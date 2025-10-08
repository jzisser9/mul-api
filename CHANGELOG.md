## [1.5.3](https://github.com/jzisser9/mul-api/compare/v1.5.2...v1.5.3) (2025-10-08)


### Bug Fixes

* remove encrypted credentials system for simple public API deployment ([ff7742d](https://github.com/jzisser9/mul-api/commit/ff7742dbb8e97c080555ea9a68905e12cf73078c))

## [1.5.2](https://github.com/jzisser9/mul-api/compare/v1.5.1...v1.5.2) (2025-10-07)


### Bug Fixes

* configure Rails master key for encrypted credentials ([775902b](https://github.com/jzisser9/mul-api/commit/775902be54b782fe0fbcd6e422f66853f368432f))

## [1.5.1](https://github.com/jzisser9/mul-api/compare/v1.5.0...v1.5.1) (2025-10-07)


### Bug Fixes

* improve database connectivity error handling and diagnostics ([24ac27f](https://github.com/jzisser9/mul-api/commit/24ac27fd4ca955f059a2d749866d8e9ffb80b065))

# [1.5.0](https://github.com/jzisser9/mul-api/compare/v1.4.0...v1.5.0) (2025-10-07)


### Features

* simplify Docker configuration with hardcoded credentials for public API ([59b2ddc](https://github.com/jzisser9/mul-api/commit/59b2ddc3aeb0f991abb4c1ee52b8781569580fda))

# [1.4.0](https://github.com/jzisser9/mul-api/compare/v1.3.0...v1.4.0) (2025-10-07)


### Features

* improve Docker database configuration and deployment documentation ([46414bc](https://github.com/jzisser9/mul-api/commit/46414bc8e8a4a5bf41104e940b0def3bf38a03ea))

# [1.3.0](https://github.com/jzisser9/mul-api/compare/v1.2.0...v1.3.0) (2025-10-07)


### Features

* add Portainer webhook integration for automatic redeployment ([b16809c](https://github.com/jzisser9/mul-api/commit/b16809ca505c10eb4084f7f3a9e1f5e105fd593a))

# [1.2.0](https://github.com/jzisser9/mul-api/compare/v1.1.1...v1.2.0) (2025-10-07)


### Features

* enhance Docker tagging strategy with comprehensive version tags ([9eb5a43](https://github.com/jzisser9/mul-api/commit/9eb5a43e58c75e6ba1504b8b7b246487f8f67cda))

## [1.1.1](https://github.com/jzisser9/mul-api/compare/v1.1.0...v1.1.1) (2025-10-07)


### Bug Fixes

* resolve Docker container startup failures ([4764238](https://github.com/jzisser9/mul-api/commit/4764238a1e6ee724feb599cfe6375be5b74ca9d2))

# [1.1.0](https://github.com/jzisser9/mul-api/compare/v1.0.2...v1.1.0) (2025-10-07)


### Bug Fixes

* add native gem recompilation to post-create script ([0ef2635](https://github.com/jzisser9/mul-api/commit/0ef2635fba8523576668287313240858b2ac5f8d))
* configure Ruby Test Explorer for RSpec integration ([8e35d26](https://github.com/jzisser9/mul-api/commit/8e35d26559b05ed6e6c0b86f91871edf4af39062))
* restore SSH agent forwarding for GitHub authentication ([75b9629](https://github.com/jzisser9/mul-api/commit/75b9629d19e02c063b84bd50d0a38b18afd7b402))


### Features

* add 1Password CLI support to dev container ([c68b9f8](https://github.com/jzisser9/mul-api/commit/c68b9f8b75a54fd5cd58c9a81b3765dff83a6589))

## [1.0.2](https://github.com/jzisser9/mul-api/compare/v1.0.1...v1.0.2) (2025-10-07)


### Bug Fixes

* configure Ruby LSP for dev container environment ([e27c9d1](https://github.com/jzisser9/mul-api/commit/e27c9d1ea7a73929321f0740b4fd0b431e8dffca))

## [1.0.1](https://github.com/jzisser9/mul-api/compare/v1.0.0...v1.0.1) (2025-10-07)


### Bug Fixes

* add aarch64-linux platform for ARM64 Docker builds ([3b0cafe](https://github.com/jzisser9/mul-api/commit/3b0cafe48faddfedd6470af19f527992f426f2c4))

# 1.0.0 (2025-10-07)


### Bug Fixes

* add native gem recompilation to post-create script ([e3d0c5f](https://github.com/jzisser9/mul-api/commit/e3d0c5fa338d000189712ec900dce11697f7ace6))
* configure Rails binstubs and PATH for dev container ([948c724](https://github.com/jzisser9/mul-api/commit/948c724eb1bf70aa868d1141fc3c92de91f12548))
* improve data cleaning in unit seeding process ([aa43fc7](https://github.com/jzisser9/mul-api/commit/aa43fc7ad2b54387e79fb6408e81d05cb7675f20))


### Features

* add GitHub Actions CI/CD with SemVer and Docker builds ([c2ea5ec](https://github.com/jzisser9/mul-api/commit/c2ea5ecb3b7030db97db7481cdf2836efc752e24))
* add MegaMek unit data files to repository ([2fc940f](https://github.com/jzisser9/mul-api/commit/2fc940f1780cb175e5808f5fe48333c6f07258ad))
* enhance dev container with SSH forwarding and modern Ruby LSP ([e1f0a99](https://github.com/jzisser9/mul-api/commit/e1f0a991ca189f541057f6fda248e5f4b3539979))


### BREAKING CHANGES

* Dev container now requires SSH agent forwarding setup on host machine for Git operations
