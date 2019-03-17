docker build -t hanksmak/multi-client:latest -t hanksmak/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t hanksmak/multi-server:latest -t hanksmak/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t hanksmak/multi-worker:latest -t hanksmak/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push hanksmak/multi-client:latest
docker push hanksmak/multi-client:$SHA
docker push hanksmak/multi-server:latest
docker push hanksmak/multi-server:$SHA
docker push hanksmak/multi-worker:latest
docker push hanksmak/multi-worker:$SHA

# This is needed to create issuer and cert
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.6/deploy/manifests/00-crds.yaml
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=hanksmak/multi-server:$SHA
kubectl set image deployments/client-deployment client=hanksmak/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=hanksmak/multi-worker:$SHA

# Remember install Helm in GKE and add RBAC (Role Based Access Control)