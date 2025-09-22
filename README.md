This is the teamspace of Aomi Labs as a drop-in repacement of Notion.

### Resources
[Important prerequisit](resources/RESOURCES.md)

Personal notes should sync to `resources/your-name`

### Daily Updates

**Automated Daily Progress Summaries**

We use an automated system to capture and sync daily progress from development sessions:

#### Setup
1. **Install SpecStory** in your project:
   ```bash
   npm install -g specstory
   # or
   yarn global add specstory
   ```

2. **Enable SpecStory tracking** in your development workflow:
   ```bash
   cd your-project-directory
   specstory sync
   ```
   This creates `.specstory/history/` files that capture your Claude Code sessions automatically.

#### Daily Summary Workflow
1. **Work with Claude Code** throughout your day - all sessions are automatically tracked
2. **Run the sync command** at end of day:
   ```bash
   /sync-today
   ```
   This command:
   - Reads all `.specstory/history/` files from today
   - Creates structured session-by-session summaries
   - Includes git repository activity and branch information
   - Automatically syncs to `updates/your-name/YYYY-MM-DD.md`
   - Commits and pushes to this teamspace repository

#### Summary Structure
Each daily summary includes:
- **Session Overview**: List of all development sessions with timestamps
- **Session Breakdown**: For each session:
  1. **Problem-Solutions**: Issues investigated and resolutions found
  2. **Code Changes**: Files modified, functions updated (summary only)
  3. **Key Insights**: Technical learning, architecture understanding, deep dives
  4. **Documentation**: Files created, knowledge captured
  5. **Next Steps**: Outstanding tasks, follow-up items
- **Repository Activity**: Today's commits, active branches, current status
- **Daily Summary**: Major accomplishments and technical growth

#### Benefits
- **Comprehensive Records**: Captures not just what was done, but how and why
- **Knowledge Transfer**: Detailed context for team collaboration
- **Progress Tracking**: Clear visibility into daily development momentum
- **Automated Process**: No manual effort required once set up

Your summaries appear in `updates/your-name/` with automatic git synchronization. 
