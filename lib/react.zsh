#
# React Development Aliases and Functions
#

# Check if command exists
_exists() {
  command -v "$1" > /dev/null 2>&1
}

# =============================================================================
# CREATE & SETUP ALIASES
# =============================================================================

# React project creation
alias cra='create-react-app'
alias cna='create-next-app'
alias cvite='create-vite'
alias cta='create-t3-app'

# Quick project setup with different templates
alias cra-ts='create-react-app --template typescript'
alias cna-ts='create-next-app --typescript'

# =============================================================================
# DEVELOPMENT SERVER ALIASES
# =============================================================================

# Start development servers
alias dev='npm run dev'
alias start='npm start'
alias build='npm run build'
alias test='npm test'
alias lint='npm run lint'
alias lintfix='npm run lint -- --fix'

# Alternative dev commands
alias serve-static='serve -s build'
alias serve-dev='live-server --port=3000'

# =============================================================================
# PACKAGE MANAGEMENT ALIASES
# =============================================================================

# npm shortcuts with npm-quick-run
if _exists nr; then
  alias n='nr'           # Quick script runner
  alias nd='nr dev'      # npm run dev
  alias nb='nr build'    # npm run build
  alias nt='nr test'     # npm run test
  alias nl='nr lint'     # npm run lint
fi

# Package management
alias ncu='npm-check-updates'
alias ncui='npm-check-updates -i'  # Interactive update
alias ncuu='npm-check-updates -u'  # Update package.json
alias ni='npm install'
alias nid='npm install --save-dev'
alias nig='npm install -g'
alias nls='npm ls --depth=0'
alias outdated='npm outdated'

# Yarn equivalents
alias yi='yarn install'
alias ya='yarn add'
alias yad='yarn add --dev'
alias yag='yarn global add'
alias yr='yarn remove'
alias yu='yarn upgrade'
alias yui='yarn upgrade-interactive'

# pnpm equivalents
alias pi='pnpm install'
alias pa='pnpm add'
alias pad='pnpm add -D'
alias pag='pnpm add -g'
alias pr='pnpm remove'
alias pu='pnpm update'

# =============================================================================
# TESTING ALIASES
# =============================================================================

# Jest testing
alias jest-watch='npm test -- --watch'
alias jest-coverage='npm test -- --coverage'
alias jest-update='npm test -- --updateSnapshot'

# Playwright testing
if _exists playwright; then
  alias pw='playwright test'
  alias pwh='playwright test --headed'
  alias pwui='playwright test --ui'
  alias pwdebug='playwright test --debug'
fi

# =============================================================================
# BUILD & BUNDLE ANALYSIS
# =============================================================================

# Bundle analysis
alias analyze='npm run build && npx webpack-bundle-analyzer build/static/js/*.js'
alias bundlephobia='bundlephobia'
alias bundle-size='size-limit'

# =============================================================================
# CODE QUALITY ALIASES
# =============================================================================

# ESLint
alias eslint-init='npx eslint --init'
alias eslint-fix='npx eslint --fix'

# Prettier
alias prettier-check='npx prettier --check'
alias prettier-write='npx prettier --write'
alias format='npx prettier --write .'

# TypeScript
alias tsc-watch='npx tsc --watch'
alias tsc-check='npx tsc --noEmit'

# =============================================================================
# UTILITY FUNCTIONS
# =============================================================================

# Create React component with boilerplate
create-component() {
  if [ -z "$1" ]; then
    echo "Usage: create-component ComponentName"
    return 1
  fi

  local component_name="$1"
  local component_dir="src/components/$component_name"

  mkdir -p "$component_dir"

  # Create component file
  cat > "$component_dir/$component_name.tsx" <<EOF
import React from 'react';
import './$component_name.css';

interface ${component_name}Props {
  // Add your props here
}

const $component_name: React.FC<${component_name}Props> = ({}) => {
  return (
    <div className="$component_name">
      <h1>$component_name Component</h1>
    </div>
  );
};

export default $component_name;
EOF

  # Create CSS file
  cat > "$component_dir/$component_name.css" <<EOF
.$component_name {
  /* Add your styles here */
}
EOF

  # Create index file for cleaner imports
  cat > "$component_dir/index.ts" <<EOF
export { default } from './$component_name';
EOF

  echo "✅ Created component: $component_dir"
  echo "   - $component_name.tsx"
  echo "   - $component_name.css"
  echo "   - index.ts"
}

# Create React hook with boilerplate
create-hook() {
  if [ -z "$1" ]; then
    echo "Usage: create-hook hookName"
    return 1
  fi

  local hook_name="$1"
  local hook_file="src/hooks/$hook_name.ts"

  mkdir -p "src/hooks"

  cat > "$hook_file" <<EOF
import { useState, useEffect } from 'react';

const $hook_name = () => {
  const [state, setState] = useState();

  useEffect(() => {
    // Add your effect logic here
  }, []);

  return {
    // Return your hook values/functions
  };
};

export default $hook_name;
EOF

  echo "✅ Created hook: $hook_file"
}

# Quick React project info
react-info() {
  echo "📦 Package.json scripts:"
  if [ -f "package.json" ]; then
    cat package.json | jq -r '.scripts | keys[]' 2>/dev/null || echo "jq not available"
  fi

  echo -e "\n🔗 Dependencies:"
  if [ -f "package.json" ]; then
    echo "Dependencies: $(cat package.json | jq -r '.dependencies | keys | length' 2>/dev/null || echo 'N/A')"
    echo "DevDependencies: $(cat package.json | jq -r '.devDependencies | keys | length' 2>/dev/null || echo 'N/A')"
  fi

  echo -e "\n📊 Project size:"
  if _exists du; then
    du -sh . 2>/dev/null
    du -sh node_modules 2>/dev/null
  fi
}

# Open React DevTools
devtools() {
  if _exists google-chrome; then
    google-chrome --remote-debugging-port=9222 &
  elif _exists chrome; then
    chrome --remote-debugging-port=9222 &
  else
    echo "Chrome not found. Please install Google Chrome."
  fi
}

# =============================================================================
# PROJECT NAVIGATION
# =============================================================================

# Quick navigation to common React directories
alias components='cd src/components'
alias hooks='cd src/hooks'
alias pages='cd src/pages'
alias utils='cd src/utils'
alias assets='cd src/assets'
alias styles='cd src/styles'

# =============================================================================
# STORYBOOK ALIASES
# =============================================================================

if _exists storybook; then
  alias sb='storybook dev'
  alias sb-build='storybook build'
  alias sb-init='storybook init'
fi