
// https://stackoverflow.com/questions/78300443/the-super-keyword-cant-be-used-in-an-extension-because-an-extension-doesnt-h
class Animal {
  final String name;

  Animal({required this.name});

  void jump() {
    print("Jumping");
  }
}

class Dog extends Animal {
  final String breed;

  Dog({required this.breed, required super.name});
}

extension AnimalExtension on Animal {
  void sleep() {
    print("sleeping");
  }
}


extension DogExtension on Dog {
  void jump() {
    this.jump();
    // super.jump(); // <- offending line, replace with above
    print("and Waving Tail");
  }
}


void main() {
  Dog dog = Dog(breed: "Labrador", name: "Tommy");
  dog.jump();
  print(dog.name);
  print(dog.breed);


}