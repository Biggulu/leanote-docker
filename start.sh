#!/bin/bash -

/usr/local/mongo/bin/mongod --dbpath /data/mongo/db --fork --logpath /data/mongo/log/leanote.log

if [ ! -f "/data/mongo/db/leanote.0" ]; then
	/usr/local/mongo/bin/mongorestore -h localhost -d leanote --dir /usr/local/leanote/mongodb_backup/leanote_install_data/
fi

cd /usr/local/leanote/bin  && bash run.sh

