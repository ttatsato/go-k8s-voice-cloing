terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.5.1"
    }
  }
}

provider "kind" {}

resource "kind_cluster" "default" {
  name           = "voice-cloning-cluster"
  node_image     = "kindest/node:v1.29.1" # K8sのバージョン指定
  wait_for_ready = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }
    # ワーカーノードを追加（ボイスクローン用）
    node {
      role = "worker"
    }
  }
}
