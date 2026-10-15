import random 
def main():
    for i in range(5):
        random.seed(42)
        print(random.random())
    
if __name__ == "__main__":
    main()