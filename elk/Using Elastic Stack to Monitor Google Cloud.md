# Using Elastic Stack to Monitor Google Cloud

## Task 1. Create an Elastic deployment

Elasticsearch is a real-time, distributed storage, search, and analytics engine. It can be used for many purposes, but one context where it excels is indexing streams of semi-structured data, such as logs or decoded network packets.

In this section, you will first need to sign up for an Elastic [free trial](https://www.elastic.co/guide/en/cloud/current/ec-getting-started-trial.html) with your personal email address. You will then log into Elastic Cloud and create a deployment.

### Create a deployment

1. First, sign up for a [free trial](https://www.elastic.co/cloud/elasticsearch-service/signup?utm_source=referral&utm_medium=qwiklabs&utm_campaign=cloud-trial-subscription-pm&utm_id=701610000005lJVAAY).

- Click **Start free trial**.
- Use your personal email, you'll need to go to your inbox to verify your email address.

**Note: \**You must use your personal email, not your student account, don't attempt to sign up with google, unless you sign out of your lab account first. If you attempt to sign up with your student id, your trial will be rejected or canceled.\****

You should be redirected to [Elastic Cloud](https://cloud.elastic.co/login).

1. On the Create deployment page, give your deployment a name (i.e `my-lab-demo`) and choose the closest Google Cloud region to you.
2. Click **Create Deployment**.
3. **Download** or copy and save the password for the Elastic user, as you will use this later in the lab.

**Note:** The deployment can take up to 5 minutes. While you're waiting for the deployment, navigate to your email and open the sign-up email sent by Elastic to verify your email address.

1. Once your deployment is ready, click **Continue**.
2. On the Welcome Page, click **Explore on my own**.

## Task 2. Set up a service account

Google Cloud implements [service accounts](https://cloud.google.com/compute/docs/access/service-accounts) as a way to access APIs securely. To monitor Google Cloud with Elastic, you will need a service account. The easiest way is to use a predefined service account that Google Cloud [creates automatically](https://cloud.google.com/compute/docs/access/service-accounts?hl=en#default_service_account). Alternatively, you can create a new service account. In this lab, you will create a new one.

1. First, navigate to the Google Cloud Console. To access the service account menu, click **Navigation Menu** > **IAM & Admin** > **Service Accounts**.
2. Next, click **Create Service Account**. For the new service account name, use **gcp-monitor**. Optionally add a description (for example, "Service account to monitor Google Cloud services using the Elastic Stack"). Click **Create and Continue**.
3. Next, add three main roles to the service account to monitor Google Cloud services:

- **Compute Viewer**
- **Monitoring Viewer**
- **Pub/Sub Admin**

![The step two, Grant this service account access to project (optional), section](images\q4StPgYLCUGTqVpDylMDR64eJEi8A%2BcAOi6QYvC%2BkiA%3D)

1. Click **Continue**, then skip granting users access to this service.
2. Finally, click **Done**. The service account is now ready to be used.
3. Next, to use the service account just created `gcp-monitor`, click **Manage keys**.

![The Manage keys option highlighted in the expanded More menu](images\Yt3%2Bq33eOsgJ7OA9UimtPKP%2FE8I7qkkb6XjBXwtAoAA%3D.jpg)

1. On the Keys page, click **Add Key** > **Create new key**.
2. Select JSON as the type and click **Create**.
3. After clicking **Create**, the credential file is downloaded. Rename the file as **credentials.json**. Keep this file in an accessible place to use later.
4. Click **Close**.

Click **Check my progress** to verify the objective.

Assessment Completed!

Set up a Service Account



Check my progress

*Assessment Completed!*



## Task 3. Install beats

To monitor Google Cloud using the Elastic Stack, you need two main components: an Elastic deployment to store and analyze the data and an agent to collect and ship the data.

Two agents can be used to monitor Google Cloud:

- **Metricbeat** is used to monitor metrics
- **Filebeat** to monitor logs.

You can run the agents on any machine. For this lab, you will be using Cloud Shell.

### Install Metricbeat

1. Navigate to Cloud Shell.
2. Download and install Metricbeat:

```
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.14.0-linux-x86_64.tar.gz
tar xzvf metricbeat-7.14.0-linux-x86_64.tar.gz
cd metricbeat-7.14.0-linux-x86_64/
```

Copied!

### Set up assets

- Metricbeat comes with predefined assets for parsing, indexing, and visualizing your data. Run the following command to load these assets. It may take a few minutes.

**Note:** Substitute your Cloud ID and an administrator's `username:password` in this command. To find your Cloud ID, click on your [deployment](https://cloud.elastic.co/deployments).

```
./metricbeat setup -e -E 'cloud.id=YOUR_DEPLOYMENT_CLOUD_ID' -E 'cloud.auth=elastic:YOUR_SUPER_SECRET_PASS'
```

```
./metricbeat setup -e -E 'cloud.id=My_deployment:dXMtY2VudHJhbDEuZ2NwLmNsb3VkLmVzLmlvJGVlMDZhYjBiMzVlZjQ3NGY4MmRkYWY0NDMxM2NlM2YyJGZkNjI5YTY5NDk1MjQ4ZTg5YzlmOTBkM2Q1N2MyMTg0
' -E 'cloud.auth=elastic:t4Djq5em5ZwIvgFJ2bekyxnr'
```



### Configure Metricbeat output

Next, you are going to configure Metricbeat output to Elasticsearch Service.

1. Use the Metricbeat keystore to store [secure settings](https://www.elastic.co/guide/en/beats/metricbeat/7.14/keystore.html). Store the Cloud ID in the keystore:

```
./metricbeat keystore create
echo -n "<Your Deployment Cloud ID>" | ./metricbeat keystore add CLOUD_ID --stdin
```

```
./metricbeat keystore create
echo -n "My_deployment:dXMtY2VudHJhbDEuZ2NwLmNsb3VkLmVzLmlvJGVlMDZhYjBiMzVlZjQ3NGY4MmRkYWY0NDMxM2NlM2YyJGZkNjI5YTY5NDk1MjQ4ZTg5YzlmOTBkM2Q1N2MyMTg0
" | ./metricbeat keystore add CLOUD_ID --stdin
```

To store metrics in Elasticsearch with minimal permissions, create an API key to send data from Metricbeat to Elasticsearch Service.

1. Log into Kibana by navigating to your **Elastic Cloud Deployments** page and clicking **Kibana** on the left navigation menu.

![The Kibana tabbed page](images\guEYktJo5eqZlmpJn1qIy0r0GodOT%2Fb9T2QGfs8ghMg%3D.jpg)

1. Click **Open**.
2. Select **Management** > **Dev Tools**.

![The Management page with the Dev Tools button highlighted](https://cdn.qwiklabs.com/e%2FO5mF50AiSwDDjtDqmY1SnAtTSmvZnBmCaJAdhnMpw%3D)

1. Send the following request. Click the play button to send the request:

```
POST /_security/api_key
{
  "name": "metricbeat-monitor",
  "role_descriptors": {
    "metricbeat_writer": {
      "cluster": ["monitor", "read_ilm"],
      "index": [
        {
          "names": ["metricbeat-*"],
          "privileges": ["view_index_metadata", "create_doc"]
        }
      ]
    }
  }
}
```

```
{
  "id": "dWWB3pQBtZ0jbXI6yPKG",
  "name": "metricbeat-monitor",
  "api_key": "Xf5r31kwRSCe0SkMnz6yOg",
  "encoded": "ZFdXQjNwUUJ0WjBqYlhJNnlQS0c6WGY1cjMxa3dSU0NlMFNrTW56NnlPZw=="
}
```



1. The response contains an `api_key` and an `id` field, which can be stored in the Metricbeat keystore in the following format: `id:api_key`:

```
echo -n "<API ID>:<API KEY>" | ./metricbeat keystore add ES_API_KEY --stdin
```

```
echo -n "dWWB3pQBtZ0jbXI6yPKG:Xf5r31kwRSCe0SkMnz6yOg" | ./metricbeat keystore add ES_API_KEY --stdin
```

**Note:** Make sure you specify the `-n` parameter; otherwise, you will have painful debugging sessions due to adding a newline at the end of your API key

1. To see if both settings have been stored, run the following command:

```
./metricbeat keystore list
```

2. To configure Metricbeat to output to Elasticsearch Service, edit the `metricbeat.yml` configuration file. Add the following lines to the end of the file:

```
cloud.id: ${CLOUD_ID}
output.elasticsearch:
  api_key: ${ES_API_KEY}
```

3. Finally, test if the configuration is working. If it is not working, verify if you used the right credentials and add them again:

```
./metricbeat test output
```

```
./metricbeat test output
elasticsearch: https://ee06ab0b35ef474f82ddaf44313ce3f2.us-central1.gcp.cloud.es.io:443...
  parse url... OK
  connection...
    parse host... OK
    dns lookup... OK
    addresses: 35.193.143.25
    dial up... OK
  TLS...
    security... WARN server's certificate chain verification is disabled
    handshake... OK
    TLS version: TLSv1.3
    dial up... OK
  talk to server... OK
  version: 8.17.1
```



Now that the output is working, you are going to set up the input (Google Cloud).

## Task 4. Configure Metricbeat Google Cloud Platform

To collect metrics from Google Cloud use the [Google Cloud Platform module](https://www.elastic.co/guide/en/beats/metricbeat/7.14/metricbeat-module-gcp.html). This module periodically fetches monitoring metrics from Google Cloud Platform using [Stackdriver Monitoring API](https://cloud.google.com/monitoring/api/metrics_gcp) for Google Cloud Platform services.

**Note:** Extra Google Cloud charges on Stackdriver Monitoring API requests may be generated by this module. For more information, please see [rough estimation of the number of API calls](https://www.elastic.co/guide/en/beats/metricbeat/7.14/metricbeat-module-gcp.html#gcp-api-requests).

1. From the Cloud Shell toolbar, click the three dots (![More icon](https://cdn.qwiklabs.com/2ufrDePg5inKfodUoT2Kib4oE7II7emYn%2BypCC85FjQ%3D)) on the navigation menu and select **Upload**.

![The More icon and the Upload option highlighted](images\yN55hr%2FjCy7g9Vzj5yjIr00xstSTOpHmTcfEuJx821A%3D)

1. Select your service account JSON key file (exported in the first section) and upload it to Cloud Shell. **Note the location of the file as you will be using it in this section**.
2. Next, run the following command to enable the Metricbeat **GCP** module.

```
./metricbeat modules enable gcp
```

Copied!

1. Navigate to the **metricbeat** folder then `modules.d/gcp.yml` file
2. **Replace the entire contents of the file** with the following configurations. Make sure to replace `project_id` and `credentials_file_path` with the your correct values:

```
- module: gcp
  metricsets:
    - compute
  region: us-east4
  project_id: "your-project-id"
  credentials_file_path: "your-credentials-file-path"
  exclude_labels: false
  period: 1m
```

```
- module: gcp
  metricsets:
    - compute
  region: us-east4
  project_id: "qwiklabs-gcp-04-b68fab8ce8d2"
  credentials_file_path: "/home/student_00_4887989e9eb6/credentials.json"
  exclude_labels: false
  period: 1m
```



**Note:** `credentials.json` is the file that you generated earlier.

Your file should resemble the following:

![The open gcp.yaml3 file displaying lines one to 11](images\LPbBWeoiads6%2B%2FNokb7H2G%2BKqzAsQCkHKRZWBBQBKuY%3D)

1. To check if Metricbeat can collect data, test the input by running the following command:

```
./metricbeat test modules gcp
```

```
./metricbeat test modules gcp
gcp...
  compute...OK
    result: 
    {
     "@timestamp": "2025-02-07T04:00:00.000Z",
     "cloud": {
      "account": {
       "id": "qwiklabs-gcp-04-b68fab8ce8d2",
       "name": "qwiklabs-gcp-04-b68fab8ce8d2"
      },
      "instance": {
       "id": "773080243640001866",
       "name": "demo-instance"
      },
      "machine": {
       "type": "e2-micro"
      },
      "provider": "gcp"
     },
     "cloud.availability_zone": "us-east1-d",
     "cloud.region": "us-east1",
     "event": {
      "dataset": "gcp.compute",
      "duration": 1671640555,
      "module": "gcp"
     },
     "gcp": {
      "compute": {
       "instance": {
        "network": {
         "received_bytes_count": {
          "value": 522
         },
         "received_packets_count": {
          "value": 12
         },
         "sent_bytes_count": {
          "value": 42
         },
         "sent_packets_count": {
          "value": 1
         }
        }
       }
      },
      "labels": {
       "metrics": {
        "loadbalanced": "false"
       }
      }
     },
     "host": {
      "id": "773080243640001866",
      "name": "demo-instance",
      "network": {
       "egress": {
        "bytes": 522,
        "packets": 12
       },
       "ingress": {
        "bytes": 42,
        "packets": 1
       }
      }
     },
     "metricset": {
      "name": "compute",
      "period": 60000
     },
     "service": {
      "type": "gcp"
     }
    }
```



Metricbeat will print Google Cloud metrics to the terminal, if the setup is correct.

1. When the input and output are ready, start Metricbeat to collect the data:

```
./metricbeat -e
```



1. Finally, navigate back to Kibana and search for the **[Metricbeat GCP] Compute Overview** dashboard. Click the result to open the dashboard.

![The compute overview search results with '[Metricbeat GCP] Compute Overview' selected](images\c24d5EsScYmne2iM7eNibFkH3hJ0zJmvc5nbq1m2fEw%3D-1738897270843-12.png)

After a few minutes or so, your dashboard should resemble the following:

![The [Metricbeat GCP] Compute Overview dashboard](https://cdn.qwiklabs.com/QK0TisYYDE6I3Disu5FX4KXQk6QsmOJzneXq2BsDB6M%3D)

## Task 5. Install Filebeat

Now that Metricbeat is up and running, configure Filebeat to collect Google Cloud logs.

- Open a new Cloud Shell tab, and run the following commands:

```
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.14.0-linux-x86_64.tar.gz
tar xzvf filebeat-7.14.0-linux-x86_64.tar.gz
cd filebeat-7.14.0-linux-x86_64
```

Copied!

### Set up assets

Filebeat comes with predefined assets for parsing, indexing, and visualizing your data.

- Run the following command to load these assets. It may take a few minutes.

**Note:** Substitute your Cloud ID and an administrator's `username:password` in this command. To find your Cloud ID, click on your [deployment](https://cloud.elastic.co/deployments).

```
./filebeat setup -e -E 'cloud.id=YOUR_DEPLOYMENT_CLOUD_ID' -E 'cloud.auth=elastic:YOUR_SUPER_SECRET_PASS'
```

```
./filebeat setup -e -E 'cloud.id=My_deployment:dXMtY2VudHJhbDEuZ2NwLmNsb3VkLmVzLmlvJGVlMDZhYjBiMzVlZjQ3NGY4MmRkYWY0NDMxM2NlM2YyJGZkNjI5YTY5NDk1MjQ4ZTg5YzlmOTBkM2Q1N2MyMTg0
' -E 'cloud.auth=elastic:t4Djq5em5ZwIvgFJ2bekyxnr'
```



**Note:** You may encounter some warnings or errors regarding setting up ML for `nginx_ecs` or `apache_ecs`. It's safe to ignore these and continue on with the lab.

### Configure Filebeat output

Next, configure Filebeat output to Elasticsearch Service.

1. Use the Filebeat keystore to store [secure settings](https://www.elastic.co/guide/en/beats/filebeat/7.14/keystore.html). Store the Cloud ID in the keystore:

```
./filebeat keystore create
echo -n "<Your Deployment Cloud ID>" | ./filebeat keystore add CLOUD_ID --stdin
```

Copied!

1. To store logs in Elasticsearch with minimal permissions, create an API key to send data from Filebeat to Elasticsearch Service.

- Log into Kibana (you can do so from the Cloud Console without typing in any permissions).
- Open the left Navigation menu, scroll down and select **Management** > **Dev Tools**.
- Send the following request. Click the play button to send the request:

```
POST /_security/api_key
{
  "name": "filebeat-monitor-gcp",
  "role_descriptors": {
    "filebeat_writer": {
      "cluster": [
        "monitor",
        "read_ilm",
        "cluster:admin/ingest/pipeline/get",
        "cluster:admin/ingest/pipeline/put"
      ],
      "index": [
        {
          "names": ["filebeat-*"],
          "privileges": ["view_index_metadata", "create_doc"]
        }
      ]
    }
  }
}
```

Copied!

**Note:** Filebeat needs extra cluster permissions to publish logs, which differs from the Metricbeat configuration. You can find more details [here](https://www.elastic.co/guide/en/beats/filebeat/7.14/feature-roles.html).

1. The response contains an `api_key` and an `id` field, which can be stored in the Filebeat keystore in the following format: `id:api_key`:

```
echo -n "<API ID>:<API KEY>" | ./filebeat keystore add ES_API_KEY --stdin
```

Copied!

**Note:** Make sure you specify the `-n` parameter; otherwise, you will have painful debugging sessions due to adding a newline at the end of your API key

1. To see if both settings have been stored, run the following command:

```
./filebeat keystore list
```

Copied!

1. To configure Filebeat to output to Elasticsearch Service, edit the `filebeat.yml` configuration file. Add the following lines to the end of the file:

```
cloud.id: ${CLOUD_ID}
output.elasticsearch:
  api_key: ${ES_API_KEY}
```

Copied!

1. Finally, test if the configuration is working:

```
./filebeat test output
```

Copied!

Now that the output is working, you are going to set up the input (Google Cloud).

If it is not working, verify that you used the right credentials and, if necessary, add them again.

## Task 6. Configure Filebeat Google Cloud module

To collect logs from Google Cloud, use the [Google Cloud Platform](https://www.elastic.co/guide/en/beats/filebeat/7.14/filebeat-module-gcp.html) module. This module periodically fetches logs that have been exported from Cloud Logging to a Pub/Sub topic sink. There are three available filesets: `audit`, `vpcflow`, `firewall`. This lab covers the `audit` fileset.

1. Use the search bar to find the **Log Router** page in **Logging**, where you'll configure Google Cloud to export logs to a Pub/Sub topic.
2. To set up the logs routing sink, click **Create sink**. Set sink name as `monitor-gcp-audit-sink`.
3. Click **Next**.
4. Under sink service select **Cloud Pub/Sub topic** and under **select a cloud pub/sub topic** click **Create a Topic**, enter `monitor-gcp-audit` as **Topic id**, then click **Create Topic**.
5. Click **Next**.
6. Finally, under **Choose logs to include in sink**, add `logName:"cloudaudit.googleapis.com"` (it includes all audit logs).
7. Click **Create Sink**. It will look something like the following:

![The Create logs routing sink page with the following populated sections: Sink details, Sink destination, Choose logs to include in sink, and Choose logs to filter out of sink (optional)](images\qTvCjKKAoQrnbBeqNEh10%2FQKCAMV52srw%2FJ3%2BB%2B1lqo%3D.png)

Click **Check my progress** to verify the objective.

Create sink



Check my progress



1. Now that Google Cloud is configured to export audit logs, run the following to enable the Filebeat Google Cloud module:

```
./filebeat modules enable gcp
```

Copied!

1. Navigate to the **filebeat** folder then to `modules.d/gcp.yml` file.
2. **Replace the entire contents of the file** with the following configurations. Make sure to update `var.project_id` and `var.credentials_file` with the your correct values:

```
- module: gcp
  vpcflow:
    enabled: false
  firewall:
    enabled: false
  audit:
    enabled: true
    var.project_id: "your-project-id"
    var.topic: "monitor-gcp-audit"
    var.subscription_name: "monitor-gcp-audit-sub"
    var.credentials_file: "your-credentials-file-path"
```

Copied!

1. Start Filebeat to collect the logs:

```
./filebeat -e
```

Copied!

1. Finally, log into Kibana and open the **[Filebeat GCP] Audit** dashboard.

![The [Filebeat GCP] Audit dashboard](images\AknN40I2K%2FvnWuwkmnDd5MBR2ciH1vW27JFxpEvvySk%3D)

After a few minutes, you should see incoming data in the dashboard.

Click **Check my progress** to verify the objective.

Configure Filebeat Google Cloud module



Check my progress