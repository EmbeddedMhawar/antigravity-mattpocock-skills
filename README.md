# Antigravity Matt Pocock Skills Plugin

[![Validate Antigravity Skills](https://github.com/abderrahmane-mhawar/antigravity-mattpocock-skills/actions/workflows/validate.yml/badge.svg)](https://github.com/abderrahmane-mhawar/antigravity-mattpocock-skills/actions/workflows/validate.yml)
[![Sync Upstream](https://github.com/abderrahmane-mhawar/antigravity-mattpocock-skills/actions/workflows/sync-upstream.yml/badge.svg)](https://github.com/abderrahmane-mhawar/antigravity-mattpocock-skills/actions/workflows/sync-upstream.yml)
[![Antigravity Plugin](https://img.shields.io/badge/Antigravity-Plugin-4285F4?logo=google&logoColor=white)](https://antigravity.google)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A ready-to-use **Google Antigravity Plugin** packaging [Matt Pocock's Skills](https://github.com/mattpocock/skills)—a collection of composable, disciplined engineering workflows designed to replace "vibe coding" with test-driven development, architectural rigor, and structured problem-solving.

This plugin features **automated weekly synchronization** with Matt Pocock's upstream repository and **zero-friction 24-hour background auto-updates** via Antigravity lifecycle hooks.

---

## ⚡ Quick Install (1-Line Command)

Run this command in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/abderrahmane-mhawar/antigravity-mattpocock-skills/main/install.sh | bash
```

Antigravity will instantly discover the plugin in `~/.gemini/config/plugins/mattpocock-skills` and enable all skills across all your projects.

---

## 📦 Alternative Installation Options

### Option A: Standard Git Clone (Global)
```bash
git clone --depth 1 https://github.com/abderrahmane-mhawar/antigravity-mattpocock-skills.git ~/.gemini/config/plugins/mattpocock-skills
```

### Option B: Per-Project / Team Repository (Version Controlled)
If you want to pin these skills to a specific repository for your entire team:
```bash
git submodule add https://github.com/abderrahmane-mhawar/antigravity-mattpocock-skills.git .agents/plugins/mattpocock-skills
```

---

## 🚀 Getting Started: Recommended First Step

In any repository where you want to use these workflows, run the setup skill once:

```text
/setup-matt-pocock-skills
```
*Or prompt Antigravity:*
> *"Run setup-matt-pocock-skills to initialize this repository's context, architecture docs layout, and issue tracker integration."*

This configures your repo's:
- `CONTEXT.md` / domain vocabulary
- Architecture Decision Records (`ADR`) directory
- Issue tracker labels and triage workflow

---

## 🛠️ Included Workflows & Skill Catalog

All skills use Antigravity's **Progressive Disclosure** (only metadata is loaded into prompt context until the skill is triggered).

### 🏗️ Engineering & Implementation
| Skill | Trigger / Command | Purpose |
| :--- | :--- | :--- |
| **`tdd`** | `/tdd` or *"Build this with TDD"* | Strict Red-Green-Refactor testing loop with unit and integration coverage. |
| **`diagnosing-bugs`** | *"Diagnose why this bug occurs"* | Hypothesis-driven root cause analysis (prevents guess-and-check coding). |
| **`codebase-design`** | *"Design module boundaries"* | Deep module design vocabulary; minimizes surface area and hides implementation. |
| **`improve-codebase-architecture`** | *"Analyze codebase architecture"* | Scans for deepening opportunities and produces a visual HTML report. |
| **`implement`** | *"Implement this spec"* | Executes tasks strictly against written tickets or specs. |
| **`resolving-merge-conflicts`** | *"Resolve git conflict"* | Systematic conflict resolution across git branches and rebases. |
| **`prototype`** | *"Build a throwaway prototype"* | Explores UX and state logic quickly before committing to production architecture. |

### 🎯 Planning, Grilling & Triage
| Skill | Trigger / Command | Purpose |
| :--- | :--- | :--- |
| **`grill-me`** / **`grilling`** | `/grill-me` or *"Grill me on this design"* | Rigorous interview to challenge assumptions and clarify requirements. |
| **`grill-with-docs`** | *"Grill me and document"* | Conducts an interview while simultaneously generating ADRs and glossary entries. |
| **`to-spec`** | *"Turn conversation into spec"* | Synthesizes discussion into an actionable specification. |
| **`to-tickets`** | *"Break this into tickets"* | Generates tracer-bullet tickets with dependency edges. |
| **`wayfinder`** | *"Plan large multi-session project"* | Creates a dependency decision map for work spanning multiple agent sessions. |
| **`triage`** | *"Triage this issue/PR"* | State machine to categorise, verify, and write agent-ready briefs. |

### 🔍 Code Quality & Review
| Skill | Trigger / Command | Purpose |
| :--- | :--- | :--- |
| **`code-review`** | *"Review changes since main"* | Parallel sub-agent review across Standards compliance and Spec alignment. |
| **`git-guardrails-claude-code`** | *"Add git safety guardrails"* | Blocks dangerous git commands (force push, reset --hard). |
| **`setup-pre-commit`** | *"Set up pre-commit"* | Configures Husky + lint-staged + Prettier + test hooks. |
| **`setup-ts-deep-modules`** | *"Configure deep modules"* | Wires `dependency-cruiser` to enforce deep module boundaries in TypeScript. |

### 🤝 Collaboration & Handoff
| Skill | Trigger / Command | Purpose |
| :--- | :--- | :--- |
| **`ask-matt`** | `/ask-matt` or *"Which skill should I use?"* | Router skill that recommends the right workflow for your immediate challenge. |
| **`handoff`** | `/handoff` or *"Prepare handoff"* | Compresses session state into a structured handoff document for another agent. |
| **`teach`** | *"Teach me this concept"* | Guides the human through mastering concepts interactively. |
| **`wizard`** | *"Generate setup wizard"* | Creates an interactive Bash CLI wizard for manual credentials and cutovers. |

---

## 🔄 Automatic Updates

This plugin includes an Antigravity `PreInvocation` lifecycle hook ([`hooks.json`](file:///home/mhawar/antigravity-mattpocock-skills/hooks.json)) that checks for updates **silently in the background once every 24 hours**. 

* **No lag or waiting:** Runs non-blocking background fetch (< 5ms startup check).
* **Manual update anytime:**
  ```bash
  cd ~/.gemini/config/plugins/mattpocock-skills && git pull
  ```

---

## ⚙️ Maintenance & GitHub Actions

This repository is maintained with two automated GitHub Actions:

1. **`sync-upstream.yml`**: A scheduled weekly cron job that fetches changes from [`mattpocock/skills`](https://github.com/mattpocock/skills), formats new skills for Antigravity, runs validation, and opens a Pull Request.
2. **`validate.yml`**: Validates that all `SKILL.md` files comply with Antigravity YAML frontmatter standards on every push and PR.

### Running local sync manually:
```bash
./scripts/sync.sh
```

---

## 📄 License & Attribution

- **Original Skills:** Copyright © [Matt Pocock](https://github.com/mattpocock) under the MIT License.
- **Antigravity Packaging & Maintenance:** Maintained by [Abderrahmane Mhawar](https://github.com/abderrahmane-mhawar).
