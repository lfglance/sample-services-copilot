# sample-services-copilot

Proof of concept for deploying [sample-services](https://github.com/lfglance/sample-services) to ECS using AWS Copilot CLI.

`sample-services` need to be cloned as a submodule in this repo.

```
git submodule init
git submodule update
```

All of the manifests for copilot are located in [copilot](./copilot/)

## Prerequisites

You'll need the following:

* An active shell session to be able to interact with an AWS account as an administrator:
```
aws sts get-caller-identity
{
    "UserId": "************",
    "Account": "************",
    "Arn": "arn:aws:iam::********:user/lance"
}
```
* [AWS Copilot CLI](https://github.com/aws/copilot-cli) installed and available in your terminal's `PATH`.

## Deployment

Due to some limitations of Copilot the deployment is 2 steps (I need the backend's ELB endpoint as an environment variable for the frontend, but it's not known ahead of time and Copilot offers no internal referencing).

```
# deploy the necessary infrastructure, ECS cluster, and backend and worker services
bash 1_init.sh

# update frontend environment variable
vim copilot/frontend/manifest.yml

# deploy frontend service
bash 2_frontend.sh
```

In about 20 minutes you should have the full cluster deployed and a simple web service which fetches some dummy data from a backend URL.

From here, try out Copilot. Make adjustments to the apps, environment variables, cluster settings, etc to get a feel for Copilot.
