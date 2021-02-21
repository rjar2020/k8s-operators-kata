brew install minikube
minikube start
kubectl get po -A
minikube kubectl -- get po -A
kubectl get po -A
#Spin up k8s console. It will disable the terminal unless executed in background
minikube dashboard
kubectl version
cd repo
git clone git@github.com:kubernetes-operators-book/chapters.git
