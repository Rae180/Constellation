# 11 - Project Structure

# Constellation Project Structure

## Purpose

This document defines the physical organization of the Constellation codebase.

A consistent project structure improves:

* Maintainability
* Scalability
* Readability
* Collaboration
* Testing

Every file should have a clear and predictable location.

The directory structure should communicate architectural intent.

---

# Organization Philosophy

Files are organized by responsibility rather than file type.

The project should be easy to navigate without requiring knowledge of the entire codebase.

When adding a new feature, its location should be obvious.

---

# Top-Level Structure

```text
constellation/

├── android/
├── ios/
├── linux/
├── macos/
├── windows/
├── web/
│
├── assets/
├── docs/
├── decisions/
├── scripts/
├── test/
│
├── lib/
│
└── pubspec.yaml
```

Platform-specific folders should remain untouched unless platform integration is required.

---

# lib Structure

```text
lib/

├── app/
├── core/
├── infrastructure/
├── features/
├── shared/
└── main.dart
```

Each directory has a clearly defined responsibility.

---

# app/

Contains application-level configuration.

Examples:

```text
app/

theme/
router/
providers/
bootstrap/
config/
```

Responsibilities include:

* Application startup
* Dependency registration
* Global configuration
* Navigation
* Theme initialization

No business logic belongs here.

---

# core/

Contains the heart of Constellation.

The Core should be independent of Flutter and platform-specific APIs.

Examples:

```text
core/

ai/
memory/
pipeline/
coordinator/
agents/
domain/
services/
```

The Core contains:

* Business logic
* AI Engine
* Memory logic
* Domain models
* Use cases
* Interfaces

The Core should remain portable.

---

# infrastructure/

Contains implementation details.

Examples:

```text
infrastructure/

database/
providers/
downloads/
storage/
network/
security/
repositories/
```

Responsibilities:

* Isar
* File System
* Secure Storage
* Local Models
* Downloads
* Future Networking

Infrastructure implements interfaces defined by the Core.

---

# features/

Contains user-facing features.

Example:

```text
features/

chat/
downloads/
memory/
settings/
onboarding/
```

Each feature owns:

Presentation

Controllers

Widgets

Feature-specific state

Feature navigation

Features communicate with the Core rather than each other whenever possible.

---

# shared/

Contains reusable resources.

Examples:

```text
shared/

widgets/
components/
extensions/
constants/
animations/
utilities/
```

Only truly reusable code belongs here.

Avoid placing feature-specific logic inside shared.

---

# Feature Structure

Every feature follows the same organization.

Example:

```text
chat/

presentation/

controllers/

widgets/

models/

providers/

services/
```

Consistency is more important than personal preference.

---

# Core Structure

Example:

```text
core/

ai/

coordinator/

pipeline/

memory/

agents/

domain/

interfaces/

services/
```

Every subsystem should remain independent.

---

# Infrastructure Structure

Example:

```text
infrastructure/

database/

isar/

repositories/

providers/

downloads/

security/

storage/

network/
```

Implementation details should never leak into higher layers.

---

# Assets

Example:

```text
assets/

fonts/

images/

animations/

icons/

models/

translations/
```

Large assets should remain organized by type.

Downloaded AI models should not be bundled inside application assets.

---

# Testing Structure

```text
test/

unit/

widget/

integration/

mocks/

fixtures/
```

Tests should mirror the production structure whenever practical.

---

# Naming Conventions

Directories

snake_case

Files

snake_case

Classes

PascalCase

Variables

camelCase

Constants

camelCase or UPPER_CASE depending on usage.

Naming should remain descriptive.

Avoid abbreviations unless universally understood.

---

# File Organization

Every file should have one primary responsibility.

Avoid files exceeding reasonable complexity.

If a file becomes difficult to understand, it should probably be divided into smaller components.

---

# Import Rules

Dependencies should always point inward.

Presentation

↓

Core

↓

Interfaces

↓

Infrastructure

Higher layers should never depend on lower-level implementation details.

Circular dependencies are prohibited.

---

# Dependency Direction

```text
Presentation
        │
        ▼
Application
        │
        ▼
Core
        ▲
        │
Infrastructure
```

Infrastructure implements Core interfaces.

Core never imports Infrastructure.

---

# Documentation

Every major directory should contain:

README.md

Describing:

Purpose

Responsibilities

Architecture

Important classes

Extension guidelines

The project structure should explain itself.

---

# Generated Files

Generated code should remain isolated.

Examples:

build/

generated/

g.dart

freezed.dart

Generated files should never contain manual modifications.

---

# Scripts

Automation belongs inside:

```text
scripts/
```

Examples:

Build scripts

Release scripts

Documentation generation

Testing automation

Formatting

Model packaging

---

# Configuration

Configuration files should remain centralized.

Examples:

Analysis options

Linter rules

Environment configuration

Build configuration

The project should avoid duplicated configuration.

---

# Scalability

The structure should support:

More features

More specialists

More providers

Desktop applications

Backend services (future)

Plugins

Community extensions

Growth should require adding folders rather than reorganizing existing ones.

---

# Project Rules

1. One responsibility per file.

2. Organize by feature.

3. Separate interfaces from implementations.

4. Avoid circular dependencies.

5. Keep the Core platform independent.

6. Infrastructure implements Core contracts.

7. Shared code must be genuinely reusable.

8. Follow consistent naming conventions.

9. Keep directories predictable.

10. Structure should scale without major reorganization.

---

# Success Criteria

The project structure succeeds when a new engineer can locate any feature, service, or subsystem with minimal effort.

The organization of the codebase should reflect the architecture of Constellation itself, making the project easier to understand, maintain, and extend throughout its lifetime.
