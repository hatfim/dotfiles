# Production-Ready Dotfiles for Modern Development

> A comprehensive, React-optimized dotfiles setup with automated installation, conventional commits, and professional development workflows.

<p align="center">
  <img alt="Modern Terminal Setup" src="https://user-images.githubusercontent.com/10276208/36086434-5de52ace-0ff2-11e8-8299-c67f9ab4e9bd.gif" width="980px">
</p>

## ✨ Features

### 🚀 **React/Frontend Development Optimized**
- **Complete React toolchain** with TypeScript, testing, and modern build tools
- **Interactive project creation** with templates for Vite, Next.js, and custom setups
- **VS Code configuration** optimized for React development with essential extensions
- **Global npm packages** for React workflows and productivity tools
- **Component and hook generators** with boilerplate templates

### 📝 **Professional Git Workflow**
- **Interactive conventional commits** with auto-selection menus
- **Global commitlint configuration** enforcing consistent commit messages
- **Git hooks integration** for automatic validation
- **Shell aliases** for streamlined git workflows
- **Commit message templates** and guidance

### 🖥️ **Modern Terminal Experience**
- **iTerm2 configuration management** with export/import capabilities
- **Starship prompt** with beautiful, informative display
- **Enhanced CLI tools** (ripgrep, fd, fzf, bat, lsd, etc.)
- **Shell integration** with autosuggestions and syntax highlighting
- **Comprehensive aliases** for productivity

### ⚙️ **Automated Setup & Maintenance**
- **Dotbot automation** with validation and safety checks
- **Homebrew management** with maintenance scripts
- **Environment configuration** via `.env` files
- **Cross-platform compatibility** (macOS focus with Linux support)
- **Security best practices** with secure credential handling

### 🛠️ **Development Tools & Scripts**
- **System validation** scripts ensuring proper setup
- **Project scaffolding** with modern templates
- **Maintenance automation** for package updates
- **Development workflow optimization** with smart aliases

## 🚀 Quick Start

### Prerequisites
- macOS (primary) or Linux
- Git installed
- Terminal access

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Configure your details**
   ```bash
   cp .env.example .env
   # Edit .env with your personal settings
   ```

3. **Install everything**
   ```bash
   ./install
   ```

4. **Restart your terminal**
   ```bash
   exec zsh
   ```

That's it! Your development environment is now configured with all the modern tools and workflows.

## 📚 Usage Guide

### React Development Workflow

#### Create New Projects
```bash
# Interactive project creation
create-react-project my-app

# Specific templates
create-react-project my-app vite      # Vite + React + TypeScript
create-react-project my-app next      # Next.js + TypeScript
create-react-project my-app custom    # Enhanced with Storybook, testing
```

#### Development Commands
```bash
# Quick npm script runner
n dev                    # npm run dev
n build                  # npm run build
n test                   # npm run test

# Package management
ncu                      # Check for updates
ncui                     # Interactive update

# Component generation
create-component Button  # Creates component with boilerplate
create-hook useAuth      # Creates custom hook template
```

### Git Workflow with Conventional Commits

#### Interactive Commits
```bash
gci                      # Interactive commit with type selection
gaci                     # Stage all + interactive commit
gcz                      # Commitizen interactive mode
```

#### Quick Commits
```bash
gc-feat auth "add login validation"        # feat(auth): add login validation
gc-fix ui "resolve button alignment"       # fix(ui): resolve button alignment
gc-docs "update API documentation"         # docs: update API documentation
gc-test components "add Button tests"      # test(components): add Button tests
```

#### Commit Analysis
```bash
gc-stats                 # Show commit type statistics
gc-validate "feat: msg"  # Validate commit format
gc-help                  # Show all git workflow commands
```

### Terminal & Environment Management

#### iTerm2 Configuration
```bash
export-iterm2-config     # Export current settings to dotfiles
setup-iterm2             # Restore configuration on new machine
```

#### System Maintenance
```bash
validate                 # Check system requirements
brew-maintenance         # Update and clean Homebrew
npm-globals              # Install global development packages
update                   # Update everything (brew, npm, etc.)
```

### Development Productivity

#### Project Navigation
```bash
# Quick directory access
components               # cd src/components
hooks                    # cd src/hooks
pages                    # cd src/pages

# Project info
react-info               # Show project statistics
```

#### Code Quality
```bash
format                   # Format all code with Prettier
lint                     # Run ESLint
lintfix                  # Fix ESLint issues
tsc-check                # TypeScript type checking
```

## 🔧 Configuration

### Environment Variables (`.env`)
```bash
# Personal Configuration
COMPUTER_NAME="your-hostname"
GIT_USER_NAME="Your Full Name"
GIT_USER_EMAIL="your.email@example.com"

# Development Preferences
REACT_DEFAULT_TEMPLATE="vite"
REACT_PROJECTS_DIR="$HOME/Dev/React"
EDITOR="code"
```

### Custom Overrides

#### Shell Customization
- **`~/.zshlocal`** - Personal shell configuration
- **`custom/*.zsh`** - Custom shell scripts (auto-loaded)

#### Git Configuration
- **`~/.gitlocal`** - Personal git settings
- **`commitlint.config.js`** - Project-specific commit rules

#### VS Code Settings
- **`.vscode/settings.json`** - Project-specific VS Code configuration
- **Extensions** automatically recommended and configured

## 📦 What's Included

