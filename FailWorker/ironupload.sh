#!/bin/bash
echo "zipping..."
zip -r fail-worker.zip .
echo "uploading"
iron worker upload --name fail-worker --zip fail-worker.zip iron/java java FailWorker
