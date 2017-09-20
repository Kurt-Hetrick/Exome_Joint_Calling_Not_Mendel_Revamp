#$ -S /bin/bash
#$ -q rnd.q,prod.q,test.q,bigdata.q,bigmem.q
#$ -cwd
#$ -V
#$ -p -20

TABIX_DIR=$1

CORE_PATH=$2
PROJECT=$3
PREFIX=$4

CMD1=$TABIX_DIR'/bgzip -c '$CORE_PATH'/'$PROJECT'/MULTI_SAMPLE/'$PREFIX'.HC.HardFiltered.SNP.INDEL.vcf'
CMD1=$CMD1' >| '$CORE_PATH'/'$PROJECT'/MULTI_SAMPLE/'$PREFIX'.HC.HardFiltered.SNP.INDEL.vcf.gz'

CMD2=$TABIX_DIR'/tabix -p vcf -f '$CORE_PATH'/'$PROJECT'/MULTI_SAMPLE/'$PREFIX'.HC.HardFiltered.SNP.INDEL.vcf.gz'

echo $CMD1 >> $CORE_PATH/$PROJECT/command_lines.txt
echo >> $CORE_PATH/$PROJECT/command_lines.txt
echo $CMD1 | bash

echo $CMD2 >> $CORE_PATH/$PROJECT/command_lines.txt
echo >> $CORE_PATH/$PROJECT/command_lines.txt
echo $CMD2 | bash

# $TABIX_DIR/bgzip -c $CORE_PATH/$PROJECT/MULTI_SAMPLE/$PREFIX".HC.SNP.INDEL.HARDFILTERED.vcf" \
# >| $CORE_PATH/$PROJECT/MULTI_SAMPLE/$PREFIX".HC.SNP.INDEL.HARDFILTERED.vcf.gz"

# $TABIX_DIR/tabix -p vcf -f $CORE_PATH/$PROJECT/MULTI_SAMPLE/$PREFIX".HC.SNP.INDEL.HARDFILTERED.vcf.gz"