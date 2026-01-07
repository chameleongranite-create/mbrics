STATUS.md — mBrics Platform (MOBILE Project)
---
2026-01-04 – Continuity Activated in MOBILE
• Checkpoint: Continuity anchors created in MOBILE project
• Changes: STATUS.md and Continuity.md added at project root
• State: Baseline established, Git initialized
• Next: Begin MasterLayout shell integration
• Tag: golden-2026-01-04-mobile
---
Platform Polish Checklist
• MasterLayout shell (AppBar, Drawer, Footer) wrapped around all pages
• Design tokens centralized (colors, spacing, typography, radii)
• Component library (buttons, inputs, feedback widgets)
• go_router navigation with named routes + breadcrumbs
• Environment/version badge in AppBar
• AuthService wrapper for Supabase calls (login, registration, session)
• Error localization via ARB (friendly messages for Supabase codes)
• Profiles table with RLS policies (secure metadata storage)
• ProfileForm UI with optimistic updates + rollback safety
• Accessibility pass (contrast, focus rings, semantics, keyboard nav)
• Microcopy + empty states (friendly messages, CTAs)
• Skeleton loaders + success banners
• LoadingOverlay for smoother transitions
• Performance improvements (lazy load, caching, debounce requests)
• Reliability guardrails (error boundaries, audit logs)
• Security hardening (JWT handling, rate limiting middleware)
• Analytics (screen views, error tracking, opt‑in privacy)
• Help tray (FAQ + contact links)
• Centralized content management (ARB + markdown snippets)
---
Rituals
• Update STATUS.md after each completed item
• Commit + tag checkpoint (chk-YYYY-MM-DD-description)
• Rollback safety: git checkout or VS Code Local History
• Preserve golden copies in /templates and /db/migrations
---
2026-01-04 – Platform Polish Integration Kickoff (MOBILE Project)
• Checkpoint: MasterLayout shell + platform polish roadmap defined
• Changes: Added /layout/master_layout.dart scaffold, feature flag (platform_shell), design_tokens.dart plan
• State: Baseline flows intact, shell integration staged under feature flag
• Next: Page-by-page rollout (login → registration → main_menu → ddp → forex → escrow → pay → settings → jobcard)
• Tag: v0.9.0-shell
---
2026-01-04 – MasterLayout Split and Login Restoration (MOBILE)
• Changes: Moved MasterLayout to lib/layout/master_layout.dart; recreated lib/login/login_screen.dart; imports aligned in main.dart; ARB updated (appTitle, navigation, footerText EN/ZN); l10n regenerated
• State: Splash → Login → MainMenu works (demo credentials mbrics/mbrics); language toggle functional across shell
• Next: Replace demo auth with Supabase signInWithPassword; localize Supabase errors; wrap registration and main_menu with MasterLayout
• Tag: chk-2026-01-04-login-shell-split
---
2026-01-05 – Auth Cycle & Profile Screen
• Checkpoint: Login and Register screens aligned under MasterLayout
• Changes: ProfileScreen scaffolded with Supabase user metadata + logout; routes in main.dart corrected to use ProfileScreen (removed ProfilePage); SplashScreen redirect confirmed (session → /mainmenu, else → /login)
• State: Verified login flow works; ProfileScreen shows “Dashboard” with empty state when no metadata/session
• Next: Wire ProfileScreen to fetch user details from Supabase users table for richer dashboard
• Tag: chk-2026-01-05-auth-profile
---
2026-01-06 – Project Scaffold
• Changes: Created folders: screens, layout, l10n, services, widgets; added placeholder files for login, register, profile, master layout, auth service, header/footer widgets
• Checkpoint Tag: chk-2026-01-06-project-scaffold
---
2026-01-06 – Completed Profile Screen
• Changes: Added ProfileScreen with user info + logout; integrated Supabase currentUser metadata; wrapped in MasterLayout for layout consistency
• Checkpoint Tag: chk-2026-01-06-profile-screen
---
2026-01-06 – Layout Discipline for New Pages
• Note: All new screens (login, register, profile, ddp, forex, escrow, pay, settings, jobcard, etc.) must be wrapped in MasterLayout
• Rule: Avoid standalone Scaffold definitions inside child pages — use MasterLayout as the single scaffold
• Guarantee: Consistency in navigation, language toggle, and footer messaging across the platform
• Checkpoint Tag: chk-2026-01-06-masterlayout-discipline
---
2026-01-06 – Upcoming Task: Profile Photo Integration
• Changes Planned:
	◦ Add avatar_url field to users table in Supabase
	◦ Create Supabase Storage bucket (avatars) for profile photo uploads
	◦ Update registration flow to allow photo upload and store public URL in avatar_url
	◦ Refactor ProfileScreen to display photo, name, email, phone, company
	◦ Wrap profile screen in MasterLayout for consistent header/footer
• Future Extension: Enable “Edit Profile” to change photo and metadata
• Checkpoint Tag: todo-2026-01-06-profile-photo
---
2026-01-06 – Deferred Task: Avatar Picker (Web)
• Issue: file_picker dialog not opening in Flutter web (Chrome/macOS)
• Decision: Defer avatar upload feature for now; placeholder default_avatar.png remains active
• Workflow Discipline: Logged in STATUS.md; revisit post-demo with fallback (URL input or isolated test page)
• Checkpoint Tag: defer-2026-01-06-avatar-picker
---
Planned – Solidity + Hardhat Integration
• Objective: Prepare for smart contract development using Solidity and Hardhat
• Scope:
	◦ Set up Hardhat project structure (contracts/, scripts/, tests/)
	◦ Integrate OpenZeppelin templates (ERC-20, ERC-721, access control)
	◦ Connect Supabase backend for off-chain data (profiles, trade metadata)
	◦ Plan deployment routes (Ethereum, Polygon, or China-compliant chains)
