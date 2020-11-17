

1. copy the following files to respective OpenPCDet folder:

   a. __init__.py - copy to <home>/OpenPCDet/pcdet/models/backbones_3d/pfe

   b. aws_driver.sh - copy to <home>/OpenPCDet/tools/

   c. modified_pv_rcnn.yaml  - copy to <home>/OpenPCDet/tools/cfgs/kitti_models

   d. modified_voxel_set_abstraction.py - copy to <home>/OpenPCDet/pcdet/models/backbones_3d/pfe

   e. pointnet2_modules.py. - copy to <home>/OpenPCDet/pcdet/ops/pointnet2/pointnet2_stack


2. install :

Follow: https://github.com/open-mmlab/OpenPCDet/blob/master/README.md

conda activate <your env>

cd <home>/OpenPCDet
mkdir output
cd tools

#to train
./aws_driver.sh cfgs/kitti_models/modified_pv_rcnn.yaml 1 1 15 1 'pytorch'


