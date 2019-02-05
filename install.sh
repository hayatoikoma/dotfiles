# Install cuda-related packages
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update
sudo apt upgrade -y
sudo apt install build-essential bzip2 tmux htop default-jdk zsh nvidia-410 -y

# Install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# Install nerd fonts
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh
cd ~

# Install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3.sh

bash ~/miniconda3.sh -b -p $HOME/miniconda3
echo ". $HOME/miniconda3/etc/profile.d/conda.sh" >> .bashrc
export PATH="$HOME/miniconda3/bin:$PATH"
. $HOME/miniconda3/etc/profile.d/conda.sh

# Create a new environment called sci with useful packages
conda update -n base -c defaults conda -y
conda config --add channels conda-forge
conda config --add channels pytorch
conda create --name sci python=3.6.8 pip pytorch-nightly cuda100 numpy scipy ipython scikit-image pandas py4j tqdm tensorflow protobuf matplotlib -y
conda activate sci
pip install torchvision
pip install git+https://github.com/lanpa/tensorboardX.git@master
pip install git+https://github.com/AOtools/aotools.git

sudo reboot now
