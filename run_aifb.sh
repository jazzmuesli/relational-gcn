
cd rgcn
python prepare_dataset.py -d aifb
python train.py -d aifb --bases 0 --hidden 16 --l2norm 0. --testing
