# Deploying Python-Redis app on GCP using GKE

This Project aimed to Deploy A containerized python-Redis web application on A GKE private cluster

## Steps applied

### Infrastructure Provisioning using terraform

1. Configured A custom `VPC` with two `private subnets` subnet1 and subnet2
2. Configured A private `Bastion VM` on the subnet1 and A `Nat Gateway` to make sure that the bastion VM can download stuff from the internet
3. Configured A private `GKE cluster` on subnet2
4. Configured A `GCR` to push our application image on it
5. Configured two service accounts for both `Bastion VM` and the `private cluster`
6. Assigned the needed roles for both of them (container.admin and storage.admin)
7. Provisioned the infrastructure using the following command

- `cd terraform`
- `terraform apply --var-file var-files/prod.tfvars`

### Dockerize The Web Application

1. Cloned the demo app repo from git git

- `git clone https://github.com/atefhares/DevOps-Challenge-Demo-Code.git`

2. Made the docker file after reading the documentation carefully
3. Built,auth, and push the application image

- `docker build . -t gcr.io/red-forklift-366019/iti-gcp-project`
- `gcloud auth configure-docker`
- `docker push gcr.io/red-forklift-366019/iti-gcp-project`

### Deploy The Web Application

1. Connected to the `bastion VM` via `ssh`

- ![Connected to the bastion vm via ssh](images/connect-to-bastion.png)

2. Connected to the `GKE Cluster` via `Bastion`

- ![Connected to the GKE Cluster via Bastion](images/connect-to-cluster-via-bastion.png)

3. cloned my code from `GitHub` to the `Bastion VM`

- ![Clone my code from GitHub to the Bastion](images/code-clone.png)

4. Deployed the `jenkins Deployment`

```
cd provision-GKE-private-cluster-and-jenkins-deployment-using-terraform
kubectl apply -f Kubernetes/jenkins --recursive -n jenkins
kubectl get all -n jenkins
```

- ![Deployed the `web application`](images/jenkins-deployment.png)
