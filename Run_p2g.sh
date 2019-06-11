#!/bin/bash -l
#SBATCH --ntasks=64
#SBATCH --nodes=1


cd ~/bigdata/Csativa

module load funannotate/git-live
module load diamond

/bigdata/bioinfo/pkgadmin/opt/linux/centos/7.x/x86_64/pkgs/funannotate/git-live/bin/funannotate-p2g.py -p FAPredict/predict_misc/proteins.combined.fa -g /bigdata/littlab/arajewski/Csativa/FAPredict/predict_misc/genome.softmasked.fa -o FAPredict/predict_misc/exonerate.out --maxintron 3000 --cpus 64 --ploidy 1 -f diamond --tblastn_out FAPredict/predict_misc/p2g.tblastn.out --logfile FAPredict/logfiles/funannotate-p2g.log
