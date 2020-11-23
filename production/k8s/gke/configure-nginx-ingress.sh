kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole cluster-admin \
  --user $(gcloud config get-value account)


kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml


kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/provider/cloud-generic.yaml


curl https://raw.githubusercontent.com/TheJaySmith/confluent-kafka-on-gcp/master/kafka/gke/kafka-nginx-ingress.yaml --output kafka-nginx-ingress.yaml

kubectl apply -f kafka-nginx-ingress.yaml -n operator

