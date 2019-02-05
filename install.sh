sudo apt install build-essential bzip2 tmux htop -y

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3.sh

bash ~/miniconda3.sh -b -p $HOME/miniconda3
echo ". $HOME/miniconda3/etc/profile.d/conda.sh" >> .bashrc
export PATH="$HOME/miniconda3/bin:$PATH"
. $HOME/miniconda3/etc/profile.d/conda.sh

conda update -n base -c defaults conda -y
conda config --add channels conda-forge
conda config --add channels pytorch

conda create --name sci python=3.6.8 pip pytorch-nightly torchvision cuda100 numpy scipy ipython scikit-image pandas py4j tqdm tensorflow protobuf -y
conda activate sci
pip install git+https://github.com/lanpa/tensorboardX.git@master
pip install git+https://github.com/AOtools/aotools.git
