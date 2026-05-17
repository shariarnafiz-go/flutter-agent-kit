# How-to: Caching Strategies

FEDA v4 supports 4 caching strategies via `.withCache()`.

## 1. Caching Configuration

```dart
pipeline.withCache(
  key: 'my_cache_key',
  ttl: const Duration(hours: 1),
  strategy: CacheStrategy.networkFirst,
);
```

## 2. The 4 Strategies

| Strategy | Behavior | Use Case |
|---|---|---|
| **CacheFirst** | Return cache if valid; otherwise hit network. | Static data (config, constants). |
| **NetworkFirst** | Hit network first; fallback to cache on failure. | Live data where freshness is key. |
| **StaleWhileRevalidate** | Return cache instantly; refresh network in background. | Social feeds, news, lists. |
| **LiveCache** (Stream) | Emit cache instantly; emit network value when it arrives. | Real-time dashboards, price updates. |

## 3. Real-Time Updates with `LiveCache`

To use `LiveCache`, you MUST use `watchResult()` instead of `executeResult()`.

```dart
@riverpod
class PriceNotifier extends _$PriceNotifier {
  @override
  Stream<Result<PriceEntity, Failure>> build() {
    return OperationPipeline<PriceModel>
        .of(tag: 'Price', name: 'watchPrice')
        .withCache(strategy: CacheStrategy.live)
        .watchResult(
           source: () => _dataSource.watchPrice(),
           map: (model) => model.toEntity(),
        );
  }
}
```

## 4. Invalidation
Use `invalidateByTag(tag)` to clear groups of related cache entries (e.g., `'price_updates'`).

