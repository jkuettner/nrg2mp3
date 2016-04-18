# nrg2mp3
Docker image to convert *.nrg (Audio CD) Images to mp3 files.

## Install
First clone this repositoriy and build the image:
```sh
git clone https://github.com/jkuettner/nrg2mp3.git
cd nrg2mp3
docker build -t jkuettner/nrg2mp3 .
```

## Usage
```sh
docker run \
  --rm \
  -ti \
  -e "MP3_BITRATE=320" \
  -e "MP3_QUALITY=0" \
  -v /path/to/your/*.nrg-Image(s):/rip \
  jkuettner/nrg2mp3
```

### Parameters
`MP3_BITRATE` defines the lame parameter `-b` (Bitrate). See `man lame` for further details.  Default: "320"
`MP3_QUALITY` defines the lame parameter `-V` (Quality). See `man lame` for further details. Default: "0"


## Example
Lets say you have nrg-images in /tmp/nrg/:
```sh
/tmp/nrg# ls -1
image1.nrg
image2.nrg
image3.nrg
```

With this docker image you are able to rip all of these images into mp3 files with separate output directories.

```sh
docker run \
  --rm \
  -ti \
  -v /tmp/nrg:/rip \
  jkuettner/nrg2mp3
```

will result in separate output directories:

```sh
/tmp/nrg# ls -1
image1.nrg
image1.nrg.out
image2.nrg
image2.nrg.out
image3.nrg
image3.nrg.out
```

```sh
/tmp/nrg# ls -1 image1.nrg.out/
track01.cdda.mp3
track02.cdda.mp3
track03.cdda.mp3
track04.cdda.mp3
track05.cdda.mp3
track06.cdda.mp3
track07.cdda.mp3
track08.cdda.mp3
```
