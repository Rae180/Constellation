# 19 - Dependency Graph

# Constellation Dependency Graph

## Purpose

This document defines the allowed dependency relationships between modules in Constellation.

The dependency graph protects architectural boundaries and prevents tight coupling between subsystems.

All dependencies must follow the rules defined in this document.

---

# Dependency Philosophy

Dependencies should always point inward toward stable abstractions.

Higher-level modules may depend on lower-level contracts.

Lower-level modules must never depend on higher-level implementations.

Architecture should remain directional and predictable.

---

# Architectural Layers

Constellation is divided into five primary layers.

```text
Presentation

↓

Application

↓

Core

↓

Infrastructure

↓

External Systems
```

Dependencies must follow this flow.

---

# High-Level Dependency Graph

```text
Features
    │
    ▼
App
    │
    ▼
Core
    │
    ▼
Interfaces
    ▲
    │
Infrastructure
```

Infrastructure implements contracts.

Core defines contracts.

Features consume contracts.

---

# Layer Responsibilities

Presentation

User interface.

Application

Bootstrapping and orchestration.

Core

Business logic and domain rules.

Infrastructure

Storage, providers, networking, security.

External Systems

Operating system, databases, AI providers.

---

# Presentation Layer

Location:

```text
lib/features/
```

May depend on:

```text
app
core
shared
```

May NOT depend on:

```text
infrastructure
```

UI should never directly access databases or providers.

---

# Application Layer

Location:

```text
lib/app/
```

May depend on:

```text
core
shared
```

May NOT depend on:

```text
features
```

Application bootstraps the system.

It should not contain business logic.

---

# Core Layer

Location:

```text
lib/core/
```

May depend on:

```text
shared
```

May NOT depend on:

```text
features
app
infrastructure
```

Core should remain framework-independent.

---

# Infrastructure Layer

Location:

```text
lib/infrastructure/
```

May depend on:

```text
core
shared
```

May NOT depend on:

```text
features
app
```

Infrastructure implements contracts defined by Core.

---

# Shared Layer

Location:

```text
lib/shared/
```

May contain:

```text
widgets
extensions
constants
utilities
animations
```

Should remain lightweight.

Shared should never become a dumping ground.

---

# Feature Dependencies

Example:

```text
Chat Feature

↓

Coordinator Contract

↓

Pipeline Contract

↓

Memory Contract

↓

Inference Contract
```

Features communicate through contracts.

Features should not directly communicate with infrastructure.

---

# Coordinator Dependencies

Coordinator may depend on:

```text
Pipeline Contract

Memory Contract

Inference Contract
```

Coordinator should not know implementation details.

---

# Pipeline Dependencies

Pipeline may depend on:

```text
Agent Contract

Memory Contract

Inference Contract
```

Pipeline should remain provider-independent.

---

# Memory Dependencies

Memory may depend on:

```text
Storage Contract

Embedding Contract
```

Memory should not know database implementations.

---

# Provider Dependencies

Providers belong to Infrastructure.

Examples:

```text
Ollama

LM Studio

OpenAI

Gemini
```

Providers implement:

```text
Inference Contract
```

Core remains provider-agnostic.

---

# Database Dependencies

Database implementations belong to Infrastructure.

Examples:

```text
Drift

Future Databases
```

They implement repository contracts.

The Core should remain storage-independent.

---

# Dependency Direction Rule

Allowed:

```text
Feature

↓

Core Contract

↓

Infrastructure Implementation
```

Not Allowed:

```text
Feature

↓

Database
```

Not Allowed:

```text
Feature

↓

Provider
```

---

# Dependency Inversion

All major systems follow dependency inversion.

Example:

```text
Coordinator

↓

Inference Contract

↑

OpenAI Provider

Ollama Provider

LM Studio Provider
```

The Coordinator depends on abstractions.

Implementations depend on abstractions.

---

# Riverpod Dependencies

Providers should expose state.

Business logic should remain inside Core.

Avoid:

```text
UI Logic

Business Logic

Database Access

Provider Calls

All inside one Riverpod provider
```

State management is not architecture.

---

# GetIt Dependencies

GetIt acts as the composition root.

Location:

```text
app/bootstrap/
```

Responsibilities:

- Register services
- Register repositories
- Register providers
- Register coordinators

No business logic should exist in registrations.

---

# Future Plugin Dependencies

Version 3+

Plugins should depend only on:

```text
Public Contracts
```

Plugins must never access internal implementations.

---

# Forbidden Dependencies

The following are always forbidden:

```text
Feature → Infrastructure

Feature → Database

Feature → Provider

Core → Infrastructure

Core → Flutter Widgets

Core → Riverpod

Core → GoRouter

Infrastructure → Features

Infrastructure → App
```

Violations should be corrected immediately.

---

# Dependency Validation

Every new module should answer:

1. What does it depend on?

2. Why does it depend on it?

3. Is the dependency necessary?

4. Can it depend on a contract instead?

5. Does it violate architecture?

Dependencies should be intentional.

---

# Future Growth

Version 2

Adaptive specialist system.

Version 3

Plugin architecture.

Version 4

Distributed execution.

The dependency graph should support future expansion without architectural rewrites.

---

# Dependency Principles

1. Depend on abstractions.

2. Keep dependencies directional.

3. Avoid circular dependencies.

4. Minimize coupling.

5. Prefer contracts over implementations.

6. Keep Core independent.

7. Protect architectural boundaries.

8. Avoid unnecessary dependencies.

9. Design for replacement.

10. Keep the graph understandable.

---

# Success Criteria

The dependency graph succeeds when every subsystem can evolve independently while preserving architectural boundaries.

A new contributor should be able to understand which dependencies are allowed, which are forbidden, and how information flows throughout Constellation without inspecting implementation details.