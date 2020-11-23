import * as k8s from "@pulumi/kubernetes"
import * as pulumi from "@pulumi/pulumi"
import * as gcp from "@pulumi/gcp"
import * as random from "@pulumi/random"

const name = "che-realtime-data-streamer"

// Create a GKE cluster
const engineVersion = gcp.container.getEngineVersions().then(v => v.latestMasterVersion)
const cluster = new gcp.container.Cluster(name, {
    initialNodeCount: 2,
    minMasterVersion: engineVersion,
    nodeVersion: engineVersion,
    nodeConfig: {
        machineType: "n1-standard-1",
        oauthScopes: [
            "https://www.googleapis.com/auth/compute",
            "https://www.googleapis.com/auth/devstorage.read_only",
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring"
        ],
    },
})

// Export the Cluster name
export const clusterName = cluster.name

// Manufacture a GKE-style kubeconfig. Note that this is slightly "different"
// because of the way GKE requires gcloud to be in the picture for cluster
// authentication (rather than using the client cert/key directly).
export const kubeconfig = pulumi.
    all([cluster.name, cluster.endpoint, cluster.masterAuth]).
    apply(([name, endpoint, masterAuth]) => {
        const context = `${gcp.config.project}_${gcp.config.zone}_${name}`
        return `apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${masterAuth.clusterCaCertificate}
    server: https://${endpoint}
  name: ${context}
contexts:
- context:
    cluster: ${context}
    user: ${context}
  name: ${context}
current-context: ${context}
kind: Config
preferences: {}
users:
- name: ${context}
  user:
    auth-provider:
      config:
        cmd-args: config config-helper --format=json
        cmd-path: gcloud
        expiry-key: '{.credential.token_expiry}'
        token-key: '{.credential.access_token}'
      name: gcp
`
    })

// Create a Kubernetes provider instance that uses our cluster from above.
const clusterProvider = new k8s.Provider(name, {
    kubeconfig: kubeconfig,
})

// MySQL Database Instance
const dbInstance = new gcp.sql.DatabaseInstance("che_db_instance", {
    region: "europe-west3",
    settings: {
        tier: "db-f1-micro",
    },
    deletionProtection: true,
    databaseVersion: "MYSQL_8_0",
    name: "che_db_instance"
})

export const dbConnectionName = dbInstance.connectionName

const database = new gcp.sql.Database("ecommerce", { instance: dbInstance.name })

export const dbName = database.name

const users = new gcp.sql.User("users", {
    instance: dbInstance.name,
    name: "che",
    host: "che.mk", // TODO: change it to your IP or open it fully public [TESTING ONLY]
    password: process.env.DB_PASSWD
})

users.name
