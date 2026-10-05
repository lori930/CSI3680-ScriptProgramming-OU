def match_status(status):
    match status:
    # When the HTTP status code is 400, it’s a bad request
        case 400:
            print("Bad request")
        # When the HTTP status code is 401 | 402 | 403, the request is not allowed (unauthorized access or a missing page)
        case 401 | 403 | 404: # In match statement, you can use | as an OR pattern.
            print("Not allowed")
        # When the HTTP status code is 418
        case 418:
            print("I am a teapot.")
        # Other status, print “something’s wrong with the internet”
        case _:
            print("Something's wrong with the internet.")
          
          
def main():
    code = int(input("What is the http code you received? "))
    match_status(code)
      
if __name__ == "__main__":
    main()