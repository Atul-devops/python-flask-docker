pyhton-flask application.
Basic Python Flask app in Docker which prints the hostname and IP of the container

Install docker and google cloud SDK on local through terminal.

steps:
1) Created dockerfile
2) Build the dockerfile by command:
    docker build -t whoami-new .
3) Check created image by command:
    docker images
4) Now we need to deploy our application on kubernetes cluster(here GKE)
5) Before that we will tag and push the image to the google container registry(remember to install Google SDK and CLI).Commands are:
6) first we will configure GCR with docker: gcloud auth configure-docker
7) Then, we will ready to tag and push our image.
8) docker tag whoami-new gcr.io/searce-msp-gcp/whoami-gcp:v1 ---- To tag
9) docker push gcr.io/searce-msp-gcp/whoami-gcp ------------------To push

10) Now we will login to the google cloud console and open Google kubernetes engine section.
11) We will now create cluster as my-cluster-1	with all the required details.
12) In order to use kubectl cmd utility, we have to configure kubectl on terminal.
13) Click on connect, we will get command to get command line access by running the following command:
    gcloud container clusters get-credentials my-cluster-1 --zone us-central1-c --project searce-msp-gcp
14) Now, we will create manifest file to deploy object/workload k8s deployment on GKE cluster.
15) Along with it we will also create service objects and use the image from the GCP Container Registry.
16) demo-app.yml and service1.yml are our two k8s objects which will be deployed on GKE cluster.
17) After this, we will use this command to create objects:
    kubectl create -f demo-app.yml   ----for object deployment
    kubectl create -f demo-app.yml  -----for service object
18) We will see it will take sometime for creation and can be checked by

    kubectl get deployments
    kubectl get pods
    kubectl get svc
    
19) Move back to your GCP console, we will see 3 nodes are creates with 4 pods as replicas are set as 4.
20) now, on terminal use command kubectl get svc
    
file:///home/atulpandhare/Pictures/Screenshot%20from%202021-03-25%2018-38-23.png![image](https://user-images.githubusercontent.com/62421988/112482016-a0145100-8d9d-11eb-8dae-e1213c379233.png)

21) Now check hitting external IP of loadbalancer wit its port defined here it is http://34.121.98.30:8070/

We will see output as : The hostname of the container is my-demo-app-54b76c6ffd-nrzpp and its IP is 10.52.1.4.



    
    
    
    

