# Practice Test - Deploy Networking Solution

  - Take me to [Practice Test](https://kodekloud.com/topic/practice-test-deploy-network-solution/)

#### Solution

  1. Check the Solution

     <details>

      ```
      Not Running
      ```
     </details>

  2. Check the Solution

     <details>

      ```
      No Network Configured
      ```
     </details>

  3. Deploy `weave-net` networking solution to the cluster.

     Replace the default IP address and subnet of `weave-net` to the `10.50.0.0/16`. Please check the official weave installation and configuration guide which is available at the top right panel.

     Check the Solution

     <details>

      ```
      Click [here](https://www.weave.works/docs/net/latest/kubernetes/kube-addon/)
     
      OR Execute below command
     
      kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
      ```
     </details>