**Date:** September 15, 2025  
**File Path:** `/meeting/2025-09-15/note.md`  
**Participants:** Cecilia Zhang, David Thompson, Kevin Singh, HZ  
**Meeting Type:** Team Sync - Agentic OS Architecture Overview



## Meeting Summary

The team discussed the comprehensive Agentic OS architecture, which aims to support a generic agentic operating system with a Linux-like architecture, including multi-threading and local LLM support. Key topics covered included the initial implementation as a driver abstracting Ethereum functionalities, the L2Beat discovery process, and the codegen workflow using BAML for type-safe compilation.

## Key Topics Discussed

### 1. Agentic OS Architecture Overview

**Core Concept:** Building an AI operating system for agentic workflows in crypto, treating agentic workflows like an operating system with the following abstractions:

- **Kernel (Planner Agent):** Orchestrates sub-agents like threads, handling scheduling, memory, and decision-making
- **Sub-Agents (Child Processes):** Execute concurrently — small local models act like CPUs for deterministic tasks, while large cloud LLMs act like GPUs for complex reasoning
- **Context Engineering:** Functions as process & memory management, enabling structured long-term context (virtual memory style)
- **External Tools as Syscalls:** Blockchain RPCs, Foundry/Chisel REPL, APIs, and other software integrations exposed as first-class syscall abstractions
- **Composable Model Integration:** Both kernel and sub-agents dynamically select and compose models based on task requirements

### 2. System Architecture Components

#### Application Layer
- **Agentic Workflows as Applications:** User-defined states compiled into native BAML client in Rust
- **State Management:** Deterministic hooks before and after LLM calls for precise control over agent behavior
- **Example:** Bloomberg terminal that uses deterministic states alongside agentic functionalities

#### Runtime/Kernel Layer
- **Scheduler:** Manages LLM calls and agent context
- **Shared Memory:** Global context compilation for LLM input
- **Thread Management:** Handles agent threads with context and message history

#### Driver Layer (Initial Implementation)
- **Stateless Tools:** Basic Ethereum functionalities (`get_account`, `get_codes`) abstracted into toolbox
- **Stateful Operations:** Contract traversal and complex operations in application layer
- **Multi-chain Support:** Designed to handle complex toolsets across different chains

### 3. L2Beat Discovery Process

**Current Work (David Thompson):**
- Analyzing L2Beat templates and handlers for contract discovery
- Understanding contract validity, data sharing mechanisms, and trustworthiness evaluation
- Re-implementing TypeScript L2Beat functionalities in Rust
- Performing tree traversal and proxy detection from root addresses
- Fetching view functions and storage slots automatically

**Process Flow:**
1. **Discovery:** Starting with root address, perform tree traversal of connected contracts
2. **Analysis:** Examine handlers, contract components, storage slots
3. **Flattening:** Compile discovered contracts into single flattened format
4. **Validation:** Ensure comprehensive contract understanding before execution

### 4. Codegen Process and Transaction Simulation

**Execution Workflow:**
1. **Code Generation:** Generate forge scripts with `VM.broadcast` based on flattened contracts and user intent
2. **Simulation:** Test transactions against latest fork before actual execution
3. **Safety Verification:** Confirm transaction safety before wallet connection
4. **User Approval:** Prompt user to sign only after simulation confirmation

**Key Benefits:**
- Type-safe transaction generation
- Prevention of fund loss through simulation
- Deterministic validation before execution

### 5. BAML Integration

**Role of BAML:**
- Type-safe and fast compilation of contract information
- Handler generation for LLM decision-making
- Parameter generation for backend execution
- Communication layer between different LLMs
- Application state serialization into contexts

**Current Implementation:**
- Moving from basic OpenAI integration to native BAML client
- Supporting multiple model types (local/remote) through unified interface

### 6. Inter-Agent Communication

**Memory Sharing Model (inspired by MemGPT):**
- **Internal Editing/IPC:** Agents modify each other's working context through shared state
- **Explicit Messages/Pipes:** Communication via explicit messages (channel-based)
- **Hierarchical Access:** Parent agents can edit child agent memory with higher priority

**Linux Analogy:**
- Planner agent = CPU scheduler
- Sub-agents = GPU kernels/worker threads  
- Syscalls = tool calls into blockchain & external APIs
- Memory management = context compilation and virtual memory

## Individual Responsibilities

### HZ
- **Focus:** BAML Rust code implementation
- **Tasks:** 
  - Understand BAML foreign function interface (FFI)
  - Implement embedded system engineering for compilation
  - Ensure smooth integration with the main system

### David Thompson & Kevin Singh
- **Focus:** Application layer development
- **Tasks:**
  - Support discovery and codegen processes
  - Ship simple version of discovery BAML handler integration
  - Work on L2Beat documentation and implementation

### Cecilia Zhang
- **Focus:** Product development and integration
- **Tasks:**
  - Replace current MCP server with advanced implementations
  - Integrate BAML support and discovery features as they become ready
  - Develop "intelligent wallet" with user memory capabilities

## Next Steps

### Immediate Actions
- [ ] **Cecilia:** Add everyone to team Notion page and GitHub with proper permissions
- [ ] **Cecilia:** Send specific study notes tailored to each team member's focus area
- [ ] **Cecilia:** Resend repository information for aomi-labs model repo
- [ ] **Cecilia:** Confirm payroll provider setup for David and HZ
- [ ] **Team:** Use group chat for tactical communications

### Technical Deliverables
- [ ] **David:** Ship discovery BAML handler integration (simple version) this week
- [ ] **HZ:** Begin BAML Rust implementation and FFI integration
- [ ] **Kevin:** Start working on codegen processes
- [ ] **Team:** Review and contribute to repository structure

### Communication & Setup
- [ ] **All:** Send Notion emails for team page access
- [ ] **Team:** Continue using personal emails (corporate emails deemed unnecessary)
- [ ] **Team:** Maintain tactical communications in group chat

## Technical Architecture Notes

### Repository Structure
Based on discussion, the team will work on:
- **aomi-labs/teamspace:** Main repository for framework development
- **Rust Workspace:** Multi-package structure with:
  - `aomi-core/`: Shared types and state management
  - `aomi-discovery/`: L2Beat integration and contract discovery
  - `aomi-foundry/`: Chisel REPL and Foundry integration
  - `aomi-mcp/`: MCP server runtime
  - `aomi-web/`: Web search and data integration

### Development Philosophy
- **Product-driven approach:** Advanced functionalities integrated as they become ready
- **Iterative development:** Always maintain a demonstr
able product version
- **Framework + Product:** Parallel development of core framework and user-facing product
- **Type safety:** BAML-first approach for all LLM interactions

## Long-term Vision

The goal is to create an AI operating system that enables developers to write high-frequency trading agents or other complex agentic applications in minimal lines of Rust code, with the underlying runtime handling:
- High performance and low cost execution
- Multi-chain blockchain operations
- Intelligent memory management
- Secure transaction handling
- Composable model integration

This positions Aomi Labs as building the foundational infrastructure for the next generation of blockchain-native AI applications.

---

*Meeting notes automatically generated from transcript and discussion. Please review for accuracy and completeness.*