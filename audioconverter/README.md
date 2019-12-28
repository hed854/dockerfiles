# Audioconverter

```
docker run --rm -it --entrypoint '' -v $(pwd)/input:/tmp/input audioconverter /bin/bash
timidity /tmp/input/file.mid -0w -o - | ffmpeg -i - -acodec libmp3lame -ab 64k /tmp/input/file.mp3
curl --upload-file input/file.mp3 https://transfer.sh/file.mp3
```
