# 16 - Data Model

# Constellation Data Model

## Purpose

This document defines the core data entities used throughout Constellation.

The data model serves as the foundation for:

* Storage
* Memory
* Conversations
* AI Providers
* Models
* Downloads
* Settings
* Future Synchronization

The data model should remain stable and evolve through documented architectural decisions.

---

# Data Modeling Principles

The data model should:

* Represent business concepts.
* Remain independent of storage technology.
* Support future evolution.
* Avoid duplication.
* Prioritize clarity.

Entities describe concepts rather than database tables.

---

# Entity Overview

Version 1 contains the following primary entities:

```text
UserSettings

Conversation
Message

Memory

Provider
Model

Download

Agent

PipelineExecution
```

Relationships should remain explicit.

---

# User Settings

Represents application preferences.

Responsibilities:

* Theme selection
* Preferred provider
* Preferred model
* Performance preferences
* Privacy preferences

Attributes:

```text
id

themeMode

preferredProviderId

preferredModelId

enableMemory

enableTelemetry

createdAt

updatedAt
```

Only one active settings record should exist.

---

# Conversation

Represents a chat session.

Responsibilities:

* Group messages
* Maintain context history
* Store metadata

Attributes:

```text
id

title

summary

createdAt

updatedAt

lastMessageAt

isArchived
```

Relationships:

```text
Conversation
     │
     ▼
Messages
```

One conversation contains many messages.

---

# Message

Represents a single chat message.

Attributes:

```text
id

conversationId

role

content

status

tokenCount

createdAt
```

Role:

```text
user
assistant
system
agent
```

Status:

```text
sending
streaming
completed
failed
```

Messages belong to exactly one conversation.

---

# Memory

Represents persistent knowledge.

Memory is separate from conversations.

A conversation may generate memories.

Attributes:

```text
id

title

content

memoryType

importanceScore

sourceConversationId

createdAt

updatedAt

lastAccessedAt
```

Memory Types:

```text
semantic

episodic

preference

project

fact
```

Future versions may introduce additional categories.

---

# Provider

Represents an inference provider.

Examples:

```text
OpenAI

Gemini

Ollama

LM Studio

Local Runtime
```

Attributes:

```text
id

name

type

isEnabled

createdAt
```

Provider data should remain independent of model data.

---

# Model

Represents a specific AI model.

Examples:

```text
Gemma

Llama

Qwen

DeepSeek
```

Attributes:

```text
id

providerId

name

version

size

capabilities

isInstalled

isDefault

createdAt
```

Relationships:

```text
Provider
     │
     ▼
Models
```

One provider may expose multiple models.

---

# Download

Represents downloadable resources.

Examples:

* Models
* Assets
* Future specialist packs

Attributes:

```text
id

resourceId

resourceType

status

progress

size

downloadedSize

createdAt

updatedAt
```

Status:

```text
queued

downloading

paused

completed

failed
```

Downloads should remain independent from model management.

---

# Agent

Represents a registered specialist.

Examples:

```text
Teacher

Planner

Programmer

Reviewer

Researcher
```

Attributes:

```text
id

name

description

capabilities

isEnabled

createdAt
```

Agents are logical entities.

They do not necessarily correspond to separate models.

---

# Pipeline Execution

Represents a single pipeline run.

Examples:

```text
User Request

↓

Planner

↓

Programmer

↓

Reviewer

↓

Response
```

Attributes:

```text
id

conversationId

status

startedAt

completedAt

duration
```

Status:

```text
pending

running

completed

failed
```

Pipeline execution records support debugging and analytics.

---

# Relationships

High-Level Overview

```text
Conversation
     │
     ▼
Message

Conversation
     │
     ▼
Memory

Provider
     │
     ▼
Model

PipelineExecution
     │
     ▼
Agent
```

Relationships should remain explicit.

---

# Entity IDs

All entities should use UUIDs.

Example:

```text
550e8400-e29b-41d4-a716-446655440000
```

UUIDs simplify synchronization and future distributed architectures.

---

# Timestamps

Every entity should include timestamps where applicable.

Recommended fields:

```text
createdAt

updatedAt
```

Optional:

```text
lastAccessedAt

completedAt
```

Timestamps support auditing and optimization.

---

# Soft Deletion

Version 1 should prefer soft deletion when practical.

Example:

```text
isArchived

isDeleted
```

Benefits:

* Recovery
* Debugging
* Future synchronization

Permanent deletion remains available when explicitly requested.

---

# Searchability

Entities should support future search capabilities.

Especially:

Conversation

Message

Memory

Model

Search requirements should influence future database selection.

---

# Future Synchronization

Version 1 is local-first.

Future synchronization should preserve:

UUIDs

Relationships

Timestamps

Conflict resolution metadata

The data model should remain synchronization-ready.

---

# Future Extensions

Version 2

Adaptive specialists

Specialist performance records

Learning profiles

Version 3

Multi-device synchronization

Distributed execution

Shared memory networks

Version 4

Plugin ecosystem

Community specialists

Marketplace metadata

The model should evolve through ADRs.

---

# Data Model Principles

1. Model concepts, not storage.

2. Keep relationships explicit.

3. Use UUIDs.

4. Design for future synchronization.

5. Separate conversations from memory.

6. Separate providers from models.

7. Keep entities independent.

8. Minimize duplication.

9. Support extensibility.

10. Evolve through ADRs.

---

# Success Criteria

The Data Model succeeds when every major subsystem of Constellation can represent its information clearly, consistently, and independently of any specific storage implementation.

The model should support future growth without requiring fundamental redesigns.
