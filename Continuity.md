Continuity.md — mBrics Platform (MOBILE Project)
2026-01-06 – Continuity Extended (MOBILE Project)
---
Core Development Environment
• IDE: Visual Studio Code (Local History extension active)
• Language/Framework: Flutter (Dart) for cross‑platform mobile/web apps
• Backend: FastAPI (Python) for orchestration and modular endpoints
• Version Control: Git (commits + tags for rollback safety)
Databases & Services
• Supabase:  
• Auth (login, registration, session persistence)  
• Database (Postgres with RLS policies)  
• Profiles table for metadata (user_id, display_name, phone, language, role, avatar_url)
• Dutify API: HS code duty lookup (tariffs)
• SeaRates API: Real‑time LCL/FCL shipping rates and schedules
• Agent tables: Clearance fees + zone‑based trucking costs
Invariants (must remain stable)
• Project root path: /Users/m2/Developer/mbrics/MOBILE
• Ports: Frontend → http://localhost:5442, Backend → http://127.0.0.1:8000
• Routing rules: If session exists → /profile (then continue to /mainmenu), else → /login
• Assets: Logo → assets/mbrics_logo.png, ARB files for localization → lib/l10n/
• Baseline modules: FastAPI endpoints for tariffs, freight, and clearance
• Feature flags: platform_shell, profileformsv2, errorlocalizationv2, analytics_basic
Execution Discipline:
cd /Users/m2/Developer/mbrics/MOBILE
flutter run -d chrome --web-port=5442
cd /Users/m2/Developer/mbrics/MOBILE/backend
uvicorn main:app --reload --port 8000
- Never omit port flags — ensures invariants remain stable across environments
- Verify routing invariants after startup: session exists → /profile → /mainmenu, no session → /login

