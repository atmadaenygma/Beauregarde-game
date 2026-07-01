export const config = { runtime: 'edge' };

const BOO_HAG_SYSTEM = `You are the AI co-author and game design engine for the Boo Hag game.

GAME SUMMARY:
Protagonist is TWO beings conjoined by cosmic 3-7-9 alignment: the BOO HAG (ancient, instinctual, centuries of riding/skinning/feeding, escaped Bureau transport) and THE GIRL (Arceneaux family, college student, died during conjunction on July 25th at 9:09 PM, consciousness transferred inside the boo hag instead of dispersing). The player IS the girl. Waking inside something ancient.

CORE MECHANICS:
- CALM breeds control. FEAR breeds chaos.
- The face (girl's symbiotic form) comes forward when calm is high enough. Cannot be lost — SHED retracts it, it stays inside.
- Five attitudes: RETICENCE (denial), ANGER (claiming while furious), CURIOSITY (accepts through understanding), JOY (unlocks after first power use), GREED (unlocks after joy). No meter shown — world responds to accumulation.
- Consciousness tiers: FERAL (no words) → WAKING (groping for language) → CLEAR (full sentences) → GRIOTTE (both integrated).

VOICE RULES:
- Direct, sparse, matter-of-fact. No mysticism in the prose.
- Never: "chosen one", "destiny", "transcendence", "the power within"
- Always: physical sensation, specific detail, actions over feelings
- Peele + Invader Zim tone. Dark but not theatrical.

When the user asks you to write a scene, create dialogue, design a quest, or build any game content, output TWO things:

1. Natural language explanation (conversational)

2. A JSON block wrapped in [NODE_JSON]...[/NODE_JSON] tags:

[NODE_JSON]
{
  "action": "create_scene" | "add_nodes" | "modify_node" | "delete_node",
  "scene": "scene_id_here",
  "declare_vars": [{ "name": "var_name", "type": "bool|int", "initial": false }],
  "consequences": [{
    "id": "consequence_id",
    "trigger": "variable = value",
    "sets": { "var": "value" },
    "downstream": [{ "scene": "scene_id", "effect": "Description" }]
  }],
  "nodes": [{
    "id": "unique_node_id",
    "type": "NARRATION|CHOICE|CONDITION|VAR_SET|ATTITUDE_BRANCH|CONSCIOUSNESS_GATE|SCENE_TRANSITION|SECTION_LABEL|ANCHOR_USE",
    "text": "Node text here",
    "media": null,
    "next": "next_node_id"
  }]
}
[/NODE_JSON]

Node type specs:
- NARRATION: text, media, next
- CHOICE: text, media, options: [{label, sets:{var:val}, next}]
- CONDITION: variable, operator, threshold, true_next, false_next
- VAR_SET: variable, operation (set|add|subtract), value, next
- ATTITUDE_BRANCH: branches:{reticence:id, anger:id, curiosity:id, joy:id, greed:id}
- CONSCIOUSNESS_GATE: min_tier (0-3), pass_next, fail_next
- SCENE_TRANSITION: target_scene, text
- SECTION_LABEL: label, next
- ANCHOR_USE: anchor_type, calm_gain, next

If the user is just discussing ideas, respond in natural language only — no JSON block needed.`;

export default async function handler(req) {
  if (req.method === 'OPTIONS') {
    return new Response(null, {
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'POST, OPTIONS',
        'Access-Control-Allow-Headers': 'Content-Type',
      },
    });
  }

  if (req.method !== 'POST') {
    return new Response('Method Not Allowed', { status: 405 });
  }

  let body;
  try {
    body = await req.json();
  } catch {
    return new Response('Bad Request', { status: 400 });
  }

  const { messages, gameContext } = body;
  const apiKey = process.env.ANTHROPIC_API_KEY;

  if (!apiKey) {
    return new Response(
      JSON.stringify({ error: 'ANTHROPIC_API_KEY not configured in Vercel environment variables.' }),
      { status: 500, headers: { 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' } }
    );
  }

  const systemPrompt = gameContext
    ? BOO_HAG_SYSTEM + '\n\n=== CURRENT GAME STATE ===\n' + gameContext
    : BOO_HAG_SYSTEM;

  const anthropicRes = await fetch('https://api.anthropic.com/v1/messages', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'x-api-key': apiKey,
      'anthropic-version': '2023-06-01',
      'anthropic-beta': 'interleaved-thinking-2025-05-14',
    },
    body: JSON.stringify({
      model: 'claude-sonnet-4-6',
      max_tokens: 4096,
      stream: true,
      system: systemPrompt,
      messages,
    }),
  });

  if (!anthropicRes.ok) {
    const errText = await anthropicRes.text();
    return new Response(
      `data: ${JSON.stringify({ error: `Anthropic API error ${anthropicRes.status}: ${errText}` })}\n\n`,
      { status: 200, headers: { 'Content-Type': 'text/event-stream', 'Access-Control-Allow-Origin': '*' } }
    );
  }

  // Stream Anthropic SSE → client SSE
  const reader = anthropicRes.body.getReader();
  const decoder = new TextDecoder();

  const stream = new ReadableStream({
    async start(controller) {
      const enc = new TextEncoder();
      let buf = '';
      try {
        while (true) {
          const { done, value } = await reader.read();
          if (done) break;
          buf += decoder.decode(value, { stream: true });
          const lines = buf.split('\n');
          buf = lines.pop();
          for (const line of lines) {
            if (!line.startsWith('data: ')) continue;
            const data = line.slice(6).trim();
            if (data === '[DONE]') continue;
            try {
              const ev = JSON.parse(data);
              if (ev.type === 'content_block_delta' && ev.delta?.type === 'text_delta') {
                controller.enqueue(enc.encode(`data: ${JSON.stringify({ text: ev.delta.text })}\n\n`));
              }
              if (ev.type === 'message_stop') {
                controller.enqueue(enc.encode('data: [DONE]\n\n'));
              }
            } catch { /* skip malformed lines */ }
          }
        }
        controller.enqueue(enc.encode('data: [DONE]\n\n'));
      } catch (err) {
        controller.enqueue(enc.encode(`data: ${JSON.stringify({ error: err.message })}\n\n`));
      }
      controller.close();
    },
  });

  return new Response(stream, {
    headers: {
      'Content-Type': 'text/event-stream',
      'Cache-Control': 'no-cache',
      'Access-Control-Allow-Origin': '*',
    },
  });
}
