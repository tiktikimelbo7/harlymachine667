FROM mirrorultroid6/seeder45:heroku
WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

RUN apt-get install -y wget 
RUN wget -q https://github.com/P3TERX/aria2.conf/raw/master/dht.dat -O /usr/src/app/dht.dat && \
    wget -q https://github.com/P3TERX/aria2.conf/raw/master/dht6.dat -O /usr/src/app/dht6.dat
COPY bash.sh .
CMD ["bash","start.sh"]

