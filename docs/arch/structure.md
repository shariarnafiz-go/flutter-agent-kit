# Project Structure

The project follows a strict directory layout to prevent architectural drift.

## 📁 Root Layout
```
lib/
├── core/               # Cross-cutting concerns (Network, Logic, UI system)
│   ├── events/         # EventBus, EventLogger
│   ├── pipeline/       # OperationPipeline
│   ├── preference/     # PrefsKit
│   ├── theme/          # Design system tokens
│   └── utils/          # Result pattern, extensions
├── features/           # Domain-specific logic (Feature-First)
│   ├── auth/
│   ├── dashboard/
│   └── network/
└── main.dart           # App entry point & initialization
```

## Feature Sub-folders
See [Architecture Overview](overview.md) for a detailed breakdown of layers within a feature.

## The Core Layer
- **`pipeline/`**: The engine of the app. It converts API calls into `Result` types.
- **`preference/`**: The ONLY place where persistence is handled.
- **`theme/`**: Contains `AppColors`, `AppTextStyles`, and `AppSystemIcons` (RULE-018).

## Testing Structure
Tests mirror the `lib/` folder exactly.
```
test/
├── core/
└── features/
    ├── auth/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
```


