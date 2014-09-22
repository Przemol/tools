fetchChromSizes ce10 > ce10.chrom.sizes

mkdir log
for f in `ls *bed`; do 
bedToBigBed $f ce10.chrom.sizes $f.bb
done;