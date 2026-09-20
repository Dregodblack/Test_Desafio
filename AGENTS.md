# AI Agent Instructions for Desafio_QA

## Purpose
This repository is a Ruby/Cucumber test automation suite for web UI scenarios. The main goal is to support adding, debugging, and running BDD tests using Capybara and Selenium.

## Key project structure
- `features/spec/` - Gherkin feature files
- `features/step_definitions/` - Ruby step definition files
- `features/support/` - environment setup, hooks, helper functions, page objects, and element constants
- `features/class/` - reusable Ruby classes for the automation
- `report/` - generated reports and screenshots
- `cucumber.yml` - Cucumber profile definitions for HTML/JSON/JUnit reporting
- `Gemfile` - Ruby gem dependencies
- `README.md` - setup and execution guidance for human readers

## How to run tests
Use Bundler and Cucumber from the repository root.

Recommended commands:
- `bundle install`
- `bundle exec cucumber` or `bundle exec cucumber -p default`
- `bundle exec cucumber --tags "@regressivo"`
- `bundle exec cucumber -p html`
- `bundle exec cucumber -p json`
- `bundle exec cucumber -p junit`

If the project is not using Bundler in a specific environment, `cucumber` is still the primary runner.

## Conventions
- The project uses Cucumber tags for selective execution. Common tags include:
  - `@regressivo` for full regression runs
  - `@cenario_desejado` or `@funcionalidade_desejada` for targeted scenarios
- `features/support/env.rb` loads all support files and configures Capybara with `:chrome` and `app_host = 'https://opensource-demo.orangehrmlive.com'`.
- Global Faker-based test data is defined in `env.rb` using variables such as `$nome_completo_faker`, `$usuario_faker`, and `$cpf_faker`.
- The project currently expects Chrome and chromedriver compatibility; `webdrivers` is used to manage driver binaries.
- Step definitions are in Portuguese and may mix comments and code in Brazilian Portuguese.

## What an AI assistant should do
- Prefer small, targeted changes in step definitions or support helpers rather than broad rewrites.
- Keep page object and element locator updates consistent with existing naming and file organization.
- Preserve the BDD structure of feature files; when creating new steps, add matching definitions under `features/step_definitions/`.
- Use `cucumber.yml` profiles for report generation rather than hardcoding report output paths.
- When asking for environment setup or path changes, reference `README.md`.

## Notes
- There is no existing `.github/copilot-instructions.md` or `AGENTS.md`; this file is the main chat customization entry point.
- Use `README.md` for detailed environment installation and project-specific notes.
