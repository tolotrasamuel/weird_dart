// https://stackoverflow.com/questions/78004582/field-assignement-not-working-as-intended-in-dart
class FooBase {
  String? name;

  FooBase({required this.name});
}
class Foo  extends FooBase{
  final String name;

  Foo({required this.name}) : super(name: name);
}

void main() {
  final foo = Foo(name: 'foo');
  final fooForm = foo;
  fooForm.name = 'bar';
  print(fooForm.name);
}


// I would expect this code to print "bar" but it prints "foo". Why so?
//
// How to make it print "bar" ?
//
