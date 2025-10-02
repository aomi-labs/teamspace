---
description: Create session-by-session daily work summary from .specstory/history and sync to teamspace (project)
allowed-tools: Read, Glob, Bash(./.claude/scripts/sync.sh), Grep
---

Please create a comprehensive summary of work by:

## Data Collection
1. **Determine date range**:
   - If user specifies `--since YYYY-MM-DD`, process all dates from that date to today
   - Otherwise, process only today's date
2. **Read all files** from .specstory/history/ for the target date(s)
3. **List all history sessions** found for each date with timestamps and brief descriptions

## Summary Structure
4. **Create detailed summary** in .claude/history/YYYY-MM-DD-summary.md (one file per date) with this format:

### Session Overview
- List of all sessions with times and main topics

### Session Breakdown
For **each session**, provide:

#### Session [N]: [Title/Topic] ([Timestamp])

**1. Problem - Solutions**
- What issues were investigated
- What solutions were found or attempted
- Resolution status

**2. Code Changes**
- Files modified, created, or discussed
- Functions/components added or updated
- Brief summary of changes (no full code unless critical)

**3. Key Insights**
- Technical concepts learned or clarified
- Architecture understanding gained
- Summary of any technical deep dives
- Important discoveries or realizations

**4. Documentation**
- Files created (.md, guides, references)
- Knowledge captured or documented
- Comments or explanations added

**5. Next Steps**
- Outstanding tasks identified
- Follow-up items noted
- Future work planned or suggested

## Content Guidelines
5. **Include specific details**:
   - Use file paths with line numbers: `file.ts:123`
   - Keep code snippets minimal and relevant
   - Focus on the "why" behind decisions
   - Cross-reference related sessions if applicable

## Sync to Teamspace
6. **Run the sync script**:
   - For single date: `./.claude/scripts/sync.sh` or `./.claude/scripts/sync.sh YYYY-MM-DD`
   - For date range: `./.claude/scripts/sync.sh --since YYYY-MM-DD`

Focus on creating a clear session-by-session record that tracks the progression of work throughout the day and makes it easy to follow the thought process and decision-making.