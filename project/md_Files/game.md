# Beauregarde Quest 1 — Development Guide

## Debug Scene Selector

The game includes a debug overlay with a scene selector dropdown that allows rapid navigation between game areas without playing through content.

### Adding a New Scene

When you create a new scene/area in the game, you must update the SCENES array in the DebugOverlay component to make it accessible in the debug menu:

1. Open [Beauregarde Quest 1.html](Beauregarde%20Quest%201.html)
2. Find the **DebugOverlay** function (around line 336)
3. Locate the SCENES array:
   ```javascript
   const SCENES=['opening','bathroom','apartment','safe','waking','hallway','hallway_in','street','returning','store'];
   ```
4. Add your new scene name to the array in the desired order:
   ```javascript
   const SCENES=['opening','bathroom','apartment','safe','waking','hallway','hallway_in','street','returning','store','newarea'];
   ```

The scene name must match the string used in the `go()` function call (e.g., `go('newarea')`).

### Using the Debug Selector

- Open the dev console or look for the debug overlay in the top-right
- Use the dropdown to jump to any scene instantly
- The debug mode is active when the `debug` flag is true in QuestApp state
- All scene transitions are instant; no dialogue or gameplay sequences execute

### Scene Naming Convention

Keep scene names lowercase and use hyphens for multi-word names (e.g., `'hallway_in'`, `'returning'`). This ensures consistency with the Go routing function.

---

## Scene Background Rules

### No Floor Bars

**Do not add a dark floor strip to any scene.** This means no `<div>` with `height:116` at the bottom of any scene container, and no SVG floor overlays with gradient fills or stripe patterns.

Scenes use full-viewport video or image backgrounds (`objectFit:'cover'`, `inset:0`) that fill the entire 1280×720 frame. Any dark bar layered over the bottom breaks that.

**Never add:**
```jsx
// ❌ Do not add these
<div style={{position:'absolute',bottom:0,left:0,right:0,height:116,background:'linear-gradient(...)',zIndex:3}}>
  <svg>...</svg>
</div>
```

Character ground level (`charBottom`) is set per-scene via the `<Char>` prop — it does not depend on a visible floor element.

### Background Format

All scene backgrounds must be `<video>` or `<img>` elements with:
```jsx
style={{position:'absolute',inset:0,width:'100%',height:'100%',objectFit:'cover'}}
```
No `backgroundImage` CSS on a div. Use a `<video autoPlay muted loop>` for animated maps and `<img>` for static ones.
