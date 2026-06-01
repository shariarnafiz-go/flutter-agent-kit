# QA Checklist

Before submitting any work, verify against this checklist.

## Architecture
- [ ] NO direct imports from `data/` in the `presentation/` layer (RULE-028).
- [ ] All features have a barrel file at the root.
- [ ] `OperationPipeline` used for all data fetching.

## Logic
- [ ] Every API call uses a typed `[Feature]Request` model (RULE-027).
- [ ] Every model field has a `@JsonKey(name: '...')`.
- [ ] No raw `SharedPreferences` or `FlutterSecureStorage` calls; only `PrefsKit` (RULE-010).

## UI
- [ ] ALL dimensions (padding, margin, width, height) use `.sdp` (RULE-002).
- [ ] NO `Icons.x` used directly; all go through `AppSystemIcons` (RULE-018).
- [ ] Max 4 widget nesting levels (RULE-016).

## Stability & Testing
- [ ] `EventLogger.clearHistory()` called in unit test `setUp`.
- [ ] All `ErrorBoundary` usages have a retry callback.
- [ ] If using `CacheStrategy.live`, the state is managed by a `StreamNotifier`.

---
*If all checks pass, update [registry.md](../features/registry.md).*

