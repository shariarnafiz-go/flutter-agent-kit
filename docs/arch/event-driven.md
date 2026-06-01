# Event-Driven Architecture

FEDA uses a central `EventBus` to allow features to talk to each other without becoming tightly coupled.

## 1. The Event Bus
The `EventBus` is a singleton `StreamController.broadcast()`.
- Features **emit** events when something important happens (e.g., `UserLoggedIn`).
- Other features **listen** to specific event types and react (e.g., the Cart feature clears itself when `UserLoggedOut` is detected).

## 2. Event Structure
Events are defined as `@freezed sealed class` variants.

```dart
@freezed
sealed class DomainEvent with _$DomainEvent {
  const factory DomainEvent.authStatusChanged({required bool isLoggedIn}) = AuthStatusChanged;
  const factory DomainEvent.refreshRequested({required String featureTag}) = RefreshRequested;
}
```

## Global Event Catalog (RULE-029)

Agents MUST register all new events here to ensure "Feature Discovery".

| Event Variant | Feature (Owner) | Description | Payload |
|---|---|---|---|
| `authStatusChanged` | Auth | Emitted on login/logout | `isLoggedIn: bool` |
| `refreshRequested` | Core | Global trigger to re-fetch data | `featureTag: String` |
| `operationFailed` | Pipeline | Emitted by OperationPipeline on error | `tag, name, message` |

## Event Logger
The `EventLogger` maintains a 200-event ring buffer. This allows you to inspect the "history of truth" in the application during debugging or testing.

---
*Reference: [How-to Add an Event](../how-to/add-event.md)*

