import re

def find_phone_number(text):
    # create the pattern
    phone_regex = re.compile(r"(\(\d{3}\))-(\d{3}-\d{4})")
    # # search the pattern
    phone_mo = phone_regex.search(text)
    # phone_mo = phone_regex.findall(text)
    # phone_mo = re.findall(r"\d{3}-\d{3}-\d{4}", text)
    
    # print out the phone number
    print(phone_mo.group())
    print(phone_mo.group(1))
    print(phone_mo.group(2))
    print(phone_mo.groups())
    # print(phone_mo[1])
message = "OU's number is (248)-370-2100, OU Police's is 248-370-3331."
find_phone_number(message)