# Canvas LMS

## Canvas Installation

1. Download the latest source for Canvas

   ```
   $ mkdir ~/exempt; cd ~/exempt # because the virus scanner is configured to ignore this dir and it makes everything faster
   $ git clone https://github.com/instructure/canvas-lms.git canvas
   $ cd canvas
   $ git checkout stable
   ```

2. Dependency Installation

   On Ubuntu 18.04 LTS (Debian 10 should be similar) you can simply do:

   ```
   $ sudo apt-get update
   $ sudo apt install ruby ruby-dev postgresql zlib1g-dev libxml2-dev libsqlite3-dev libpq-dev libxmlsec1-dev curl build-essential
   ```

   Node.js installation

   ```
   $ curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
   $ sudo apt-get install -y nodejs 
   ```

   Yarn installation:

   ```
   $ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
   $ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
   $ sudo apt-get update && sudo apt-get install yarn=1.10.1-1
   ```

   After installing Postgres, you will need to set your system username as a postgres superuser. You can do so by running the following commands:

   ```
   sudo -u postgres createuser $USER
   sudo -u postgres psql -c "alter user $USER with superuser" postgres
   ```

   **Bundler**
   Canvas uses Bundler as an additional layer on top of Ruby Gems to manage versioned dependencies. Bundler is great!

   **You can install Bundler using Ruby Gems:**

   ```
   $ sudo gem install bundler
   ```

3. Canvas Dependencies

   Once you have installed Bundler, **please navigate to the Canvas application root**, where you can install all of the Canvas dependencies using Bundler.

   ```
   
   ```

   

