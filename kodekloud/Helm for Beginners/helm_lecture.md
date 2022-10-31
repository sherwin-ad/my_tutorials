# Helm Lecture

## Writing Helm Chart

Creates a chart directory along with the common files and directories used in a chart

```
$ helm create nginx-chart

$ ls -l nginx-chart
total 16
-rw-r--r--  1 sherwinowen  staff  1147 Oct 27 13:56 Chart.yaml
drwxr-xr-x  2 sherwinowen  staff    64 Oct 27 13:56 charts
drwxr-xr-x  4 sherwinowen  staff   128 Oct 30 21:07 templates
-rw-r--r--  1 sherwinowen  staff   320 Oct 30 21:14 values.yaml
```

Installs chart using the chart created

```
$ helm install hello world 1 ./ nginx chart

$ helm install hello-world \
> --set replicaCount=2 \
> --set image=nginx \
> ./nginx-chart
NAME: hello-world
LAST DEPLOYED: Mon Oct 31 18:13:57 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
```





## Make sure Chart is working as intended



```
helm lint nginx chart
```

```
helm template ./ nginx chart

helm template ./ nginx chart --debug
```

```
helm install hello world 1 ./ nginx chart --
dry run
```

