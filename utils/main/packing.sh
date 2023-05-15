#####################################################
# File name  : packing.sh        
# Author:    : 付清鑫     
# Date       : 2023-04-18       
# Describe   : 打包脚本
# History:
#      1.Date&Author:  2023-04-18
#        Author:       付清鑫
#        Modification: 新建文档           
####################################################

JSON_FILE="packing.json"

HASH_PROGRAM="./hash"
#检查传入json文件
check_json()
{
    if [[ ${1##*.} == "json" ]]; then
        JSON_FILE=$1
    fi
}

#检查jq工具
check_jq()
{
    JQ_VERSION=`jq --version 2>/dev/null`
    if [[ "$JQ_VERSION" != "jq-"* ]]; then
        apt-get install -y jq >/dev/null
    fi
}

calculate_hash()
{
    app_name=$1
    app_path=`cat $JSON_FILE | jq -r ".app.$app_name.packing"`
    app_hash=`$HASH_PROGRAM -p "$app_path"`
    jq --arg app_name "$app_name" --arg app_hash "$app_hash" '.app[$app_name].hash = $app_hash' $JSON_FILE > tmp.json && mv tmp.json $JSON_FILE
}

check_jq
check_json $1


#获取项目名称
PROJECT_NAME=`cat $JSON_FILE | jq -c '.name' |sed -e 's/"//g;s/\[//g;s/\]//g'`

#获取项目中应用名称
app_string=`cat $JSON_FILE | jq -c '.app|keys' |sed -e 's/"//g;s/\[//g;s/\]//g'`
IFS=',' read -ra app_array <<< "$app_string"

app_names=`cat $JSON_FILE | jq -r '.app | keys[]'`
if [[ -z $app_names ]]; then
    echo "Error: no app found in $JSON_FILE" >&2
    exit 1
fi

# 计算哈希值并写入JSON文件
for app_name in $app_names
do
    calculate_hash "$app_name"
done

#创建项目文件夹
mkdir $PROJECT_NAME
for app_name in "${app_array[@]}"
do
    cp `cat $JSON_FILE | jq -r .app.${app_name}.packing` `pwd`/$PROJECT_NAME/
done
cat $JSON_FILE | jq . | sed -e '/\"packing\"/d' >> `pwd`/$PROJECT_NAME/manifest.json

#打包项目文件夹
zip -rq $PROJECT_NAME-`date "+%Y%m%d"`.zip ./$PROJECT_NAME
rm -rf ./$PROJECT_NAME

echo "$PROJECT_NAME-`date "+%Y%m%d"`.zip 打包成功！！！"

