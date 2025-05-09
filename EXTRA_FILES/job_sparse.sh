#!/bin/bash
#SBATCH --account=standby                        # Your account
#SBATCH --job-name=SparseInputPrep               # Descriptive job name
#SBATCH --partition=gilbreth-standby             # Use GPU partition
#SBATCH --nodes=1                                # One node only
#SBATCH --ntasks=1                               # One task
#SBATCH --cpus-per-task=24                       # Enough for preprocessing
#SBATCH --gres=gpu:1                             # Request 1 available GPU
#SBATCH --mem=64G                                # Reasonable memory request
#SBATCH --time=02:00:00                          # Job will run up to 2 hours
#SBATCH --output=SparseInputPrep_%j.out          # Output log file
#SBATCH --error=SparseInputPrep_%j.err           # Error log file

# === Load Conda environment ===
source ~/.bashrc
conda activate /scratch/gilbreth/pate2126/pate2126env

# === Change to your script's directory ===
cd /scratch/gilbreth/pate2126/DKP/3D

# === Log basic job info ===
echo "========== JOB STARTED =========="
echo "Date      : $(date)"
echo "Node      : $(hostname)"
echo "Directory : $(pwd)"
echo "Script    : input_output_preparation_sparselabel.py"
echo "=================================="

# === Run the script ===
python Test_training_sparselabel.py


# === Job complete ===
echo "========== JOB COMPLETED =========="
echo "Date : $(date)"
