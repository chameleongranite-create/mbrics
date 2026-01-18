STATUS.md — mBrics Trade Gateway🏁 Executive Summary: Phase 1 "Digital Terminal" CompletionObjective: Replace "Paper & Trust" trade with a "Digital & Code" settlement terminal.Identity: Transitioned from generic BRICS to mBrics (Service-led branding).Aesthetic: "Institutional Metallic" — Charcoal, Financial Gold, and Brushed Silver.Trust Pillars: 6-service architecture (Payments, DDP, FX, F500 Network, Escrow, Auth).🚀 Key Milestones2026-01-14 – mBrics Service Pivot (The "Login Standard")UI Lock: Finalized the Login Page as the "Golden Copy" for all UI logic.Asset Standard: All feature icons standardized to 80x80 (high-density visual weight).Content: Moved from descriptive text to "Sales-Driven" service headings (e.g., "Fortune 500 Network" instead of "Verified Partners").Greeting Logic: Implemented brand-consistent time-of-day greetings (Prioritizing "Good evening").Tag: chk-2026-01-14-mbrics-pivot2026-01-11 – L10n & ARB SynchronizationSync: Full parity achieved between app_en.arb and app_zh.arb.Automation: flutter gen-l10n workflow established; all hard-coded strings removed from Login/Registration.Tag: chk-2026-01-11-arb-sync2026-01-07 – MasterLayout & Conversational FlowScaffold: Every page wrapped in MasterLayout for persistent branding.Hierarchy: Platinum styling for core trade functions; White/Silver for utilities.Tag: chk-2026-01-07-masterlayout-discipline🛠 Technical FrameworkFrontend: Flutter Web (Optimized for Chrome).Backend: Supabase (Auth, PostgreSQL, Secure Vault).L10n: ARB-based Dynamic Localization (EN/ZH).Branding: 350px center cards, 30px border radius, Gold-tinted shadows.📊 Implementation TrackingModuleStatusNotesLogin System✅ COMPLETEDFull Supabase Auth, 6-Pillar Features, ARB-Integrated.Registration🟡 IN PROGRESSNeeds update to the 80x80 Medallion aesthetic.Main Menu🟡 IN PROGRESSConversational flow active; needs final mBrics branding.Forex Engine🔴 PENDINGLocalize ZAR/e-CNY bridge logic.Smart Escrow🔴 PENDINGVisualizing "Vault Locked" status milestones.Logistics (DDP)🔴 PENDINGIntegrated SeaRates/Dutify Landed Cost view.🇨🇳 China Accessibility & PerformanceFont Strategy: Google Fonts (Inter) bundled locally to bypass API blocks.CDN: Prioritizing global edge nodes (Singapore/HK) for low-latency mainland access.Regionality: Supabase configured for high-speed routing to Chinese institutional partners (Xiangyu, BoC).🎯 Next Immediate Action: Registration Page UpgradeTo maintain continuity, the Registration Page must be transformed to match the Login screen's success:Register-Specific Icons: (Global ID, Zero Fees, Escrow Protection).Matching Medallions: Position the English/Chinese toggle identically to the Login page.UI Signature: 80x80 icons, Gold "Create Account" button, Silver "Back to Login" button.
🏁 Executive Summary: Phase 1 "Digital Terminal" Stability
Objective: Finalize the Institutional Entryway (Login/Registration) with zero-glitch performance. Identity: mBrics (Web3 Engine replacing Letters of Credit). Aesthetic: "Institutional Metallic" — 80x80 icons, Gold/Silver palette.

🚀 Key Milestones
2026-01-16 – The "Flicker Cure" & Deployment Protocol

UI Stability: Diagnosed and fixed the "Mobile Flicker Loop" caused by LayoutBuilder/Scroll conflicts.

Rendering Fix: Forced "html" renderer in index.html to bypass CanvasKit "white screen" issues on mobile touch.

Auth Ease: Disabled Email Verification in Supabase for frictionless investor demos.

Asset Lock: Standardized all 6 pillar icons to 80x80 with gold-ring medallions.

🛠 Technical Incident Report: The "Flicker" Issue
The Problem: On mobile browsers (Safari/Chrome), the login screen would disappear or flash white when touched or scrolled.

The Cause:

Rendering Engine: Flutter’s default "CanvasKit" engine is high-performance but often "pauses" on mobile web to save power, causing the screen to go blank.

Layout Loop: Placing a LayoutBuilder as the parent of a SingleChildScrollView created a loop. When the mobile keyboard or URL bar moved by even 1 pixel, the layout recalculated, resetting the scroll position and causing a visual "jump."

The Solution:

Structural Flip: We made SingleChildScrollView the parent. This locks the scroll context.

HTML Renderer: We switched the web engine to HTML tags, which the browser treats as a standard website, making it 100% stable for touch.

📦 Mandatory Deployment Ritual (The "Upload" Process)
To ensure no "ghost code" or old caches interfere with the live site, follow this exact sequence for every update:

Deep Clean (Terminal): Run: flutter clean Run: flutter pub get

Build for Stability (Forcing HTML): Ensure your web/index.html script forces the renderer to "html". Run: flutter build web --release

Vercel Production Push: Run: vercel deploy build/web --prod

📊 Implementation Tracking
Login System: COMPLETED. Flicker-free, 80x80 icons, simple language.

Registration: COMPLETED. Matched to Login UI, 80x80 icons, back-to-login logic.

Main Menu: IN PROGRESS. Needs update to the 80x80 institutional aesthetic.

Forex/Escrow: PENDING. Next on the roadmap.

🎯 Next Immediate Action: Main Menu Institutionalization
Now that the "Gate" (Login/Register) is perfect, we must apply the same 80x80 icon weight and Stable Scroll structure to the Main Menu. This ensures that once an investor logs in, the "Greatness of the Web3 Engine" is immediately felt.