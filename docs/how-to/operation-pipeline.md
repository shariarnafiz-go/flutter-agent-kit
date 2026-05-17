# How-to: Use the OperationPipeline

The `OperationPipeline` is the single entrance for all data logic. It replaces legacy mixins and provides a unified API.

## 1. Creating a Pipeline

```dart
final pipeline = OperationPipeline<UserModel>.of(
  tag: 'UserDataSource', 
  name: 'fetchUser',
);
```

## 2. Terminal Methods

### `executeSource` (Data Source Layer)
Used to wrap raw async calls. It catches all `AppException` variants and returns them as a `Result.failed`.

```dart
final result = await pipeline.executeSource(() async {
  return await _apiClient.getUser();
});
```

### `executeResult` (Repository Layer)
Used to bridge the gap between models and entities.

```dart
final result = await pipeline.executeResult(
  source: () => _dataSource.fetchUser(request),
  map: (model) => model.toEntity(),
);
```

## 3. Adding Modifiers

### Retries
```dart
pipeline.withRetry(3, delay: const Duration(seconds: 1));
```

### Event Bus Integration
Use this if you want failures to be broadcasted globally (e.g., for showing global snackbars).

```dart
pipeline.withEventBus(ref.read(eventBusProvider));
```

---
*Next: [Caching with Pipeline](file:///docs/how-to/caching.md)*

