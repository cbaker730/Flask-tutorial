#!/bin/bash

# Script to create and start a mysql database container.
# After initial creation, the container can be started and stopped with:
#    docker-compose up
#    docker-compose down


FILE=docker-compose.yml

# If the .yml file already exists, then just start it
if [ -f "$FILE" ]; then
    sudo docker-compose up -d
    exit 0
fi


# Create configuration file for docker-compose
sudo tee -a "$FILE" > /dev/null <<EOF
version: '3.3'
services:
  db:
    image: mysql:5.7
    container_name: mysql
    restart: always
    environment:
      MYSQL_DATABASE: 'shop'
      MYSQL_USER: 'shopadmin'
      MYSQL_PASSWORD: 'TmV2ZXIgZ29ubmEgZ2l2ZSB5b3UgdXAK'
      MYSQL_ROOT_PASSWORD: 'WW91IGtuMHcgdGhlIHJ1bDN6ICYgc28gZG8gSQo'
    ports:
      # <Port exposed> : < MySQL Port running inside container>
      - '127.0.0.1:3306:3306'
    expose:
      # Opens port 3306 on the container
      - '3306'
      # Where our data will live
    volumes:
      - my-db:/var/lib/mysql
# Names our volume
volumes:
  my-db:
EOF

# Pull and start the container
sudo docker-compose up -d


