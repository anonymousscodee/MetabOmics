#!/bin/bash      
#SBATCH -A mvmatk
#SBATCH -p core40q
#SBATCH -n 4
#SBATCH -N 1
#SBATCH --ntasks-per-node=40
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=canb22@itu.edu.tr
# TIMESTAMP=$(date "+%Y%m%d_%H%M%S")
# FILE_NAME=outputs2/$1_$TIMESTAMP.txt
# echo $FILE_NAME

# Load module
module load Python/python-3.8.8-openmpi-3.1.6-intel-2017.4
# Activate virtual env
source /okyanus/users/bcan/metabolitics-dev/venv/bin/activate
# Run Python script
python main.py
# python main.py >> $FILE_NAME
# python breast-ml-pipeline.py
# Deactivate the env
deactivate
echo "DONE!"