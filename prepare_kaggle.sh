#!/usr/bin/env bash

mkdir -p models/pytorch
mkdir -p data/coco/person_detection_results

cd data/coco/person_detection_results
wget "https://drive.google.com/uc?export=download&id=1ygw57X-mh0QBfENB-U5DsuSauGIu-8RB" -O COCO_val2017_detections_AP_H_56_person.json
cd ../../..

cd models/pytorch
pwd
wget https://s3.amazonaws.com/pytorch/models/resnet50-19c8e357.pth

cd ../..

pip install -r requirements.txt

cd lib
make
cd ..

git clone https://github.com/cocodataset/cocoapi.git COCO
cd COCO/PythonAPI
# Install into global site-packages
make install
cd ../..