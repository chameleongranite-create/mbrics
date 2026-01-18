{
  "project_identity": {
    "name": "mBrics Web3 Engine",
    "mission": "A high-performance institutional trade gateway replacing traditional bank Letters of Credit (LC) with Blockchain Smart Escrow and Document Verification.",
    "branding_rules": [
      "Strictly 'mBrics'. Never generic 'BRICS'.",
      "Tone: Simple language for everyday users, impressive terminology for institutional investors.",
      "Key Concept: The 'Digital Policeman' — ensuring trust through decentralized verification.",
      "Emphasis: Technology, Blockchain, Global Trade, and Trust."
    ]
  },
  "ui_ux_specification": {
    "palette": {
      "primary_gold": "#C2994B",
      "background_off_white": "#F8F9FA",
      "terminal_black": "#121212 (Primary background for the Execution Layer)",
      "neutral_silver": "#A7A9AC",
      "success_green": "#2E7D32"
    },
    "typography_china_compliant": {
      "strategy": "No GoogleFonts. Use MBricsTheme constants only.",
      "prose": "Inter (Local Asset: assets/fonts/Inter_24pt-Regular.ttf)",
      "technical": "ShareTechMono (Local Asset: assets/fonts/ShareTechMono-Regular.ttf)"
    },
    "mobile_flicker_fix": "Physics: ClampingScrollPhysics() is mandatory for all SingleChildScrollViews to prevent iOS/Android bounce flicker."
  },
  "technical_infrastructure": {
    "stack": "Flutter Web + Supabase Auth/DB",
    "rendering_protocol": "HTML Renderer (Mandatory for stable China-based mobile access).",
    "localization": {
      "mode": "Physical/Direct (synthetic-package: false)",
      "directory": "lib/l10n/",
      "workflow": "Update ARB -> Run 'flutter gen-l10n' -> Manual verification of mainmenu/pillars sections."
    },
    "auth_metadata": {
      "greeting_logic": "Extracts 'full_name' or 'name' from Supabase metadata. Fallback: 'Partner'."
    }
  },
  "system_architecture": {
    "layer_1_entrance": ["Login Screen", "Registration Screen"],
    "layer_2_navigation": ["Main Menu (The 6-Pillar Dashboard)"],
    "layer_3_execution": [
      "DDP Command (Landed Cost Command Center)",
      "Settlement Engine (Global Pay)",
      "Trust Engine (The Digital Policeman / LC Replacement)",
      "Forex Bridge (Currency Locking)",
      "Trade Visualizer (Live Blockchain Timeline)",
      "Network Hub (Verified Institutional Directory)"
    ]
  },
  "publishing_rituals": {
    "step_1": "flutter clean && flutter pub get && flutter gen-l10n",
    "step_2": "flutter build web --release --web-renderer html",
    "step_3": "vercel deploy build/web --prod",
    "step_4_essential": "Update Supabase Dashboard: Redirect URIs must point to the official production domain (not localhost)."
  },
  "investor_roadmap": {
    "current_status": "Phase 1 COMPLETE: UI Lock & Global Localization (EN/ZH).",
    "demo_readiness": "Simulation Mode Active. All modules utilize 'System Notice' popups via ARB keys for development transparency.",
    "next_milestone": "Phase 2: Live Smart Contract binding and real-time logistics API integration (Xiangyu/Carrier-level)."
  }
}