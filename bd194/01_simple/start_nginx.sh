#!/bin/bash
mkdir -p logs

NGINX_DIR=$(pwd)
NGINX_CONF="$NGINX_DIR/nginx.conf"

# 定义清理函数
cleanup() {
    echo "正在停止 nginx..."
    sudo nginx -s stop
    exit 0
}

# 捕获 SIGTERM 信号
trap cleanup SIGTERM

# 启动 nginx 函数
start_nginx() {
    echo "正在启动 nginx..."
    sudo nginx -c "$NGINX_CONF"
    if [ $? -eq 0 ]; then
        echo "nginx 启动成功"
    else
        echo "nginx 启动失败"
        exit 1
    fi
}

# 停止 nginx 函数
stop_nginx() {
    echo "正在停止 nginx..."
    sudo nginx -c "$NGINX_CONF" -s stop
    if [ $? -eq 0 ]; then
        echo "nginx 停止成功"
    else
        echo "nginx 停止失败"
        exit 1
    fi
}

# 重载 nginx 函数
reload_nginx() {
    echo "正在重载 nginx 配置..."
    sudo nginx -c "$NGINX_CONF" -s reload
    if [ $? -eq 0 ]; then
        echo "nginx 重载成功"
    else
        echo "nginx 重载失败"
        exit 1
    fi
}

# 检查 nginx 状态
check_nginx() {
    if pgrep nginx >/dev/null; then
        echo "nginx 正在运行"
        return 0
    else
        echo "nginx 未运行"
        return 1
    fi
}

# 根据命令行参数执行相应操作
case "$1" in
    start)
        start_nginx
        ;;
    stop)
        stop_nginx
        ;;
    reload)
        reload_nginx
        ;;
    status)
        check_nginx
        ;;
    *)
        echo "用法: $0 {start|stop|reload|status}"
        exit 1
        ;;
esac

# 保持脚本运行，这样supervisor不会认为进程退出了
# while true; do
#     if ! nginx -t >/dev/null 2>&1; then
#         echo "Nginx configuration test failed"
#         exit 1
#     fi
#     if ! pgrep nginx >/dev/null; then
#         echo "Nginx is not running"
#         exit 1
#     fi
#     sleep 60
# done