# API Integration Guide

This guide describes how to wire a new API endpoint to the UI using the FEDA v4 pipeline.

## 1. Define the Models
Create your request and response models in `data/models/`. Use `@freezed`.

```dart
@freezed
abstract class UserRequest with _$UserRequest {
  const factory UserRequest({
    @JsonKey(name: 'id') required String id,
  }) = _UserRequest;
  factory UserRequest.fromJson(...) => ...;
}
```

## 2. Implement the DataSource
Use the `OperationPipeline` to wrap your `ApiClient` call.

```dart
@override
Future<Result<UserModel, AppException>> fetchUser(UserRequest request) {
  return OperationPipeline<UserModel>
      .of(tag: _tag, name: 'fetchUser')
      .executeSource(() async {
        final response = await _apiClient.request(
          ApiUrls.userProfile,
          queryParams: request.toJson(),
        );
        // ... parse and return model
      });
}
```

## 3. Map to Entity in Repository
The Repository is the layer that handles the translation.

```dart
@override
Future<Result<UserEntity, Failure>> getUser(UserParams params) {
  return OperationPipeline<UserModel>
      .of(tag: _tag, name: 'getUser')
      .executeResult(
        source: () => _dataSource.fetchUser(UserRequest(id: params.userId)),
        map: (model) => model.toEntity(),
      );
}
```

---
*Reference: [Operation Pipeline How-to](file:///docs/how-to/operation-pipeline.md)*

