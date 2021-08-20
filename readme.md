## Postgres Password

Manually create a secret used as Postgres password

```
kubectl create secret generic pgpassword --from-literal PGPASSWORD=1234asdf
```

## Ingress Controller

Install provider specific ingress controller to allow incoming traffic

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.48.1/deploy/static/provider/cloud/deploy.yaml
```

## Kubernetes Dashboard

Start the server by running the following command:

```
kubectl proxy
```

You can now access the dashboard by visiting:

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

Click the "SKIP" link next to the SIGN IN button.


## Install and use Travis CLI via Docker

Run image with ruby preinstalled

```
docker run -it -v $(pwd):/app ruby:2.4 sh
```

Install Travis CLI on that container

```
gem install travis
```