• Workflow Discipline: Golden copies created after initial Hardhat setup; STATUS.md and Continuity.md updated in sync
• Next Steps: Scaffold Hardhat project and import Solidity templates for editing
• Tag: chk-2026-01-06-hardhat-solidity-init

# Guidelines for Tomorrow’s Rebuild (MOBILE Project)

## STATUS.md Entry (Guideline)
2026-01-07 – Login & Registration Polish
• Checkpoint: LoginScreen and RegistrationScreen recreated under MasterLayout; brand palette applied; ARB keys aligned
• State: Routing invariants verified (session → /mainmenu, else → /login)
• Next: Supabase signInWithPassword integration; ProfileScreen photo support
• Tag: chk-2026-01-07-login-registration

## Continuity.md Entry (Guideline)
2026-01-07 – Port Alignment & Layout Discipline
• Invariant: Frontend bound to http://localhost:5442, backend to http://127.0.0.1:8000
• State: MasterLayout restored with onLocaleChange param; LoginScreen polished with brand palette + accessibility
• Rule: All new pages (registration, profile, main_menu) must inherit MasterLayout
• Next: RegistrationScreen rollout with Supabase signInWithPassword
• Tag: chk-2026-01-07-port-login

## Anchors to Remember
- MasterLayout discipline: no standalone Scaffolds, all pages wrapped in MasterLayout.
- ARB keys: welcomeTitle, login, register, plus localized error messages for Supabase.
- Routing invariant: session → /mainmenu, else → /login.
- Profile photo: deferred on web, placeholder default_avatar.png remains.
- Ports: always run with `flutter run -d chrome --web-port=5442` and backend `uvicorn main:app --reload --port 8000`.

## Short Checklist for Tomorrow
1. Restore LoginScreen under MasterLayout with onLocaleChange wired in.
2. Re-add RegistrationScreen with same polish and localization.
3. Confirm ARB keys exist (welcomeTitle, login, register).
4. Verify routing invariants (session → /mainmenu, else → /login).
5. Run frontend on port 5442 and backend on port 8000.
6. Commit and tag checkpoint in Git (chk-2026-01-07-login-registration).
7. Mirror entry in Continuity.md for port alignment and layout discipline.

## Reminder
These are guidelines, not rigid instructions. If you uncover missing pieces (widgets, ARB keys, Supabase handlers), add them back into STATUS.md and Continuity.md. The goal is to preserve workflow discipline: checkpoint, tag, and mirror in both files.

2026-01-07 – Registration Screen Fix & Polish (MOBILE Project)
• Checkpoint: RegistrationScreen stabilized under MasterLayout; overflow crash resolved (Flexible → Column refactor)
• Changes: Country/phone block simplified; flag emojis applied; ARB keys verified; imports corrected in main.dart
• State: Login and Registration flows now render correctly; routing invariant confirmed (session → /mainmenu, else → /login)
• Next: Integrate Supabase signInWithPassword for login; extend registration to support avatar_url when web picker issue is resolved
• Tag: chk-2026-01-07-registration-fix

# STATUS.md

## Checkpoint: January 7, 2026

### Updates
- Added bilingual toggle in top charcoal header bar:
  - Left: "Digital Currency Bridge Platform" (English, white)
  - Right: "数字货币桥平台" (Chinese, red accent)
  - Both act as language selection links.
- Increased logo size to 120px, pure white background version (`assets/mbrics_logo.png`).
- Updated microcopy under logo: "Built for global trade. Designed for trust."
- Refined card block:
  - Soft white tint (#FAFAFA) background
  - Light gray (#E0E0E0) border
  - Subtle shadow for depth
- Button hierarchy confirmed:
  - Gold (#C2994B) → Primary CTA ("Continue to Site")
  - Silver (#A7A9AC) → Secondary actions ("Upload Avatar", "Edit Details")
  - Charcoal Navy (#343A40) → Tertiary link ("Logout")

### Next Steps
- Backup current project state (`PROJECT_CHECKPOINT.md`, Git commit).
- Apply new color scheme to `login_screen.dart`:
  - Pure white background
  - Charcoal header bar with bilingual toggle
  - Card block styled with soft white + gray border
  - Buttons aligned with global scheme

  ## 2026-01-07 – MasterLayout Applied to All Pages (MOBILE Project)

### Changes
- Wrapped all remaining pages in `MasterLayout`:
  - settings_page.dart
  - main_menu_page.dart
  - forex_page.dart
  - pay_page.dart
  - dashboard_page.dart
  - escrow_page.dart
- Confirmed login_screen.dart, registration_screen.dart, and profile_page.dart already used `MasterLayout`.
- Every page now inherits the charcoal header with bilingual toggle (English left, Chinese right).
- Logo, microcopy, and button color scheme consistent across flows.

### State
- Continuity achieved: all screens visually and structurally aligned.
- Language toggle functional across all routes.
- Color discipline enforced (gold, silver, charcoal, white).

### Next
- Extend Supabase login/register integration with localized error handling.
- Apply avatar upload once web picker issue is resolved.
- Begin styling main_menu and settings flows with same card rhythm.

### Tag
`chk-2026-01-07-masterlayout-allpages`