# che-realtime-data-streamer

Realtime data stream from MySQL DB through Kafka to Elasticsearch deployed on K8s

This pipeline utilizes the Kafka connectors and streaming components

The project is split in multiple folder for demonstration purposes

- `api/` [ API service example ] (TODO: not finished, example only)
- `dev/` 
  - `local/` => run the pipeline locally with docker-compose
    - `k8s/`  => run the pipeline locally with local  k8s cluster (kind or k3d)
- `production/`
  - `infra/`  => IaC with Pulumi or manual gcloud scripting (TODO: example only)
  - `diagrams/` => Brief high level overview infrastructure diagram
  - `k8s/` 
    - `gke/` => GKE cluster creating and provisioning (manual kubectl yaml or make/Helm TODO: example only)
    - `self-managed/` => self managed VM cluster (provisioned with Ansible? TODO: example only)
  - `kafka/` 
    - `confluent/` => managed Kafka on Confluent Cloud (demo only, everything in browser)
    - `KSQL` => all the SQL statements needed to create the connectors and tables/ETL for streaming to ES
  - `mysql/` => initial MySQL DB initialization (example manual TODO: prepare the DB with the API migrations)

## TODO

- Automate the whole infrastructure creation [MySQL and GKE] (Pulimi, Terraform... or custom make)
- Automate the whole K8s deployments
- Add CI (GitHub actions, Gitlab CI)
- Add CD (GitOps flow with ArgoCD)
- Finish the test API service (example MySQL CRUD, manage/query Kafka and KSQL, query ES)