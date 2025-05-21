import requests
import argparse

def test_requests(host, port):
    # 测试第一个端点
    url1 = f"http://{host}:{port}/"
    try:
        response1 = requests.get(url1)
        print(f"\n请求 {url1}")
        print(f"状态码: {response1.status_code}")
        print(f"响应内容: {response1.text}")
    except requests.exceptions.RequestException as e:
        print(f"请求 {url1} 失败: {str(e)}")

    # 测试第二个端点
    url2 = f"http://{host}:{port}/test"
    try:
        response2 = requests.get(url2)
        print(f"\n请求 {url2}")
        print(f"状态码: {response2.status_code}")
        print(f"响应内容: {response2.text}")
    except requests.exceptions.RequestException as e:
        print(f"请求 {url2} 失败: {str(e)}")

    # 测试通过80端口访问
    url3 = f"http://{host}/test"
    try:
        response3 = requests.get(url3)
        print(f"\n请求 {url3}")
        print(f"状态码: {response3.status_code}")
        print(f"响应内容: {response3.text}")
    except requests.exceptions.RequestException as e:
        print(f"请求 {url3} 失败: {str(e)}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='测试HTTP请求')
    parser.add_argument('--host', '-H', default='222.186.175.121', help='指定主机IP地址')
    parser.add_argument('--port', '-p', default='8442', help='指定端口号')
    
    args = parser.parse_args()
    test_requests(args.host, args.port)
