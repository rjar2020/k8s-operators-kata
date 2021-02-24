kubectl create -f secret.yaml
kubectl create -f database.yaml
kubectl create -f database-service.yaml
kubectl create -f backend.yaml
kubectl create -f backend-service.yaml
kubectl create -f frontend.yaml
kubectl create -f frontend-service.yaml
# Hitting minikube ip didn't work for me
minikube ip
#So I used the tunnel
minikube service visitors-frontend-service
#Cleanup
kubectl delete -f frontend-service.yaml
kubectl delete -f frontend.yaml
kubectl delete -f backend-service.yaml
kubectl delete -f backend.yaml
kubectl delete -f secret.yaml
kubectl delete -f database.yaml
kubectl delete -f database-service.yaml