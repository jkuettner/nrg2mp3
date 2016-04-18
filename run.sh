#!/bin/bash
cd ${IMAGE_DIR}

for image in $(find . -type f -name "*.nrg"); do
    OUT_DIR=${IMAGE_DIR}/${image}.out
    mkdir -p ${OUT_DIR}
    cd ${OUT_DIR}
    cd-paranoia -d ../${image} -B
    for wav in $(find . -type f -name "*.wav"); do
        lame -h -V ${MP3_QUALITY} -b ${MP3_BITRATE} "${wav}" "${wav%.wav}.mp3"
        if [[ ${?} -eq 0 ]]; then
            rm "${wav}"
        fi
    done
done
