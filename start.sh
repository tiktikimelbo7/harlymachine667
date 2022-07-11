python3 update.py
tracker_list=`curl -Ns https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/all.txt | awk '$1' | tr '\n' ',' | cat`
qbit_trackers_list=$(curl -Ns https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/all.txt | awk '$0' | tr '\n' ',')
echo -e "\nmax-concurrent-downloads=7\nbt-tracker=$tracker_list" >> /usr/src/app/a2c.conf
echo -e "\nBittorrent\add_trackers=$=$qbit_trackers_list" >> /usr/src/app/qBittorrent.conf
extra-api --conf-path=/usr/src/app/a2c.conf
python3 -m bot
