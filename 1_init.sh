#!/bin/bash

echo -e "[+] Initializing new app ecs-sample"
copilot app init ecs-sample

echo -e "\n\n[+] Initializing new environment staging"
copilot env init --name staging --profile default --default-config
# copilot env init --name production --profile default --default-config

echo -e "\n\n[+] Deploying staging environment"
copilot env deploy --name staging

echo -e "\n\n[+] Deploying worker service to staging env"
copilot svc init --name worker
copilot svc deploy --name worker --env staging --tag v0.0.1-

echo -e "\n\n[+] Deploying backend service to staging env"
copilot svc init --name backend
copilot svc deploy --name backend --env staging --tag v0.0.1

echo -e "\n\n\n[+] Backend is up! Update copilot/frontend/manifest.yml image.build.args.BACKEND_URL variable to the backend's ELB endpoint before proceeding."
