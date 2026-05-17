# Development Workflow

## 1. Feature Initiation
- Check `docs/features/registry.md` to see if the feature exists.
- Check `docs/arch/event-driven.md` for existing events you might need to listen to.
- Use the `docs/how-to/add-feature.md` template.

## 2. Iterative Development
1. **Models First**: Define your `@freezed` request and response models.
2. **Domain Next**: Define the Entity, Repository interface, and UseCase.
3. **Data Implementation**: Write the DataSource and Repository implementation using `OperationPipeline`.
4. **UI Last**: Build the Notifier and Widgets.

## 3. Atomic Commits
Commit after each layer is complete.
- `feat(feature): add data models`
- `feat(feature): implement repository`
- `feat(feature): add ui components`

## 4. Documentation Update
Every feature added MUST be registered in `docs/features/registry.md` with its current status.
Every event added MUST be registered in `docs/arch/event-driven.md`.

