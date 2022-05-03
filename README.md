# terraform for kubernetes

Use terraform to manage state in a kubernetes cluster.

## Contents

- [Overview](#overview)
- [How to use?](#how-to-use)
- [Roadmap](#roadmap)
- [Contribute](#contribute)

## Overview

1. configure the Kubernetes provider by creating a name-space.
2. deploy the application in a pod.
3. expose the pod to the users as a service.

- **NOTE**: To do all these, you need to have your Kubernetes cluster up and running.
  personally, I used minikube.
  minikube's primary goal is to quickly set up local Kubernetes clusters, more information can be found here: [what is minikube?](https://minikube.sigs.k8s.io/docs/start/)

## How to use?

Check your provider version and initialize Terraform.

```bash
terraform init
```

Now it's time to actually using apply.

```bash
terraform apply
```

Deletes and removes Terraform-managed infrastructure

```bash
terraform destroy
```

## Roadmap

- [x] Deploy the Pod
- [x] Create Deployment
- [x] Expose The Pod With A Service
- [ ] helm

## Contribute

Contributions are always welcome!
