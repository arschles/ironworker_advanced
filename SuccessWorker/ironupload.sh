#!/bin/bash
echo "zipping..."
zip -r success-worker.zip .
echo "uploading"
iron worker upload --name success-worker --zip success-worker.zip iron/java java SuccessWorker
