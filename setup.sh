#!/bin/bash

# Exit on error
set -e

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update && sudo apt upgrade -y

# Install required packages
echo "Installing required packages..."
sudo apt install -y ffmpeg curl git

# Clone the DeOldify repository
if [ ! -d "DeOldify" ]; then
    echo "Cloning DeOldify repository..."
    git clone https://github.com/jantic/DeOldify.git DeOldify
else
    echo "DeOldify repository already exists."
fi

# Navigate to the DeOldify directory
cd DeOldify

# Download and install Miniconda
if [ ! -f "Miniconda3-latest-Linux-x86_64.sh" ]; then
    echo "Downloading Miniconda installer..."
    curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
else
    echo "Miniconda installer already downloaded."
fi

echo "Installing Miniconda..."
sudo chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh -b -p ~/miniconda3
rm Miniconda3-latest-Linux-x86_64.sh

# Update PATH and initialize conda
if ! grep -q 'miniconda3/bin' ~/.bashrc; then
    echo "Updating PATH for Miniconda..."
    echo 'export PATH=~/miniconda3/bin:$PATH' | sudo tee -a ~/.bashrc
fi

source ~/.bashrc

if ! ~/miniconda3/bin/conda info --envs | grep -q 'deoldify'; then
    echo "Initializing Conda..."
    ~/miniconda3/bin/conda init
fi

# Create the conda environment
echo "Creating Conda environment..."
~/miniconda3/bin/conda env create -f environment.yml

# Install Jupyter core
echo "Installing Jupyter core..."
sudo apt install -y jupyter-core

# Download the model file
MODEL_PATH="models/ColorizeArtistic_gen.pth"
if [ ! -f "$MODEL_PATH" ]; then
    echo "Downloading model file..."
    curl -L https://huggingface.co/spaces/aryadytm/photo-colorization/resolve/main/models/ColorizeArtistic_gen.pth?download=true -o $MODEL_PATH
else
    echo "Model file already exists."
fi

# Print the contents of the instructions file
echo
if [ -f "run_one_by_one_to_start_first_time.txt" ]; then
    echo "------READ THIS------"
    cat run_one_by_one_to_start_first_time.txt
else
    echo "Instructions file 'run_one_by_one_to_start_first_time.txt' not found."
fi
