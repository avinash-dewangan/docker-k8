# Step

## in Window
* install docker desktop
* inside doecker go to setting and the click kubernates and enable kubernates


## Create Dockerfile
* Here is this project Dockerfile example for Java spring boot jar project

Dockerfile
```
FROM openjdk:18-alpine AS builder
WORKDIR /project-name

COPY target/project-name-0.0.1-SNAPSHOT.jar /project-name/project-name-0.0.1-SNAPSHOT.jar

CMD ["java", "-jar", "project-name-0.0.1-SNAPSHOT.jar"]
```

## create image command
```
docker build -t user .
```
### docker process command
```
docker ps
```
### docker list of images
```
docker images
```
## push the image in local directory
```
docker run -d -p 5000:5000 --restart=always --name registry registry:2 
docker tag user:latest localhost:5000/user:latest
docker push localhost:5000/user:latest
```


## run below command
```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```


## Installing the Kubernetes Dashboard
* Deploying the Kubernetes Dashboard is not a tough job, you’d have to follow the step-by-step procedure given below. We need to apply the recommended deployment descriptor file:
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
```
* Next step is to check all the resources by the below command 
```
kubectl get all -n kubernetes-dashboard
```
```
kubectl get pods -A
```
## Creating Admin user
The Kubernetes dashboard supports a few ways to manage access control. In this example, we’ll be creating an admin user account with full privileges to modify the cluster and using tokens.

Start by making a new directory for the dashboard configuration files.
```
mkdir ~/dashboard && cd ~/dashboard
nano dashboard-admin.yaml
```
```
apiVersion: v1
kind: ServiceAccount
metadata:
    name: admin-user
    namespace: kubernetes-dashboard
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
    name: admin-user
roleRef:
    apiGroup: rbac.authorization.k8s.io
    kind: ClusterRole
    name: cluster-admin
subjects:
   - kind: ServiceAccount
    name: admin-user
    namespace: kubernetes-dashboard
```

Then deploy the admin user role with the next command.

```
kubectl apply -f dashboard-admin.yaml
```

## kubernatic dashboard open
```
kubectl proxy
```
## open this link
```
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.
```
## for token genrate command
```
kubectl -n kubernetes-dashboard create token admin-user
```
## get pods
```
kubectl get pods        
```

## List of service deployed
```
kubectl get service
```
## List of service deployment count
```
kubectl get deployments
```
## service scale
```
kubectl scale deployment node-app --replicas=0
```
# Delete
## all pds
```
kubectl delete services --all

kubectl delete pods --all 

kubectl delete deployment --all
```
## pod logs
* --follow: Continuously stream the logs as they are generated. 
* --tail: Specify the number of lines of log output to display. 
* --since: Only show log output generated within a certain duration. 
* --timestamps: Add timestamps to the log output.
```
kubectl logs <pod-name>
```
* Example
```
kubectl logs --follow user-784b6cb6-8xnsg
```

### 6. Deploy the Updated Image to Kubernetes
> mvn clean install

> docker build -t your-dockerhub-username/spring-boot-app:latest .

> docker run -d -p 8080:8080 --name spring-boot-app your-dockerhub-username/spring-boot-app:latest

> docker push your-dockerhub-username/spring-boot-app:latest

> kubectl rollout restart deployment your-deployment-name
