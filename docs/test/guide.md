# Testing Guide

Testing is not optional in FEDA.

## 1. Unit Testing (Logic)
Target: UseCases and Repositories.

### Mocking
Use `mocktail` or `mockito`.
```dart
class MockAuthDataSource extends Mock implements AuthRemoteDataSource {}
```

### Deterministic Events
Always clear the event history before each test.
```dart
setUp(() {
  EventLogger.clearHistory(); // RULE-021
});
```

## 2. Widget Testing (UI)
Target: Presentation widgets.
- Wrap widgets in a `ProviderScope` for testing.
- Use `sdp` dimensions in your `pumpWidget` surface size.

## 3. Integration Testing
Target: Complete feature flows.
- Use `mock_api` or `msw`-like mocking at the network level.

## 🚦 Test Checklist
- [ ] Logic returns `Result.success` on valid input.
- [ ] Logic returns `Result.failed` on network error.
- [ ] Domain event is emitted on success.
- [ ] Cache is updated correctly.

