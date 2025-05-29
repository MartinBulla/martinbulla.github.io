#!/bin/bash

# Set upstream remote name and branch
UPSTREAM=upstream
BRANCH=master

# Fetch latest upstream changes
echo "🔄 Fetching latest changes from $UPSTREAM/$BRANCH..."
git fetch $UPSTREAM

# Show commits in upstream that are not yet in your current branch
echo "📋 Commits in $UPSTREAM/$BRANCH that are not in your current branch:"
git log HEAD..$UPSTREAM/$BRANCH --oneline

# Optionally show a diffstat summary
echo
echo "📊 Summary of file changes:"
git diff --stat HEAD..$UPSTREAM/$BRANCH

# Reminder
echo
echo "✅ Review the log and diff above to decide whether to rebase."
