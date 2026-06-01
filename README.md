![Flutter Agent Kit Banner](docs/assets/banner.png)

# Flutter Agentic Development Rules with Feature-First Event-Driven Clean Architecture

A highly structured, production-grade template and documentation kit implementing **Feature-First Event-Driven Clean Architecture (FEDA)** for Flutter. Designed from the ground up for extreme scaling, high testability, and seamless **AI-Driven Agentic Development** (optimized for Cursor, Claude, and Gemini).

---

[![Architecture: FEDA v4](https://img.shields.io/badge/Architecture-FEDA%20v4-8A2BE2?style=for-the-badge&logo=fluentd)](docs/arch/overview.md)
[![Flutter: >=3.41.7](https://img.shields.io/badge/Flutter-%3E%3D3.41.7-02569B?style=for-the-badge&logo=flutter)](docs/dev/setup.md)
[![Dart: >=3.11.5](https://img.shields.io/badge/Dart-%3E%3D3.11.5-0175C2?style=for-the-badge&logo=dart)](docs/dev/setup.md)
[![State: Riverpod 3.0+](https://img.shields.io/badge/State-Riverpod%203.0%2B-lightgrey?style=for-the-badge&logo=riverpod)](docs/dev/setup.md)
[![Agent Ready: Cursor | Claude | Gemini](https://img.shields.io/badge/Agent_Ready-Cursor%20%7C%20Claude%20%7C%20Gemini-success?style=for-the-badge)](docs/agent/overview.md)

---

## Table of Contents

- [Introduction to FEDA v4](#introduction-to-feda-v4)
- [What's Inside?](#whats-inside)
- [Architectural Blueprint](#architectural-blueprint)
- [Documentation Map](#documentation-map)
- [5-Minute Quickstart](#5-minute-quickstart)
- [Core Components Showcase](#core-components-showcase)
  - [1. OperationPipeline](#1-operationpipeline)
  - [2. Event Bus & Event Logging](#2-event-bus--event-logging)
  - [3. Enterprise Caching Strategies](#3-enterprise-caching-strategies)
- [AI Agent Alignment & Strict Rules](#ai-agent-alignment--strict-rules)
- [Prerequisites & Tech Stack](#prerequisites--tech-stack)
- [Contributing & Standards](#contributing--standards)

---

## Introduction to FEDA v4

**Feature-First Event-Driven Clean Architecture (FEDA)** represents a paradigm shift in structuring Flutter enterprise applications. While typical Clean Architecture implementations become bloated or split by technical layer (leading to "layer spaghetti"), FEDA divides your codebase strictly by **Domain Feature**. 

Features are completely self-contained and communicate **asynchronously** via a global **Event Bus**. This design pattern minimizes coupling, ensures lightning-fast build-runner generation, and provides clear guardrails that allow **AI Coding Agents** to safely create, modify, and delete features without breaking the rest of the application.

---

## What's Inside?

* **Unified Logic Pipeline**: `OperationPipeline<T>` replaces convoluted mixins and handlers, offering a declarative API for network calls, mapping, automated retries, and errors as values.
* **Decoupled Observability**: Global `EventBus` and `EventLogger` with a 200-event ring buffer for seamless, time-travel-like debugging and trace diagnostics.
* **Native Crash Resilience**: Standardized `ErrorBoundary` wrappers and smart state hydration guard against UI crashes.
* **Enterprise Caching**: Built-in 4-tier caching engine (`CacheFirst`, `NetworkFirst`, `StaleWhileRevalidate`, `LiveCache`) with tag-based invalidation.
* **Strict Agent Alignment**: A suite of 31 machine-readable rules (`RULE-001` through `RULE-030`) packaged to keep AI assistants strictly within architectural boundaries.

---

## Architectural Blueprint

### Folder Structure (Feature-First)
Each feature lives inside its own self-contained directory under `lib/features/[feature_name]/`. Communication with other features occurs strictly through the feature's public barrel file.

```
lib/
├── core/                         # Cross-cutting system modules
│   ├── events/                   # EventBus & EventLogger
│   ├── pipeline/                 # OperationPipeline framework
│   ├── preference/               # PrefsKit local storage
│   ├── theme/                    # Color, text, and icon constants
│   └── utils/                    # Common extensions & result structures
└── features/                     # Self-contained business features
    └── [feature_name]/
        ├── [feature_name].dart   # Feature Barrel File (Public API)
        ├── data/                 # Data sources & API serialization
        ├── domain/               # Pure business models, entities & use cases
        └── presentation/         # Riverpod Notifiers & UI widgets
```

### The Data Flow
FEDA enforces a strict, unidirectional data pipeline:

$$\text{External API} \longrightarrow \text{Data Source (Model)} \longrightarrow \text{Repository (Entity)} \longrightarrow \text{State Notifier (Riverpod)} \longrightarrow \text{UI Widget}$$

---

## Documentation Map

This repository includes exhaustive, dedicated guides for every part of the FEDA workflow. Use the links below for direct access:

| Section | Focus | Relative Link |
| :--- | :--- | :--- |
| **Architectural Overview** | FEDA core philosophy and rules | [docs/arch/overview.md](docs/arch/overview.md) |
| **Directory Blueprint** | Folder breakdown of core and features | [docs/arch/structure.md](docs/arch/structure.md) |
| **Event System** | Pub/Sub, stream architecture and Event Catalog | [docs/arch/event-driven.md](docs/arch/event-driven.md) |
| **Data Flow** | How data moves across the layers | [docs/arch/data-flow.md](docs/arch/data-flow.md) |
| **Strict Agent Rules** | 31 strict, machine-readable rules | [docs/agent/rules.md](docs/agent/rules.md) |
| **Operation Pipeline** | Declarative API for network requests | [docs/how-to/operation-pipeline.md](docs/how-to/operation-pipeline.md) |
| **Caching Strategies** | Setup instructions for the 4-tier cache | [docs/how-to/caching.md](docs/how-to/caching.md) |
| **Development Setup** | Tooling, SDK versions, and commands | [docs/dev/setup.md](docs/dev/setup.md) |
| **Feature Registry** | Ongoing features tracker and statuses | [docs/features/registry.md](docs/features/registry.md) |
| **Testing Guide** | How to write unit, mock, and widget tests | [docs/test/guide.md](docs/test/guide.md) |

---

## 5-Minute Quickstart

Getting a FEDA-compliant project running is fully automated. Follow these quick steps:

### 1. Copy Kit Files
Copy the `flutter-agent-kit/` directory into your target Flutter project root.

### 2. Configure project.md
Open `project.md` and customize your project identity, SDK limits, caching intervals, and package specifications:
```yaml
name: "FEDA App"
package: "feda_app"
flutter_version: "3.41.7"
dart_version: "3.11.5"
riverpod: true
freezed: true
cache_enabled: true
```

### 3. Run Automation Script
Execute the setup automation script in a PowerShell terminal. This script loads your configuration, replaces all `[TOKENS]` across the template files, and copies the master entry points into your active Flutter directory tree.
```powershell
./setup.ps1
```

### 4. Direct Your AI Agent
Point your AI agent (Gemini, Claude, or Cursor) to `GEMINI.md` located in the root of your newly set-up project. This acts as the Agent's blueprint and anchors its coding workflow.

---

## Core Components Showcase

### 1. OperationPipeline
The `OperationPipeline<T>` replaces arbitrary try-catch blocks and helper mixins with a clean, unified fluent API.

```dart
final pipeline = OperationPipeline<UserModel>.of(
  tag: 'UserDataSource', 
  name: 'fetchUser',
);

// executeSource catches exceptions and wraps values in a Result.failed or Result.success
final result = await pipeline
  .withRetry(3, delay: const Duration(seconds: 1))
  .executeSource(() async {
     return await _apiClient.getUser();
  });
```

### 2. Event Bus & Event Logging
Features communicate entirely via events. An event is modeled as a `@freezed sealed class` variant and dispatched onto the central `EventBus`.

```dart
// Emit an event securely
ref.read(eventBusProvider).emit(
  DomainEvent.authStatusChanged(isLoggedIn: true),
);

// React to the event in a decoupled feature
ref.read(eventBusProvider)
  .on<AuthStatusChanged>()
  .listen((event) {
     if (!event.isLoggedIn) {
       _clearLocalCache();
     }
  });
```

### 3. Enterprise Caching Strategies
Caching is baked directly into the `OperationPipeline` and supports four customizable strategies:

| Strategy | Cache Status | Network Action | Typical Use Case |
| :--- | :--- | :--- | :--- |
| **`CacheFirst`** | Return immediately if valid | Hit only if cache is invalid/missing | Configuration & local static data |
| **`NetworkFirst`** | Fallback if network fails | Hit network first; update cache | Live transactional details |
| **`StaleWhileRevalidate`** | Return instantly | Fetch in background; update cache | Social feeds, dashboards, catalogs |
| **`LiveCache`** | Stream cache instantly | Stream network response when ready | High-frequency charts and tickers |

---

## AI Agent Alignment & Strict Rules

AI coding models perform exceptionally well when restricted by absolute, deterministic constraints. FEDA v4 provides a strict contract of **31 development rules** (`RULE-001` through `RULE-030`). Key highlights include:

* **`RULE-001` (Layer Encapsulation)**: Absolute relative imports only. Imports must never reference another feature's internal `data/` or `presentation/` structures directly.
* **`RULE-005` (Failure Handling)**: Repositories and UseCases **must** return typed `Result<T, Failure>` models. Throwing raw exceptions is strictly forbidden.
* **`RULE-018` (Design Integrity)**: Direct icon references are banned. All widgets must reference centralized, conceptual `AppSystemIcons` keys.
* **`RULE-029` (Event Governance)**: Agents are strictly prohibited from implementing a new event variant without registering it first in the global **Event Catalog** (`docs/arch/event-driven.md`).

For the comprehensive, non-negotiable list of constraints, review the [Agent Rules Sheet](docs/agent/rules.md).

---

## Prerequisites & Tech Stack

Ensure your machine and target project satisfies these constraints:
* **Flutter SDK**: `>= 3.41.7` (FVM strongly recommended)
* **State Management**: Riverpod `3.0+`
* **JSON Serialization**: Freezed & JsonSerializable
* **Local Persistence**: PrefsKit (`Preference<T>`)
* **Responsive Scaling**: `.sdp` extension scaling for all layout dimensions

---

*Created for Advanced Agentic Coding.*