#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="charlesdecott/udacity_p4"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run mlmicroserviceapi\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=mlmicroserviceapi

# Step 3:
# List kubernetes pods
kubectl get pods -A

# Step 4:
# Forward the container port to a host

sleep 20

kubectl port-forward mlmicroserviceapi 8000:80

kubectl logs -lapp=mlmicroserviceapi --all-containers=true
