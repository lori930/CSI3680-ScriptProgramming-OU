class Car:
    def __init__(self, make, model):
        self.make = make  # Attribute
        self.model = model  # Attribute
    
    def drive(self):  # Method
        print(f"The {self.make} {self.model} is driving.")

# Creating an object (instance) of the Car class
my_car = Car("Jeep", "Wrangler")

# Calling a method on the object
my_car.drive()  # Output: The Jeep Wrangler is driving.