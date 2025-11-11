import webbrowser, sys

def open_google_maps(address):
    # Construct the Google Maps URL
    url = "https://www.google.com/maps/place/" + address
    # TODO: Open the web browser with the Google Maps URL
    
if __name__ == "__main__":
    # Join the command line arguments to form the address
    if len(sys.argv) > 1:
        # Join all arguments after the script name
        address = " ".join(sys.argv[1:])
        open_google_maps(address)
    else:
        print("Please provide a street address.")