Structure Discipline
• Source of truth: Only use /Users/m2/Developer/mbrics/MOBILE as the active Flutter project. Do not use deprecated paths.
• Lib structure: Use lib/layout for app shell (MasterLayout), lib/services for AuthService and providers, keep feature modules under lib/<feature>/ with clear ownership and tests.
Rituals
• STATUS.md: Update after each milestone with what changed, why, and next steps.
• Commits & Tags: Commit and tag before any feature work (golden-* for baselines, chk-* for checkpoints).
• Rollback safety: Prefer Git tags and Local History; avoid manual deletions without checkpoints.
• Golden copies: Preserve canonical templates and migrations in /db/migrations or /templates.
• Module-first: Use pre‑coded modules first; avoid one‑off hacks that break invariants.
Operational Notes
• Localization: Maintain ARB files under lib/l10n/ with English and Chinese entries aligned to UI strings.
• Assets discipline: Replace logos and UI assets via golden‑copy workflow with reproducible commands.
• Environment: Keep env.dart minimal; secrets managed via Supabase and local .env.
• Testing: Use test/ for unit and integration tests; keep web startup consistent with --web-port invariant.
---
Path Correction History (2026-01-04)
• Identified stray files under deprecated example paths.
• Action: Removed stray Dart files and re‑established canonical files in /MOBILE/lib.
• Purpose: Enforce single source of truth and prevent future path drift.
2026-01-04 – Shell Split & Login Restoration
• MasterLayout moved to lib/layout/master_layout.dart; LoginScreen recreated in lib/login/login_screen.dart.
• Imports aligned in main.dart; ARB keys added (appTitle, navigation, footerText).
• Demo login works; language toggle functional.
• Next: Supabase auth wiring with localized error handling; wrap registration and main_menu with MasterLayout.
• Tag: chk-2026-01-04-login-shell-split
---
Continuity Entry: Supabase Auth Integration (Planned)
• Integrate Supabase login/register/profile management module.
• Includes federated sign‑in (Google, Apple, WeChat/Alipay).
• Error messaging localized via ARB.
• Visuals inherit from MasterLayout card theme.
• Checkpoint discipline: STATUS.md updated, Continuity.md mirrored, golden copies created, Git tag applied.
Continuity Entry: Solidity + Hardhat Integration (Planned)
• Integrate Solidity smart contracts with Hardhat.
• Import OpenZeppelin templates for safe contract logic.
• Connect Supabase for off‑chain storage.
• Encode multipolar trade/payment rules and compliance flows.
• Deployment routes: Ethereum, Polygon, China‑compliant chains.
• Checkpoint discipline: STATUS.md updated, Continuity.md mirrored, golden copies created, Git tag applied.
Planned — Supabase Login Integration (2026-01-07)
• Replace demo login with Supabase signInWithPassword.
• Handle Supabase error codes with localized ARB messages.
• Redirect successful login → /profile.
• Tag: chk-2026-01-07-supabase-login
---
Continuity Entry: Profile Photo Integration (Deferred – 2026-01-06)
• Issue: file_picker dialog not opening on Flutter web (Chrome/macOS).
• Decision: Defer avatar upload feature; placeholder default_avatar.png remains active.
• Planned Changes: Add avatar_url field to Supabase users table, create Supabase Storage bucket (avatars), update registration flow to allow photo upload, refactor ProfileScreen to display photo + metadata.
• Future Extension: Enable “Edit Profile” to change photo and metadata once picker issue resolved.
• Tag: defer-2026-01-06-avatar-picker
---
Continuity Entry: Layout Theme Enforcement (2026-01-06)
• Rule: All pages must use the unified card‑based layout theme established by Login and Profile pages.
• Includes: logo size and position (constrained box, centered at top), card style (rounded corners, elevation, consistent padding), button colors and sizing (full‑width, bold labels, consistent spacing), typography (titles bold at 24px, body text at 16px), white background scaffold with centered content.
• Applies to: Login, Registration, Profile, Main Menu, DDP, Forex, Escrow, Pay, Settings.
• Checkpoint discipline: STATUS.md updated, Continuity.md mirrored, Git tag applied: chk-2026-01-06-layout-theme
---
Continuity Entry: Color Palette Enforcement (2026-01-06)
• Rule: Only four colors are permitted throughout the MOBILE project.
• Palette:  
• Primary Blue (#1976D2) — main action buttons and highlights  
• Neutral White (#FFFFFF) — backgrounds and card surfaces  
• Dark Gray (#212121) — text and icons  
• Accent Green (#388E3C) — secondary action buttons and confirmations
• Applies to: All modules and screens (Login, Registration, Profile, Main Menu, DDP, Forex, Escrow, Pay, Settings).
• Checkpoint discipline: STATUS.md updated, Continuity.md mirrored, Git tag applied: chk-2026-01-06-color-palette
---
Continuity Entry: Page Naming Discipline (2026-01-06)
• Locked names for clarity:  
• login_screen.dart → Login  
• registration_screen.dart → Registration  
• profile_page.dart → Profile  
• edit_profile_page.dart → Edit Profile  
• main_menu_page.dart → Main Menu  
• settings_page.dart → Settings  
• pay_page.dart → Pay  
• forex_page.dart → Forex  
• escrow_page.dart → Escrow
---
Continuity Entry: Font Discipline (2026-01-06)
• Primary Font (English): Eurostile Bold Extended or Bank Gothic Medium  
• Use for page titles, headers, branding elements
• Secondary Font (Chinese): Noto Sans SC or PingFang SC  
• Use for Chinese UI labels, subtitles, bilingual ARB entries
• Fallback Font: Roboto  
• Use for body text and system UI where custom fonts are not feasible
Usage Discipline:
• Page titles → Primary Font, 24px, bold
• Chinese subtitles → Secondary Font, 16px, regular
• Body text/buttons → Roboto unless overridden for branding
• Checkpoint discipline: STATUS.md updated, Continuity.md mirrored, Git tag applied: chk-2026-01-06-font-lock
---
Continuity Entry: Action Hierarchy & Color Discipline (2026-01-06)
• Rule: All pages must separate primary functional actions (blue) from secondary/nice‑to‑have actions (green).
• Primary Actions → Blue (#1976D2)
• Divider
