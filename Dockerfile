FROM ubuntu:22.04

RUN apt-get update && apt-get install -y wget

RUN wget https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_amd64.zip

RUN apt-get install -y unzip

RUN unzip terraform_1.7.4_linux_amd64.zip -d /usr/local/bin/

# Cleanup
RUN rm terraform_1.7.4_linux_amd64.zip

# Check Terraform version
RUN terraform --version
