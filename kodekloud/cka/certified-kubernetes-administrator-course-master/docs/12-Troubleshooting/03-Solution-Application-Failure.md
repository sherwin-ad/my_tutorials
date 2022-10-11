# Practice Test - Application Failure

  - Take me to [Practice Test](https://kodekloud.com/topic/practice-test-application-failure/) of the Application Failure

    ### Solution

    1. **Troubleshooting Test 1:** A simple 2 tier application is deployed in the `alpha` namespace. It must display a green web page on success. Click on the `App` tab at the top of your terminal to view your application. It is currently failed. Troubleshoot and fix the issue.

       Stick to the given architecture. Use the same names and port numbers as given in the below architecture diagram. Feel free to edit, delete or recreate objects as necessary.

       Check Solution 
    
       ![img](/Users/sherwinowen/my_doc/my_tutorials/kubernetes/certified-kubernetes-administrator-course-master/images/kubernetes-cka-troubleshooting-app-1.png)
    
       <details>
    
        ```
         kubectl delete svc mysql -n alpha
        ```
    
        ```
         apiVersion: v1
         kind: Service
         metadata:
           name: mysql-service
           namespace: alpha
         spec:
           ports:
           - port: 3306
             protocol: TCP
             targetPort: 3306
           selector:
             name: mysql
           sessionAffinity: None
           type: ClusterIP
         status:
           loadBalancer: {}
      ```
       </details>
    
    2. **Troubleshooting Test 2:** The same 2 tier application is deployed in the `beta` namespace. It must display a green web page on success. Click on the `App` tab at the top of your terminal to view your application. It is currently failed. Troubleshoot and fix the issue.
    
       Stick to the given architecture. Use the same names and port numbers as given in the below architecture diagram. Feel free to edit, delete or recreate objects as necessary.
    
       Check
    
       Check Solution
    
       <details>
  
       You can edit the `mysql-service` service and change the targetPort "8080" to "3306".
        ```
        kubectl edit svc mysql-service -n beta
        ```
    
       OR
    
       Delete the `mysql-service` service and then apply below manifest:
        ```
        kubectl delete svc mysql-service -n beta
        ```
    
        ```
        apiVersion: v1
        kind: Service
        metadata:
          name: mysql-service
          namespace: beta
        spec:
          ports:
          - port: 3306
            protocol: TCP
            targetPort: 3306
          selector:
            name: mysql
          sessionAffinity: None
          type: ClusterIP
        status:
          loadBalancer: {}
        ```
       </details>
    
    3. **Troubleshooting Test 3:** The same 2 tier application is deployed in the `gamma` namespace. It must display a green web page on success. Click on the `App` tab at the top of your terminal to view your application. It is currently failed or unresponsive. Troubleshoot and fix the issue.
    
       Stick to the given architecture. Use the same names and port numbers as given in the below architecture diagram. Feel free to edit, delete or recreate objects as necessary.
    
       Check Solution

       <details>

       ```
       kubectl edit svc mysql-service -n gamma
       Press Esc, then colon(:)
       :%s/sql00001/mysql/
       ```
       </details>

    4. **Troubleshooting Test 4:** The same 2 tier application is deployed in the `delta` namespace. It must display a green web page on success. Click on the `App` tab at the top of your terminal to view your application. It is currently failed. Troubleshoot and fix the issue.

       Stick to the given architecture. Use the same names and port numbers as given in the below architecture diagram. Feel free to edit, delete or recreate objects as necessary.

       Check Solution
    
       <details>
    
        ```
        kubectl edit deployment.apps/webapp-mysql -n delta
       
        Change the DB_User's value to root.
       
        :%s/sql-user/root
       
        - name: DB_User
          value: root
        ```
       </details>
    
    5. **Troubleshooting Test 5:** The same 2 tier application is deployed in the `epsilon` namespace. It must display a green web page on success. Click on the `App` tab at the top of your terminal to view your application. It is currently failed. Troubleshoot and fix the issue.
    
       Stick to the given architecture. Use the same names and port numbers as given in the below architecture diagram. Feel free to edit, delete or recreate objects as necessary.
    
       Check Solution
    
       <details>

        ```
        kubectl edit pod mysql -n epsilon
       
        Replace the DB_Password with the correct password as shown below, then delete the pod and re-create it again.
        
        :%s/passwooooorrddd/paswrd
        
        save the file with ":wq" in vi editor and it will create a temporary file with random name under the default path /tmp/kubectl-edit-xxxxx.yaml. After deleting the existing one, re-create it again with kubectl apply -f or kubectl create -f command.
        
        In the "webapp-mysql" deployments, change the DB_User's value to root.
        
        kubectl edit deployment.apps/webapp-mysql -n epsilon
       
        :%s/sql-user/root
       
        - name: DB_User
          value: root
          
        save the file and exit with ":wq" in vi editor. 
        ```
       </details>
    
    6. **Troubleshooting Test 6:** The same 2 tier application is deployed in the `zeta` namespace. It must display a green web page on success. Click on the `App` tab at the top of your terminal to view your application. It is currently failed. Troubleshoot and fix the issue.
    
       Stick to the given architecture. Use the same names and port numbers as given in the below architecture diagram. Feel free to edit, delete or recreate objects as necessary.

       Check Solution

       <details>
    
        ```
        kubectl edit deployment.apps/webapp-mysql -n zeta
       
        Change the DB_User's value to root.
       
        :%s/sql-user/root
       
        - name: DB_User
          value: root
        ```
    
        ```
        Replace the DB_Password with the correct password as shown below, delete the pod and re-create it.
       
        kubectl edit pod mysql -n zeta
       
        :%s/passwooooorrddd/paswrd
        
        save the file with ":wq" in vi editor and it will create a temporary file with random name under the default path /tmp/kubectl-edit-xxxxx.yaml. After deleting the existing one, re-create it again with kubectl apply -f or kubectl create -f command. 
        ```
    
        ```
        kubectl edit svc web-service -n zeta
       
        Change the nodePort from "30088" to "30081".
       
        :%s/30088/30081
        ```
       </details>
