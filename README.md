# istio-helloWorld
This repo is related to my Third tutorial in the Istio step-by-step tutorial series

Here are the kubernetes artifacts for the users who are not using Ballerina Language for Istio service deployments. This reposoitory contains the Service, Deployment, VirtualService and the Gateway related to the helloWorld microservices.

### How to run the ballerina service
Step 01: `git clone` the repo

Step 02: Open the project in your IDE (intelliJ)

Step 03: Move to the project folder [`cd helloWorld`]

Step 04: Edit the `dockerCertPath` {in line no 15}

Step 05: Point the minikube VM to Docker env 
`eval $(sudo minikube docker-env)`

Step 06: Build the service 
`ballerina build helloWorld.bal`

{ This step is optinal if you have already enabled
Step 07: Enable istio sidecar injection 
`kubectl label namespace default istio-injection=enabled --overwrite`}

Step 08: Apply kubernetes artifacts 
