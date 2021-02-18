#!/bin/sh
FECHA=`date '+%Y%m%d%H%M'`
python /usr/src/udemy-dl/udemy-dl.py \
            ${URL} \
           -u $USERNAME \
           -p ${PASSWORD} \
           -o "/data"
           --info
$ARGS
NAME=`ls /data`
rm /data/.udemy-dl.conf
rm /data/$NAME/udemy-dl.log
tar -cvj /data |split -b ${SIZEVOLUME} -d - $NAME$FECHA.tbz.
megamkdir -u ${MAILMEGA} -p ${PASSWORDMEGA} /Root/$NAME/
cat <<EOF > join.sh
#!/bin/sh
cat $NAME$FECHA.tbz.* > $NAME$FECHA.tbz2
EOF
chmod +x join.sh
megaput -u ${MAILMEGA} -p ${PASSWORDMEGA} --path=/Root/$NAME/ $NAME$FECHA.tbz.*
megaput -u ${MAILMEGA} -p ${PASSWORDMEGA} --path=/Root/$NAME/ join.sh
rm /data/ -Rv