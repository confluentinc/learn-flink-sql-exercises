# Apache Flink® SQL Course Exercises

This repository is part of the **Flink SQL** course on [Confluent Developer](https://developer.confluent.io/).

## What this does

The code in this repo uses Docker Compose to start up a Flink cluster, a Kafka cluster, a Schema Registry, and the Flink SQL Client. [flink-faker](https://github.com/knaufk/flink-faker) is used to generate some sample data streams.

## How to get it running

First build the image and start all of the containers:

```bash
docker compose up --build -d
```

Once the containers are running,

```bash
docker compose run sql-client
```

will drop you into the Flink SQL Client, where you can interact with Flink SQL.

## How to shut it down

```bash
docker compose down -v
```
