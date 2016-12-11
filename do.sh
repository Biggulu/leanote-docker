#!/bin/bash - 
#===============================================================================
#
#          FILE: do.sh
# 
#         USAGE: ./do.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 12/11/2016 22:03
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#command -v docker || sudo yum install -y docker
#sudo usermod -aG docker amito
leanote_root=${HOME}/Web/web/leanote
mkdir -p ${leanote_root}/{leanote,mongo}
mkdir -p ${leanote_root}/mongo/{leanote,log}
if [[ ! -f ${leanote_root}/leanote/conf/app.conf ]]; then
	cp -r conf/ ${leanote_root}/leanote/
fi
docker build -t $(users)/leanote --rm --no-cache .

docker run --name leanote -d -v ${leanote_root}/mongo/db:/data/mongo/db -v ${leanote_root}/mongo/log/:/data/mongo/log -v ${leanote_root}/leanote/conf/:/usr/local/leanote/conf -v ${leanote_root}/leanote/files/:/usr/local/leanote/files -p 9000:9000 $(users)/leanote

docker start leanote


