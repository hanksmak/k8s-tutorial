gcloud set project k8s-tutorial-233417
gcloud config set project k8s-tutorial-233417
gcloud config set compute/zone asia-east2-a
gcloud container clusters get-credentials multi-cluster
kubectl create secret generic pgpassword --from-literal PGPASSWORD={pwd}
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller --upgrade # use the latest helm
helm install stable/nginx-ingress --name my-nginx --set rbac.create=true