OpenCTI Infrastructure as code project written by 3man.

# Overview

This project was written to establish a cost effective, pre configured, single node instance of OpenCTI.

The instance is configured to use the following OpenCTI connectors:

* Alienvault's subscribed pulse feed
* MITRE ATT&CK
* NIST CVE feed
* OpenCTI's Sector, Geography and Company files.

The instance is designed to run under a FQDN with an NGINX proxy.  

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
