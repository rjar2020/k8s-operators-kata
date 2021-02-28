cd k8s-operators-kata
mkdir helm-operator-existing-chart
brew install wget
cd helm-operator-existing-chart
wget https://github.com/kubernetes-operators-book/chapters/releases/download/1.0.0/visitors-helm.tgz
ls
operator-sdk init --project-version=3 --plugins=helm.sdk.operatorframework.io/v1
operator-sdk create api --help
operator-sdk create api --helm-chart=visitors-helm.tgz
make install
