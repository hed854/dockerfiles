#!/bin/bash

# install tree and zip

INPUT_FILE="$1"
OUTPUT_TYPE="mp3"

cd /tmp/input
unzip INPUT_FILE 
mkdir ${OUTPUT_TYPE}

for dir in */; do
#	echo "$dir"
  # Create mirror in output dir
  mkdir -p ${OUTPUT_TYPE}/${dir}
  for file in ${dir}; do
      if [[ $file == *.kar || $file == *.mid ]]; then
        timidity $file -0w -o - | ffmpeg -i - -acodec libmp3lame -ab 64k ${OUTPUT_TYPE}/${dir}
      fi
    done
done

zip -r ${OUTPUT_TYPE}.zip ${OUTPUT_TYPE}

curl --upload-file ${OUTPUT_TYPE}.zip https://transfer.sh/${OUTPUT_TYPE}.zip
