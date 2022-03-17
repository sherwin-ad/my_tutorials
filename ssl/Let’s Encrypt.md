# Let’s Encrypt



## Download and Install Let’s Encrypt

1. Install the `git` package:

   **CentOS**

   ```
   sudo yum install git
   ```

   **Debian / Ubuntu**

   ```
   sudo apt-get install git
   ```

2. Download a clone of Let’s Encrypt from the [official GitHub repository](https://github.com/letsencrypt/letsencrypt). `/opt` is a common installation directory for third-party packages, so let’s install the clone to `/opt/letsencrypt`:

   ```
   sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
   ```

3. Navigate to the new `/opt/letsencrypt` directory:

   ```
   cd /opt/letsencrypt
   ```