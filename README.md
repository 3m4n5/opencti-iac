OpenCTI Infrastructure as code project written by 3man.

# Overview

This project was written to establish a cost effective, pre configured, single node instance of OpenCTI.

The instance is configured to use the following OpenCTI connectors:

* Alienvault's subscribed pulse feed
* MITRE ATT&CK
* NIST CVE feed
* OpenCTI's Sector, Geography and Company files.

The instance is designed to run under a FQDN with an NGINX proxy.  Certbot is baked into ansible to configure SSL's for your A record.

## System Requirements

OpenCTI recomends the following requirements:

| Component     | CPU     | RAM      | Disk type | Disk space |
| :------------ | :------ | :------- | :-------- | :--------- |
| ElasticSearch | 2 cores | ≥ 8GB   | SSD       | ≥ 16GB    |
| Redis         | 1 core  | ≥ 1GB   | SSD       | ≥ 16GB    |
| RabbitMQ      | 1 core  | ≥ 512MB | Standard  | ≥ 2GB     |
| S3 / MinIO    | 1 core  | ≥ 128MB | SSD       | ≥ 16GB    |

The preset configured for this repository is to utilise Hetzner's cpx41 Virtual Machine.

This includes 8 VCPU, 16GB RAM and 240GB of SSD storage.

# Deployment

## Prerequisites

To deploy the instance you will need to perform several actions:

- Obtain a NIST API Key
- Obtain an AlienVault API key, and subscribe to any pulses that interest you
  - By default, any new account is subscribed to the official Alienvault account which has reliable threat intelligence.
- Register a SSH Private Key under the name "primary"
- Obtain a HCloud API Key

## Instructions

Firstly, fill out the variables in `/ansible/inventories/prod/group_vars/opencti.yml` with the details gathered in the previous section.

Subsequently, under `terraform//envs/prod` create `terraform.auto.tfvars` and fill in your infrastructure related variables.  This is where your `hcloud_token` must be set.

Run the following commands to deploy your infrastructure.

```
cd terraform/envs/prod
terraform apply

```

This will create a file under `ansible/inventories/prod ` review this file, and copy it's IP address.  Then create an A record under your domain.

Next you'll run the configuration.

```
cd ansible
ansible-playbook playbooks/site.yml
```

Finally, navigate to your domain and log in with your admin credentials you provided under the `/ansible/inventories/prod/group_vars/opencti.yml`

## Troubleshooting

The ansible playbook is designed in mind to re-run, and not overwrite unessecarily.  However, if you wish to run a component or individual role,  you can do so by running `ansible-playbook` with the `--tags` options:

- common
- docker
- opencti
- nginx
- certs
