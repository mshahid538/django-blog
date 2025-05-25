#!/bin/bash

# Update system
apt-get update
apt-get upgrade -y

# Install PostgreSQL
apt-get install -y postgresql postgresql-contrib

# Install Nginx
apt-get install -y nginx

# Install Python and pip
apt-get install -y python3 python3-pip

# Create a virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Configure PostgreSQL
sudo -u postgres psql -c "CREATE DATABASE mgoldmantherapy;"
sudo -u postgres psql -c "CREATE USER your_postgres_user WITH PASSWORD 'your_postgres_password';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE mgoldmantherapy TO your_postgres_user;"

# Run migrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

# Configure Gunicorn
cp gunicorn.service /etc/systemd/system/
systemctl start gunicorn
systemctl enable gunicorn

# Configure Nginx
cp nginx_config.conf /etc/nginx/sites-available/mgoldmantherapy
ln -s /etc/nginx/sites-available/mgoldmantherapy /etc/nginx/sites-enabled/
systemctl restart nginx

echo "Deployment completed successfully!" 