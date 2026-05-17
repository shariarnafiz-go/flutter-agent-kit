# Architecture Overview: FEDA v4

**Feature-First Event-Driven Clean Architecture (FEDA)** is designed for scale, testability, and AI-driven development.

## 核心 (Core) Principles

1. **Feature-First**: Code is organized by business feature, not technical role. A single folder contains everything needed for a feature to work.
2. **Event-Driven**: Features are decoupled. They communicate via `DomainEvents` on a central `EventBus`. Feature A never calls a Notifier in Feature B.
3. **Clean Layers**:
   - **Data**: Infrastructure, API models, Storage (PrefsKit).
   - **Domain**: Pure business logic, Entities, UseCases.
   - **Presentation**: UI, Notifiers (Riverpod), Widgets.
4. **Result-First**: Errors are values, not side effects. Every operation returns a `Result<T, Failure>`.

## 📦 Feature Structure

```
lib/features/[feature_name]/
├── [feature_name].dart          # Barrel file (Public API)
├── data/
│   ├── data_sources/            # API/Local storage
│   └── models/                  # Request/Response models
├── domain/
│   ├── entities/                # Pure UI-ready objects
│   ├── repositories/            # Interfaces
│   └── use_cases/               # Granular logic units
└── presentation/
    ├── notifiers/               # State management
    └── widgets/                 # UI components
```

## 🔄 Data Flow

`API → Model → Entity → State → UI`

The `OperationPipeline` manages the complexity of this flow, providing retries, caching, and mapping out-of-the-box.

---
*Next: [Event-Driven Communication](file:///docs/arch/event-driven.md)*

