/**
 * Global Commitlint Configuration
 *
 * This configuration enforces conventional commit standards across all projects.
 * Based on @commitlint/config-conventional with custom rules for React development.
 *
 * Commit Message Format: type(scope): description
 * Example: feat(auth): add login validation
 */

module.exports = {
  extends: ['@commitlint/config-conventional'],

  rules: {
    // Type definitions - what kind of change this is
    'type-enum': [
      2,
      'always',
      [
        'feat',      // New feature
        'fix',       // Bug fix
        'docs',      // Documentation changes
        'style',     // Code style changes (formatting, missing semicolons, etc)
        'refactor',  // Code refactoring
        'perf',      // Performance improvements
        'test',      // Adding or updating tests
        'build',     // Changes to build system or external dependencies
        'ci',        // Changes to CI configuration files and scripts
        'chore',     // Other changes that don't modify src or test files
        'revert',    // Reverts a previous commit
        'wip',       // Work in progress (use sparingly)
        'hotfix',    // Critical fixes that need immediate attention
      ],
    ],

    // Scope definitions - what part of the codebase is affected
    'scope-enum': [
      1, // Warning level (not error)
      'always',
      [
        // Frontend/React specific
        'ui',           // UI components and styling
        'components',   // React components
        'hooks',        // React hooks
        'pages',        // Page components/routes
        'auth',         // Authentication
        'api',          // API integration
        'state',        // State management
        'routing',      // Routing/navigation
        'forms',        // Form handling
        'validation',   // Input validation
        'styling',      // CSS/styling
        'responsive',   // Responsive design
        'accessibility', // a11y improvements
        'seo',          // SEO optimizations
        'performance',  // Performance optimizations

        // Development/Tooling
        'config',       // Configuration files
        'deps',         // Dependencies
        'scripts',      // Build scripts
        'webpack',      // Webpack configuration
        'vite',         // Vite configuration
        'eslint',       // ESLint configuration
        'prettier',     // Prettier configuration
        'husky',        // Git hooks
        'ci/cd',        // CI/CD pipelines
        'docker',       // Docker configuration
        'env',          // Environment configuration

        // Testing
        'unit',         // Unit tests
        'integration',  // Integration tests
        'e2e',          // End-to-end tests
        'test-utils',   // Testing utilities
        'mocks',        // Mock data/services

        // Documentation
        'readme',       // README files
        'changelog',    // Changelog updates
        'docs',         // General documentation
        'storybook',    // Storybook documentation
        'jsdoc',        // JSDoc comments

        // Infrastructure
        'security',     // Security improvements
        'monitoring',   // Monitoring/logging
        'analytics',    // Analytics tracking
        'database',     // Database changes
        'migration',    // Database migrations

        // Project Management
        'release',      // Release management
        'version',      // Version bumps
        'license',      // License updates
        'legal',        // Legal/compliance changes
      ],
    ],

    // Message format rules
    'subject-case': [2, 'always', 'lower-case'],
    'subject-empty': [2, 'never'],
    'subject-full-stop': [2, 'never', '.'],
    'subject-max-length': [2, 'always', 72],
    'subject-min-length': [2, 'always', 3],

    // Type rules
    'type-case': [2, 'always', 'lower-case'],
    'type-empty': [2, 'never'],

    // Scope rules
    'scope-case': [2, 'always', 'lower-case'],
    'scope-empty': [1, 'never'], // Warning, not error

    // Header rules
    'header-max-length': [2, 'always', 100],
    'header-min-length': [2, 'always', 10],

    // Body rules
    'body-leading-blank': [2, 'always'],
    'body-max-line-length': [2, 'always', 100],

    // Footer rules
    'footer-leading-blank': [2, 'always'],
    'footer-max-line-length': [2, 'always', 100],
  },

  // Custom prompt configuration for interactive commits
  prompt: {
    questions: {
      type: {
        description: "Select the type of change that you're committing:",
        enum: {
          feat: {
            description: 'A new feature',
            title: 'Features',
            emoji: '✨',
          },
          fix: {
            description: 'A bug fix',
            title: 'Bug Fixes',
            emoji: '🐛',
          },
          docs: {
            description: 'Documentation only changes',
            title: 'Documentation',
            emoji: '📚',
          },
          style: {
            description: 'Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)',
            title: 'Styles',
            emoji: '💎',
          },
          refactor: {
            description: 'A code change that neither fixes a bug nor adds a feature',
            title: 'Code Refactoring',
            emoji: '📦',
          },
          perf: {
            description: 'A code change that improves performance',
            title: 'Performance Improvements',
            emoji: '🚀',
          },
          test: {
            description: 'Adding missing tests or correcting existing tests',
            title: 'Tests',
            emoji: '🚨',
          },
          build: {
            description: 'Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)',
            title: 'Builds',
            emoji: '🛠',
          },
          ci: {
            description: 'Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)',
            title: 'Continuous Integrations',
            emoji: '⚙️',
          },
          chore: {
            description: 'Other changes that don\'t modify src or test files',
            title: 'Chores',
            emoji: '♻️',
          },
          revert: {
            description: 'Reverts a previous commit',
            title: 'Reverts',
            emoji: '🗑',
          },
        },
      },
      scope: {
        description: 'What is the scope of this change (e.g. component or file name)',
      },
      subject: {
        description: 'Write a short, imperative tense description of the change',
      },
      body: {
        description: 'Provide a longer description of the change',
      },
      isBreaking: {
        description: 'Are there any breaking changes?',
      },
      breakingBody: {
        description: 'A BREAKING CHANGE commit requires a body. Please enter a longer description of the commit itself',
      },
      breaking: {
        description: 'Describe the breaking changes',
      },
      isIssueAffected: {
        description: 'Does this change affect any open issues?',
      },
      issuesBody: {
        description: 'If issues are closed, the commit requires a body. Please enter a longer description of the commit itself',
      },
      issues: {
        description: 'Add issue references (e.g. "fix #123", "re #123".)',
      },
    },
  },
};