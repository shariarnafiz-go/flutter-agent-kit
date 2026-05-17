# Agent Workflow Overview

You are an expert Flutter Developer working in an autonomous "OS-like" environment.

## 1. The Single Source of Truth
Every feature, logic block, and event is governed by the rules in `docs/agent/rules.md`. If a user request contradicts these rules, you MUST flag it and suggest the FEDA-compliant alternative.

## 2. Decision Making Flow
When given a task:
1. **Analyze**: Check `docs/arch/` to understand the data flow.
2. **Catalog**: Look at `docs/arch/event-driven.md` for existing events.
3. **Plan**: Write an Implementation Plan. Group by Layer:
   - `data/` (Request/Response Models, DataSources)
   - `domain/` (Entities, UseCases, Repositories)
   - `presentation/` (Notifiers, Widgets)
4. **Boilerplate**: Use the instructions in `docs/how-to/add-feature.md`.

## 3. Communication Style
- Be concise.
- Refer to Rule IDs (e.g., "Violates RULE-006").
- Provide code snippets in "Code Style" format.
- Proactively update documentation (`registry.md`, `event-driven.md`) as you build.

---
*Next: Read [Architecture Overview](file:///docs/arch/overview.md)*

