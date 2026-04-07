#!/bin/bash      
#SBATCH -A mvmatk
#SBATCH -p bigmemq
#SBATCH -N 1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sahinay21@itu.edu.tr


# Load Anaconda module first
module load Anaconda/Anaconda3-2021.05-python3.8.8

# Extra command for conda
source /okyanus/progs/ANACONDA/Anaconda3-2021.05-python3.8/etc/profile.d/conda.sh

# Activate discoverer env for script
conda activate metaboliticsenv

# Run Python script
python main_metabGene_pdac_v1.py

# Deactivate
conda deactivate