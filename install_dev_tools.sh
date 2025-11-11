#!/bin/bash

# Скрипт автоматичного встановлення Docker, Docker Compose, Python і 
Django
# Працює на Ubuntu / Debian

set -e  # зупиняє виконання при помилці

echo "🔍 Перевірка та встановлення необхідних інструментів..."

# --- Docker ---
if ! command -v docker &> /dev/null
then
    echo "🐳 Docker не знайдено. Встановлення..."
    sudo apt update -y
    sudo apt install -y apt-transport-https ca-certificates curl 
software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg 
--dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) 
signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
      https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee 
/etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update -y
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    sudo systemctl enable docker
    sudo systemctl start docker
    echo "✅ Docker встановлено."
else
    echo "✔️ Docker вже встановлено."
fi

# --- Docker Compose ---
if ! command -v docker-compose &> /dev/null
then
    echo "🔧 Встановлення Docker Compose..."
    sudo curl -L 
"https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname 
-s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "✅ Docker Compose встановлено."
else
    echo "✔️ Docker Compose вже встановлено."
fi

# --- Python ---
if ! command -v python3 &> /dev/null
then
    echo "🐍 Python не знайдено. Встановлення..."
    sudo apt update -y
    sudo apt install -y python3 python3-pip
    echo "✅ Python встановлено."
else
    echo "✔️ Python вже встановлено."
fi

# --- Django ---
if ! python3 -m django --version &> /dev/null
then
    echo "🧱 Встановлення Django..."
    pip3 install --upgrade pip
    pip3 install django
    echo "✅ Django встановлено."
else
    echo "✔️ Django вже встановлено."
fi

echo ""
echo "🎉 Усі інструменти встановлено або вже були присутні в системі!"
