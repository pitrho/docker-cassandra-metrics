#!/bin/bash

LOGENTRIES_APPENDER_VERSION="1.1.35"
IMAGE_TAG="pitrho/cassandra-metrics-config"

# Custom die function.
#
die() { echo >&2 -e "\nRUN ERROR: $@\n"; exit 1; }

# Parse the command line flags.
#
while getopts "v:t:" opt; do
  case $opt in
    t)
      IMAGE_TAG=${OPTARG}
      ;;

    v)
      LOGENTRIES_APPENDER_VERSION=${OPTARG}
      ;;

    \?)
      die "Invalid option: -$OPTARG"
      ;;
  esac
done

# Crete the build directory
rm -rf build
mkdir build

cp run.sh build/
cp log4j_logentries.xml build/
cp queries.json build/

# Copy docker file, and override the REDIS_VERSION string
sed 's/%%LOGENTRIES_APPENDER_VERSION%%/'"$LOGENTRIES_APPENDER_VERSION"'/g' Dockerfile.tmpl > build/Dockerfile

docker build -t="${IMAGE_TAG}" build/

rm -rf build
