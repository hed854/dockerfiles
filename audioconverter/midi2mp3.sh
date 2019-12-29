#!/bin/bash

# install tree and zip

INPUT_FILE="$1"
OUTPUT_FOLDER="mp3"

if [ ! -d ${OUTPUT_FOLDER} ]; then
  mkdir -p ${OUTPUT_FOLDER}
else
  rm -rf ${OUTPUT_FOLDER}/*
fi

unzip ${INPUT_FILE} -d ${OUTPUT_FOLDER}

# get file list
find ${OUTPUT_FOLDER} \( -name '*.kar' -o -name '*.mid' \) > filelist.txt

# convert based on the file list
while read line; do
  timidity "${line}" -Ow -o - | ffmpeg -i - -acodec libmp3lame -ab 64k "${line}.mp3" ;
done < filelist.txt

# remove midi files
find ${OUTPUT_FOLDER} \( -name '*.kar' -o -name '*.mid' \) -exec rm -rf {} \;

# zip output
zip -r ${OUTPUT_FOLDER}.zip ${OUTPUT_FOLDER}
mv ${OUTPUT_FOLDER}.zip /tmp/input
