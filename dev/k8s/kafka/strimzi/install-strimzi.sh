# Create kafka namespace
kubectl create namespace kafka

# Install the strimzi kafka operator
kubectl apply -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka

# Create single node Kafka Cluster (utilizes Strimzi Kafka CRDs)
kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-persistent-single.yaml -n kafka 

# TODO: Install all the rest of the components... Connectors, Schema Registry, KSQ...