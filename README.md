# nginx_learn_code

生成多个配置的nginx配置，用于学习


### 01_simple 建立主页

01_simple    主要是把nginx搭建起来，能够看到index.html页面

1. 一定要把各种 include *.conf 去掉，不然会被冲淡
2. 要设定好目录，html文件夹要有目录，不然就会报错，
3. 使用root问题就简单了

### 02_域名注意

当没有绑定域名的时候，可以通过ip直接访问80端口
但是当绑定了域名的时候，80端口只能通过域名来访问了

### 02_服务端口转发


### 03_ssl转发


### 04_www_data使用


## 问题

### 跟页面无法访问 

如果跟页面访问不了的话，一定要看下根目录是否存在

1. /home/ubuntu/code/nginx_learn_code/01_simple
2. 因为换了机器以后，目录可能不一致，所以一定要注意


### 端口转发有问题 

1. 一定要确保端口两边是一致的
