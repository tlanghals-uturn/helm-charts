#!/bin/bash

IMAGE=${1:-airflow}
TAG=${2:-latest}

rm -rf .tmp/

mkdir -p .tmp && cd .tmp
git clone https://github.com/puckel/docker-airflow.git
cd docker-airflow

docker build --build-arg AIRFLOW_DEPS="kubernetes,s3" --tag=${IMAGE}:${TAG} .

cd ../..
rm -rf .tmp/