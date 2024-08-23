### INTRODUCTION

This is a simple docker-compose and dockerfile setup for starting Foundry VTT from volumes and a ftp server which serves it's data directory

## Why volumes?

For persistence, anything done from foundry will be persisted into the volumes, and vice-versa

## How do i use this?

Copy your FoundryVTT data folder into this folder under the name foundryVTTData

Copy your FoundryVTT source folder into this folder under the name foundryVTTSource

Set your foundry port(In foundryVTT configuration) to 30000

Change the value `YOUR_PASSWORD` in the docker-compose.yml file to a secure password

Open ports 20, 21, 443 and 60000 to 60099(60000-60099) to your host machine

Install docker and docker-compose, guide [here](https://docs.docker.com/compose/install/)

Simply run `docker-compose up` and you're done, if you encounter any errors, these are surely related to foundry configuration

## Troubleshooting

You need to have every configuration pointing towards the `/root/foundryVTTData` and `/root/foundryVTTSource` folders

If the ftp server fails... well, it should not, if it does, good luck

## Details

This docker-compose project starts automatically with docker, so you can have your server running 24/7(as long as docker starts automatically)

This server is started on port 443, so, make sure that you use https and certificates, or else you will get errors, my recommendation is to use [letsencrypt](https://letsencrypt.org/)

## Setting https up

To setup https i recommend using letsencrypt(see above), after you setup letsencrypt, you need to copy the certificates into your foundry installation, for that i created a simple sh and service(which executes that sh correctly)

To use it just modify the lines 5 and 6 on `copycerts.service.example`, specifically these parts:

`/YOUR/REPOSITORY/LOCATION` to your repository location, so if you downloaded the repo on /home/user/fvtt-docker-runner, that should be there

`YOUR_DNS_NAME` to your hostname, this is the external name used in both letsencrypt and whichever service you're using

Copy the copycerts.service.example to /etc/systemd/system/copycerts.service via `cp copycerts.service.example /etc/systemd/system/copycerts.service`

Reload the systemctl daemon via `systemctl daemon-reload`

Enable the service via `systemctl enable copycerts.service`

Run the service and make sure it works via `service copycerts start`

If foundry is configured correctly, you should have https with certificates working