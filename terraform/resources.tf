# Add one Kubernetes namespace to the cluster:
resource "kubernetes_namespace" "ns" {
  metadata {
    name = "my-new-namespace"
  }
}

# Create simple pod,
resource "kubernetes_pod" "test" {
  metadata {
    name      = "example-with-terraform"
    namespace = kubernetes_namespace.ns.metadata.0.name
  }
  spec {
    container {
      image = "nginx"
      name  = "example-nginx"
      port {
        container_port = 80
      }
    }
  }
}

# Create simple deployment,
resource "kubernetes_deployment" "test" {
  metadata {
    name      = "terraform-nginx"
    namespace = kubernetes_namespace.ns.metadata.0.name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "my-nginx-with-terraform"
      }
    }
    template {
      metadata {
        labels = {
          app = "my-nginx-with-terraform"
        }
      }
      spec {
        container {
          image = "nginx"
          name  = "nginx-terraform-deployment"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

# Create simple service
resource "kubernetes_service" "test" {
  metadata {
    name      = "nginx-service-terraform"
    namespace = kubernetes_namespace.ns.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.test.spec.0.template.0.metadata.0.labels.app
    }
    type = "NodePort"
    port {
      port        = 80
      target_port = 80
    }
  }
}