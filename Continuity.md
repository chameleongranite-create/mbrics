# Continuity.md — mBrics Platform (MOBILE Project)

## Core Environment
- IDE: VS Code (Local History active)  
- Framework: Flutter (Dart) for mobile/web  
- Backend: FastAPI (Python)  
- Version Control: Git with commits + tags for rollback  

## Databases & Services
- Supabase: Auth, Postgres (RLS), Profiles table  
- Dutify API: HS code duty lookup  
- SeaRates API: LCL/FCL shipping rates  
- Agent tables: clearance fees + trucking costs  

## Invariants
- Root path: /Users/m2/Developer/mbrics/MOBILE  
- Ports: Frontend → http://localhost:5442, Backend → http://127.0.0.1:8000  
- Routing: session → /mainmenu, else → /login  
- Assets: logo `assets/mbrics_logo.png` (white background, 120px), ARB files in lib/l10n/  
- Feature flags: platform_shell, profileformsv2, errorlocalizationv2, analytics_basic  

## UI Discipline
- Headings:  
  - Core functions → *“Hi {user_name}, ready to get started?”*  
  - Utilities → *“Or, manage your tools and settings…”*  
- Colors:  
  - Platinum (#E5E4E2) → core cards  
  - White (#FFFFFF) → utility cards  
  - Gold (#C2994B) → primary buttons/icons  
  - Silver (#A7A9AC) → secondary accents  
  - Charcoal Navy (#343A40) → headings/text  
- Logo: top of all pages, pure white background, 100–120px height  
- Microcopy under logo: *“Built for global trade. Designed for trust.”*  
- MasterLayout: enforced across all modules for consistency  

## Execution Discipline
- Frontend: `flutter run -d chrome --web-port=5442`  
- Backend: `uvicorn main:app --reload --port 8000`  

## Rituals
- Update STATUS.md after each milestone  
- Commit + tag checkpoints (chk-YYYY-MM-DD-description)  
- Preserve golden copies in /templates and /db/migrations  
- Continuity.md updated whenever headings, palette, or grouping logic change  

## Operational Notes
- Localization: ARB files maintained in lib/l10n/ (EN/ZN)  
- Assets: replaced via golden-copy workflow  
- Testing: UI tests for headings/logo/card grouping; snapshot tests for MainMenu platinum vs. white styling  

## Current Checkpoints
- **2026-01-07 – Registration Screen Fix**  
  - Refactor resolved Flexible crash; flows render correctly under MasterLayout  
  - Tag: `chk-2026-01-07-registration-fix`  

- **2026-01-07 – UI Continuity & Color Discipline**  
  - Palette standardized (white/gold/silver/charcoal), bilingual toggle, logo update, microcopy refined  
  - Tag: `chk-2026-01-07-ui-continuity-colors`  

- **2026-01-07 – Main Menu Conversational Flow**  
  - Conversational headings applied; platinum styling for core functions, white for utilities  
  - Logo consistency enforced  
  - Tag: `chk-2026-01-07-mainmenu-conversational-hierarchy`