# che-realtime-data-streamer

Realtime data stream from MySQL DB through Kafka to Elasticsearch deployed on Self managed instances or K8s

# Development environment

## Workflow 1 - running everything locally with Docker Compose

The environment bootstraps it's self my running `docker-compose up` in the `/dev/local` directory

1. Connect to the MySQL DB with your favorite DB client or via the cli `docker exec -it mysql bash -c 'mysql -u $MYSQL_USER -p$MYSQL_PASSWORD ecommerce'`

2. Connect to Kibana with navigating to open `http://localhost:5601/` in the browser

3. Connect to ksqlDB with `docker exec -it ksqldb ksql http://ksqldb:8088`

Once connected to the ksqlDB follow the `ecommerce.ksql` file with all the necessary ksql statements for creating the source and sink connectors

- 3 separate MySQL debezium source connectors for simplicity (the kafka topics will be automatically created)
- create 3 tables (products, attributes and attributes_kv) and inspect their data
- also for test create 3 streams from the same topics
- join the tables you need into new table or stream
- last crate Elasticsearch sink connector with the joined data

On Elasticsearch/Kibana side check the indexes and inspect the dashboard

Insert or update data in MySQL and observe it into Elasticsearch

## Workflow 2 - running everything in local K8s cluster

For local k8s development and testing i'm using K3d from Rancher (Kind and Minikube are fine too) [TODO]

