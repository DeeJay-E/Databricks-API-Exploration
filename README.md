# DevContainerTemplate

This container creates an image ready to use **Python 3.12** with a CUDA-enabled version of PyTorch along with some common Machine Learning, Math, Statistics, and Visualization imports.

## Features

- **Python 3.12** on Ubuntu 24.04 LTS
- **CUDA 12.6** support for GPU acceleration
- **Poetry** for dependency management
- Pre-configured development environment with common ML libraries:
  - PyTorch with CUDA support
  - NumPy, Pandas, Scikit-learn
  - Matplotlib, Seaborn for visualization
  - Jupyter Notebook support
  - Development tools (Black, MyPy, isort, flake8)

## Getting Started

1. **Open in VS Code**: Open this repository in VS Code and click "Reopen in Container" when prompted.

2. **Add Dependencies**: You can add additional imports using the terminal command:
   ```bash
   poetry add <package-name>
   ```

3. **Verify Installation**: After the container builds, verify your setup:
   ```bash
   python --version  # Should show Python 3.12.x
   poetry --version
   localpy --version  # Alias to virtual environment Python
   ```

## System Requirements

- **GPU**: NVIDIA GPU with CUDA 12.4 support
- **Docker**: Docker Desktop with GPU support enabled
- **VS Code**: With Dev Containers extension

## Container Structure

- **Base Image**: `nvidia/cuda:12.4.0-devel-ubuntu24.04`
- **Python Version**: 3.12 (native to Ubuntu 24.04)
- **Package Manager**: Poetry with virtual environment in project
- **User**: Non-root `developer` user with sudo access

## Usage

The container provides several ways to run Python:

- `python` or `python3` - System Python 3.12
- `localpy` - Alias to your Poetry virtual environment Python
- Through VS Code's integrated terminal and Python extension

## Troubleshooting

If you encounter issues:

1. **Rebuild Container**: Use Command Palette → "Dev Containers: Rebuild Container"
2. **Check CUDA**: Verify GPU access with `nvidia-smi`
3. **Poetry Issues**: Run `poetry install` to reinstall dependencies