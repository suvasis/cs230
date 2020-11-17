#!/bin/bash

config_path=$1
#output_dir=$2
#tcp_port=$3
workers=$2
batch_size=$3
epochs=$4
n_tasks=$5


# from https://pytorch.org/tutorials/beginner/aws_distributed_training_tutorial.html
export NCCL_SOCKET_IFNAME=ens3

    #python_args="--launcher aws
    #             --workers=${workers}
    #             --tcp_port=${tcp_port}
    ##             --cfg_file=${config_path}
    #             --batch_size=${batch_size}
    #             --epoch=${epoch}
    #             --extra_tag=$(basename ${output_dir})
    #             --local_rank=${i}"


for i in $(seq 0 ${n_tasks}); do
    outputdir=/projectdata/OpenPCDet/tools/someoutput
    #python_args="--launcher 
    python_args="--launcher none
                 --workers=${workers}
                 --cfg_file=${config_path}
                 --batch_size=${batch_size}
                 --epoch=${epochs}
                 #--extra_tag=$(basename ${output_dir})
                 --extra_tag ${outputdir}
                 --local_rank=${i}"

    mycmd=(python -u train.py)
    mycmd+=(${python_args})

    echo "${mycmd[@]}"
    echo ""

    if [ "${i}" = "0" ]; then

        # log output of local_rank=0
        eval "${mycmd[@]}" &>> ${outputdir}/train.out &

    elif [ "${i}" = "${n_tasks}" ]; then

        # wait after issuing the last training command
        eval "${mycmd[@]}"

    else

        # continue after issuing every other training command
        eval "${mycmd[@]}" &

    fi

done
