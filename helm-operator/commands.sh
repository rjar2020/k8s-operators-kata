cd k8s-operators-kata
brew install helm
helm --help
mkdir helm-operator
cd helm-operator
operator-sdk init --project-version=3 --plugins=helm.sdk.operatorframework.io/v1
operator-sdk create api --group=example.com --version=v1 --kind=VisitorsApp
