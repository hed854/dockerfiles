# Audioconverter

0) Import a zip file with audio

curl https://transfer.sh/abcd/myzip.zip -o input/myzip.zip

1) Launch Audioconverter

```
docker run --rm -it --entrypoint '' -v $(pwd)/input:/tmp/input audioconverter midi.py /tmp/input/myzip.zip
```

2) Get the converted zip

