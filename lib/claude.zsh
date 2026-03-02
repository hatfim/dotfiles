#
# Claude AI Development Workflow Aliases and Functions
# Enhanced Claude CLI integration with agents and development tools
#

# Check if command exists
_exists() {
  command -v "$1" > /dev/null 2>&1
}

# =============================================================================
# CLAUDE CLI ALIASES
# =============================================================================

# Basic Claude commands
alias c='claude'
alias cc='claude chat'
# alias cd='claude docs'
alias cv='claude validate'
alias cs='claude status'

# Chat variations
alias cci='claude chat --interactive'
alias ccf='claude chat --file'
alias ccp='claude chat --project'

# =============================================================================
# AGENT SHORTCUTS
# =============================================================================

# Core agents
alias cg='claude chat --agent general-purpose'
alias cfe='claude chat --agent frontend-developer'
alias cbe='claude chat --agent backend-developer'
alias cfa='claude chat --agent full-stack-architect'

# React specialists
alias crc='claude chat --agent react-component-architect'
alias crn='claude chat --agent react-nextjs-expert'
alias crh='claude chat --agent react-hooks-expert'

# Backend specialists
alias crl='claude chat --agent rails-backend-expert'
alias crla='claude chat --agent rails-api-developer'
alias clar='claude chat --agent laravel-backend-expert'
alias clar-e='claude chat --agent laravel-eloquent-expert'

# Django specialists
alias cdj='claude chat --agent django-backend-expert'
alias cdja='claude chat --agent django-api-developer'
alias cdjo='claude chat --agent django-orm-expert'

# Vue specialists
alias cvu='claude chat --agent vue-component-architect'
alias cvn='claude chat --agent vue-nuxt-expert'

# DevOps and infrastructure
alias cdo='claude chat --agent devops-engineer'
alias cdi='claude chat --agent docker-specialist'
alias ckube='claude chat --agent kubernetes-expert'

# Code quality and testing
alias ctlr='claude chat --agent tech-lead-reviewer'
alias ctest='claude chat --agent test-automation-expert'
alias cperf='claude chat --agent performance-optimizer'

# Documentation and analysis
alias cdoc='claude chat --agent documentation-specialist'
alias ccode='claude chat --agent code-archaeologist'
alias crev='claude chat --agent code-reviewer'

# =============================================================================
# DEVELOPMENT WORKFLOW FUNCTIONS
# =============================================================================

# Quick agent lookup
claude-agents() {
  echo "🤖 Available Claude Agents:"
  echo "=========================="
  echo
  echo "🔧 Core Development:"
  echo "  cg          - general-purpose (default multi-task agent)"
  echo "  cfe         - frontend-developer (React, Vue, Angular)"
  echo "  cbe         - backend-developer (Node, Python, etc.)"
  echo "  cfa         - full-stack-architect (system design)"
  echo
  echo "⚛️  React Specialists:"
  echo "  crc         - react-component-architect"
  echo "  crn         - react-nextjs-expert"
  echo "  crh         - react-hooks-expert"
  echo
  echo "🚂 Backend Frameworks:"
  echo "  crl         - rails-backend-expert"
  echo "  crla        - rails-api-developer"
  echo "  clar        - laravel-backend-expert"
  echo "  clar-e      - laravel-eloquent-expert"
  echo "  cdj         - django-backend-expert"
  echo "  cdja        - django-api-developer"
  echo "  cdjo        - django-orm-expert"
  echo
  echo "🔷 Vue.js:"
  echo "  cvu         - vue-component-architect"
  echo "  cvn         - vue-nuxt-expert"
  echo
  echo "☁️  DevOps & Infrastructure:"
  echo "  cdo         - devops-engineer"
  echo "  cdi         - docker-specialist"
  echo "  ckube       - kubernetes-expert"
  echo
  echo "🔍 Code Quality:"
  echo "  ctlr        - tech-lead-reviewer"
  echo "  ctest       - test-automation-expert"
  echo "  cperf       - performance-optimizer"
  echo "  crev        - code-reviewer"
  echo
  echo "📚 Documentation:"
  echo "  cdoc        - documentation-specialist"
  echo "  ccode       - code-archaeologist"
  echo
  echo "💡 Usage: Just type the alias to start chatting with that agent!"
}

