# Solution Control Plane Failure

  - Lets have a look at the [Practice Test](https://kodekloud.com/topic/practice-test-control-plane-failure/) of the Control Plane Failure

    ### Solution

    1. The cluster is broken. We tried deploying an application but it's not working. Troubleshoot and fix the issue.

       Start looking at the deployments.

       Check Solution 
    
       <details>

        ```
        kubectl get pods -n kube-system
        ```
    
        ```
        sed -i 's/kube-schedulerrrr/kube-scheduler/g' /etc/kubernetes/manifests/kube-scheduler.yaml
        ```
       </details>

    2. Scale the deployment `app` to 2 pods.
    
       Check Solution
    
       <details>
    
        ```
        kubectl scale deploy app --replicas=2
        ```
       </details>
    
    3. Even though the deployment was scaled to 2, the number of `PODs` does not seem to increase. Investigate and fix the issue.
    
       Inspect the component responsible for managing `deployments` and `replicasets`.
    
       Check Solution
    
       <details>
    
        ```
        sed -i 's/controller-manager-XXXX.conf/controller-manager.conf/' /etc/kubernetes/manifests/kube-controller-manager.yaml
        ```
       </details>
    
    4. Check Solution
    
       <details>
    
        ```
        sed -i 's/WRONG-PKI-DIRECTORY/pki/' /etc/kubernetes/manifests/kube-controller-manager.yaml
        ```
       </details>




​       