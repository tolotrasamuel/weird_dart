 class Base {
  foo(int param) { print("Base::foo $param"); }
}

class Derived extends Base {

}

extension DerivedWithFoo on Derived {
  foo(int param) { print("Derived::foo $param");}
}

void main() {
  final d = Derived();
  d.foo(5);
}