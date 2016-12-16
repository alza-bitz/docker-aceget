# docker-aceget

A Docker recipe for making [Acestream](http://acestream.org/) streams available as a simple HTTP url for your favourite video player, using [aceget](https://aur.archlinux.org/packages/aceget/).

## Credits

The included `aceget.exp` Expect script is derived from  https://aur.archlinux.org/cgit/aur.git/tree/aceget.exp?h=aceget

## Dependencies

Depends on [docker.io/centos:7](https://hub.docker.com/_/centos/).

## Install

### Docker Build

```
git clone https://github.com/alzadude/docker-aceget.git
cd docker-aceget
docker build --rm -t alzadude/aceget .
```

### Docker Pull

```
docker pull alzadude/aceget
```

## Usage

### With an Acestream PID:
```
docker run -p 6878:6878 -i -t alzadude/aceget PID <acestream-pid>
```
Then open the displayed url in your favourite video player.
Press `ctrl+c` to close the stream and quit.

## License

MIT
