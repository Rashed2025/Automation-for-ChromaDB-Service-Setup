#!/bin/bash

# This script automates the setup of a ChromaDB service on any fresh Virtual Machine (VM) from scratch.
# It installs the necessary packages, clones your project repository, sets up a Python virtual environment,
# installs dependencies, and configures ChromaDB to run as a persistent systemd service.

# Update system and install necessary packages
sudo apt update && sudo apt install -y python3-pip python3-venv git

# Define variables
# You can use your own variables, or use the following as an example:
# REPO_URL="https://github.com/Rashed2025/6.5-Terraform.git"
# REPO_NAME="6.5-Terraform"
# SERVICE_NAME="chromadb"

REPO_URL="<your-repo-url>"
REPO_NAME="<your-repo-name>"
SERVICE_NAME="<your-service-name>"
USER_NAME="$(whoami)"
WORKING_DIR="/home/$USER_NAME/$REPO_NAME"

# Clone the GitHub repository
cd ~
git clone "$REPO_URL"
cd "$REPO_NAME"

# Create and activate Python virtual environment
python3 -m venv myenv
source myenv/bin/activate

# Install project dependencies
pip install -r requirements.txt

# Create the systemd service
sudo tee /etc/systemd/system/$SERVICE_NAME.service > /dev/null <<EOF
[Unit]
Description=$SERVICE_NAME Service
After=network.target

[Service]
Type=simple
User=$USER_NAME
WorkingDirectory=$WORKING_DIR
ExecStart=$WORKING_DIR/myenv/bin/chroma run --path $WORKING_DIR/mydata --host 0.0.0.0 --port 8000
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd and start the service
sudo systemctl daemon-reload
sudo systemctl enable $SERVICE_NAME
sudo systemctl start $SERVICE_NAME
