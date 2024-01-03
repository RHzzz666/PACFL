for thresh in 7.2
do
    dir='../save_results/pacfl/noniid1-#label20/cifar100'
    if [ ! -e $dir ]; then
    mkdir -p $dir
    fi 
    
    python ../main_pacfl.py --trial=1 \
    --rounds=200 \
    --num_users=100 \
    --frac=0.1 \
    --local_ep=10 \
    --local_bs=10 \
    --lr=0.01 \
    --momentum=0.5 \
    --model=resnet9 \
    --dataset=cifar100 \
    --datadir='../../data/' \
    --logdir='../../logs/' \
    --savedir='../save_results/' \
    --partition='noniid1-#label20' \
    --alg='pacfl' \
    --beta=0.1 \
    --local_view \
    --noise=0 \
    --cluster_alpha=$thresh \
    --n_basis=4 \
    --linkage='average' \
    --gpu=0 \
    --print_freq=10 \
    2>&1 | tee $dir'/'$thresh'_1.txt'

done 
