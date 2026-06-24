# 03 - Architecture

# Constellation Architecture

## Purpose

This document describes the software architecture of Constellation.

The architecture is designed to be:

* Modular
* Replaceable
* Testable
* Offline-first
* Scalable
* Future-proof

Every subsystem should have a single responsibility and communicate through well-defined interfaces.

---

# Architectural Philosophy

Constellation is **not** a Flutter application with AI features.

Constellation is an AI operating system whose first client is a Flutter application.

The UI is only one layer of the system.

The intelligence lives inside the Constellation Core.

---

# High-Level Architecture

```text
                   Flutter Application
                           │
                           ▼
                 Presentation Layer
                           │
                           ▼
                 Application Layer
                           │
                           ▼
                  Constellation Core
                           │
      ┌────────────────────┼────────────────────┐
      ▼                    ▼                    ▼
Coordinator         Pipeline Engine      Memory Service
      │                    │                    │
      └──────────────┬─────┴──────────────┬─────┘
                     ▼                    ▼
               Agent Manager       Model Manager
                     │                    │
                     ▼                    ▼
               AI Specialists      AI Providers
                     │                    │
                     └──────────────┬─────┘
                                    ▼
                              Local AI Model
```

---

# Architecture Layers

## Presentation Layer

Responsible for everything visible to the user.

Responsibilities:

* Screens
* Widgets
* Navigation
* Themes
* Animations
* User interaction

The Presentation Layer must never contain business logic.

---

## Application Layer

Acts as the bridge between the UI and the Core.

Responsibilities:

* Controllers
* State Management
* Dependency Injection
* Use Cases
* Event Handling

This layer translates user actions into Core requests.

---

## Constellation Core

The heart of the system.

Contains all business logic.

This layer should be platform independent.

Ideally, it should be possible to reuse the Core for:

* Android
* iOS
* Windows
* Linux
* macOS

without modification.

---

# Core Components

## Coordinator

### Responsibility

Determine **what** needs to happen.

The Coordinator never performs AI reasoning itself.

Instead, it:

* analyzes user intent
* selects the appropriate specialists
* requests a reasoning pipeline
* combines the final results
* returns a unified response

The Coordinator never communicates directly with AI models.

---

## Pipeline Engine

### Responsibility

Determine **how** a request should be processed.

The Pipeline Engine constructs the reasoning workflow.

Example:

User Request

↓

Planner

↓

Programmer

↓

Reviewer

↓

Teacher

↓

Coordinator

↓

User Response

Pipelines may change dynamically in future versions.

---

## Agent Manager

Responsible for managing every specialist.

Responsibilities:

* Register specialists
* Discover specialists
* Load specialists
* Execute specialists
* Remove specialists

Version 1 uses predefined specialists.

Future versions will support dynamic specialists.

---

## Memory Service

Responsible for all memory operations.

Responsibilities:

* Store conversations
* Retrieve context
* Build prompts
* Summarize history
* Manage user preferences

The Memory Service hides the underlying storage implementation.

---

## Model Manager

Responsible for AI model lifecycle.

Responsibilities:

* Install models
* Remove models
* Load models
* Unload models
* Switch models
* Report model status

The rest of the system never interacts directly with AI providers.

---

# AI Providers

AI Providers abstract the actual language model.

Every provider implements the same interface.

Examples:

* Gemma Provider
* Qwen Provider
* Llama Provider
* OpenAI Provider
* Claude Provider

This abstraction allows models to be replaced without affecting the architecture.

---

# Specialists

Every specialist represents one responsibility.

Examples:

* Planner
* Programmer
* Reviewer
* Teacher
* Researcher

Each specialist:

* receives context
* performs one task
* returns structured output

Specialists never communicate directly with each other.

All communication passes through the Coordinator and Pipeline Engine.

---

# State Management

Constellation uses Riverpod.

Reasons:

* Compile-time safety
* Testability
* Built-in dependency injection
* Excellent asynchronous support
* Scalable architecture

State should remain as close as possible to the feature that owns it.

---

# Local Storage

Primary database:

Isar

Reasons:

* High performance
* Offline-first
* Native support
* Strong querying capabilities
* Easy relationships

Database access must always occur through repositories.

The rest of the application should never know which database is being used.

---

# Communication

Subsystems communicate using explicit interfaces.

Preferred communication patterns:

* Request / Response
* Commands
* Events

Avoid direct dependencies between independent modules.

Loose coupling is preferred over convenience.

---

# Design Patterns

The following design patterns are used throughout the project.

## Mediator

Used by the Coordinator.

Allows specialists to remain independent.

---

## Strategy

Used by AI Providers.

Allows runtime model replacement.

---

## Factory

Used for specialist creation.

Future versions will dynamically generate specialists.

---

## Repository

Used for:

* Memory
* Storage
* Settings
* Conversations

Repositories isolate infrastructure from business logic.

---

## Dependency Injection

Handled through Riverpod.

Avoid service locators whenever possible.

---

# Folder Structure

```text
lib/

core/
│
├── coordinator/
├── pipeline/
├── agents/
├── memory/
├── models/
├── providers/
├── infrastructure/
├── services/
└── utils/

features/
│
├── chat/
├── settings/
├── downloads/
├── onboarding/
└── memories/

shared/
│
├── widgets/
├── themes/
├── animations/
├── constants/
└── extensions/
```

---

# Architectural Rules

1. Every class has one responsibility.

2. The UI never contains business logic.

3. Specialists never communicate directly.

4. AI Providers are replaceable.

5. Storage implementations are hidden behind repositories.

6. Every subsystem communicates through interfaces.

7. Business logic belongs inside the Core.

8. Platform-specific code must remain isolated.

9. Every major component should be independently testable.

10. Future versions should extend the architecture instead of replacing it.

---

# Scalability

Version 1 focuses on local execution.

The architecture is intentionally designed to support:

* Dynamic specialists
* Distributed execution
* Cross-device synchronization
* Cloud providers
* Community extensions

without major architectural changes.

---

# Architectural Goal

The architecture should make adding new intelligence significantly easier than modifying existing intelligence.

New specialists, models, memories, and providers should integrate by implementing existing interfaces rather than changing existing systems.

A stable architecture should allow Constellation to evolve for years without requiring fundamental rewrites.
