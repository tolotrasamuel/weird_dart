abstract class Foo {

  Foo();
  void bar(){
    print('bar');
  }
}

class Foz extends Foo {
}

void main() {
  Foz().bar();
}