# Acure Agent Kubernetes manifest
* Installs the Acure agent [Acure.io](https://Acure.io)

## Installing by manifest
Install the Acure-agent as a Deployment to your Kubernetes cluster by applying the manifest:
```bash
export ACURE_URI="https://<myspace>.acure.io"
export ACURE_KEY="<my coordinator key>"

envsubst < acure-agent.yaml | kubectl apply -f https://raw.githubusercontent.com/Acure-io/acure-agent/main/manifests/acure-agent/acure-agent.yaml
```
It also creates ClusterRole, ClusterRoleBinding, ServiceAccount and Secret for token.