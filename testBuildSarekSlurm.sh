#!/bin/bash
#SBATCH --job-name=testSarek
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=jtk622@gmail.com
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=17gb
#SBATCH --time=10:00:00
#SBATCH --output=nextflow_%j.log


pwd; hostname; date

# load modules

module load singularity
module load nextflow/0.32.0

echo "Running nextflow script on HiPerGator"

nextflow run buildReferences.nf --outDir References/smallGRCh37 --refDir Sarek-data/reference  --genome smallGRCh37 --genome_base References/smallGRCh37 --tag latest -profile singularityslurm

date
