# Budibase

1. Install Docker and Docker-Compose

   ```sh
   $ wget https://raw.githubusercontent.com/Budibase/budibase/develop/hosting/scripts/linux/install-docker.sh
   
   wget https://raw.githubusercontent.com/Budibase/budibase/develop/hosting/scripts/linux/install-docker-compose.sh
   ```

   

2. Download

   ```sh
   $ wget https://raw.githubusercontent.com/Budibase/budibase/develop/hosting/docker-compose.yaml
   
   $ wget https://raw.githubusercontent.com/Budibase/budibase/develop/hosting/envoy.yaml
   
   $ wget https://raw.githubusercontent.com/Budibase/budibase/develop/hosting/hosting.properties
   ```

3. Docker-compose

   ```sh
   $ docker-compose --env-file hosting.properties up
   ```

   

