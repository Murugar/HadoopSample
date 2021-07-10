#!/bin/sh

echo "== Type 'runspark' to run the inner project Spark application =="
runspark() {
	echo "Running Spark application : test1"
	(cd test1 && mvn clean compile exec:java)
}

echo "== Type 'pkgspark' to move Spark application into folder ./release/ =="
pkgspark() {
    mvn package
    mkdir -p release/
    mv test1/target/*-jar-with-dependencies.jar release/
}

echo "== Generate model with > gendatamodel DATA_MODEL_PROJECT_NAME =="
gendatamodel() {
  # MIN NUM OF ARG
  if [[ "$#" < "1" ]]; then
    echo "Usage : ${FUNCNAME[0]} DATA_MODEL_PROJECT_NAME" >&2
    return -1
  fi

  local DATA_MODEL_PROJECT_NAME=$1

  echo "mvn archetype:generate -DarchetypeGroupId=com.github.frtu.archetype -DarchetypeArtifactId=avro-project-archetype -DarchetypeVersion=${base-pom-version} -DgroupId=com.iqmsoft -DartifactId=${DATA_MODEL_PROJECT_NAME} -Dversion=1.0-SNAPSHOT"
  mvn archetype:generate -DarchetypeGroupId=com.github.frtu.archetype -DarchetypeArtifactId=avro-project-archetype -DarchetypeVersion=${base-pom-version} -DgroupId=com.iqmsoft -DartifactId=${DATA_MODEL_PROJECT_NAME} -Dversion=1.0-SNAPSHOT
}

