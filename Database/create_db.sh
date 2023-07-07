#! /bin/bash

# 检查是否存在MySQL
if ! mysql --version 2>&1 | grep 'MySQL' > /dev/null; then
    echo "MySQL not found!"
    exit 1
else
    mysql --version | awk '{printf("MySQL found! Version Info: %s\n", $3);}'
fi

DBNAME="AreYouFull"
DIR="$(cd "$(dirname "$0")" && pwd)"
CONF_FILE="${DIR}"/sql.conf
SQL_SCRIPT="${DIR}/${DBNAME}"/crebas.sql

# 获取密码
if [[ ! -e "$CONF_FILE" ]]; then
    read -r -p "输入数据库Root用户密码: " PASS
    echo -e "[client]\nuser=root\npassword=$PASS" > "$CONF_FILE"
fi

# 创建默认数据库
echo "Running SQL Script in AreYouFull/crebas.sql"
echo "DROP DATABASE IF EXISTS ${DBNAME}; CREATE DATABASE ${DBNAME}; USE ${DBNAME}; source ${SQL_SCRIPT};" | mysql --defaults-file="$CONF_FILE"