#!/bin/bash

echo -e "\n\n[+] Deploying frontend service to staging env"
copilot svc init --name frontend
copilot svc deploy --name frontend --env staging --tag v0.0.1