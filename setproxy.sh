# !/bin/bash
CURRENT_DIR=$(pwd)
DIR=$(dirname "$(readlink -f "$0")")


cd $DIR
export CONFIG_PATH=$DIR/config/
FILE_TO_LINK=${1:-externe}.yml
rm -f $CONFIG_PATH/config.yaml
ln -s $CONFIG_PATH/$FILE_TO_LINK $CONFIG_PATH/config.yaml
#chmod a+rwx $CONFIG_PATH/config.yaml

docker-compose down
docker-compose up -d

cd $CURRENT_DIR
