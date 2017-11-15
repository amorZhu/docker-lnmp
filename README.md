# docker-lnmp
### lnmp
```html
目录介绍：
.
├── conf                                # 配置文件目录，用于在docker-compose.yml 文件中挂载配置文件
│   ├── mysql
│   ├── nginx
│   └── php-fpm
├── docker-compose.yml                  # docker-compose 模板文件
├── Dockerfile                          # Dockerfile 文件 用以创建 php-fpm
├── log                                 # 日志文件目录，用于在docker-compose.yml 文件中挂载配置文件
│   ├── mysql
│   ├── nginx
│   └── php-fpm
└── mysql                               # mysql 数据文件目录，若不挂在，则会导致mysql数据无法同步

参考资料：
php-fpm:
https://hub.docker.com/_/php/
mysql:
https://hub.docker.com/_/mysql/
redis:
https://hub.docker.com/_/redis/
nginx:
https://hub.docker.com/_/nginx/

最后，感谢：
  https://www.awaimai.com/2120.html

clone文件到本地，确认已安装docker docker-compose，执行docker-compose up (后台运行请加 -d)

```
