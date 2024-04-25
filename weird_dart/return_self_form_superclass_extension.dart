class Animal {
  final String name;

  Animal({required this.name});

}

class Dog extends Animal {
  final String breed;

  void bark(){
    print("Barking");
  }

  Dog({required this.breed, required super.name});
}

extension AnimalExtension on Animal {
    Animal sleep() {
    print("sleeping");
    return this;
  }
}

void main () {
  final dog = Dog(breed: "Labrador", name: "Tommy");
  final sameDog = dog.sleep();
  // sameDog.bark(); <- uncomment offending line
  // The method 'bark' isn't defined for the type 'Animal'

  // but this works
  final sameDogAgain = dog..sleep();
  sameDogAgain.bark();
}

