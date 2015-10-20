#!/bin/bash
echo "zipping..."
zip -r sleep-worker.zip .
echo "uploading"
iron worker upload --name sleep-worker --zip sleep-worker.zip iron/java java SleepWorker
