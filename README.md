# Unofficial Implementation of LSKNet ImageNet Pretraining
This is a PyTorch implementation of **LSKNet (https://github.com/zcablii/LSKNet) ** ImageNet1K-Pretrain 


## Image Classification

Data prepare: ImageNet with the following folder structure.

```
│imagenet/
├──train/
│  ├── n01440764
│  │   ├── n01440764_10026.JPEG
│  │   ├── n01440764_10027.JPEG
│  │   ├── ......
│  ├── ......
├──val/
│  ├── n01440764
│  │   ├── ILSVRC2012_val_00000293.JPEG
│  │   ├── ILSVRC2012_val_00002138.JPEG
│  │   ├── ......
│  ├── ......
```



### 3.Requirement

```
1. Pytorch >= 1.7
2. timm == 0.4.12
```

### 4. Train 

We use 8 GPUs for training by default.  Run command (It has been writen in train.sh):

```bash
MODEL=lsknet_s 
DROP_PATH=0.1 
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 bash distributed_train.sh 8 /path/to/imagenet \
	  --model $MODEL -b 128 --lr 1e-3 --drop-path $DROP_PATH --amp --epochs 300 --model-ema
```
