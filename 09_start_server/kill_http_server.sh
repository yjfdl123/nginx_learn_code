#!/bin/bash

# 检查是否提供了端口参数
if [ $# -ne 1 ]; then
    echo "使用方法: $0 <端口号>"
    exit 1
fi

PORT=$1

# 检查输入是否为数字
if ! [[ "$PORT" =~ ^[0-9]+$ ]]; then
    echo "错误: 请输入有效的端口号"
    exit 1
fi

# 查找使用该端口的进程ID
PID=$(lsof -ti tcp:$PORT)

if [ -z "$PID" ]; then
    echo "没有找到使用端口 $PORT 的进程"
    exit 0
else
    echo "找到使用端口 $PORT 的进程 (PID: $PID)"
    
    # 杀掉进程
    kill -9 $PID
    
    if [ $? -eq 0 ]; then
        echo "成功终止进程 $PID"
    else
        echo "无法终止进程 $PID"
        exit 1
    fi
fi
