#!/bin/bash
#SBATCH -A standby                             # Account name
#SBATCH --nodes=1                              # Request 1 node
#SBATCH --ntasks=1                             # One task total
#SBATCH --cpus-per-task=24                     # 24 CPU cores for your training
#SBATCH --gpus-per-node=1                      # 1 GPU for Gilbreth
#SBATCH --time=04:00:00                        # Run for 4 hours (can increase if needed)
#SBATCH --job-name=CO2_TrainNotebook           # Job name
#SBATCH --output=CO2_TrainNotebook_%j.out      # Output log
#SBATCH --error=CO2_TrainNotebook_%j.err       # Error log

# Load your conda environment
source ~/.bashrc
conda activate /scratch/gilbreth/pate2126/pate2126env

# Move to your working directory
cd /scratch/gilbreth/pate2126/3D

# Job info
echo "Job started on $(date)"
echo "Running on node: $(hostname)"
echo "Working directory: $(pwd)"
echo "Executing: Test_training_fulllabel.ipynb"

# Run the notebook
python Test_training_fulllabel.py

# End time
echo "Job ended on $(date)"

