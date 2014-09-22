#2.0) align all SE fastqs in the folder using backtrack


    mkdir log
    for f in `ls *fastq.gz`; do 
        g=$(basename $ref)
    	echo '-> Aligning: ' $f ' to ' $g
    	echo "bwa samse $ref <(bwa aln -t 8 $ref $f) $f \
    	| samtools_mt view -@ 8 -Su - | samtools_mt sort -@ 8 - $f" \
    	| qsub -cwd -pe slots 8 -N alnse_$f -S /bin/bash -m n -o log/se_$f.txt -sync n -j y
    	echo	
    done;