# Status

Accepted

# Context

The current Go API lacks visibility into its internal health and performance.
We Cannot measure Service Level Indicators(SLIs) like request latency or error rates.
Without these metrics, we cannot define or monitor Service Level Objectives(SLOs) to ensure system reliability.

# Decision

We will adopt Prometheus as our primary monitoring and alerting tool.
We will instrument the Go application using the official Prometheus client library to expose a `/metrics` endpoints.
Prometheus will be deployed within the kubernetes cluster to scrape metrics from the application service at regular intervals.

# Consequences

## Positive

- We will gain the ability to visualize the "Four Golden Signals" (Latency, Traffic, Errors, and Saturation)
- This establishes a foundation for data-driven decision-making and automated incident detection.

## Negative

- It introduces additional resource overhead withing the cluster to run the PRometheus instance.
- The team will need to lean PromQL(Prometheus Query Language) to create effective dashboards and alerts.
