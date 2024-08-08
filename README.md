
# AutoDeOldifyLocal

Automatic silent installer scripts for setting up DeOldify on Jupyter Lab.

**With this installer, you get a fully operational Jupyter Lab environment that you can also use for other projects.**

## Setup Instructions

**Important: Do not run these commands as root.**

1. **Clone the repository:**
    ```bash
    git clone https://github.com/daddyparodz/AutoDeOldifyLocal.git
    cd AutoDeOldifyLocal
    ```

2. **Make the scripts executable:**
    ```bash
    sudo chmod +x *.sh
    ```

3. **Run the setup scripts:**
    ```bash
    ./fix.sh
    ./setup.sh
    ```
    *Note:* `fix.sh` is designed for WSL (tested on Ubuntu 20.04.3 LTS).

## Post-Setup Instructions

After completing the setup, run the following commands **from a new shell**:

1. **Navigate to the DeOldify directory:**
    ```bash
    cd DeOldify
    ```

2. **Activate the Conda environment:**
    ```bash
    conda activate deoldify
    ```

3. **Generate Jupyter server configuration:**
    ```bash
    jupyter server --generate-config
    ```

4. **Start Jupyter Lab:**
    ```bash
    jupyter lab
    ```

*Note:* If the `conda` command is not recognized, use the full path to Conda:
```bash
~/miniconda3/bin/conda activate deoldify
```

**Important:** Do not execute the first two cells in the `.ipynb` file, as you have already cloned the DeOldify repository and navigated to it.

## Restarting the Server

If you need to restart the server and encounter an error related to Tornado version, resolve it by running:
```bash
pip3 install tornado --upgrade
```

Then, start Jupyter Lab again (make sure you are in the DeOldify directory) with:
```bash
conda activate deoldify
jupyter lab
```

---

If you encounter any issues, please open an issue and I'll assist you. Thanks.
