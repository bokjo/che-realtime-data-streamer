# che-realtime-data-streamer

Realtime data stream from MySQL DB through Kafka to Elasticsearch

## Production environment

Over simplified version of the possible solutions

### Option 1 - Run everything on Google Cloud Managed Kubernetes cluster

1. Provision GKE k8s cluster (gcloud, make or Pulumi)
2. Provision CloudSQL MySQL 8.0 instance (manually or with Pulumi)
3. Deploy Confluent Kafka k8s operator and configure the kafka cluster with connectors and ksqlDB
4. Deploy Elastic k8s operator and configure Elasticsearch and Kibana instances
5. Deploy and configure Nginx Ingress controller for simplicity
6. Create and configure the Debezium MySQL CDC source connector
7. Create all the TABLES and STREAMS you want to push to ES (perform the ETL and joins)
8. Create and configure the Elasticsearch sink connector for streaming the data into ES
9. Test by inserting and changing data into the MySQL tables

### Option 2 - Run everything on custom build VM cluster 

1. Provision CloudSQL MySQL 8.0 instance (manually or with Pulumi)
2. Create and provision 2 VMs (use Ansible to provision and install ES/Kibana on one and Kafka on the another) [for testing only cluster with 1 instance (the VMs will have to be quite big!)]
3. Create and configure the Debezium MySQL CDC source connector with Kafka
4. Create all the topics and streams for ES
5. Create and configure the Elasticsearch sink connector for streaming the data into ES
6. Test by inserting and changing data into the MySQL tables

### Option 3 - Run on Managed Kafka and Elasticsearch Services (Avien, Confluent, Elastic... all of those ones are supported and can run on Google Cloud)

1. Provision CloudSQL MySQL 8.0 instance (manually or with Pulumi)
2. Utilize Managed Kafka cluster from Confluent cloud
   - in order to use KSQL you will have to run Condluent Platform locally for initial setup and testing
3. Deploy ES and Kibana on a single VM or use Elastic Cloud or some other Managed ES offering

TODO: discuss the advantages and disadvantages on all of the above options!
TODO: discuss other options, visualization dashboards, different providers, logging, monitoring
TODO: Prepare the example service API if there is time (Simple CRUD operations against MySQL, later stage possibly interact and manage/query Kafka and ES through their REST APIs)
