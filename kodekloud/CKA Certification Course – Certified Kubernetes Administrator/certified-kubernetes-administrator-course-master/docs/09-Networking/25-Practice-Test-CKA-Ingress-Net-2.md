# Practice Test CKA Ingress 2

  - Take me to [Practice Test](https://kodekloud.com/topic/practice-test-cka-ingress-networking-2/)

#### Solution 

  1. Check the Solution

     <details>

      ```
      OK
      ```
     </details>

  2. Let us now deploy an Ingress Controller. First, create a namespace called `ingress-space`.

     We will isolate all ingress related objects into its own namespace.

     Check

     - Name: ingress-space

     ![](/home/sherwinowen/Documents/my_tutorials/kubernetes/certified-kubernetes-administrator-course-master/images/kubernetes-ckad-ingress-controller-1_yvsjbl.jpg)

     Check the Solution

     <details>

      ```
      kubectl create namespace ingress-space
      ```
     </details>

  3. The NGINX Ingress Controller requires a ConfigMap object. Create a ConfigMap object in the `ingress-space`.

     Use the spec given below. No data needs to be configured in the ConfigMap.

     Check

     - Name: nginx-configuration

     Check the Solution

     <details>

      ```
      kubectl create configmap nginx-configuration --namespace ingress-space
      ```
     </details>

  4. The NGINX Ingress Controller requires a ServiceAccount. Create a ServiceAccount in the `ingress-space` namespace.

     Use the spec provided below.

     Check

     - Name: ingress-serviceaccount

     Check the Solution

     <details>

      ```
      kubectl create serviceaccount ingress-serviceaccount --namespace ingress-space
      ```
     </details>

  5. We have created the Roles and RoleBindings for the ServiceAccount. Check it out!!

     Check the Solution

     <details>

      ```
      Ok
      ```
     ```
     $ kubectl get role -n ingress-space
     rolebindings.rbac.authorization.k8s.io  roles.rbac.authorization.k8s.io 
     ```

     ```
     $ kubectl get rolebinding -n ingress-space
     NAME                   ROLE                AGE
     ingress-role-binding   Role/ingress-role   3m23s
     ```

     ```
     $ kubectl describe role -n ingress-space ingress-role 
     Name:         ingress-role
     Labels:       app.kubernetes.io/name=ingress-nginx
                   app.kubernetes.io/part-of=ingress-nginx
     Annotations:  <none>
     PolicyRule:
       Resources   Non-Resource URLs  Resource Names                     Verbs
       ---------   -----------------  --------------                     -----
       configmaps  []                 []                                 [get create]
       configmaps  []                 [ingress-controller-leader-nginx]  [get update]
       endpoints   []                 []                                 [get]
       namespaces  []                 []                                 [get]
       pods        []                 []                                 [get]
       secrets     []                 []                                 [get]
     ```

     </details>

  6. Let us now deploy the Ingress Controller. Create a deployment using the file given.

     The Deployment configuration is given at `/root/ingress-controller.yaml`. There are several issues with it. Try to fix them.

     Check

     - Deployed in the correct namespace.
     - Replicas: 1
     - Use the right image
     - Namespace: ingress-space

     Check the Solution

     <details>
     ```
     kubectl create -f ingress-controller.yaml
     ```


      ```
      apiVersion: apps/v1
      kind: Deployment
      metadata:
        name: ingress-controller
        namespace: ingress-space
      spec:
        replicas: 1
        selector:
          matchLabels:
            name: nginx-ingress
        template:
          metadata:
            labels:
              name: nginx-ingress
          spec:
            serviceAccountName: ingress-serviceaccount
            containers:
              - name: nginx-ingress-controller
                image: quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.21.0
                args:
                  - /nginx-ingress-controller
                  - --configmap=$(POD_NAMESPACE)/nginx-configuration
                  - --default-backend-service=app-space/default-http-backend
                env:
                  - name: POD_NAME
                    valueFrom:
                      fieldRef:
                        fieldPath: metadata.name
                  - name: POD_NAMESPACE
                    valueFrom:
                      fieldRef:
                        fieldPath: metadata.namespace
                ports:
                  - name: http
                    containerPort: 80
                  - name: https
                    containerPort: 443
      ```
     </details>

  7. Let us now create a service to make Ingress available to external users.

     Create a service following the given specs.

     Check

     - Name: ingress
     - Type: NodePort
     - Port: 80
     - TargetPort: 80
     - NodePort: 30080
     - Namespace: ingress-space
     - Use the right selector

     Check the Solution

     <details>
     ```
     kubectl get deployments.apps -n ingress-space 
     NAME                 READY   UP-TO-DATE   AVAILABLE   AGE
     ingress-controller   1/1     1            1           5m48s
     ```

     ```
     $ kubectl expose deployment ingress-controller -n ingress-space --name ingress --port=80 --target-port=80 --type NodePort
     ```


      ```
      apiVersion: v1
      kind: Service
      metadata:
        name: ingress
        namespace: ingress-space
      spec:
        type: NodePort
        ports:
        - port: 80
          targetPort: 80
          protocol: TCP
          nodePort: 30080
          name: http
        - port: 443
          targetPort: 443
          protocol: TCP
          name: https
        selector:
          name: nginx-ingress
      ```
     </details>

  8. Create the ingress resource to make the applications available at `/wear` and `/watch` on the Ingress service.

     Create the ingress in the `app-space` namespace.

     Check

     - Ingress Created
     - Path: /wear
     - Path: /watch
     - Configure correct backend service for /wear
     - Configure correct backend service for /watch
     - Configure correct backend port for /wear service
     - Configure correct backend port for /watch service

     Check the Solution

     <details>
     ```
     $ kubectl get service -n app-space 
     NAME                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
     default-http-backend   ClusterIP   10.110.105.253   <none>        80/TCP     43m
     video-service          ClusterIP   10.102.101.225   <none>        8080/TCP   43m
     wear-service           ClusterIP   10.107.126.101   <none>        8080/TCP   43m
     ```

     ```
     $ kubectl create ingress ingress-wear-watch -n app-space --rule="/wear=wear-service:8080" --rule="/watch=video-service:8080"
     ingress.networking.k8s.io/ingress-wear-watch created
     ```


      ```
      apiVersion: networking.k8s.io/v1
      kind: Ingress
      metadata:
        name: ingress-wear-watch
        namespace: app-space
        annotations:
          nginx.ingress.kubernetes.io/rewrite-target: /
          nginx.ingress.kubernetes.io/ssl-redirect: "false"
      spec:
        rules:
        - http:
            paths:
            - path: /wear
              pathType: Prefix
              backend:
                service:
                 name: wear-service
                 port: 
                  number: 8080
            - path: /watch
              pathType: Prefix
              backend:
                service:
                 name: video-service
                 port:
                  number: 8080
     
      ```
     </details>

  9. Check the Solution

     <details>

      ```
      OK
      ```
     </details>
