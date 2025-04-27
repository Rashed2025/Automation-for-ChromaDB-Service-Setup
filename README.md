# Automation for ChromaDB Service Setup

This project provides a Bash script that **automates the deployment and setup of a ChromaDB service** on any **fresh Virtual Machine (VM)**.  
It covers everything from installing required packages to configuring ChromaDB to run as a persistent `systemd` service.

---

## Author

**Rashed M. Alghamdi**  
[LinkedIn : EngRashed1](https://www.linkedin.com/in/engrashed1)

---

## Features

- Updates the system and installs necessary packages (`python3-pip`, `python3-venv`, `git`).
- Clones a specified GitHub repository.
- Creates and activates a Python virtual environment.
- Installs Python dependencies from `requirements.txt`.
- Configures ChromaDB to run continuously as a `systemd` service.

---

## How to Use

1. **Clone this repository** to your VM:

   ```bash
   git clone <your-this-repo-url>
   cd <repo-folder-name>
   ```

2. **Edit the script** (`automation-for-chromadb.sh`) to set your custom variables if needed:

   ```bash
   REPO_URL="<your-repo-url>"
   REPO_NAME="<your-repo-name>"
   SERVICE_NAME="<your-service-name>"
   ```

   > You can use your own project repository or refer to the example variables provided inside the script.

3. **Make the script executable**:

   ```bash
   chmod +x automation-for-chromadb.sh
   ```

4. **Run the script**:

   ```bash
   ./automation-for-chromadb.sh
   ```

5. **Check the status of the service**:

   ```bash
   sudo systemctl status <your-service-name>
   ```

---

## Important Notes

- Ensure your repository includes a `requirements.txt` file containing all required Python packages.
- The service will restart automatically if the system reboots or if the service stops unexpectedly.
- The `chroma run` command must exist and be properly configured inside the project.

---

## Potential Issues

- **File Ownership:** After creating the service file, you might need to set the correct ownership of the file. Use the following command if needed:

  ```bash
  sudo chown root:root /etc/systemd/system/<your-service-name>.service
  ```

  This ensures that the service file has the correct permissions and avoids startup errors.

---

## Example Variable Values (as shown in the script)

```bash
REPO_URL="https://github.com/Rashed2025/6.5-Terraform.git"
REPO_NAME="6.5-Terraform"
SERVICE_NAME="chromadb"
```

You can replace them with your own values based on your project setup.

---

## License

This script is provided for educational and automation purposes.  
Feel free to modify and adapt it to your specific needs.

