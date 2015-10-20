# ironworker_advanced

Semi-advanced code samples for IronWorker.

# Instructions for Use

This repository has 3 different workers: `FailWorker`, `SleepWorker` and `SuccessWorker`. Each worker's
codebase has a respective folder of the same name, and each folder has a `dockerbuild.sh`, `dockerrun.sh`
and `ironupload.sh` script in it. The two `docker*` ones follow the first 2 commands in
[the dockerworker repo](https://github.com/iron-io/dockerworker/tree/master/java)
and the last `zip`s up the code and `iron worker upload`s the code package.

For any specific worker, run the following:

```bash
cd $worker_dir
./dockerbuild.sh
./dockerrun.sh
./ironupload.sh
cd ..
# 10 threads running 10 tasks. run 'ruby run.rb usage' for more info
ruby run.rb $worker_name 10 10 default 1
```
