# 一、目录介绍

`<项目根目录>/Database`目录下中存放了数据库设计、初始化脚本等内容。



## 1. `AreYouFull`文件夹

`AreYouFull`使用 `Power Designer`来设计数据库。因此，`<项目根目录>/Database`目录下的 `AreYouFull`目录存放了 `Power Designer`的工程文件，其中存放了 `AreYouFull`的数据库 `ER`图和 `PMD`模型图等内容。使用 `Power Designer`打开 `<项目根目录>/Database/AreYouFull`即可看到。



## 2. `README.md`文件

本说明文档



## 3. `create_db.sh`文件

数据库创建一键化脚本





# 二、如何使用？

## `Linux`用户

如果你使用`zsh`或者`bash`，那么可以使用我编写的脚本`create_db.sh`直接完成创建。

```shell
bash Database/create_db.sh
```





## `Windows`用户

如果你是`Windows`用户，则请在`MySQL`终端中使用我所提供的数据库创建脚本

```sql
DROP DATABASE IF EXISTS AreYouFull;
CREATE DATABASE AreYouFull;
USE AreYouFull;
source <项目根目录>/Database/AreYouFull/crebas.sql;
```

