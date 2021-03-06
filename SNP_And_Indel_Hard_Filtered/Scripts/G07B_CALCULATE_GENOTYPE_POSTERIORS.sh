#$ -S /bin/bash
#$ -q rnd.q,prod.q,test.q,bigdata.q,bigmem.q
#$ -cwd
#$ -V
#$ -p -20

JAVA_1_7=$1
GATK_DIR_NIGHTLY=$2
KEY=$3
REF_GENOME=$4
P3_1KG=$5
ExAC=$6

CORE_PATH=$7
PROJECT=$8
PREFIX=$9


CMD=$JAVA_1_7'/java -jar'
CMD=$CMD' '$GATK_DIR_NIGHTLY'/GenomeAnalysisTK.jar'
CMD=$CMD' -T CalculateGenotypePosteriors'
CMD=$CMD' -R '$REF_GENOME
CMD=$CMD' --variant '$CORE_PATH'/'$PROJECT'/MULTI_SAMPLE/'$PREFIX'.HC.HardFiltered.SNP.INDEL.vcf'
CMD=$CMD' --supporting '$P3_1KG
CMD=$CMD' --supporting '$ExAC
CMD=$CMD' --disable_auto_index_creation_and_locking_when_reading_rods'
CMD=$CMD' -et NO_ET'
CMD=$CMD' -K '$KEY
CMD=$CMD' -o '$CORE_PATH'/'$PROJECT'/MULTI_SAMPLE/'$PREFIX'.BEDsuperset.HF.1KG.ExAC3.REFINED.temp.vcf'

echo $CMD >> $CORE_PATH/$PROJECT/command_lines.txt
echo >> $CORE_PATH/$PROJECT/command_lines.txt
echo $CMD | bash

# $JAVA_1_7/java -jar $GATK_DIR_NIGHTLY/GenomeAnalysisTK.jar \
# -T CalculateGenotypePosteriors \
# -R $REF_GENOME \
# --variant $CORE_PATH/$PROJECT/MULTI_SAMPLE/$PREFIX".HC.SNP.INDEL.HARDFILTERED.vcf" \
# --supporting $P3_1KG \
# --supporting $ExAC \
# --disable_auto_index_creation_and_locking_when_reading_rods \
# -et NO_ET \
# -K $KEY \
# -o $CORE_PATH/$PROJECT/MULTI_SAMPLE/$PREFIX".BEDsuperset.HF.1KG.ExAC3.REFINED.temp.vcf"
