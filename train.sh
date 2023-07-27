MODEL=lsknet_t # van_{b0, b1, b2, b3}
DROP_PATH=0.1

python3 train.py /root/imagenet \
		-b 128 --lr 1e-3 --drop-path $DROP_PATH --amp --epochs 300 --model $MODEL --model-ema 
