def make_decision(gpa):
# When GPA is larger than 3.5, accept the application
    if gpa > 3.5:
        print('Your application is accepted.')
    # When GPA is larger than 2.0, conditionally accept the application
    elif gpa > 2.0:
        print('Your application is conditionally accepted.') 
    # When GPA is no more than 2.0, deny the application
    else:
        print('Your application is denied.')
    
def main():
    gpa = float(input("What is your GPA? "))
    make_decision(gpa)

# A common structure for a Python script is to put the main program logic inside main() and use if __name__ == "__main__": as the entry point.
if __name__ == "__main__":
    main()
    
