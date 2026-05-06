CLUSTER_NAME := voice-cloning-cluster
KUBECONFIG_FILE := $(PWD)/$(CLUSTER_NAME)-config
export KUBECONFIG_FILE := $(KUBECONFIG_FILE)

.PHONY: help connect nodes cluster-up cluster-down

nodes: ## check out cluster status
	kubectl get nodes

cluster-up:
	terraform init && terraform apply -auto-approve

cluster-down:
	terraform destroy -auto-approve