# Interactive agent selector
claude-select() {
  echo "🤖 Select a Claude Agent:"
  echo "========================"
  echo
  echo "1.  General Purpose (cg)"
  echo "2.  Frontend Developer (cfe)"
  echo "3.  React Component Architect (crc)"
  echo "4.  React Next.js Expert (crn)"
  echo "5.  Backend Developer (cbe)"
  echo "6.  Rails Backend Expert (crl)"
  echo "7.  Laravel Backend Expert (clar)"
  echo "8.  Django Backend Expert (cdj)"
  echo "9.  Vue Component Architect (cvu)"
  echo "10. DevOps Engineer (cdo)"
  echo "11. Code Reviewer (crev)"
  echo "12. Documentation Specialist (cdoc)"
  echo
  read -p "Enter number (1-12): " selection

  case $selection in
    1) cg ;;
    2) cfe ;;
    3) crc ;;
    4) crn ;;
    5) cbe ;;
    6) crl ;;
    7) clar ;;
    8) cdj ;;
    9) cvu ;;
    10) cdo ;;
    11) crev ;;
    12) cdoc ;;
    *) echo "Invalid selection. Use 'claude-agents' to see all options." ;;
  esac
}

# Project-specific Claude chat
claude-project() {
  if [ -z "$1" ]; then
    echo "Usage: claude-project <project-name> [agent]"
    echo "Example: claude-project my-react-app react-component-architect"
    return 1
  fi

  local project_name="$1"
  local agent="${2:-general-purpose}"

  echo "🚀 Starting Claude chat for project: $project_name"
  echo "📁 Agent: $agent"
  echo

  if [ -f "package.json" ]; then
    echo "📦 Detected Node.js project"
    claude chat --agent "$agent" --context "This is a project called '$project_name'. Here's the package.json:" --file package.json
  elif [ -f "requirements.txt" ]; then
    echo "🐍 Detected Python project"
    claude chat --agent "$agent" --context "This is a Python project called '$project_name'. Here are the requirements:" --file requirements.txt
  else
    claude chat --agent "$agent" --context "This is a project called '$project_name'."
  fi
}

# Quick code review with Claude
claude-review() {
  local files="${1:-.}"

  echo "🔍 Starting code review with Claude..."

  if [ -f "$files" ]; then
    echo "📄 Reviewing file: $files"
    crev --context "Please review this code for best practices, potential issues, and improvements:" --file "$files"
  else
    echo "📂 Reviewing current directory changes"
    if git diff --cached --name-only | head -5; then
      crev --context "Please review these staged changes for best practices, potential issues, and improvements:"
    else
      echo "❌ No staged changes found. Stage some files first with 'git add'"
      return 1
    fi
  fi
}

# Generate documentation with Claude
claude-docs() {
  local target="${1:-.}"

  echo "📚 Generating documentation with Claude..."

  if [ -f "$target" ]; then
    echo "📄 Documenting file: $target"
    cdoc --context "Please generate comprehensive documentation for this code:" --file "$target"
  elif [ -d "$target" ]; then
    echo "📂 Documenting directory: $target"
    cdoc --context "Please analyze this project structure and suggest documentation improvements for the codebase in directory: $target"
  else
    echo "❌ Target not found: $target"
    return 1
  fi
}

# Performance analysis with Claude
claude-perf() {
  local target="${1:-.}"

  echo "🚀 Starting performance analysis with Claude..."

  if [ -f "package.json" ]; then
    echo "📦 Analyzing Node.js/React performance"
    cperf --context "Please analyze this project for performance issues and optimization opportunities:" --file package.json
  else
    echo "📂 General performance analysis"
    cperf --context "Please analyze the current directory for performance optimization opportunities"
  fi
}

# Test generation with Claude
claude-test() {
  if [ -z "$1" ]; then
    echo "Usage: claude-test <file-to-test>"
    echo "Example: claude-test src/components/Button.tsx"
    return 1
  fi

  local file_to_test="$1"

  if [ ! -f "$file_to_test" ]; then
    echo "❌ File not found: $file_to_test"
    return 1
  fi

  echo "🧪 Generating tests with Claude..."
  ctest --context "Please generate comprehensive tests for this code:" --file "$file_to_test"
}

# =============================================================================
# CLAUDE CONFIGURATION HELPERS
# =============================================================================

# Show Claude configuration
claude-config() {
  echo "⚙️ Claude Configuration:"
  echo "======================="
  echo
  echo "📂 Claude directory: $HOME/.claude"
  echo "🤖 Agents path: $HOME/.claude/agents"
  echo "🔧 Local package: $HOME/.claude/local"
  echo
  echo "📊 Status:"
  if _exists claude; then
    echo "✅ Claude CLI: Available"
  else
    echo "❌ Claude CLI: Not found"
  fi

  if [ -d "$HOME/.claude/agents" ]; then
    echo "✅ Agents: Available"
  else
    echo "❌ Agents: Not found"
  fi

  if [ -f "$HOME/.claude/config.json" ]; then
    echo "✅ Configuration: Available"
  else
    echo "❌ Configuration: Not found"
  fi
}

