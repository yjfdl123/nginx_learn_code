from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
import argparse

app = FastAPI()

# 配置CORS，允许所有来源访问
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # 允许所有来源
    allow_credentials=True,
    allow_methods=["*"],  # 允许所有方法
    allow_headers=["*"],  # 允许所有头部
)

@app.get("/")
def read_root():
    return {"message": "Hello World"}

@app.get("/test1")
def test():
    return {"status": "ok", "port": 8443}

@app.get("/info/{name}")
def get_info(name: str):
    return {
        "name": name,
        "message": f"Welcome, {name}!",
        "server": "test_http server on 8442"
    }

if __name__ == "__main__":
    # 创建命令行参数解析器
    parser = argparse.ArgumentParser(description='启动HTTP服务器')
    parser.add_argument('-p', '--port', type=int, default=9400,
                      help='指定服务器端口号（默认：9400）')
    
    # 解析命令行参数
    args = parser.parse_args()
    
    # 使用指定的端口启动服务器
    uvicorn.run(
        app,
        host="0.0.0.0",  # 允许所有IP访问
        port=args.port,
        log_level="info"
    ) 