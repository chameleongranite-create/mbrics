# Continuity.md — mBrics Platform (MOBILE Project)

---
2026-01-07 – Continuity Extended (MOBILE Project)

## Core Development Environment
• IDE: Visual Studio Code (Local History extension active)  
• Language/Framework: Flutter (Dart) for cross‑platform mobile/web apps  
• Backend: FastAPI (Python) for orchestration and modular endpoints  
• Version Control: Git (commits + tags for rollback safety)  

---
## Databases & Services
• Supabase:  
  ◦ Auth (login, registration, session persistence)  
  ◦ Database (Postgres with RLS policies)  
  ◦ Profiles table for metadata (user_id, display_name, phone, language, role)  
• Dutify API: HS code duty lookup (tariffs)  
• SeaRates API: Real‑time LCL/FCL shipping rates and schedules  
• Agent tables: Clearance fees + zone‑based trucking costs  

---
## Invariants (must remain stable)
• Project root path:  
  ◦ /Users/m2/Developer/mbrics/MOBILE  
• Ports:  
  ◦ Frontend → http://localhost:5442  
  ◦ Backend → http://127.0.0.1:8000  
• Routing rules:  
  ◦ If session exists → /mainmenu  
  ◦ Else → /login  
• Assets:  
  ◦ Logo → assets/mbrics_logo.png (pure white background, updated 2026‑01‑07)  
  ◦ ARB files for localization → lib/l10n/  
• Baseline modules:  
  ◦ FastAPI endpoints for tariffs, freight, and clearance  
• Feature flags:  
  ◦ platform_shell, profileformsv2, errorlocalizationv2, analytics_basic  

### UI Headings
• Main functions group must begin with: *“Hi {user_name}, ready to get started?”*  
• Secondary utilities group must begin with: *“Or, manage your tools and settings…”*  
• These headings are invariant and must be localized in ARB files (EN/ZN).  

### Color Hierarchy
• Platinum (#E5E4E2) → background for core function cards  
• White (#FFFFFF) → background for utility cards  
• Gold (#C2994B) → icons for utilities and primary buttons  
• Silver (#A7A9AC) → icons for core functions and secondary accents  
• Charcoal Navy (#343A40) → text for headings and card titles  

### Logo
• Must appear at the top of all pages, pure white background, 100–120px height  
• Microcopy under logo: *“Built for global trade. Designed for trust.”*  

---
## Execution Discipline
frontend port bindings:  
cd /Users/m2/Developer/mbrics/MOBILE  
flutter run -d chrome --web-port=5442  

cd /Users/m2/Developer/mbrics/MOBILE/backend  
uvicorn main:app --reload --port 8000  

---
## Structure Discipline
• Source of truth: /Users/m2/Developer/mbrics/MOBILE only.  
• Lib structure:  
  ◦ lib/layout → app shell (MasterLayout)  
  ◦ lib/services → AuthService/providers  
  ◦ Feature modules under lib/<feature>/ with clear ownership and tests  

• Menu Layout:  
  ◦ Core functions (Get a quote, Send or receive money, Create a blockchain contract) must always render first, grouped together.  
  ◦ Secondary utilities (Live forex rates, Edit Profile, Settings) must always render second, separated by a divider and introduced by the secondary heading.  
• MasterLayout Enforcement:  
  ◦ All modules must inherit MasterLayout to ensure consistent logo, bilingual toggle, and palette enforcement.  

---
## Rituals
• STATUS.md: Update after each milestone with what changed, why, and next steps.  
• Commits & Tags: Commit before any feature work (golden-* for baselines, chk-* for checkpoints).  
• Rollback safety: Prefer Git tags and Local History.  
• Golden copies: Preserve canonical templates and migrations in /db/migrations or /templates.  
• Module-first: Use pre‑coded modules first; avoid one‑off hacks.  
• Continuity.md: Update whenever headings, palette roles, or grouping logic change.  

---
## Operational Notes
• Localization: Maintain ARB files under lib/l10n/ with English and Chinese entries aligned to UI strings.  
• Assets discipline: Replace logos and UI assets via golden-copy workflow.  
• Environment: Keep env.dart minimal; secrets managed via Supabase and local .env.  
• Testing:  
  ◦ UI tests must confirm correct rendering of headings, logo placement, and card grouping.  
  ◦ Snapshot tests required for MainMenuPage to enforce platinum vs. white styling.  

---
## Checkpoints
2026-01-04 – Shell Split & Login Restoration (MOBILE)  
• MasterLayout moved to lib/layout/master_layout.dart; LoginScreen recreated in lib/login/login_screen.dart.  
• Imports aligned in main.dart; ARB keys added (appTitle, navigation, footerText EN/ZN); l10n regenerated.  
• State: Demo login (mbrics/mbrics) works; language toggle functional across shell.  
• Tag: chk-2026-01-04-login-shell-split  

2026-01-07 – Registration Screen Fix & Layout Discipline (MOBILE Project)  
• Issue: RegistrationScreen crashed due to invalid Flexible nesting.  
• Resolution: Refactored block to use a single Column with DropdownButtonFormField + TextFormField.  
• State: Login and Registration flows render correctly under MasterLayout; routing invariant confirmed.  
• Tag: chk-2026-01-07-registration-fix  

2026-01-07 – UI Continuity & Color Discipline (MOBILE Project)  
• Decision: Standardized white/gold/silver/charcoal palette across all screens.  
• Roles and Colors: see Color Hierarchy above.  
• Layout Changes: bilingual toggle, logo update, microcopy, spacing rhythm.  
• Enforcement: All future modules must inherit MasterLayout and apply this palette.  
• Tag: chk-2026-01-07-ui-continuity-colors  

2026-01-07 – Main Menu Conversational Flow & Platinum Hierarchy (MOBILE Project)  
• Headings updated: *“Hi Bennie, ready to get started?”* for core functions, *“Or, manage your tools and settings…”* for utilities.  
• Platinum styling applied to top 3 core functions; white styling applied to bottom 3 utilities.  
• Logo consistency enforced across all pages.  
• Tag: chk-2026-01-07-mainmenu-conversational-hierarchy