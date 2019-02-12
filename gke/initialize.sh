# setting gcloud
gcloud init

# Update components
gcloud components update
gcloud components update kubectl


#Set CLUSTER_NAM and NODE_POOL
CLUSTER_NAME="micro-cluster"
NODE_POOL="stable-node"
ZONE="us-central1-c"

# Create clustor and nodes
gcloud container clusters create $CLUSTER_NAME --preemptible --machine-type=f1-micro --num-nodes 3 --disk-size 10 --zone $ZONE
gcloud container node-pools create $NODE_POOL --cluster $CLUSTER_NAME --machine-type=f1-micro --num-nodes 1 --disk-size 10 --zone $ZONE

# Show clustor
gcloud container node-pools list --cluster $CLUSTER_NAME

# Show credentials
gcloud container clusters get-credentials $CLUSTER_NAME

# Show token
kubectl describe secrets

# Delete clustor
# gcloud container clusters delete  $CLUSTER_NAME
