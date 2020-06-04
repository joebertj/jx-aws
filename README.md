# Install Notes

## Certificate
`watch -n 5 kubectl get order,challenge,certificaterequest,certificate`

## Vault
https://vault-jx.aws.kenchlightyear.com/v1/sys/health?drsecondarycode=299&performancestandbycode=299&sealedcode=299&standbycode=299&uninitcode=299

## Copy TLS secret to staging and production

### jx 
```
jx add app jx-app-replicator -v 1.0.16 --repository https://storage.googleapis.com/chartmuseum.jenkins-x.io
jx step replicate secret "tls-*" -r jx-staging -r jx-production --create-namespace
```
### kubectl
```
kubectl patch deployment -n kube-system jxing-nginx-ingress-controller --type='json' -p='[{"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--default-ssl-certificate=jx/tls-aws-kenchlightyear-com-p"}]'
```

## ACM
`service.beta.kubernetes.io/aws-load-balancer-ssl-cert: "certificate ARN"`


