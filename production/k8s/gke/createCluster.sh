# TODO: TESTING 
gcloud --quiet container --project $(GCP_PROJECT_ID) clusters create $(GKE_BASE_CLUSTER_ID) \
       --zone $(GKE_BASE_ZONE) \
       --no-enable-basic-auth \
       --cluster-version $(GKE_BASE_CLUSTER_VERSION) \
       --machine-type $(GKE_BASE_MACHINE_TYPE) \
       --image-type $(GKE_BASE_IMAGE_TYPE) \
       --disk-type $(GKE_BASE_DISK_TYPE) \
       --disk-size $(GKE_BASE_DISK_SIZE) \
       --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
       --num-nodes $(GKE_BASE_NUM_NODES) \
       --no-enable-autoupgrade \
       --no-issue-client-certificate \ 
       --metadata disable-legacy-endpoints=true \
       --enable-ip-alias \
       --network "projects/$(GCP_PROJECT_ID)/global/networks/default" \
       --subnetwork "projects/$(GCP_PROJECT_ID)/regions/$(GKE_BASE_REGION)/subnetworks/$(GKE_BASE_SUBNET)" \
       --default-max-pods-per-node "110" \
       --addons HorizontalPodAutoscaling,HttpLoadBalancing 
	