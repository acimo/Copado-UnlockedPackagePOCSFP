# Copado-UnlockedPackagePOCSFP

Copado Org Edition Provisioning Copado-UnlockedPackagePOCSFP repository.

## Getting Started

This is a Salesforce project using Copado for DevOps and CI/CD automation.

### Prerequisites

- Salesforce CLI (sfdx)
- Node.js and npm
- Git
- SSH keys configured for Copado authentication

### SSH Key Setup

If you need to create SSH keys for Git authentication with Copado, please refer to our comprehensive guide:

**[📖 SSH Setup Guide](SSH_SETUP.md)**

This guide covers:

- How to generate SSH keys on different operating systems
- Adding SSH keys to GitHub, GitLab, Bitbucket, and Azure DevOps
- Configuring SSH keys in Copado
- Troubleshooting common issues

## Development

### Install Dependencies

```bash
npm install
```

### Linting

```bash
npm run lint
```

### Testing

```bash
npm test
```

### Formatting

```bash
npm run prettier
```

## Project Structure

- `force-app/` - Salesforce source code
- `config/` - Salesforce project configuration
- `scripts/` - Apex and SOQL scripts for testing

## Contributing

Please ensure all code follows the project's formatting and linting standards before committing.
