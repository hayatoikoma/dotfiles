# Install gcsfuse
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Install cuda-related packages
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update
sudo apt upgrade -y
sudo apt install build-essential bzip2 tmux htop default-jdk zsh nvidia-410 gcsfuse -y

# Install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# Install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3.sh
cd ~

bash ~/miniconda3.sh -b -p $HOME/miniconda3
echo ". $HOME/miniconda3/etc/profile.d/conda.sh" >> ~/.zshrc
export PATH="$HOME/miniconda3/bin:$PATH"
. $HOME/miniconda3/etc/profile.d/conda.sh

# Create a new environment called sci with useful packages
conda update -n base -c defaults conda -y
conda config --add channels conda-forge
conda config --add channels pytorch
conda create --name sci python=3.6.8 pip pyyaml pytorch-nightly cudatoolkit=10.0 numpy scipy ipython scikit-image pandas py4j=0.10.8.1 tqdm tensorflow protobuf matplotlib -y
conda activate sci
pip install torchvision
pip install tensorboardX==1.5
pip install aotools
pip install git+https://github.com/hayatoikoma/trackpy.git@master

sudo chsh -s $(which zsh) "$USER"

ipython profile create
cp ipython_config.py ~/.ipython/profile_default

rm ~/miniconda3.sh
sudo reboot now
