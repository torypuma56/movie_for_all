---
name: Obsidian Lumina
colors:
  surface: '#16121b'
  surface-dim: '#16121b'
  surface-bright: '#3c3741'
  surface-container-lowest: '#100d15'
  surface-container-low: '#1e1a23'
  surface-container: '#221e27'
  surface-container-high: '#2d2832'
  surface-container-highest: '#38333d'
  on-surface: '#e8dfed'
  on-surface-variant: '#cbc3d7'
  inverse-surface: '#e8dfed'
  inverse-on-surface: '#332e38'
  outline: '#958ea0'
  outline-variant: '#494454'
  surface-tint: '#d0bcff'
  primary: '#d0bcff'
  on-primary: '#3c0091'
  primary-container: '#a078ff'
  on-primary-container: '#340080'
  inverse-primary: '#6d3bd7'
  secondary: '#4edea3'
  on-secondary: '#003824'
  secondary-container: '#00a572'
  on-secondary-container: '#00311f'
  tertiary: '#ddb7ff'
  on-tertiary: '#490080'
  tertiary-container: '#b76dff'
  on-tertiary-container: '#400071'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#e9ddff'
  primary-fixed-dim: '#d0bcff'
  on-primary-fixed: '#23005c'
  on-primary-fixed-variant: '#5516be'
  secondary-fixed: '#6ffbbe'
  secondary-fixed-dim: '#4edea3'
  on-secondary-fixed: '#002113'
  on-secondary-fixed-variant: '#005236'
  tertiary-fixed: '#f0dbff'
  tertiary-fixed-dim: '#ddb7ff'
  on-tertiary-fixed: '#2c0051'
  on-tertiary-fixed-variant: '#6900b3'
  background: '#16121b'
  on-background: '#e8dfed'
  surface-variant: '#38333d'
typography:
  headline-xl:
    fontFamily: Plus Jakarta Sans
    fontSize: 40px
    fontWeight: '800'
    lineHeight: 48px
    letterSpacing: -0.03em
  headline-xl-mobile:
    fontFamily: Plus Jakarta Sans
    fontSize: 30px
    fontWeight: '800'
    lineHeight: 36px
    letterSpacing: -0.025em
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.02em
  headline-lg-mobile:
    fontFamily: Plus Jakarta Sans
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 20px
    fontWeight: '700'
    lineHeight: 28px
    letterSpacing: -0.015em
  title-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
  title-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 22px
  body-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  body-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 16px
  label-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 13px
    fontWeight: '600'
    lineHeight: 18px
    letterSpacing: 0.02em
  label-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 11px
    fontWeight: '700'
    lineHeight: 14px
    letterSpacing: 0.04em
  badge-score:
    fontFamily: Plus Jakarta Sans
    fontSize: 12px
    fontWeight: '800'
    lineHeight: 14px
    letterSpacing: -0.01em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  margin: 1.25rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style

This design system channels an immersive, theater-grade cinema experience tailored for mobile-first media consumption. It merges the focused intimacy of a dim theater room with the electrifying energy of neon marquee signage. The aesthetic is built on **Dark Glassmorphism** layered atop an ultra-deep obsidian-violet void, delivering crisp contrast, tactile depth, and immediate content hierarchy.

Key principles:
- **Cinematic Submersion:** UI surfaces retreat into deep violet-black tones, letting colorful key art, production stills, and high-fidelity video dominate.
- **Electric Precision:** High-impact ultraviolet and neon lime-emerald accents direct attention decisively toward critical user flows: play controls, curated ratings, VIP tier locks, and conversion moments.
- **Luminous Layering:** Frosted backdrops and translucent glass borders establish intuitive physical hierarchy without cluttering small viewports.

## Colors

The palette establishes an ultra-high-contrast, dark-mode-first environment engineered specifically for streaming discovery:

- **Primary (`#8B5CF6` / Electric Ultraviolet):** Dominates brand-level actions, active navigation states, interactive slider scrubbers, and primary play triggers.
- **Secondary (`#10B981` / Vivid Emerald Lime):** Reserved for high-value transactional signals: Rotten Tomatoes-style rating badges, VIP subscriptions, live status pings, and download-ready indicators.
- **Tertiary (`#A855F7` / Bright Heliotrope):** Used for ambient glowing halos, gradient masks across hero title cards, and secondary highlights.
- **Neutral Surface Palette:**
  - Base Obsidian: `#09060E` (Canvas background)
  - Surface Deep: `#120C1F` (List groupings, base sheet containers)
  - Glass Surface: `rgba(24, 15, 41, 0.65)` (Floating cards, navigation dock)
  - Surface Border: `rgba(168, 85, 247, 0.18)` (Subtle luminous outline)
- **Text & Contrast:** Primary text rests at `#F9FAFB` (high-contrast off-white), secondary text at `#9CA3AF`, and subtle metadata at `#6B7280`.

## Typography

Plus Jakarta Sans powers the entire hierarchy, providing crisp geometric clarity, open apertures, and modern warmth that stays legible over saturated movie posters and dark glass backings.

