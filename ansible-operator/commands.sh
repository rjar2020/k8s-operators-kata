mkdir ansible-operator
cd ansible-operator
operator-sdk init --project-version=3 --plugins=ansible.sdk.operatorframework.io/v1
operator-sdk create api --group=example.com --version=v1 --kind=VisitorsApp
