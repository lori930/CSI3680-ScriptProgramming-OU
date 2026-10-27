class Car:
    def __init__(self, make, model):
        self.make = make  # Attribute
        self.model = model  # Attribute
    
    def drive(self):  # Method
        print(f"The {self.make} {self.model} is driving.")

# Creating objects (instances) of the Car class
my_car = Car("Jeep", "Wrangler")
your_car = Car("Toyota", "Camry")

# Calling a method on the object
my_car.drive()  
your_car.drive()