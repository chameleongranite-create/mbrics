Continuity.md — mBrics Trade Gateway
Core Environment
Stack: VS Code, Flutter (Web Focus), FastAPI, Git.

Services: Supabase Auth/DB, Dutify API (Logistics), SeaRates API (Freight), Agent Tables.

Invariants
Root Path/Ports: Unchanged.

Routing: / (Login), /register, /mainmenu, /forex, /escrow, /pay, /profile, /edit_profile, /settings.

Asset Mapping: Icons stored in assets/icons/icon_1.png through icon_6.png.

UI Discipline
Brand Focus: Strictly mBrics. Avoid generic "BRICS" references.

Palette: White (Background), Gold #C2994B (Primary/Action), Silver #A7A9AC (Neutral/Secondary), Terminal Black #121212 (Text).

Iconography: Feature icons must be 80x80 (doubled from original) for visual weight.

Microcopy: Use "secure authentication" (lowercase brand style). Greetings must follow time-of-day logic but prioritize "Good evening" for brand consistency.

MasterLayout: All pages must be wrapped in MasterLayout to ensure logo and navigation continuity.

Rituals
Localization: Every UI string must reside in app_en.arb and app_zh.arb. Run flutter gen-l10n after any text change.

Documentation: Sync STATUS.md and Continuity.md after every major UI or Logic lock.

Checkpoints (Standardized)
2026-01-14 – mBrics Brand Pivot & Service Alignment
Identity: Transitioned brand focus from "BRICS" to mBrics.

Service Pitch: Redefined 6 core icons as high-value services: Instant Payments, Local Currency Pricing, Fortune 500 Network, Smart Escrow, Door-to-Door (DDP), and Secure Authentication.

Greeting: Fixed "Good evening" greeting logic for brand warmth.

Footer: Striking simple slogan: "DIGITALIZING GLOBAL TRADE".

Tag: chk-2026-01-14-mbrics-pivot

2026-01-13 – Docs & Name-Dropping Alignment
Updates: STATUS.md and Continuity.md polished to reflect the company's trajectory and logistics partnerships.

Tag: chk-2026-01-13-docs-alignment

2026-01-11 – Registration Localization & ARB Sync
Localization: Fully replaced hard-coded text in Registration with ARB-driven translations (EN/ZH). Verified flutter gen-l10n output.

Tag: chk-2026-01-11-registration-localization

2026-01-10 – Main Menu Icon & Welcome Logic
UI: Centered large round icons in side panels; simplified golden welcome block.

Tag: chk-2026-01-10-mainmenu-icons-welcome-update

2026-01-09 – Login Overflow & Asset Resizing
Assets: Trust pillar icons resized; logo enlarged to 100px. Overflow issues on smaller viewports resolved.

Tag: chk-2026-01-09-login-overflow-fix

Continuity Golden Save
Brand: mBrics (Locked).

Icon Size: 80x80 (Locked).

Translation: Full parity between English and Chinese ARB files.

Auth Greeting: "Good evening" priority (Locked).

Next focus: Localize remaining internal pages (Forex, Escrow, Pay, Profile) to match the Login Page's "smart and pretty" standard.

Continuity.md Update
2026-01-15 – Institutional UI & Pillar Architecture Lock

Structure: Verified /lib/pillars directory for feature scaling.

Assets: Icons mm_01 through mm_06 saved to assets/icons/.

UI Standard: Confirmed 80x80 icon weight and MasterLayout requirement for all internal pages.

Web3 Pivot: Pillar 3 officially defined as Web3 Trust (LC Replacement) focusing on document verification.

Language Sync: English and Chinese ARB files synchronized for 6-pillar grid.

Tag: chk-2026-01-15-ui-icon-lock