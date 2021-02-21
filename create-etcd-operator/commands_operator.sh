
cd create-etc-operator
kubectl create -f etcd-operator-crd.yaml
kubectl get crd
kubectl create -f etcd-operator-sa.yaml
kubectl get serviceaccounts
kubectl create -f etcd-operator-role.yaml
kubectl get serviceaccounts
kubectl get roles
kubectl create -f etcd-operator-rolebinding.yaml
kubectl get roles
kubectl get rolebinding
kubectl create -f etcd-operator-deployment.yaml
kubectl get deployments
kubctl get pods
kubectl get pods
kubectl create -f etcd-cluster-cr.yaml
#Will disable the terminal, as it keeps polling status changes in k8s pods
#Press Ctrl+C when all pods in running status
kubectl get pods -w
kubectl describe etcdcluster/example-etcd-cluster
kubectl get services --selector etcd_cluster=example-etcd-cluster
#Didn't work for me, so I installed etcdctl locally
kubectl run --rm -i --tty etcdctl --image quay.io/coreos/etcd \ --restart=Never -- /bin/sh
#For installing etcdctl execute the following
#---START-------Intalling etcdctl local----------------------------------------
#Requirements: go tools on your machine (Which k8s enthusiast doesn't?)
go get -v go.etcd.io/etcd/etcdctl
#To see if it works
etcdctl version
#If it doesn't because some issue $GOPATH try building the poject locally
#Go to your workspace and execute the following
git clone https://github.com/etcd-io/etcd.git
cd etcd
./build.sh
#Now it should work
./bin/etcdctl version
#Do your magic in macOs for creating an alias 
#As it's etcdctl is outside minikube, you need to expose the etcd cluster client service to the host
#It will disable the terminal unless executed in background
minikube service --url example-etcd-cluster-client
#In mine example-etcd-cluster-client started in http://127.0.0.1:55015
#---STOP-------Intalling etcdctl local----------------------------------------
export ETCDCTL_API=3
export ETCDCSVC=http://127.0.0.1:55015
etcdctl --endpoints $ETCDCSVC put foo bar
etcdctl --endpoints $ETCDCSVC get foo
#After adding one more replica to etcd cluester
kubectl apply -f etcd-cluster-cr.yaml
kubectl get pods -l app=etcd
#Pick one pod, the one you like the least
kubectl delete pods example-etcd-cluster-c8bczd59lf
kubectl get pods -w
kubectl describe etcdcluster/example-etcd-cluster
etcdctl endpoint health --endpoints $ETCDCSVC
#Nothing happened to the persited foo key/value
etcdctl --endpoints $ETCDCSVC get foo
#Pick a pod
kubectl get pod example-etcd-cluster-6zg6vw8rkj -o yaml | grep "image:" | uniq
kubectl describe etcdcluster/example-etcd-cluster
kubectl apply -f etcd-cluster-cr.yaml 
#See the pods upgrade version in the Events section
kubectl describe etcdcluster/example-etcd-cluster
etcdctl endpoint health --endpoints $ETCDCSVC
#Nothing happened to the persited foo key/value
etcdctl --endpoints $ETCDCSVC get foo
kubectl patch etcdcluster example-etcd-cluster --type='json' -p '[{"op": "replace", "path": "/spec/version", "value":3.3.12}]'
#See the pods upgrade version in the Events section
kubectl describe etcdcluster/example-etcd-cluster
etcdctl endpoint health --endpoints $ETCDCSVC
#Nothing happened to the persited foo key/value
etcdctl --endpoints $ETCDCSVC get foo
#Clean-up
kubectl delete -f etcd-operator-sa.yaml
kubectl delete -f etcd-operator-role.yaml
kubectl delete -f etcd-operator-rolebinding.yaml
kubectl delete -f etcd-operator-crd.yaml
kubectl delete -f etcd-operator-deployment.yaml
kubectl delete -f etcd-operator-crd.yaml
#The etcd cluster is gone. You can go to k8s console and see all (service, deployment, etc) is gone
kubectl get pods