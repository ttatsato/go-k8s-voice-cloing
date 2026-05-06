CLUSTER_NAME := voice-cloning-cluster
KUBECONFIG_FILE := $(PWD)/$(CLUSTER_NAME)-config
IMAGE_NAME := voice-api:latest
DOCKERFILE_PATH := cmd/api/Dockerfile
export KUBECONFIG := $(KUBECONFIG_FILE)

.PHONY: help connect nodes cluster-up cluster-down


nodes: ## check out cluster status
	kubectl get nodes

connect: ## クラスター接続用のサブシェルを起動
	@echo "--- 🚀 Entering Kubernetes environment ---"
	@echo "Type 'exit' to leave this environment."
	@KUBECONFIG=$(KUBECONFIG_FILE) $(SHELL)

cluster-up:
	terraform init && terraform apply -auto-approve

cluster-down:
	terraform destroy -auto-approve

build:
	docker build -t $(IMAGE_NAME) -f $(DOCKERFILE_PATH) .

load: build
		kind load docker-image $(IMAGE_NAME) --name $(CLUSTER_NAME)

deploy: load
	kubectl apply -f k8s/app.yaml
	@echo "--- 🚀 Deployment deployed! ---"
	@echo "Run 'make status' to check."

restart: load
	kubectl rollout restart deployment voice-api
	@echo "--- 🚀 Deployment restarted! ---"
	@echo "Run 'make status' to check."
