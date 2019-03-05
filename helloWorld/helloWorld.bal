import ballerina/http;
import ballerina/log;
import ballerinax/kubernetes;

@kubernetes:IstioGateway {} // in the new ballerina version gateway and the virtual service can be configure in the svc
@kubernetes:IstioVirtualService {}
@kubernetes:Service {
    name: "helloworld"
}
listener http:Listener hello = new(9095);
@kubernetes:Deployment {
    image: "helloworld", // remember the docker image should contain only simple letters
    name: "helloworld",
    dockerHost: "tcp://192.168.99.100:2376", // IP can be obtained via `minikube ip` command
    dockerCertPath: "/home/romina/.minikube/certs", // Docker cert path should be configure here
    singleYAML: true
}

@http:ServiceConfig { basePath:"/helloworld" }
service helloWorld on hello {
    @http:ResourceConfig {
        path: "/",
        methods: ["GET"]
    } resource function sayHello(http:Caller caller, http:Request req){
        var result = caller->respond("Hello World!!\n");
        if (result is error) {
            log:printError("Error responding back to client");
        }
    }
}
