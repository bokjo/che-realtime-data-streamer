FROM confluentinc/cp-kafka-connect:6.0.0

ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components"

RUN confluent-hub install --no-prompt debezium/debezium-connector-mysql:1.2.2 \
    && confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:0.4.0 \
    && confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:10.0.1
