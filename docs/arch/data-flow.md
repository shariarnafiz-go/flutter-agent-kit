# Reactive Data Flow

Data flows in a unidirectional loop.

## 1. Request Flow (Command)
1. **UI** triggers a Notifier method.
2. **Notifier** calls a **UseCase**.
3. **UseCase** calls the **Repository**.
4. **Repository** maps domain params to a **RequestModel**.
5. **DataSource** uses **OperationPipeline** to call the API.

## 2. Response Flow (Result)
1. **API** returns JSON.
2. **DataSource** parses JSON into a **ResponseModel**.
3. **OperationPipeline** catches any exceptions and returns `Result<Model, AppException>`.
4. **Repository** maps the model to an **Entity** and returns `Result<Entity, Failure>`.
5. **UseCase** passes it back to the **Notifier**.

## 3. The "Live" Shortcut (`LiveCache`)
For real-time dashboards:
1. **UI** watches a `StreamNotifier`.
2. **StreamNotifier** calls `OperationPipeline.watchResult()`.
3. **Pipeline** immediately emits the **Cache** (if available).
4. **Pipeline** fetches the **Network** in the background.
5. **Pipeline** emits the fresh network value, overwriting the cache in the UI.
6. **Pipeline** listens to **DomainEvents** (e.g., `RefreshRequested`) to trigger a new cycle.

---
*Reference: [Caching Strategies](../how-to/caching.md)*

