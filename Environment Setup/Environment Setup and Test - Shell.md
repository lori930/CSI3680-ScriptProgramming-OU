# Environment Setup and Test - Shell
## Step 1: Unix Shell Environment Setup
### Windows Users: use WSL (Windows Subsystem for Linux)
1. Enable WSL2 (Windows 10 or 11):
    - Open **PowerShell(Admin)** and run:
        ```
        wsl --install
        ```
    - Restart your computer
2. Install Ubuntu
    - From Microsoft Store, search for Ubuntu 22.04 LTC and install it.
3. Open Ubuntu:
    - Launch `Ubuntu` from Start Menu
    - Create a username & password
4. Update packages:
    ```
    sudo apt update && sudo apt upgrade -y
    ```
5. Test your shell:
    ```
    echo "Hello from Bash!"
    ```
### macOS Users: use built-in Terminal
1. Open **Terminal** (`Applications -> Utilities -> Terminal`)
2. Confirm `bash` is available:
   ```
   bash --version
   ```
   Note: macOS defaults to `zsh`, which is fine -- but we'll primarily use `bash`.
3. Install GNU tools (optional but recommended)
   ```
   brew install gnu-sed gawk coreutils
   ```
   Note: requires [Homebrew](https://brew.sh/) if not installed.
### Linux Users: Native environment 
1. Open your terminal
2. Ensure basic tools are installed:
   ```
   sudo apt install bash sed gawk cron tar gzip
   ```
3. Verify versions:
   ```
   bash --version
   awk --version
   sed --version
   ```

## Step 2: Testing Your Shell Environment
Run the following test script (`test.sh`):
```
#!/bin/bash
echo "Hello, $USER!"
date
uname -a
```
Save it, make it executable, and run:
```
chmod +x test.sh
./test.sh
```
If it prints your username, current date, and system info, your Shell environment is ready!

