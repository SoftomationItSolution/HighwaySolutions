#!/bin/bash
# Absolute path to miniconda base
CONDA_BASE="/home/mcube/miniconda3"

# Activate your conda env and run the app
source "$CONDA_BASE/etc/profile.d/conda.sh"
conda activate pysy
python /home/mcube/Documents/PySwbApp/main.py
