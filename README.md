# go-k8s-voice-cloing

# Get started

## Run cluster

```
terraform apply
```

## Check out

```
export KUBECONFIG=$(pwd)/voice-cloning-cluster-config
kubectl get nodes
```

If status is Ready, it was success.

```
NAME       STATUS   ROLES                  AGE   VERSION
orbstack   Ready    control-plane,master   14d   v1.33.9+orb1
```