# Update Claude agents
claude-update() {
  echo "🔄 Updating Claude agents..."

  local agents_repo="$HOME/Dev/Forks/claude-agents"

  if [ -d "$agents_repo" ]; then
    cd "$agents_repo"
    git pull origin main
    echo "✅ Claude agents updated"
    cd - > /dev/null
  else
    echo "❌ Claude agents repository not found"
    echo "Run 'setup-claude' to install the agents"
  fi
}

# =============================================================================
# DEVELOPMENT SHORTCUTS
# =============================================================================

# Quick React component creation with Claude
claude-react-component() {
  if [ -z "$1" ]; then
    echo "Usage: claude-react-component <ComponentName>"
    echo "Example: claude-react-component UserProfile"
    return 1
  fi

  local component_name="$1"

  echo "⚛️ Creating React component with Claude: $component_name"
  crc --context "Please create a React TypeScript component called '$component_name' with the following:
  - TypeScript interface for props
  - Functional component with proper typing
  - CSS module for styling
  - Basic JSDoc documentation
  - Export statement
  Please create both the component file and a basic test file."
}

# API design with Claude
claude-api() {
  local description="$*"

  if [ -z "$description" ]; then
    echo "Usage: claude-api <description>"
    echo "Example: claude-api user authentication with JWT tokens"
    return 1
  fi

  echo "🔌 Designing API with Claude..."
  cbe --context "Please design a RESTful API for: $description. Include:
  - Resource endpoints
  - HTTP methods and status codes
  - Request/response schemas
  - Authentication/authorization
  - Error handling
  - OpenAPI/Swagger specification if possible"
}

# Database design with Claude
claude-db() {
  local description="$*"

  if [ -z "$description" ]; then
    echo "Usage: claude-db <description>"
    echo "Example: claude-db e-commerce platform with users, products, and orders"
    return 1
  fi

  echo "🗄️ Designing database with Claude..."
  cbe --context "Please design a database schema for: $description. Include:
  - Entity relationship diagram
  - Table structures with columns and types
  - Primary and foreign keys
  - Indexes for performance
  - Sample SQL migrations
  - Best practices for normalization"
}

# Help function
claude-help() {
  echo "🤖 Claude Development Workflow Commands"
  echo "======================================="
  echo
  echo "📝 Basic Commands:"
  echo "  c, cc           - Start Claude chat"
  echo "  cv              - Validate Claude setup"
  echo "  cs              - Show Claude status"
  echo
  echo "🤖 Agent Selection:"
  echo "  claude-agents   - Show all available agents"
  echo "  claude-select   - Interactive agent selector"
  echo
  echo "🔧 Development Workflows:"
  echo "  claude-project <name> [agent]  - Project-specific chat"
  echo "  claude-review [file]           - Code review"
  echo "  claude-docs [target]           - Generate documentation"
  echo "  claude-perf [target]           - Performance analysis"
  echo "  claude-test <file>             - Generate tests"
  echo
  echo "⚛️ React Development:"
  echo "  claude-react-component <name>  - Create React component"
  echo "  crc, crn, crh                  - React specialists"
  echo
  echo "🔌 Backend Development:"
  echo "  claude-api <description>       - Design API"
  echo "  claude-db <description>        - Design database"
  echo "  crl, clar, cdj                 - Backend specialists"
  echo
  echo "⚙️ Configuration:"
  echo "  claude-config   - Show configuration"
  echo "  claude-update   - Update agents"
  echo "  setup-claude    - Initial setup"
  echo
  echo "💡 Use 'claude-help' anytime to see this reference!"
}

# Auto-completion for agents (if using zsh)
if [[ -n "${ZSH_VERSION:-}" ]]; then
  _claude_agents=(
    general-purpose frontend-developer backend-developer full-stack-architect
    react-component-architect react-nextjs-expert react-hooks-expert
    rails-backend-expert rails-api-developer laravel-backend-expert laravel-eloquent-expert
    django-backend-expert django-api-developer django-orm-expert
    vue-component-architect vue-nuxt-expert
    devops-engineer docker-specialist kubernetes-expert
    tech-lead-reviewer test-automation-expert performance-optimizer code-reviewer
    documentation-specialist code-archaeologist
  )

  compctl -k _claude_agents claude-project
fi