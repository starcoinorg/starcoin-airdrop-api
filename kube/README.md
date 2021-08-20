# start pods
kubectl apply -f ./airdrop-api-deployment.yaml

# check pods
$kubectl get pods                       
NAME                                               READY   STATUS    RESTARTS   AGE
airdrop-api-deployment-847564d655-j8xpw            1/1     Running   0          7m16s

# start service
kubectl apply -f ./service-airdrop-api.yaml

# check service 
$kubectl get services 
NAME                   TYPE           CLUSTER-IP       EXTERNAL-IP             PORT(S)        AGE
airdrop-api            LoadBalancer   xxxx             xxx.elb.amazonaws.com   80:30570/TCP   4m48s

#  cname https://api-airdrop.starcoin.org to xxx.elb.amazonaws.com