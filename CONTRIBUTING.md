## Conventional Commits

This project uses [Conventional Commits](https://www.conventionalcommits.org/) for automated semantic versioning.

### Commit Message Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

- **feat**: A new feature (triggers a minor version bump)
- **fix**: A bug fix (triggers a patch version bump)
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **chore**: Changes to the build process or auxiliary tools and libraries such as documentation generation

### Breaking Changes

Add `!` after the type/scope or include `BREAKING CHANGE:` in the footer to trigger a major version bump:

```
feat!: change API response format
```

or

```
feat: add new authentication system

BREAKING CHANGE: API now requires authentication headers
```

### Examples

```
feat: add unit search by faction
fix: resolve database connection timeout
docs: update API documentation
chore: update dependencies
test: add unit controller specs
```