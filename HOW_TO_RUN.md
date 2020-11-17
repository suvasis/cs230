install 

Follow: https://github.com/open-mmlab/OpenPCDet/blob/master/README.md

conda activate <env>

cd <home>/OpenPCDet
mkdir output
cd tools

#to train
./aws_driver.sh cfgs/kitti_models/modified_pv_rcnn.yaml 1 1 15 1 'pytorch'


