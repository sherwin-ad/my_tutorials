# Practice Test CKA Ingress 1

  - Take me to [Practice Test](https://kodekloud.com/topic/practice-test-cka-ingress-networking-1/)

#### Solution 

  1. Check the Solution

     <details>

      ```
      Ok
      ```
     </details>

  2. Which namespace is the `Ingress Controller` deployed in?

     - default
     - kube-system
     - nginx-ingress
     - ingress-nginx

     Check the Solution

     <details>
     ```
     kubectl get pods -A
     NAMESPACE       NAME                                        READY   STATUS      RESTARTS   AGE
     app-space       default-backend-7f87f4c484-cg9vp            1/1     Running     0          5m9s
     app-space       webapp-video-d54b764b6-7k4md                1/1     Running     0          5m9s
     app-space       webapp-wear-5bb44cf565-445qg                1/1     Running     0          5m9s
     ingress-nginx   ingress-nginx-admission-create-b8cfb        0/1     Completed   0          5m5s
     ingress-nginx   ingress-nginx-admission-patch-wqggn         0/1     Completed   0          5m5s
     ingress-nginx   ingress-nginx-controller-6b79d8694c-j6prz   1/1     Running     0          5m5s
     kube-system     coredns-64897985d-b7b2v                     1/1     Running     0          11m
     kube-system     coredns-64897985d-gdtg8                     1/1     Running     0          11m
     kube-system     etcd-controlplane                           1/1     Running     0          12m
     kube-system     kube-apiserver-controlplane                 1/1     Running     0          12m
     kube-system     kube-controller-manager-controlplane        1/1     Running     0          12m
     kube-system     kube-flannel-ds-xm8hp                       1/1     Running     0          11m
     kube-system     kube-proxy-fh56j                            1/1     Running     0          11m
     kube-system     kube-scheduler-controlplane                 1/1     Running     0          12m
     ```


      ```
      INGRESS-SPACE
      ```
     </details>

  3. What is the name of the Ingress Controller Deployment?

     - ingress-controller
     - nginx-ingress-controller
     - nginx-ingress
     - ingress-nginx
     - ingress-nginx-controller

     Check the Solution

     <details>
     ```
     kubectl get deployments.apps -n ingress-nginx 
     NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
     ingress-nginx-controller   1/1     1            1           8m8s
     ```


      ```
      NGINX-INGRESS-CONTROLLER
      ```
     </details>

  4. Which namespace are the applications deployed in?

     - default
     - kube-system
     - app-space
     - application

     Check the Solution

     <details>
     ```
     kubectl get pods -A
     NAMESPACE       NAME                                        READY   STATUS      RESTARTS   AGE
     app-space       default-backend-7f87f4c484-cg9vp            1/1     Running     0          5m9s
     app-space       webapp-video-d54b764b6-7k4md                1/1     Running     0          5m9s
     app-space       webapp-wear-5bb44cf565-445qg                1/1     Running     0          5m9s
     ingress-nginx   ingress-nginx-admission-create-b8cfb        0/1     Completed   0          5m5s
     ingress-nginx   ingress-nginx-admission-patch-wqggn         0/1     Completed   0          5m5s
     ingress-nginx   ingress-nginx-controller-6b79d8694c-j6prz   1/1     Running     0          5m5s
     kube-system     coredns-64897985d-b7b2v                     1/1     Running     0          11m
     kube-system     coredns-64897985d-gdtg8                     1/1     Running     0          11m
     kube-system     etcd-controlplane                           1/1     Running     0          12m
     kube-system     kube-apiserver-controlplane                 1/1     Running     0          12m
     kube-system     kube-controller-manager-controlplane        1/1     Running     0          12m
     kube-system     kube-flannel-ds-xm8hp                       1/1     Running     0          11m
     kube-system     kube-proxy-fh56j                            1/1     Running     0          11m
     kube-system     kube-scheduler-controlplane                 1/1     Running     0          12m
     ```


      ```
      APP-SPACE
      ```
     </details>

  5. How many applications are deployed in the `app-space` namespace?

     Count the number of deployments in this namespace.

     - 1
     - 2
     - 3
     - 4

     Check the Solution

     <details>
     ```
     kubectl get pods -A
     NAMESPACE       NAME                                        READY   STATUS      RESTARTS   AGE
     app-space       default-backend-7f87f4c484-cg9vp            1/1     Running     0          5m9s
     app-space       webapp-video-d54b764b6-7k4md                1/1     Running     0          5m9s
     app-space       webapp-wear-5bb44cf565-445qg                1/1     Running     0          5m9s
     ingress-nginx   ingress-nginx-admission-create-b8cfb        0/1     Completed   0          5m5s
     ingress-nginx   ingress-nginx-admission-patch-wqggn         0/1     Completed   0          5m5s
     ingress-nginx   ingress-nginx-controller-6b79d8694c-j6prz   1/1     Running     0          5m5s
     kube-system     coredns-64897985d-b7b2v                     1/1     Running     0          11m
     kube-system     coredns-64897985d-gdtg8                     1/1     Running     0          11m
     kube-system     etcd-controlplane                           1/1     Running     0          12m
     kube-system     kube-apiserver-controlplane                 1/1     Running     0          12m
     kube-system     kube-controller-manager-controlplane        1/1     Running     0          12m
     kube-system     kube-flannel-ds-xm8hp                       1/1     Running     0          11m
     kube-system     kube-proxy-fh56j                            1/1     Running     0          11m
     kube-system     kube-scheduler-controlplane                 1/1     Running     0          12m
     ```


      ```
       3
      ```
     </details>

  6. Which namespace is the Ingress Resource deployed in?

     - default
     - kube-system
     - app-space
     - application

     Check the Solution

     <details>
     ```
     kubectl get ingress -A
     NAMESPACE   NAME                 CLASS    HOSTS   ADDRESS         PORTS   AGE
     app-space   ingress-wear-watch   <none>   *       10.105.248.92   80      13m
     ```


      ```
      APP-SPACE
      ```
     </details>

  7. What is the name of the Ingress Resource?

     - default
     - app-space
     - ingress-wear
     - ingress-wear-watch

     Check the Solution

     <details>
     ```
     kubectl get ingress -A
     NAMESPACE   NAME                 CLASS    HOSTS   ADDRESS         PORTS   AGE
     app-space   ingress-wear-watch   <none>   *       10.105.248.92   80      13m
     ```


      ```
      INGRESS-WEAR-WATCH
      ```
     </details>

  8. What is the `Host` configured on the `Ingress Resource`?

     The host entry defines the domain name that users use to reach the application like `www.google.com`

     - default
     - All Hosts (*)
     - wear.app.com
     - my-online-store.com

     Check the Solution

     <details>
     ```
     kubectl get ingress -A
     NAMESPACE   NAME                 CLASS    HOSTS   ADDRESS         PORTS   AGE
     app-space   ingress-wear-watch   <none>   *       10.105.248.92   80      13m
     ```


      ```
      ALL-HOSTS(*)
      ```
     </details>

  9. What backend is the `/wear` path on the Ingress configured with?

     - default-backend
     - apparel-service
     - video-service
     - wear-service

     Check the Solution

     <details>
     ```
     kubectl describe ingress -n app-space ingress-wear-watch 
     Name:             ingress-wear-watch
     Labels:           <none>
     Namespace:        app-space
     Address:          10.105.248.92
     Default backend:  default-http-backend:80 (<error: endpoints "default-http-backend" not found>)
     Rules:
       Host        Path  Backends
       ----        ----  --------
       *           
                   /wear    wear-service:8080 (10.244.0.4:8080)
                   /watch   video-service:8080 (10.244.0.5:8080)
     Annotations:  nginx.ingress.kubernetes.io/rewrite-target: /
                   nginx.ingress.kubernetes.io/ssl-redirect: false
     Events:
       Type    Reason  Age                From                      Message
       ----    ------  ----               ----                      -------
       Normal  Sync    34m (x2 over 34m)  nginx-ingress-controller  Scheduled for sync
     ```


      ```
      WEAR-SERVICE
      ```
     </details>

  10. At what path is the video streaming application made available on the `Ingress`?

      - /video
      - /stream
      - /
      - /watch

      Check the Solution

      ```
      kubectl describe ingress -n app-space ingress-wear-watch 
      Name:             ingress-wear-watch
      Labels:           <none>
      Namespace:        app-space
      Address:          10.105.248.92
      Default backend:  default-http-backend:80 (<error: endpoints "default-http-backend" not found>)
      Rules:
        Host        Path  Backends
        ----        ----  --------
        *           
                    /wear    wear-service:8080 (10.244.0.4:8080)
                    /watch   video-service:8080 (10.244.0.5:8080)
      Annotations:  nginx.ingress.kubernetes.io/rewrite-target: /
                    nginx.ingress.kubernetes.io/ssl-redirect: false
      Events:
        Type    Reason  Age                From                      Message
        ----    ------  ----               ----                      -------
        Normal  Sync    34m (x2 over 34m)  nginx-ingress-controller  Sch
      ```

      ```
       /WATCH
      ```

      

  11. If the requirement does not match any of the configured paths what service are the requests forwarded to?

      - No Service
      - default-backend-service
      - default-backend
      - The last service configured

      Check the Solution

      <details>
      ```
      kubectl describe ingress -n app-space ingress-wear-watch 
      Name:             ingress-wear-watch
      Labels:           <none>
      Namespace:        app-space
      Address:          10.105.248.92
      Default backend:  default-http-backend:80 (<error: endpoints "default-http-backend" not found>)
      Rules:
        Host        Path  Backends
        ----        ----  --------
        *           
                    /wear    wear-service:8080 (10.244.0.4:8080)
                    /watch   video-service:8080 (10.244.0.5:8080)
      Annotations:  nginx.ingress.kubernetes.io/rewrite-target: /
                    nginx.ingress.kubernetes.io/ssl-redirect: false
      Events:
        Type    Reason  Age                From                      Message
        ----    ------  ----               ----                      -------
        Normal  Sync    34m (x2 over 34m)  nginx-ingress-controller  Scheduled for sync
      ```


       ```
        DEFAULT-HTTP-BACKEND
       ```

  12. Now view the Ingress Service using the tab at the top of the terminal. Which page do you see?

      Click on the tab named `Ingress`.

      - Blank
      - 404 Error page
      - Apparel Service
      - Video Service

      Check the Solution

      <details>

       ```
        404-ERROR-PAGE
       ```
      </details>

  13. Check the Solution

      <details>

       ```
        OK
       ```
      </details>

  14. You are requested to change the URLs at which the applications are made available.

      Make the video application available at `/stream`.

      CheckCompleteIncomplete

      - Ingress: ingress-wear-watch
      - Path: /stream
      - Backend Service: video-service
      - Backend Service Port: 8080

      Check the Solution

      <details>

        ```
        kubectl edit ingress --namespace app-space
       
        Change the path from /watch to /stream
          
        OR
       
        apiVersion: v1
        items:
        - apiVersion: extensions/v1beta1
          kind: Ingress
          metadata:
            annotations:
              nginx.ingress.kubernetes.io/rewrite-target: /
              nginx.ingress.kubernetes.io/ssl-redirect: "false"
            name: ingress-wear-watch
            namespace: app-space
          spec:
            rules:
            - http:
                paths:
                - backend:
                    serviceName: wear-service
                    servicePort: 8080
                  path: /wear
                  pathType: ImplementationSpecific
                - backend:
                    serviceName: video-service
                    servicePort: 8080
                  path: /stream
                  pathType: ImplementationSpecific
          status:
            loadBalancer:
              ingress:
              - {}
        kind: List
        metadata:
          resourceVersion: ""
          selfLink: ""
        ```
      </details>

  15. Check the Solution

      <details>

       ```
        OK
       ```
      </details>

  16. A user is trying to view the `/eat` URL on the Ingress Service. Which page would he see?

      If not open already, click on the `Ingress` tab above your terminal, and append `/eat` to the URL in the browser.

      - Blank
      - 404 Error page
      - Apparel Service
      - Video Service

      Check the Solution

      <details>

       ```
        404 ERROR PAGE
       ```
      </details>

  17. Check the Solution

      <details>

       ```
        OK
       ```
      </details>

  18. You are requested to add a new path to your ingress to make the food delivery application available to your customers.

      Make the new application available at `/eat`.

      Check

      - Ingress: ingress-wear-watch
      - Path: /eat
      - Backend Service: food-service
      - Backend Service Port: 8080

      Check the Solution

      <details>

       ```
        Run the command 'kubectl edit ingress --namespace app-space' and add a  new Path entry for the new service.
      
        OR
      
       apiVersion: v1
       items:
       - apiVersion: extensions/v1beta1
         kind: Ingress
         metadata:
           annotations:
             nginx.ingress.kubernetes.io/rewrite-target: /
             nginx.ingress.kubernetes.io/ssl-redirect: "false"
           name: ingress-wear-watch
           namespace: app-space
         spec:
           rules:
           - http:
               paths:
               - backend:
                   serviceName: wear-service
                   servicePort: 8080
                 path: /wear
                 pathType: ImplementationSpecific
               - backend:
                   serviceName: video-service
                   servicePort: 8080
                 path: /stream
                 pathType: ImplementationSpecific
               - backend:
                   serviceName: food-service
                   servicePort: 8080
                 path: /eat
                 pathType: ImplementationSpecific
         status:
           loadBalancer:
             ingress:
             - {}
       kind: List
       metadata:
         resourceVersion: ""
         selfLink: ""
       ```
      </details>

  19. Check the Solution

      <details>

       ```
        OK
       ```
      </details>

  20. Check the Solution

      <details>
      ```
       kubectl get service -A
      NAMESPACE        NAME                                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
      app-space        default-backend-service              ClusterIP   10.102.221.106   <none>        80/TCP                       21m
      app-space        video-service                        ClusterIP   10.107.162.130   <none>        8080/TCP                     21m
      app-space        wear-service                         ClusterIP   10.99.185.227    <none>        8080/TCP                     21m
      critical-space   pay-service                          ClusterIP   10.99.122.213    <none>        8282/TCP                     3m3s
      default          kubernetes                           ClusterIP   10.96.0.1        <none>        443/TCP                      28m
      ingress-nginx    ingress-nginx-controller             NodePort    10.98.7.218      <none>        80:30080/TCP,443:32103/TCP   21m
      ingress-nginx    ingress-nginx-controller-admission   ClusterIP   10.102.149.31    <none>        443/TCP                      21m
      kube-system      kube-dns                             ClusterIP   10.96.0.10       <none>        53/UDP,53/TCP,9153/TCP       28m
      ```


       ```
        CRITICAL-SPACE
       ```
      </details>

  21. What is the name of the deployment of the new application?

      - payment-gateway
      - easy-pay
      - pay-service
      - webapp-pay

      Check the Solution

      <details>
      ```
      kubectl get deployments.apps -A
      NAMESPACE        NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
      app-space        default-backend            1/1     1            1           23m
      app-space        webapp-video               1/1     1            1           23m
      app-space        webapp-wear                1/1     1            1           23m
      critical-space   webapp-pay                 1/1     1            1           4m54s
      ingress-nginx    ingress-nginx-controller   1/1     1            1           23m
      kube-system      coredns                    2/2     2            2           30m
      ```


       ```
        WEBAPP-PAY
       ```
      </details>

  22. You are requested to make the new application available at `/pay`.

      Identify and implement the best approach to making this application available on the ingress controller and test to make sure its working. Look into annotations: rewrite-target as well.

      Check

      - Ingress Created
      - Path: /pay
      - Configure correct backend service
      - Configure correct backend port

      Check the Solution

      <details>
      ```
      kubectl get service -n critical-space
      NAME          TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
      pay-service   ClusterIP   10.99.122.213   <none>        8282/TCP   20m
      ```

      ```
      kubectl create ingress ingress-pay -n critical-space  --rule="/pay=pay-service:8282"
      ingress.networking.k8s.io/ingress-pay created
      ```


       ```
        
        apiVersion: networking.k8s.io/v1
        kind: Ingress
        metadata:
          name: test-ingress
          namespace: critical-space
          annotations:
            nginx.ingress.kubernetes.io/rewrite-target: /
            nginx.ingress.kubernetes.io/ssl-redirect: "false"
        spec:
          rules:
          - http:
              paths:
              - path: /pay
                pathType: Prefix
                backend:
                  service:
                   name: pay-service
                   port:
                    number: 8282
       ```
        </details>

  23. Check the Solution

      <details>

       ```
        OK
       ```
      </details>
