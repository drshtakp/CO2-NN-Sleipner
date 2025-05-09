#!/bin/bash
#SBATCH -A standby                            # Account name
#SBATCH --nodes=1                            # Request 1 node
#SBATCH --ntasks=1                           # One task total
#SBATCH --cpus-per-task=24                   # 24 CPU cores for your training
#SBATCH --gpus-per-node=1                    # 1 GPU required for Gilbreth
#SBATCH --time=04:00:00                      # Wall time: reduced to 4 hours to comply with policy
#SBATCH --job-name=CO2_NN                    # Job name
#SBATCH --output=CO2_NN_%j.out               # Output log file with job ID
#SBATCH --error=CO2_NN_%j.err                # Error log file

# Load your environment
source ~/.bashrc
conda activate /scratch/gilbreth/pate2126/pate2126env   # Activate your custom conda env

# Change explicitly to your job directory
cd /scratch/gilbreth/pate2126/DKP/job_CO2_NN

# Print job and system info
echo "Job started on $(date)"
echo "Running on node: $(hostname)"
echo "Current directory: $(pwd)"

# Run your Python script
python CO2_identify.py

# Print completion time
echo "Job ended on $(date)"
