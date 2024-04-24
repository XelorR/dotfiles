# How to run KonSave in Docker container

Create:
```bash
sudo docker build -t konsave -f konsave.dockerfile .
```

Run:
```bash
sudo docker run -it --rm -v $HOME:/home/user --name konsave konsave bash
```
