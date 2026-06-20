# Dark+ Contrast EINK 60HZ

A VS Code dark theme based on **Dark High Contrast**, enhanced with **font-style differentiation** for grayscale/e-ink readability — while retaining full color for normal monitors.

---

## The Problem

E-ink monitors are grayscale. Traditional syntax highlighting relies entirely on color to distinguish code elements like keywords, strings, types, and variables. On a grayscale display, colors collapse into near-identical gray levels, making code hard to scan.

Most e-ink setups use ICC color inversion (black ↔ white) for readability, but this doesn't solve the fundamental problem: **color is the only dimension of differentiation.**

## The Solution: Font Style as a Semantic Dimension

This theme layers **font styles** on top of the standard Dark High Contrast colors:

| Font Style | Code Elements | Rationale |
|---|---|---|
| **bold** | keywords, functions, storage types/modifiers, constants, tags, preprocessor, escape chars | Structural bone of code — must stand out |
| *italic* | comments, strings, parameters, attributes, regex | Contextual/secondary — visually distinct but not dominant |
| **bold italic** | types, classes, interfaces, enums, structs, namespaces, `this`/`super`/`self` | Declarations needing maximum distinction from functions |
| ~~strikethrough~~ | invalid, deprecated tokens, diff-deleted | Clear "don't use" signal |
| underline | diff-inserted, markup headings | Boundary/clarity signals |
| normal | variables, operators, numbers, punctuation | Baseline — no decoration needed |

On a color monitor, these styles reinforce the color signal. On a grayscale e-ink, they become the *primary* signal — each code element has a unique typographic identity regardless of shade.

### Why Not Just Grayscale?

The theme keeps the **full Dark High Contrast color palette** (`#569cd6` keywords, `#ce9178` strings, `#4EC9B0` types, etc.). This means it works on:

- **Normal monitors** — colors + font styles together
- **E-ink with inversion** — font styles as primary, residual gray contrast as secondary
- **E-ink without inversion** — same benefit

No sacrifice either way.

### Semantic Token Coverage

The theme includes `semanticTokenColors` rules so TypeScript, JavaScript, Java, and other language-server-backed languages get the same font-style treatment at the semantic level — covering types like `class`, `interface`, `enum`, `function`, `method`, `parameter`, and modifiers like `*.declaration`, `*.static`, `*.readonly`, `*.deprecated`.

---

## Implementation Note: `uiTheme`

The extension's `package.json` declares `"uiTheme": "hc-black"` — not `"vs-dark"`. This tells VS Code to use the built-in high-contrast black UI base for all chrome (status bar, activity bar, sidebar, tabs, panels, menus, etc.) automatically. Without this, UI elements would fall back to the default dark theme's blue styling, breaking the high-contrast look.

The theme file itself (`themes/dark_plus.json`) only needs to define editor-area colors (background, selection, etc.) — everything else is inherited from `hc-black`.

---

## Design Principles

1. **Hierarchy over decoration** — every font style maps to a semantic category; nothing is arbitrarily bold or italic
2. **Dark background, pure black** (`#000000`) — maximum contrast for readability
3. **Minimal font-style combinations** — only 5 styles (bold, italic, bold+italic, strikethrough, underline) to avoid confusion
4. **Consistency across languages** — broad TextMate scope lists ensure Python, JS/TS, Java, C++, CSS, and others all benefit

---

## Usage

1. Install the extension from VS Code Marketplace
2. Select **Dark+ Contrast EINK 60HZ** from the theme picker (`Preferences: Color Theme`)
3. Works immediately on both color and grayscale monitors

---

Based on the original [Dark+ Contrast theme](https://github.com/k3a/theme-darkplus-contrast) by k3a.
