# Environment Setup and Test - Python
## Step 1: Python Setup (All Platforms)
- Install **Python 3.8+**
  - Windows/macOS: [Download from python.org](https://www.python.org/downloads)
  - Linux: Use package manager (`sudo apt install python3 python3-pip`)
- Verify installation:
    ```
    python3 --version
    pip3 --version
    ```
- Install recommended modules:
    ```
    pip3 install requests psutil
    ```


## Step 2: Testing Your Python Environment
1. Open your terminal (Ubuntu/WSL/macOS/Linux) or command prompt (Windows).
2. Create a file `hello.py` with the following code:
   ```
    import platform
    import datetime

    print("Hello from Python!")
    print("Today's date is:", datetime.date.today())
    print("Python version:", platform.python_version())
   ```
3. Run the script:
   ```
   python3 hello.py
   ```
If it prints greeting, today's date, and your Python version, your Python environment is ready!

