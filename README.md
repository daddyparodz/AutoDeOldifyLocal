# AutoDeOldifyLocal
Automatic silent installer scripts for DeOldify on Jupyter Lab


**[BTW with this automatic installer, you get a fully working jupyter lab you can use freely with your other projects aswell]**

### COMMANDS: [DON'T RUN AS ROOT]

```
git clone https://github.com/daddyparodz/AutoDeOldifyLocal.git
cd AutoDeOldifyLocal
sudo chmod +x *.sh
./fix.sh
./setup.sh
```
**fix.sh is for WSL, I used Ubuntu 20.04.3 LTS for testing.**

#### WHEN SETUP IS COMPLETED, YOU MUST RUN THESE COMMANDS MANUALLY **FROM A NEW SHELL**
```
cd DeOldify
conda activate deoldify
jupyter server --generate-config
jupyter server password
jupyter lab
```
*P.S.*

Sometimes the "conda" command alone does not work even if it's in PATH. In this case, use ```~/miniconda3/bin/conda activate deoldify```

*P.P.S.*

**DON'T RUN THE FIRST 2 CELLS IN THE .ipnyb file because you already have the Deoldify directory downloaded.  ("git clone ..." and "cd DeOldify")**

#### SECOND TIME ####

After you shut down the server and then decide to restart it, it COULD give an error saying that tornado isn't in the right version.

To fix this, you just need to run: ```pip3 install tornado --upgrade```

And then you can start your jupyter lab normally (**obviously in the DeOldify directory**) with

```
conda activate deoldify
jupyter lab
```

Hope it works, if it doesn't, please open an issue and I'll try to fix it. THX.
