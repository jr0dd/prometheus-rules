Alerting and recording rules I have written, tweaked or procurred from the interwebs.
All in yaml format ready to be imported individually with manifest or kustomize into k8s.

This repo does not or will contain rules that are aready bundled with [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack/templates/prometheus/rules-1.14)
```
The only place where the namespace is definined is in the kustomization.yaml in the app subdir.
Be sure to adjust the namespace in the kustomizations, if needed, before importing.
```


Some of the sources these have been created from:

[monitoring-mixins](https://github.com/monitoring-mixins/website)

[ceph-mixins](https://github.com/ceph/ceph-mixins)

[glusterfs-mixins](https://github.com/gluster/gluster-mixins)

[awesome-prometheus-alerts](https://github.com/samber/awesome-prometheus-alerts)
