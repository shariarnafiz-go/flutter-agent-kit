# [PROJECT_NAME] — AI Agent Guide

Welcome, Agent. You are developing **[PROJECT_NAME]**, a Flutter application built with **Feature-First Event-Driven Clean Architecture (FEDA)**.

> [!IMPORTANT]
> This document is your Single Source of Truth. Before taking any action, you MUST read and adhere to the rules and patterns linked below.

## Documentation Map

| Area | Purpose | Link |
|---|---|---|
| **Rules** | Mandatory constraints (31 rules) | [rules.md](docs/agent/rules.md) |
| **Patterns** | How to write FEDA code correctly | [code-style.md](docs/agent/code-style.md) |
| **Architecture** | FEDA principles & layers | [overview.md](docs/arch/overview.md) |
| **Events** | Domain Events & Event Bus | [event-driven.md](docs/arch/event-driven.md) |
| **Setup** | SDK & Project configuration | [setup.md](docs/dev/setup.md) |
| **Registry** | All features and their status | [registry.md](docs/features/registry.md) |

## Tech Stack

- **Core**: Flutter 3.41.7, Dart 3.11.5
- **State**: Riverpod 3.0+
- **Logic**: OperationPipeline<T> (Unified Result pattern)
- **Data**: Freezed, JsonSerializable
- **Messaging**: EventBus (StreamController)
- **Scaling**: .sdp for all dimensions

## Core Workflow

1. **Research**: Check `registry.md` and `event-driven.md` (Event Catalog) before starting.
2. **Plan**: Propose changes in an implementation plan. Reference specific RULE IDs.
3. **Execute**: Use `OperationPipeline` for all data operations. Register new events in the catalog.
4. **Verify**: Run tests as per the [test guide](docs/test/guide.md).

---
*Repository: [REPO_URL]*


