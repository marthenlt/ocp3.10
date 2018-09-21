oc new-project bluegreen
oc new-app openshift/deployment-example:v1 --name=example-green
oc new-app openshift/deployment-example:v2 --name=example-blue

