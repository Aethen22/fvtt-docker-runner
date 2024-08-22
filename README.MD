### INTRODUCTION

This is a simple docker-compose and dockerfile setup for starting Foundry VTT from volumes and a ftp server which serves it's data directory

## Why volumes?

For persistence, anything done from foundry will be persisted into the volumes, and vice-versa

## How do i use this?

Copy your FoundryVTT data folder into this folder under the name foundryVTTData

Copy your FoundryVTT source folder into this folder under the name foundryVTTSource

Change the value `YOUR_PASSWORD` in the docker-compose.yml file to a secure password

Install docker and docker-compose, guide [here](https://docs.docker.com/compose/install/)

Simply run `docker-compose up` and you're done, if you encounter any errors, these are surely related to foundry configuration

## Troubleshooting

You need to have every configuration pointing towards the `/root/foundryVTTData` and `/root/foundryVTTSource` folders

If the ftp server fails... well, it should not, if it does, good luck

## Details

This docker-compose project starts automatically with docker, so you can have your server running 24/7(as long as docker starts automatically)

This server is started on port 443, so, make sure that you use https and certificates, or else you will get errors, my recommendation is to use [letsencrypt](https://letsencrypt.org/)