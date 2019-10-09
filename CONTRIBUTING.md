# Libero Producer: Developer Code of Practice

The following is the Code of Practice that must be followed when creating a new library or service for the Libero Producer project.

# Language

The preferred development language is **TypeScript**, falling back to **JavaScript** where pragmatic. New code should be written in **TypeScript** and existing **JavaScript** code can optinally be ported, however the merit of such work should be judged on a case by case basis.

# Analysis

All code is expected to adhere to a styling standard, which is enforced automatically using [**TSLint](https://palantir.github.io/tslint/). A default set of rules have been defined and all code is expected to adhear to these standards which will be inforced as part of the CI/CD process, so any committed code that fails to adhear to the standard will be rejected.

# Testing

All code **MUST** be tested, with the default expectation being 100% coverage. For both **TypeScript** and **JavaScript** we make use of [**Jest**](https://jestjs.io/). The build system includes rules and targets to run tests, as long as they meet the following requirements.

* Tests are located under the 'src' directory, or any subdirectory within the 'src' directory.
* Tests are named matching the schema '*.test.ts' or '\*.test.js'.

HTML coverage reports are generated for each test run, and can be found in the './dist/jest/' directory.

# Documentation

All public APIs, Interfaces or Objects that your code exposes **MUST** be documented. For both **TypeScript** and **JavaScript** we follow the [**TSDoc**](https://github.com/microsoft/tsdoc) standard, and rely on the [**TypeDoc**](https://typedoc.org/) tools to generate a set of HTML pages. The build system has been setup to already support this via the 'docs' target.

For documentation, the following rules apply...
* Test files by default are excluded by the the generator.

HTML documentation can be found in the './dist/docs/' directory.

# Commit Messages

Commit messages **MUST** follow the [**Conventional Commits 1.0.0 Standard**](https://www.conventionalcommits.org/en/v1.0.0/) standard, and changes that do not adhear to this will not be accepted into the project. We make use of [**husky**](https://github.com/typicode/husky) and [**commitlint**](https://github.com/conventional-changelog/commitlint) to enforce this client side.

# Versioning

Versioning is handled automatically by the CI/CD system. You **MUST NOT** manually version packages. A new version number is generated when a change is made to the tip of the master branch, at which point a new version number is automatically generated based on the type of change, and then a new artifact published to the relevant repository. To facilitate this, we require that commit messages follow the [**Conventional Commits 1.0.0 Standard**](https://www.conventionalcommits.org/en/v1.0.0/) which the CI/CD system can use to automatically derive the next appropriate version number for a release.

# Publishing

Your library or service is expected to produce an artifact, that can hence be published and made available for use. Libraries are expected to produce an NPM package as an artifact, and Services can produce either an NPM package, a Docker Container, or both. The 'publish' target should when called produce the appropriate artifact, do any appropriate versioning operation and publish the artifact to the relevant remote location, e.g. NPM or Docker Hub. The 'publish' target should only by run by the CI/CD system, hence running the target locally should result in either an error, or a 'dry-run'.