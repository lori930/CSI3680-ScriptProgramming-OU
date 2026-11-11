from pathlib import Path

folder = Path("../Labs")

for file in folder.glob("*.ipynb"):
    print(file.name)