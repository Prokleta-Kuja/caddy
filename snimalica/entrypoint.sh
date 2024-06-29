#!/bin/bash -e

if [[ -z $INPUT_STREAM ]]; then
  echo "INPUT_STREAM not set" >&2; exit 1
fi

if ! [[ $KEEP_DAYS =~ ^[0-9]+$ ]] ; then
   echo "KEEP_DAYS not a number" >&2; exit 1
fi

if ! [[ $SPLIT_TIME =~ ^[0-9]+$ ]] ; then
   echo "SPLIT_TIME not a number" >&2; exit 1
fi

# cronDailyPath="/etc/periodic/daily/delete-old-recordings"
# echo "#!/bin/sh" > $cronDailyPath
# echo "find $dir -type f -mtime +$KEEP_DAYS -delete" >> $cronDailyPath
# chmod +x $cronDailyPath
# crond

echo "Starting recording @ $(date -u +"%Y-%m-%d_%H:%M:%SZ")"

ffmpeg -hide_banner -y \
  -loglevel error \
  -rtsp_transport tcp \
  -use_wallclock_as_timestamps 1 \
  -i $INPUT_STREAM \
  -metadata title="$TITLE" \
  -metadata comment="$COMMENT" \
  -vcodec copy \
  -acodec copy \
  -f segment \
  -reset_timestamps 1 \
  -segment_time $SPLIT_TIME \
  -segment_format mkv \
  -segment_atclocktime 1 \
  -strftime 1 \
  /data/%Y-%m-%d_%H-%M-%S.mkv
