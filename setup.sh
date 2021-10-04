sudo apt update && sudo apt upgrade -y
sudo apt-get update && sudo apt-get upgrade -y
git clone https://github.com/jantic/DeOldify.git DeOldify
sudo apt install ffmpeg -y
cd DeOldify
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh
sudo chmod +x Miniconda3-py39_4.10.3-Linux-x86_64.sh
./Miniconda3-py39_4.10.3-Linux-x86_64.sh
rm Miniconda3-py39_4.10.3-Linux-x86_64.sh
sudo echo 'export PATH=~/miniconda3/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
~/miniconda3/bin/conda init
~/miniconda3/bin/conda env create -f environment.yml
sudo apt install jupyter-core -y
echo 
echo ------READ THIS------
echo NOW OPEN ANOTHER SHELL, THEN
echo RUN THE COMMANDS IN THE TXT FILE [ALSO LISTED HERE]
echo cd DeOldify
echo conda activate deoldify
echo jupyter server --generate-config
echo jupyter server password
echo jupyter lab