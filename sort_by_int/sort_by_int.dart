extension ListExtensionSort<T> on List<T> {
  void sortByDescOrder<K extends Comparable<K>>(K Function(T element) keyOf,
      [int start = 0, int? end]) {
    sort((b, a) => keyOf(a).compareTo(keyOf(b)));
  }
}
void main() {
  List<Person> people = [
    Person('Alice', 30),
    Person('Bob', 25),
    Person('Charlie', 35),
  ];

  (24).compareTo(56);
  // Sort by age in ascending order
  people.sortByDescOrder((person) => person.age); // does not work
  people.sortByDescOrder((person) => person.name); // does work

  // Print sorted list
  people.forEach((person) {
    print('${person.name}: ${person.age}');
  });
}
