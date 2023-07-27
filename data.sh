#! /bin/bash
# You should not distribute the URLs in this script; Log in first at https://image-net.org/challenges/LSVRC/2012/2012-downloads.php
mkdir imagenet
wget https://image-net.org/data/ILSVRC/2012/ILSVRC2012_img_val.tar -P imagenet
wget https://image-net.org/data/ILSVRC/2012/ILSVRC2012_img_train.tar -P imagenet

# extract train data
mkdir train && mv ILSVRC2012_img_train.tar train/ && cd train
tar -xvf ILSVRC2012_img_train.tar && rm -f ILSVRC2012_img_train.tar
find . -name "*.tar" | while read NAME ; do mkdir -p "${NAME%.tar}"; tar -xvf "${NAME}" -C "${NAME%.tar}"; rm -f "${NAME}"; done
# extract validation data
cd ../ && mkdir val && mv ILSVRC2012_img_val.tar val/ && cd val && tar -xvf ILSVRC2012_img_val.tar
wget -qO- https://raw.githubusercontent.com/soumith/imagenetloader.torch/master/valprep.sh | bash