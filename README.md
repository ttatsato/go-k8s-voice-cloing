# go-k8s-voice-cloing

# Get started

## Run k8s cluster

```
make cluster-up
```

## deploy application on k8s

```
make deploy
```

If status is Ready, it was success.

```
--- 🚀 Deployment deployed! ---
Run 'make status' to check.
```

## redeploy application

if you change to files, you execute the following command.

```
make restart
```

## checkout running application on browser

```
kubectl port-forward svc/voice-api-service 8080:80
```

access the follow link
http://localhost:8080

## Cleanup

```
make cluster-down
```
