#!/usr/bin/env bash
set -euo pipefail

# This script reads a summary from a specific file and copies it to the teamspace directory

# Function to sync a specific date
sync_date() {
    local DATE=$1
    local SOURCE_FILE="${SOURCE_DIR}/${DATE}-summary.md"
    local OUTFILE="${TEAMSPACE_DIR}/${DATE}.md"

    echo "Processing date: $DATE"

    # Check if source file exists
    if [ ! -f "$SOURCE_FILE" ]; then
        echo "Warning: Source file does not exist: $SOURCE_FILE" >&2
        return
    fi

    # Get git activity from the source repository for this date
    cd "/Users/ceciliazhang/Code/forge-mcp.worktrees/sessioned-frontend"

    # Collect git activity information
    GIT_ACTIVITY=$(cat <<EOF

## Repository Activities & Active Branches

### Commits ($DATE)
$(git log --oneline --since="$DATE 00:00:00" --until="$DATE 23:59:59" --all --pretty=format:"- %h %s (%an, %ar)" 2>/dev/null || echo "No commits found for $DATE")

### Branches Worked On
$(git for-each-ref --format='- %(refname:short) (last commit: %(committerdate:relative))' refs/heads/ 2>/dev/null | head -10)

### Current Branch Status
- Current branch: $(git branch --show-current 2>/dev/null || echo "unknown")
- Working directory status: $(git status --porcelain 2>/dev/null | wc -l | xargs echo) files with changes

EOF
)

    # Copy the original summary and append git activity
    cp "$SOURCE_FILE" "$OUTFILE"
    echo "$GIT_ACTIVITY" >> "$OUTFILE"

    cd "$REPO_ROOT"

    # Stage the updated file
    git add "$OUTFILE"

    echo "Synced: $OUTFILE"
}

# Parse arguments
SINCE_DATE=""
TARGET_DATE=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --since)
            SINCE_DATE="$2"
            shift 2
            ;;
        *)
            TARGET_DATE="$1"
            shift
            ;;
    esac
done

TEAMSPACE_DIR="/Users/ceciliazhang/Code/aomi-teamspace/updates/cecilia"
REPO_ROOT="/Users/ceciliazhang/Code/aomi-teamspace"
SOURCE_DIR="/Users/ceciliazhang/Code/forge-mcp.worktrees/sessioned-frontend/.claude/history"

mkdir -p "$TEAMSPACE_DIR"

# Pull latest changes from main branch
cd "$REPO_ROOT"
git pull origin main

# If --since flag is provided, loop through dates
if [ -n "$SINCE_DATE" ]; then
    END_DATE=$(date +%Y-%m-%d)

    echo "Syncing files from $SINCE_DATE to $END_DATE"
    echo "==="

    CURRENT_DATE="$SINCE_DATE"
    while [ "$CURRENT_DATE" != "$(date -j -v+1d -f '%Y-%m-%d' "$END_DATE" '+%Y-%m-%d' 2>/dev/null)" ]; do
        sync_date "$CURRENT_DATE"
        CURRENT_DATE=$(date -j -v+1d -f '%Y-%m-%d' "$CURRENT_DATE" '+%Y-%m-%d' 2>/dev/null)
    done
elif [ -n "$TARGET_DATE" ]; then
    # Single date provided
    sync_date "$TARGET_DATE"
else
    # Use today's date
    DATE=$(date +%F)
    sync_date "$DATE"
fi

# Commit if there are staged changes
if ! git diff --cached --quiet; then
    COMMIT_DATE="${TARGET_DATE:-${SINCE_DATE:-$(date +%F)}}"
    git commit -m "update: daily summary for ${COMMIT_DATE} by cecilia"
    git push origin main
else
    echo "No changes to commit. Skipping push."
fi

echo "Done!"

