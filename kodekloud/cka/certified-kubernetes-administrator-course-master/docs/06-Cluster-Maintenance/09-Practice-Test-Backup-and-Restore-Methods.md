# Practice Test - Backup and Restore Methods
  - Take me to [Practice Test](https://kodekloud.com/topic/practice-test-backup-and-restore-methods/)

Solutions to practice test - Backup and Restore Methods
- Run the kubectl get deployments command
  
  <details>
  ```
  $ kubectl get deployments
  ```
  </details>
  
- Look at the ETCD Logs using command kubectl logs etcd-master -n kube-system or check the ETCD pod kubectl describe pod etcd-master -n kube-system

  <details>
  ```
  $ kubectl logs etcd-master -n kube-system (or)
  $ kubectl describe pod etcd-master -n kube-system
  ```
  </details>
  
- Use the command kubectl describe pod etcd-master -n kube-system and look for --listen-client-urls
  
  <details>
  ```
  $ kubectl describe pod etcd-master -n kube-system 
  ```
  </details>
  
- Check the ETCD pod configuration kubectl describe pod etcd-master -n kube-system
  
  <details>
  ```
  $ kubectl describe pod etcd-master -n kube-system
  ```
  </details>
  
- Check the ETCD pod configuration kubectl describe pod etcd-master -n kube-system
  
  <details>
  ```
  $ kubectl describe pod etcd-master -n kube-system
  ```
  </details>
  
- Run the below command to backup etcd. View answer file at [etcd-backup-and-restore](https://github.com/mmumshad/kubernetes-the-hard-way/blob/master/practice-questions-answers/cluster-maintenance/backup-etcd/etcd-backup-and-restore.md)
  
  <details>
  ```
  $ ETCDCTL_API=3 etcdctl --endpoints=https://[127.0.0.1]:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt key=/etc/kubernetes/pki/etcd/server.key snapshot save /tmp/snapshot-pre-boot.db.
  ```
  </details>
  
- Wake up! We have a conference call! After the reboot the master nodes came back online, but none of our applications are accessible. Check the status of the applications on the cluster. What's wrong?
  
  <details>
  ```
  All of the above
  ```
  </details>
  
- Luckily we took a backup. Restore the original state of the cluster using the backup file. 
  - View answer file at [etcd-backup-and-restore](https://github.com/mmumshad/kubernetes-the-hard-way/blob/master/practice-questions-answers/cluster-maintenance/backup-etcd/etcd-backup-and-restore.md#3-restore-etcd-snapshot-to-a-new-folder)
  



#### Take me to [Solutions of Practice Tests - Backup and Restore](https://kodekloud.com/topic/solution-backup-and-restore/)

# 1. Get etcdctl utility if it's not already present.

Reference: https://github.com/etcd-io/etcd/releases

```
ETCD_VER=v3.4.9

# choose either URL
GOOGLE_URL=https://storage.googleapis.com/etcd
GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
DOWNLOAD_URL=${GOOGLE_URL}

rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
rm -rf /tmp/etcd-download-test && mkdir -p /tmp/etcd-download-test

curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/etcd-download-test --strip-components=1
rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz

/tmp/etcd-download-test/etcd --version
ETCDCTL_API=3 /tmp/etcd-download-test/etcdctl version

mv /tmp/etcd-download-test/etcdctl /usr/bin
```

# 2. Backup

```
ETCDCTL_API=3 etcdctl --endpoints=https://[127.0.0.1]:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt \
     --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key \
     snapshot save /opt/snapshot-pre-boot.db
```

Note: In this case, the **ETCD** is running on the same server where we are running the commands (which is the *controlplane* node). As a result, the **--endpoint** argument is optional and can be ignored.

The options **--cert, --cacert and --key** are mandatory to authenticate to the ETCD server to take the backup.

If you want to take a backup of the ETCD service running on a different machine, you will have to provide the correct endpoint to that server (which is the IP Address and port of the etcd server with the **--endpoint** argument)

# -----------------------------

# Disaster Happens

# -----------------------------

# 3. Restore ETCD Snapshot to a new folder

```
ETCDCTL_API=3 etcdctl  --data-dir /var/lib/etcd-from-backup \
     snapshot restore /opt/snapshot-pre-boot.db
```

Note: In this case, we are restoring the snapshot to a different directory but in the same server where we took the backup (**the controlplane node)** As a result, the only required option for the restore command is the **--data-dir**.

# 4. Modify /etc/kubernetes/manifests/etcd.yaml

We have now restored the etcd snapshot to a new path on the controlplane - **/var/lib/etcd-from-backup**, so, the only change to be made in the YAML file, is to change the hostPath for the volume called **etcd-data** from old directory (/var/lib/etcd) to the new directory **/var/lib/etcd-from-backup**.

```
  volumes:
  - hostPath:
      path: /var/lib/etcd-from-backup
      type: DirectoryOrCreate
    name: etcd-data
```

With this change, /var/lib/etcd on the **container** points to /var/lib/etcd-from-backup on the **controlplane** (which is what we want)

When this file is updated, the ETCD pod is automatically re-created as this is a static pod placed under the `/etc/kubernetes/manifests` directory.

> Note: as the ETCD pod has changed it will automatically restart, and also kube-controller-manager and kube-scheduler. Wait 1-2 to mins for this pods to restart. You can make a `watch "docker ps | grep etcd"` to see when the ETCD pod is restarted.

> Note2: If the etcd pod is not getting `Ready 1/1`, then restart it by `kubectl delete pod -n kube-system etcd-controlplane` and wait 1 minute.

> Note3: This is the simplest way to make sure that ETCD uses the restored data after the ETCD pod is recreated. You **don't** have to change anything else.

**If** you do change **--data-dir** to **/var/lib/etcd-from-backup** in the YAML file, make sure that the **volumeMounts** for **etcd-data** is updated as well, with the mountPath pointing to /var/lib/etcd-from-backup (**THIS COMPLETE STEP IS OPTIONAL AND NEED NOT BE DONE FOR COMPLETING THE RESTORE**)
