# Helm Lecture



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

