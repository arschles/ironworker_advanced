#!/bin/bash
docker run --rm -v "$PWD":/worker -w /worker iron/java:dev javac SleepWorker.java
