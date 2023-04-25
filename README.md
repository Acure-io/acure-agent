# Acure-agent

Repo contains:
- Dockerfile to build the Acure-agent image
- Helm chart to install Acure-agent (see the [chart Readme](charts/acure-agent/README.md) for more info about installation)
- Manifest for manual setup Acure-agent on Kubernetes  (see the [Readme](manifests/acure-agent/readme.md) for more details)

You can install the Acure-agent using Helm:
```bash
kubectl create namespace acure

helm install acure-agent -n acure oci://acureio.azurecr.io/charts/acure-agent \
--set config.baseUri="https://<myspace>.acure.io" --set config.apiKey="<my coordinator key>"
```

or by applying the manifest manually:
```bash
export ACURE_URI="https://<myspace>.acure.io"
export ACURE_KEY="<my coordinator key>"

curl https://raw.githubusercontent.com/Acure-io/acure-agent/main/manifests/acure-agent/acure-agent.yaml -o acure-agent.yaml 

envsubst < acure-agent.yaml | kubectl apply -f -
```