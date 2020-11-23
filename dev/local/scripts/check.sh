# 1. Check if the kafka connector is up and running
curl -s http://localhost:8083/connectors

# 2. Check if Elasticsearch, Debezium, and DataGen connectors are installed and available
curl -s localhost:8083/connector-plugins | jq '.[].class'| egrep 'DatagenConnector|MySqlConnector|ElasticsearchSinkConnector'