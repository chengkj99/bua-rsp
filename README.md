# 科研仪器共享平台管理系统

## Dev

### FrontEnd

```shell
cd front
npm i
npm run start
```

### Server

[API 文档](./api/api.md)

```shell
cd api
go run main.go
```

### Alipay

```shell
cd pay-ex
node app.js
```

## Build

## Front

```sh
cd front
npm run build
```

## Api Server

```sh
cd api
# for linux
GOARCH=amd64 GOOS=linux go build main.go
```

## Production

生产环境部署在阿里云服务环境中。

### 前端服务

```shell
# /etc/nginx/conf.d/bua-rsp-pro.conf

/usr/sbin/nginx -s reload
```

### 后端服务

```shell
# /root/workspace/gospace/src/dist
sh start.sh
```

### 数据库

先在 workbench 中操作导出数据，生成 `Dump20200516.sql` 文件。

登录服务器导入 sql 文件：

```sh
mysql
mysql>show databases;
mysql>use bua_rsp;
mysql>source /root/workspace/gospace/src/dist/Dump20200516.sql;
```
