# argocd-declarative-template


Add the needed helm repo.

```bash
helm repo add argo-cd https://argoproj.github.io/argo-helm
```

Generate `Chart.lock` file for our argo-cd chart.

```bash
helm dep update bootstraping/${env}/argo-cd/
```

This will generate two files:

- Chart.lock
- bootstraping/${env}/argo-cd/charts/argo-cd-5.37.1.tgz

The tgz file is the downloaded dependency and no required in our code. Argo CD will download the dependencies based on the `Chart.lock` file.

We install Argo CD using our chart:

```bash
kubeclt create ns argocd
helm install argo-cd bootstraping/${env}/argo-cd --namespace argocd
```

Yo can get the generated password for the `admin` user:

```bash
./get-argocd-initial-password.sh
```

or patch the secret to set the password `argocdadmin`:

```bash
./patch-argocd-password.sh
```

Access Argo CD web interface at `https://${host_ip}:8080`, using the `admin` username and the password.

Apply the root configuration to the environment:

```bash
helm template bootstraping/${env}/root | kubectl apply -f -
```
