#!/bin/bash

# 更新包列表
sudo apt-get update

# 安装必要的依赖
sudo apt-get install -y curl gnupg2 ca-certificates lsb-release

# 添加 Nginx 官方源
echo "deb http://nginx.org/packages/ubuntu $(lsb_release -cs) nginx" | sudo tee /etc/apt/sources.list.d/nginx.list

# 添加 Nginx 签名密钥
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -

# 更新包列表
sudo apt-get update

# 安装指定版本的 Nginx
sudo apt-get install -y nginx=1.18.0*

# 启动 Nginx 服务
sudo systemctl start nginx

# 设置开机自启
sudo systemctl enable nginx

# 检查 Nginx 状态
sudo systemctl status nginx

echo "Nginx 1.18 安装完成！"
