#!/bin/bash
sudo pkill -f main || true
export HOST=${{ secrets.DBHOST }}
export USER=${{ secrets.DBUSER }}
export PASSWORD=${{ secrets.DBPASSWORD }}
export DBNAME=${{ secrets.DBNAME }}
export DBPORT=${{ secrets.DBPORT }}
export PORT=8000
cd /home/${{ secrets.REMOTE_USER }}
chmod +x main
nohup ./main > app.log 2>&1 &