### Core Tools
- **Shell**: Zsh with Oh My Zsh and Sheldon plugin management
- **Prompt**: Starship with beautiful, informative display
- **Terminal**: iTerm2 with optimized configuration
- **Package Manager**: Homebrew with curated packages

### Development Tools
- **Node.js**: nvm with automatic version switching
- **Package Managers**: npm, yarn, pnpm with global packages
- **Build Tools**: Vite, Webpack, TypeScript
- **Testing**: Jest, Playwright, Testing Library
- **Code Quality**: ESLint, Prettier, commitlint

### Enhanced CLI Experience
- **File Operations**: `lsd` (better ls), `bat` (better cat), `fd` (better find)
- **Search**: `ripgrep` (faster grep), `fzf` (fuzzy finder)
- **Git**: Enhanced git aliases and interactive workflows
- **System**: `htop`, `neofetch`, monitoring tools

### VS Code Integration
- **Extensions**: Curated list for React development
- **Settings**: Optimized for TypeScript/React workflows
- **Keybindings**: Enhanced shortcuts for development
- **Snippets**: React component and workflow snippets

## 🔍 Available Commands

### Project Management
| Command | Description |
|---------|-------------|
| `create-react-project <name> [template]` | Create new React project with templates |
| `create-component <name>` | Generate React component with boilerplate |
| `create-hook <name>` | Generate custom React hook template |
| `react-info` | Show project statistics and dependencies |

### Git Workflow
| Command | Description |
|---------|-------------|
| `gci` / `gcint` | Interactive commit with type selection |
| `gaci` | Stage all and commit interactively |
| `gc-feat [scope] <msg>` | Create feature commit |
| `gc-fix [scope] <msg>` | Create bug fix commit |
| `gc-stats` | Show commit type statistics |
| `gc-help` | Show all git workflow commands |

### System Maintenance
| Command | Description |
|---------|-------------|
| `validate` | Check system requirements and setup |
| `brew-maintenance` | Update and clean Homebrew packages |
| `npm-globals` | Install global npm development packages |
| `setup-git-hooks` | Configure git hooks for commitlint |
| `export-iterm2-config` | Export iTerm2 settings to dotfiles |
| `setup-iterm2` | Restore iTerm2 configuration |

### Development Shortcuts
| Command | Description |
|---------|-------------|
| `n <script>` | Quick npm script runner (npm-quick-run) |
| `ncu` | Check for package updates |
| `format` | Format code with Prettier |
| `lint` / `lintfix` | ESLint checking and fixing |
| `serve-static` | Serve built files locally |

## 🔧 Troubleshooting

### Common Issues

#### Installation Fails
```bash
# Check system requirements
validate

# Fix common issues
brew doctor
brew-maintenance
```

#### Git Hooks Not Working
```bash
# Reinstall git hooks
setup-git-hooks

# Check commitlint installation
which commitlint
```

#### iTerm2 Configuration Not Applied
```bash
# Re-export and setup
export-iterm2-config
setup-iterm2
```

#### VS Code Extensions Not Installing
```bash
# Manually install recommended extensions
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension esbenp.prettier-vscode
```

### Getting Help

- **Command help**: Most commands have `--help` or `-h` flags
- **Git workflow**: Run `gc-help` for complete git command reference
- **React tools**: Check `react-info` for project-specific guidance
- **System status**: Use `validate` to check overall setup health

## 🎯 Project Structure

```
~/.dotfiles/
├── home/                          # Files linked to home directory
│   ├── .zshrc                     # Main shell configuration
│   ├── .gitconfig                 # Git configuration
│   ├── .config/
│   │   ├── starship.toml          # Prompt configuration
│   │   ├── iterm2/                # iTerm2 settings
│   │   ├── vscode/                # VS Code configuration
│   │   └── commitlint/            # Commit message rules
├── lib/                           # Shell functions and aliases
│   ├── aliases.zsh                # General aliases
│   ├── react.zsh                  # React development aliases
│   └── git-commits.zsh            # Git workflow functions
├── scripts/                       # Automation scripts
│   ├── validate                   # System validation
│   ├── npm-globals                # Global package installer
│   ├── create-react-project       # Project scaffolding
│   ├── git-commit-interactive     # Interactive commit UI
│   ├── setup-git-hooks           # Git hooks configuration
│   ├── export-iterm2-config      # iTerm2 export utility
│   ├── setup-iterm2              # iTerm2 setup script
│   └── brew-maintenance          # Homebrew maintenance
├── templates/                     # Project templates
│   ├── react-component.txt        # Component template
│   ├── react-hook.txt             # Hook template
│   ├── package.json               # Enhanced package.json
│   ├── eslintrc.json              # ESLint configuration
│   └── prettierrc.json            # Prettier configuration
├── Brewfile                       # Homebrew package definitions
├── install.conf.yaml              # Dotbot configuration
└── .env.example                   # Environment template
```

## 🤝 Contributing

This dotfiles setup is designed to be personal but also shareable. To customize:

1. **Fork the repository**
2. **Modify configurations** to match your preferences
3. **Update `.env.example`** with your defaults
4. **Test thoroughly** with the validation scripts
5. **Share improvements** via pull requests

## 📄 License

MIT © [Your Name](https://yourwebsite.com)

---

<p align="center">
  <strong>A modern, production-ready development environment that grows with you.</strong>
</p>