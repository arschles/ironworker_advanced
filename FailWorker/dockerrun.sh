#!/bin/bash
docker run --rm -v "$PWD":/worker -w /worker iron/java java FailWorker
