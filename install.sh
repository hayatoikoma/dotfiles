sudo apt install git build-essential bzip2 tmux htop -y

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3.sh

bash ~/miniconda3.sh -b -p $HOME/miniconda3
echo ". $HOME/miniconda3/etc/profile.d/conda.sh" >> .bashrc
. $HOME/miniconda3/etc/profile.d/conda.sh

conda update -n base -c defaults conda -y
conda config --add channels conda-forge

conda env create -f environment.yml
