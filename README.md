# go-k8s-voice-cloning

## Stack

- Go
- Docker
- Kubernetes
- kind
- Terraform

## Prerequisites

Make sure the following tools are installed:

- `docker`
- `kubectl`
- `kind`
- `terraform`
- `make`

## Get Started

### 1) Create a local Kubernetes cluster

```bash
make cluster-up
```

### 2) Deploy the application to Kubernetes

```bash
make deploy
```

After deployment, check that nodes and pods are healthy:

```bash
make nodes
kubectl get pods
```

### 3) Redeploy after code changes

If you update application code, run:

```bash
make restart
```

### 4) Access the application from your browser

```bash
kubectl port-forward svc/voice-api-service 8080:80
```

Open:

[http://localhost:8080](http://localhost:8080)

### 5) Cleanup

```bash
make cluster-down
```
