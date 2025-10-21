# SSH Key Setup Guide for Copado

This guide will walk you through creating and configuring SSH keys for use with Copado and your Git repositories.

## Why SSH Keys?

SSH keys are used by Copado to:

- Securely authenticate with your Git repositories
- Enable automated deployments and CI/CD pipelines
- Provide secure communication between Copado and your version control system

## Prerequisites

- Access to a terminal or command line interface
- Git installed on your system
- Admin access to your Git provider (GitHub, GitLab, Bitbucket, etc.)

## Step 1: Generate an SSH Key

### On Linux/macOS:

1. Open your terminal
2. Run the following command:

   ```bash
   ssh-keygen -t ed25519 -C "your_email@example.com"
   ```

   Or if your system doesn't support Ed25519:

   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

3. When prompted "Enter file in which to save the key," press Enter to accept the default location (`~/.ssh/id_ed25519` or `~/.ssh/id_rsa`)

4. Enter a secure passphrase when prompted (optional but recommended)

### On Windows:

#### Using Git Bash (Recommended):

1. Open Git Bash
2. Follow the same steps as Linux/macOS above

#### Using PowerShell:

1. Open PowerShell as Administrator
2. Run:
   ```powershell
   ssh-keygen -t ed25519 -C "your_email@example.com"
   ```
3. Follow the prompts as described above

## Step 2: Locate Your SSH Keys

After generation, you'll have two files:

- **Private key**: `~/.ssh/id_ed25519` (or `id_rsa`) - **Keep this secret!**
- **Public key**: `~/.ssh/id_ed25519.pub` (or `id_rsa.pub`) - This is what you'll share

### View Your Public Key:

**Linux/macOS/Git Bash:**

```bash
cat ~/.ssh/id_ed25519.pub
```

**Windows PowerShell:**

```powershell
Get-Content ~/.ssh/id_ed25519.pub
```

## Step 3: Add SSH Key to Your Git Provider

### GitHub:

1. Copy your public key to clipboard
2. Go to GitHub → Settings → SSH and GPG keys
3. Click "New SSH key"
4. Give it a descriptive title (e.g., "Copado SSH Key")
5. Paste your public key
6. Click "Add SSH key"

### GitLab:

1. Copy your public key to clipboard
2. Go to GitLab → User Settings → SSH Keys
3. Paste your public key in the "Key" field
4. Add a descriptive title
5. Click "Add key"

### Bitbucket:

1. Copy your public key to clipboard
2. Go to Bitbucket → Personal Settings → SSH keys
3. Click "Add key"
4. Give it a label
5. Paste your public key
6. Click "Add key"

### Azure DevOps:

1. Copy your public key to clipboard
2. Go to User Settings → SSH public keys
3. Click "+ New Key"
4. Provide a name
5. Paste your public key
6. Click "Add"

## Step 4: Configure SSH Key in Copado

### For Copado Deployer:

1. Log in to your Copado instance
2. Navigate to **Copado Deployer** → **Settings** → **Pipeline Manager**
3. Go to the **Git Repository** settings
4. Select your repository
5. Choose **SSH** as the authentication method
6. Paste your **private key** (the content of `~/.ssh/id_ed25519` or `~/.ssh/id_rsa`)
   ```bash
   cat ~/.ssh/id_ed25519
   ```
7. Save the configuration

### For Git Repository Authentication:

1. In Copado, go to your **Git Repository** record
2. Set **Authentication Protocol** to "SSH"
3. In the **SSH Key** field, paste your private key
4. Test the connection
5. Save the record

## Step 5: Verify SSH Connection

Test your SSH connection to ensure everything is configured correctly:

### GitHub:

```bash
ssh -T git@github.com
```

Expected output: "Hi username! You've successfully authenticated..."

### GitLab:

```bash
ssh -T git@gitlab.com
```

Expected output: "Welcome to GitLab, @username!"

### Bitbucket:

```bash
ssh -T git@bitbucket.org
```

Expected output: "authenticated via ssh key..."

## Troubleshooting

### Permission Denied (publickey)

- Ensure your public key is correctly added to your Git provider
- Verify the private key is correctly configured in Copado
- Check that you're using the correct SSH URL format (git@github.com:username/repo.git)

### SSH Key Format Issues

- Ensure you're copying the entire key (including the header and footer)
- Don't add extra spaces or line breaks
- For Copado, use the private key; for Git providers, use the public key

### Connection Timeout

- Check your firewall settings
- Ensure port 22 is not blocked
- Try using HTTPS as an alternative if SSH is blocked

## Security Best Practices

1. **Never share your private key** - Only share the public key (.pub file)
2. **Use a passphrase** - Adds an extra layer of security
3. **Use separate keys for different services** - Generate different keys for different purposes
4. **Rotate keys periodically** - Update your keys regularly
5. **Remove old keys** - Delete unused keys from your Git provider and Copado

## Additional Resources

- [GitHub SSH Documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [GitLab SSH Documentation](https://docs.gitlab.com/ee/user/ssh.html)
- [Copado Documentation](https://docs.copado.com)
- [Bitbucket SSH Documentation](https://support.atlassian.com/bitbucket-cloud/docs/set-up-an-ssh-key/)

## Need Help?

If you encounter issues:

1. Check the Copado logs for error messages
2. Verify your SSH key format and permissions
3. Contact your Copado administrator
4. Reach out to Copado support

---

**Note**: Always follow your organization's security policies when generating and managing SSH keys.
