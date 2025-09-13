# update system
sudo apt-get update
sudo apt-get upgrade -y
# install Linux tools and Python 3
sudo apt-get install software-properties-common wget curl \
    python3-dev python3-pip python3-wheel python3-setuptools -y
# install Python packages
sudo python3 -m pip install --upgrade pip
sudo pip3 install --user -r .devcontainer/requirements.txt
# update CUDA Linux GPG repository key
sudo wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo rm cuda-keyring_1.0-1_all.deb
# install cuDNN
sudo wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /" -y
sudo apt-get update
sudo apt-get install libcudnn8=8.9.0.*-1+cuda11.8
sudo apt-get install libcudnn8-dev=8.9.0.*-1+cuda11.8
# install recommended packages
sudo apt-get install zlib1g g++ freeglut3-dev \
        libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev libfreeimage-dev -y
# clean up
sudo pip3 cache purge
sudo apt-get autoremove -y
sudo apt-get clean