# 使用 Python 3.9 的官方映像作為基礎
FROM python:3.9

# 安裝 Flask 和相依套件
RUN pip install flask

# 安裝 openssh-server 以提供 SSH 服務
RUN apt-get update && apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    echo 'test:test1234' | chpasswd

# 複製 Flask 應用程式到容器中
COPY app.py /app.py

# 啟動 Flask 和 SSH 服務
CMD ["/bin/bash", "-c", "/usr/sbin/sshd && python3 /app.py"]
