CLUSTER_NAME := voice-cloning-cluster
KUBECONFIG_FILE := $(PWD)/$(CLUSTER_NAME)-config
IMAGE_NAME := voice-api:latest
DOCKERFILE_PATH := cmd/api/Dockerfile
export KUBECONFIG_FILE := $(KUBECONFIG_FILE)

.PHONY: help connect nodes cluster-up cluster-down

nodes: ## check out cluster status
	kubectl get nodes

cluster-up:
	terraform init && terraform apply -auto-approve

cluster-down:
	terraform destroy -auto-approve

build:
	docker build -t $(IMAGE_NAME) -f $(DOCKERFILE_PATH) .

load: build
		kind load docker-image $(IMAGE_NAME) --name $(CLUSTER_NAME)
