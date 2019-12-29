# Audioconverter

0) Import a zip file with audio

```
curl https://transfer.sh/abcd/myzip.zip -o input/myzip.zip
```

1) Launch Audioconverter

```
docker run --rm -it --entrypoint '' -v $(pwd)/input:/tmp/input audioconverter midi2mp3.sh /tmp/input/myzip.zip
```

2) Get the converted zip

```
curl --upload-file myzip.zip https://transfer.sh/myzip.zip
```