- **Hero & Title Display:** `headline-xl` and `headline-lg` employ tight negative tracking (`-0.025em` to `-0.03em`) and heavy weights (700/800) for punchy cinematic branding and marquee movie titles.
- **Editorial Sub-headings:** `title-md` and `headline-md` preserve balanced vertical rhythm across carousel rails, actor cast lists, and episode carousels.
- **Technical Badges & Meta:** `label-sm` and `badge-score` emphasize metadata (e.g., "4K UHD", "HDR10+", "98% MATCH") with increased letter-spacing and uppercase tracking for immediate at-a-glance scanning.

## Layout & Spacing

A mobile-first fluid grid anchors all screen formats, scaling outward gracefully for tablet split-screens and folding viewports:

- **Mobile Canvas (< 640px):** 4-column layout with `1.25rem` (`20px`) margins and `1rem` (`16px`) gutters. Horizontal scrolling carousels "bleed" edge-to-edge, with the first poster inset matching the screen margin.
- **Tablet / Large Handhelds (640px - 1024px):** 8-column layout with `1.5rem` margins and `1.25rem` gutters. Accommodates two-up grid structures for movie catalogs and dual-pane playback interfaces.
- **Rhythm Rules:** Vertical spacing between content rails is consistently pegged to `space-xl` (`2rem`), while title-to-rail distance strictly stays at `space-sm` (`0.5rem`). Poster items maintain internal visual padding of `space-xs` to keep meta text locked to the poster canvas.

## Elevation & Depth

Visual hierarchy uses a refined blend of **Dark Glassmorphism** and **Luminous Rim Lighting**:

- **Tier 0 (Canvas):** Pure `#09060E` obsidian ground.
- **Tier 1 (Surface Cards & Shelves):** Background `rgba(18, 12, 31, 0.75)` with `backdrop-filter: blur(16px)` and a hairline outer stroke of `rgba(255, 255, 255, 0.08)`.
- **Tier 2 (Floating Player Controls & Modals):** Background `rgba(24, 15, 41, 0.85)` with `backdrop-filter: blur(24px)` and a top rim stroke of `rgba(139, 92, 246, 0.35)`.
- **Shadow Signature:** Shadows are never muddy black; they use ambient tinted ultraviolet dispersion (`box-shadow: 0 12px 32px -4px rgba(139, 92, 246, 0.22)`).
- **Poster Glow Effect:** Focused or tapped media cards emit a gentle emerald or violet bloom underneath the frame (`0 8px 24px -2px rgba(16, 185, 129, 0.3)` for rated content; `0 8px 24px -2px rgba(139, 92, 246, 0.35)` for standard media).

## Shapes

The shape system adopts smooth, refined geometry (`roundedness: 2` / Base radius `0.5rem` / `8px`):

- **Poster & Media Cards (`rounded-lg` / 16px):** Curved to soften poster imagery while maintaining a clean, modern silhouette.
- **Action Buttons & Badges (`rounded-full` / Pill-shape):** Primary "Play", "Watch Trailer", and streaming tags use complete pill radiuses to communicate touch interactivity and contrast against rectangular media frames.
- **Bottom Navigation Dock & Drawers (`rounded-xl` / 24px):** Top edges of bottom sheets and floating glass navigation bars use expansive radii to nest naturally inside curved mobile displays.

## Components

### Buttons
- **Primary Play Action:** Full pill radius, solid electric ultraviolet gradient (`linear-gradient(135deg, #8B5CF6, #A855F7)`), crisp white text, bold weight, accompanied by a solid play icon. Glows with a `0 6px 20px rgba(139, 92, 246, 0.4)` footprint.
- **Secondary Actions (Watchlist, Share):** Glass pill surface (`rgba(255, 255, 255, 0.08)`), white icon and text, subtle border (`rgba(255, 255, 255, 0.15)`).

### Badges & Ratings
- **Score Chip:** Pill badge filled with a deep emerald tint (`rgba(16, 185, 129, 0.15)`), vibrant neon emerald text (`#10B981`), and a 1px emerald border. Includes star or percentage glyph.
- **Quality / Codec Flags (4K, Dolby Atmos, IMAX):** Micro pill cards with ultra-dark obsidian fill, frosted border, and uppercase `label-sm` typography in `#9CA3AF`.

### Media Cards (Poster & Backdrop)
- **Portrait Poster (2:3 Aspect Ratio):** `rounded-lg` edges, clipped image with top-right rating chip overlay and bottom gradient scrim for title readability.
- **Landscape Backdrop (16:9 Aspect Ratio):** Used for episode guides and "Continue Watching" progress rails, featuring an integrated inline emerald scrub bar on the bottom boundary.

### Bottom Navigation Bar
- **Floating Island Dock:** Suspended 16px above screen bottom, rounded-full shape, deep translucent glass (`rgba(15, 10, 26, 0.85)`, `blur(24px)`), hairline purple rim stroke. Active icons illuminate with an electric ultraviolet neon dot indicator.

### Input Fields & Search Bars
- Translucent obsidian capsule (`rgba(255, 255, 255, 0.06)`), `0.75rem` vertical padding, placeholder text in `#6B7280`. Focused states trigger an animated 1px border stroke transition to `#8B5CF6`.

### Checkboxes & Segmented Toggles
- Rounded `4px` squares for checkboxes; active states are flooded with `#8B5CF6` featuring white checkmarks. Segmented tabs (e.g., "Overview", "Cast", "Trailers") use sliding frosted glass pills over a dark recessed trough.