# Code Style & Patterns

## 1. Unified Result-First Logic

Every logic unit MUST return a `Result<T, Failure>`. Use the `OperationPipeline` to achieve this.

### Data Source (Remote)
```dart
@override
Future<Result<NetworkModel, AppException>> fetchNetwork(NetworkRequest request) {
  return OperationPipeline<NetworkModel>
      .of(tag: _tag, name: 'fetchNetwork')
      .withRetry(1)
      .executeSource(() async {
        final response = await _apiClient.request(
          ApiUrls.network,
          queryParams: request.toJson(),
        );
        if (response.isSuccess) {
          final api = ApiResponse<NetworkModel>.fromJson(
            response.data,
            fromJsonT: NetworkModel.fromJson,
          );
          return api.data!;
        }
        throw ApiExceptionHandler.handle(statusCode: response.statusCode!);
      });
}
```

### Repository
```dart
@override
Future<Result<NetworkEntity, Failure>> getNetwork(GetNetworkParams params) {
  final request = NetworkRequest(timeframe: params.timeframe.name);

  return OperationPipeline<NetworkModel>
      .of(tag: _tag, name: 'getNetwork')
      .executeResult(
        source: () => _dataSource.fetchNetwork(request),
        map: (model) => model.toEntity(),
      );
}
```

## 2. Widget Extraction (RULE-016)

Avoid "Mega-Widgets". If your `build` method exceeds 60 lines or has >4 nesting levels, extract subtrees.

```dart
// ❌ BAD
@override
Widget build(BuildContext context, WidgetRef ref) {
  return Scaffold(
    body: Container(
      padding: EdgeInsets.all(16.sdp),
      child: Column(
        children: [
          Container(
             child: Row(
               children: [
                 Text('Header'), // Nesting level 5+
               ],
             ),
          ),
        ],
      ),
    ),
  );
}

// ✅ GOOD
@override
Widget build(BuildContext context, WidgetRef ref) {
  return Scaffold(
    body: _BodyContent(),
  );
}

class _BodyContent extends StatelessWidget { ... }
```

## 3. Dependency Injection

Always use named parameters in constructors for Repositories and DataSources.

```dart
class MyRepositoryImpl implements MyRepository {
  final MyRemoteDataSource _remoteDataSource;

  MyRepositoryImpl({
    required MyRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
}
```

