FROM jrottenberg/ffmpeg

COPY midi2mp3.sh .
RUN mkdir -p /tmp/input
RUN apt-get install -qy timidity tree zip
