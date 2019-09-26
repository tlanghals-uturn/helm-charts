#!/bin/bash

IMAGE=${1:-airflow}
TAG=${2:-latest}

rm -rf .tmp/

mkdir -p .tmp && cd .tmp
git clone --single-branch --branch feature/airflow-1.10.5 https://github.com/maxbrunet/docker-airflow.git
cd docker-airflow

docker build --build-arg AIRFLOW_DEPS="kubernetes" --tag=${IMAGE}:${TAG} .

cd ../..
rm -rf .tmp/