# Flutter Agentic Development Rules with Feature-First Event-Driven Clean Architecture

These rules are non-negotiable. Any violation is a failure of architectural integrity. AI coding models and developers MUST adhere to these constraints at all times.

## Structural Rules

| ID | Rule |
|---|---|
| **RULE-001** | Relative imports only — never `package:[PACKAGE]/...` for internal files. |
| **RULE-002** | `.sdp` scaling for ALL layout values (padding, margin, size) — never use raw doubles. |
| **RULE-003** | Use `@freezed abstract class` for all entities, models, and state classes. |
| **RULE-004** | Explicit `@JsonKey(name: '...')` on every single model field to handle API changes safely. |
| **RULE-005** | Repository and UseCase layers MUST return `Result<T, Failure>` — they are strictly forbidden from throwing exceptions. |
| **RULE-006** | No cross-layer imports — the Presentation layer imports from Domain only. Data layer is invisible to UI. |
| **RULE-007** | One barrel file per feature — `[feature_name].dart` at the feature root. No nested barrels. |
| **RULE-008** | Data layer files (models, data sources) MUST NOT be exported from the feature barrel file. |
| **RULE-009** | Constructor injection for DataSources and Repositories — never pass `Ref` into a constructor. |
| **RULE-010** | **All storage goes through `PrefsKit`** — never call `SharedPreferences` or `FlutterSecureStorage` directly. |
| **RULE-010b** | **Sensitive data uses `secure: true`** in the `Preference` declaration inside `PrefsKit`. |

## Development Rules

| ID | Rule |
|---|---|
| **RULE-011** | No UI/design changes during API integration work. UI and Logic are separate tasks. |
| **RULE-012** | `@riverpod` annotation is used ONLY on Notifiers. Data/Domain layers use plain `Provider<T>`. |
| **RULE-013** | `OperationPipeline.executeSource()` MUST wrap all data source network calls. |
| **RULE-014** | `const _tag = 'ClassName';` MUST be defined at the top of every data source and repository file. |
| **RULE-015** | UseCase `Provider<T>` MUST be declared at the BOTTOM of the use case file. |
| **RULE-016** | Max 4 widget nesting levels — extract deeper subtrees into separate private widgets. |
| **RULE-017** | Class names MUST follow the `[Feature][Type]` convention (e.g., `NetworkRepositoryImpl`). |
| **RULE-018** | **Icon Abstraction Mandate** — All icon references MUST use `AppSystemIcons.*` constants. |

## FEDA+ (Event & Cache) Rules

| ID | Rule |
|---|---|
| **RULE-019** | All Domain Events MUST be `@freezed sealed class` variants. |
| **RULE-020** | All event emissions MUST go through `EventBus.emit()` — never use `_controller.add()`. |
| **RULE-021** | `EventLogger.clearHistory()` MUST be called in `setUp()` for all unit tests involving events. |
| **RULE-022** | All `ErrorBoundary` usages MUST provide a `retry` callback — never swallow errors silently. |
| **RULE-023** | `OperationPipeline<T>` replaces all mixins. `DataSourceHandlerMixin` is forbidden. |
| **RULE-024** | Cache keys MUST include all dynamic parameters (e.g., `'network_${timeframe}_${currency}'`). |
| **RULE-025** | Cache invalidation triggered by a `DomainEvent` MUST use `invalidateByTag()`. |
| **RULE-026** | `CacheStrategy.live` REQUIRES `StreamNotifier<State>`. Regular `Notifier` MUST NOT use `watchResult()`. |
| **RULE-027** | **DataSource methods MUST accept a typed `[Feature]Request` model** — never raw parameters. |
| **RULE-028** | **Layer Firewall** — `presentation/` is strictly forbidden from importing any file in `data/`. |
| **RULE-029** | **Event Catalog Mandate** — New events MUST be registered in the Global Event Catalog in `docs/arch/event-driven.md` first. |
| **RULE-030** | **Emoji Prohibition** — Emojis MUST NOT be used in code, comments, or documentation. |
