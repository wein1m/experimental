$NAME="kubernetesdemo-api"
$USERNAME="weinsz"
$IMAGE="$($USERNAME)/$($NAME):latest"

write-host -foregroundColor magenta "`n Building The Docker Image🐇 `n"
docker build -t $IMAGE .

write-host -foregroundColor magenta "`n Pushing Image to the Docker Hub... `n"
docker push $IMAGE

write-host -foregroundColor magenta "`n Applying Kubernetes yaml~ `n"
kubectl apply -f k8s/

write-host -foregroundColor magenta "`n Getting Pods~ `n"
kubectl get pods

write-host -foregroundColor magenta "`n Geting Services~ `n"
kubectl get services

write-host -foregroundColor magenta "`n Fetchign the Main Service~ `n"
kubectl get services $NAME-service
