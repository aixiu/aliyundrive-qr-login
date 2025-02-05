# 使用官方 Python Docker 镜像
FROM python:3.9-slim-buster

# LABEL 维护者信息
LABEL maintainer=4815563@qq.com

# 设置工作目录
WORKDIR /aliyundrive-qr-login

# 安装系统依赖
# RUN apt-get update && apt-get install -y gcc libffi-dev

# 拷贝项目文件到容器内
COPY . /aliyundrive-qr-login

# 安装项目依赖
RUN pip install --no-cache-dir -r requirements.txt gunicorn

# 配置环境变量
ENV GUNICORN_CMD="gunicorn -w 2 -b 0.0.0.0:5500 app:app"

# 暴露需要的端口
EXPOSE 5500

# 运行 Gunicorn 服务器
CMD [ "sh", "-c", "$GUNICORN_CMD" ]