#
# Git Commit Workflow Aliases and Functions
# Enhanced commit experience with conventional commits
#

# Check if command exists
_exists() {
  command -v "$1" > /dev/null 2>&1
}

# =============================================================================
# COMMIT ALIASES - Interactive & Conventional
# =============================================================================

# Interactive commit with type selection
alias gci='git-commit-interactive'
alias gcint='git-commit-interactive'

# Standard git commit aliases (enhanced)
alias gc='git commit'
alias gca='git commit -a'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gcan='git commit --amend --no-edit'
alias gcane='git commit --amend'

# Commitizen integration
if _exists cz; then
  alias gcz='cz commit'
  alias gczc='cz commit'
fi

# =============================================================================
# CONVENTIONAL COMMIT SHORTCUTS
# =============================================================================

# Quick commit functions for common types
gc-feat() {
  local scope=""
  local msg=""

  if [ $# -eq 1 ]; then
    msg="$1"
  elif [ $# -eq 2 ]; then
    scope="($1)"
    msg="$2"
  else
    echo "Usage: gc-feat [scope] <message>"
    echo "Example: gc-feat auth 'add login validation'"
    echo "Example: gc-feat 'add new dashboard widget'"
    return 1
  fi

  git commit -m "feat${scope}: ${msg}"
}

gc-fix() {
  local scope=""
  local msg=""

  if [ $# -eq 1 ]; then
    msg="$1"
  elif [ $# -eq 2 ]; then
    scope="($1)"
    msg="$2"
  else
    echo "Usage: gc-fix [scope] <message>"
    echo "Example: gc-fix ui 'resolve button alignment issue'"
    echo "Example: gc-fix 'handle null pointer exception'"
    return 1
  fi

  git commit -m "fix${scope}: ${msg}"
}

gc-docs() {
  local scope=""
  local msg=""

  if [ $# -eq 1 ]; then
    msg="$1"
  elif [ $# -eq 2 ]; then
    scope="($1)"
    msg="$2"
  else
    echo "Usage: gc-docs [scope] <message>"
    echo "Example: gc-docs readme 'update installation instructions'"
    echo "Example: gc-docs 'add API documentation'"
    return 1
  fi

  git commit -m "docs${scope}: ${msg}"
}

gc-refactor() {
  local scope=""
  local msg=""

  if [ $# -eq 1 ]; then
    msg="$1"
  elif [ $# -eq 2 ]; then
    scope="($1)"
    msg="$2"
  else
    echo "Usage: gc-refactor [scope] <message>"
    echo "Example: gc-refactor hooks 'extract authentication logic'"
    echo "Example: gc-refactor 'simplify validation functions'"
    return 1
  fi

  git commit -m "refactor${scope}: ${msg}"
}

gc-test() {
  local scope=""
  local msg=""

  if [ $# -eq 1 ]; then
    msg="$1"
  elif [ $# -eq 2 ]; then
    scope="($1)"
    msg="$2"
  else
    echo "Usage: gc-test [scope] <message>"
    echo "Example: gc-test components 'add unit tests for Button'"
    echo "Example: gc-test 'increase test coverage for auth module'"
    return 1
  fi

  git commit -m "test${scope}: ${msg}"
}

gc-chore() {
  local scope=""
  local msg=""

  if [ $# -eq 1 ]; then
    msg="$1"
  elif [ $# -eq 2 ]; then
    scope="($1)"
    msg="$2"
  else
    echo "Usage: gc-chore [scope] <message>"
    echo "Example: gc-chore deps 'update React to v18.2.0'"
    echo "Example: gc-chore 'update build configuration'"
    return 1
  fi

  git commit -m "chore${scope}: ${msg}"
}

gc-style() {
  local scope=""
  local msg=""

  if [ $# -eq 1 ]; then
    msg="$1"
  elif [ $# -eq 2 ]; then
    scope="($1)"
    msg="$2"
  else
    echo "Usage: gc-style [scope] <message>"
    echo "Example: gc-style ui 'fix button spacing and alignment'"
    echo "Example: gc-style 'format code with prettier'"
    return 1
  fi

  git commit -m "style${scope}: ${msg}"
}

gc-perf() {
  local scope=""
  local msg=""

  if [ $# -eq 1 ]; then
    msg="$1"
  elif [ $# -eq 2 ]; then
    scope="($1)"
    msg="$2"
  else
    echo "Usage: gc-perf [scope] <message>"
    echo "Example: gc-perf api 'optimize database queries'"
    echo "Example: gc-perf 'reduce bundle size by 15%'"
    return 1
  fi

  git commit -m "perf${scope}: ${msg}"
}

# =============================================================================
# COMMIT WORKFLOW FUNCTIONS
# =============================================================================

# Add all changes and commit interactively
gaci() {
  git add .
  git-commit-interactive
}

# Quick commit with staging
gcq() {
  if [ $# -eq 0 ]; then
    echo "Usage: gcq <commit-message>"
    echo "Stages all changes and commits with message"
    return 1
  fi

  git add .
  git commit -m "$*"
}

# Commit with automatic conventional commit detection
gc-auto() {
  if [ $# -eq 0 ]; then
    echo "Usage: gc-auto <message>"
    echo "Automatically detects commit type based on staged files"
    return 1
  fi

  local msg="$*"
  local commit_type="chore"

  # Simple heuristics to detect commit type
  local staged_files=$(git diff --cached --name-only)

  if echo "$staged_files" | grep -q "test\|spec"; then
    commit_type="test"
  elif echo "$staged_files" | grep -q "README\|\.md$\|docs/"; then
    commit_type="docs"
  elif echo "$staged_files" | grep -q "package\.json\|yarn\.lock\|package-lock\.json"; then
    commit_type="chore"
  elif echo "$staged_files" | grep -q "\.css\|\.scss\|\.less\|styles"; then
    commit_type="style"
  elif git diff --cached | grep -q "^+.*TODO\|^+.*FIXME\|^+.*bug\|^+.*fix"; then
    commit_type="fix"
  elif git diff --cached | grep -q "^+.*function\|^+.*class\|^+.*export"; then
    commit_type="feat"
  fi

  echo "Auto-detected commit type: $commit_type"
  git commit -m "${commit_type}: ${msg}"
}

# Show commit message template
gc-template() {
  if [ -f "$HOME/.gitmessage" ]; then
    cat "$HOME/.gitmessage"
  else
    echo "Commit template not found. Run 'setup-git-hooks' to create it."
  fi
}

# Validate commit message format
gc-validate() {
  if [ $# -eq 0 ]; then
    echo "Usage: gc-validate <commit-message>"
    echo "Validates commit message against conventional commit format"
    return 1
  fi

  local msg="$*"

  # Basic validation regex for conventional commits
  if echo "$msg" | grep -qE "^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert|hotfix|wip)(\(.+\))?: .{3,}"; then
    echo "✅ Valid conventional commit format"
    return 0
  else
    echo "❌ Invalid commit format"
    echo "Expected: type(scope): description"
    echo "Example: feat(auth): add login validation"
    return 1
  fi
}

# =============================================================================
# COMMIT HISTORY & ANALYSIS
# =============================================================================

# Show conventional commit stats
gc-stats() {
  echo "📊 Commit Statistics (last 50 commits):"
  echo "======================================="

  git log --oneline -50 | \
    grep -oE "^[a-f0-9]+ (feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert|hotfix|wip)" | \
    cut -d' ' -f2 | \
    sort | uniq -c | sort -rn | \
    while read count type; do
      printf "%-12s %3d commits\n" "$type:" "$count"
    done

  echo
  echo "Recent commits:"
  git log --oneline -10
}

# Show commits by type
gc-by-type() {
  local type="${1:-feat}"

  echo "📝 Commits of type '$type':"
  echo "=========================="

  git log --oneline --grep="^$type" -20
}

# =============================================================================
# SETUP & MAINTENANCE
# =============================================================================

# Setup commitlint in current project
gc-setup() {
  echo "🔧 Setting up commitlint for current project..."
  setup-git-hooks
}

# Setup global commitlint configuration
gc-setup-global() {
  echo "🌐 Setting up global commitlint configuration..."
  setup-git-hooks global
}

# =============================================================================
# HELP FUNCTION
# =============================================================================

gc-help() {
  echo "🎯 Git Commit Workflow Commands"
  echo "==============================="
  echo
  echo "📝 Interactive Commits:"
  echo "  gci, gcint          - Interactive commit with type selection"
  echo "  gcz                 - Commitizen interactive commit"
  echo "  gaci                - Stage all and commit interactively"
  echo
  echo "⚡ Quick Commits:"
  echo "  gc-feat [scope] msg - feat: commit"
  echo "  gc-fix [scope] msg  - fix: commit"
  echo "  gc-docs [scope] msg - docs: commit"
  echo "  gc-test [scope] msg - test: commit"
  echo "  gc-chore [scope] msg- chore: commit"
  echo "  gc-style [scope] msg- style: commit"
  echo "  gc-perf [scope] msg - perf: commit"
  echo
  echo "🛠 Utilities:"
  echo "  gcq <message>       - Stage all and commit quickly"
  echo "  gc-auto <message>   - Auto-detect commit type"
  echo "  gc-validate <msg>   - Validate commit message format"
  echo "  gc-template         - Show commit message template"
  echo
  echo "📊 Analysis:"
  echo "  gc-stats            - Show commit type statistics"
  echo "  gc-by-type <type>   - Show commits of specific type"
  echo
  echo "⚙️ Setup:"
  echo "  gc-setup            - Setup commitlint for current project"
  echo "  gc-setup-global     - Setup global commitlint configuration"
  echo
  echo "Examples:"
  echo "  gc-feat auth 'add login validation'"
  echo "  gc-fix ui 'resolve button alignment'"
  echo "  gc-docs 'update API documentation'"
}

# Auto-completion for commit types (if using zsh)
if [[ -n "${ZSH_VERSION:-}" ]]; then
  _gc_types=(feat fix docs style refactor perf test build ci chore revert hotfix wip)
  compctl -k _gc_types gc-by-type
fi