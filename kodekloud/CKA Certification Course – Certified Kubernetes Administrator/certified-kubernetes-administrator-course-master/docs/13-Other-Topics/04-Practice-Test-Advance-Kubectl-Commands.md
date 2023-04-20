# Practice Test for Advance Kubectl Commands

  - Take me to [Advance Practice Test for Kubectl Commands](https://kodekloud.com/topic/practice-test-advanced-kubectl-commands/)

  ### Solution

   1. Get the list of nodes in JSON format and store it in a file at `/opt/outputs/nodes.json`.Check Solution 

       <details>

        ```
        kubectl get nodes -o json > /opt/outputs/nodes.json
        ```
       </details>

   2. Get the details of the node `node01` in json format and store it in the file `/opt/outputs/node01.json`.Check Solution 

       <details>

        ```
        kubectl get node node01 -o json > /opt/outputs/node01.json
        ```
       </details>

   3. Use JSON PATH query to fetch node names and store them in `/opt/outputs/node_names.txt`.

       Remember the file should only have node names.

       Check Solution

       <details>

        ```
        kubectl get nodes -o=jsonpath='{.items[*].metadata.name}' > /opt/outputs/node_names.txt
        ```
       </details>

   4. Use JSON PATH query to retrieve the `osImages` of all the nodes and store it in a file `/opt/outputs/nodes_os.txt`.

       The `osImages` are under the `nodeInfo` section under `status` of each node.

       Check Solution

       <details>

        ```
        kubectl get nodes -o jsonpath='{.items[*].status.nodeInfo.osImage}' > /opt/outputs/nodes_os.txt
        ```
       </details>

   5. A kube-config file is present at `/root/my-kube-config`. Get the user names from it and store it in a file `/opt/outputs/users.txt`.

       Use the command `kubectl config view --kubeconfig=/root/my-kube-config` to view the custom kube-config.

       Check Solution

       <details>

        ```
        kubectl config view --kubeconfig=my-kube-config -o jsonpath="{.users[*].name}" > /opt/outputs/users.txt
        ```
       </details>

   6. A set of Persistent Volumes are available. Sort them based on their capacity and store the result in the file `/opt/outputs/storage-capacity-sorted.txt`.

       Check Solution

       <details>

        ```
        kubectl get pv --sort-by=.spec.capacity.storage > /opt/outputs/storage-capacity-sorted.txt
        ```
       </details>

   7. That was good, but we don't need all the extra details. Retrieve just the first 2 columns of output and store it in `/opt/outputs/pv-and-capacity-sorted.txt`.

       The columns should be named `NAME` and `CAPACITY`. Use the `custom-columns` option and remember, it should still be sorted as in the previous question.

       Check Solution

       <details>

        ```
        kubectl get pv --sort-by=.spec.capacity.storage -o=custom-columns=NAME:.metadata.name,CAPACITY:.spec.capacity.storage > /opt/outputs/pv-and-capacity-sorted.txt
        ```
       </details>

   8. Use a JSON PATH query to identify the context configured for the `aws-user` in the `my-kube-config` context file and store the result in `/opt/outputs/aws-context-name`.

       Check Solution

       <details>

        ```
        kubectl config view --kubeconfig=my-kube-config -o jsonpath="{.contexts[?(@.context.user=='aws-user')].name}" > /opt/outputs/aws-context-name
        ```
       </details>

       