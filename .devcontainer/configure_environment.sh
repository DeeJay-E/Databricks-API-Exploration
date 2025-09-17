export DEBIAN_FRONTEND=noninteractive

# ==========================
# Basic package installation
# ==========================

echo "Installing basic packages for Python 3.12..."

apt-get -y update \
&& apt-get install -yq curl vim git python3.12 python3.12-dev python3.12-venv python3-pip npm \
    software-properties-common wget build-essential \
&& apt-get clean

if [ $? -eq 0 ]; then
    echo "Basic packages installed!"
else
    echo "Failed to install basic packages."
    exit 1
fi

echo "root ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

if grep -q "^root ALL=(ALL) NOPASSWD:ALL" /etc/sudoers; then
    echo "Enabled sudo for root!"
else
    echo "Failed to enable sudo for root."
    exit 1
fi

# Create symbolic links for python3.12
echo "Creating Python 3.12 symbolic links..."
ln -sf /usr/bin/python3.12 /usr/bin/python3
ln -sf /usr/bin/python3.12 /usr/bin/python

# Upgrade pip for Python 3.12
echo "Upgrading pip for Python 3.12..."
python3.12 -m pip install --upgrade pip

user_name="developer"
group_name="developer"

developer_home="/home/$user_name"

# ===================
# Poetry installation
# ===================

poetry_dir=".local/bin"
poetry_command="$developer_home/$poetry_dir/poetry"
install_command="curl -sSL https://install.python-poetry.org | python3.12 -"

echo "Installing Poetry for Python 3.12..."

sudo -u "$user_name" bash -c "$install_command"

if "$poetry_command" --version &>/dev/null; then
    echo "Poetry installed!"
else
    echo "Failed to install Poetry."
fi

echo "Adding Poetry to path..."

echo "export PATH=\"$developer_home/$poetry_dir:\$PATH\"" >> $developer_home/.bashrc

echo "Configuring Poetry virtual environments..."

sudo -u "$user_name" "$poetry_command" config virtualenvs.in-project true

echo "Installing repository dependencies..."

sudo -u "$user_name" "$poetry_command" install --with dev --no-root

if [ $? -eq 0 ]; then
    echo "Repository dependencies installed!"
else
    echo "Failed to install repository dependencies."
fi

echo "Success!"

exit 0