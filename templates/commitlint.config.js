module.exports = {
  extends: ['@commitlint/config-conventional'],

  rules: {
    'type-enum': [
      2,
      'always',
      [
        'feat',
        'fix',
        'docs',
        'style',
        'refactor',
        'perf',
        'test',
        'build',
        'ci',
        'chore',
        'revert',
        'wip',
        'hotfix',
      ],
    ],
    'scope-enum': [
      1,
      'always',
      [
        'ui', 'components', 'hooks', 'pages', 'auth', 'api', 'state', 'routing', 'forms',
        'config', 'deps', 'scripts', 'webpack', 'vite', 'eslint', 'prettier',
        'unit', 'integration', 'e2e', 'test-utils', 'mocks',
        'readme', 'changelog', 'docs', 'storybook',
        'security', 'monitoring', 'analytics', 'database'
      ],
    ],
    'subject-case': [2, 'always', 'lower-case'],
    'subject-empty': [2, 'never'],
    'subject-full-stop': [2, 'never', '.'],
    'subject-max-length': [2, 'always', 72],
    'header-max-length': [2, 'always', 100],
  },
};