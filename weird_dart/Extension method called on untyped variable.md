https://stackoverflow.com/questions/78804586/nosuchmethoderror-class-foo-has-no-instance-method-copywith-extension-me

Will this code compile ? 


    class Foo {
      
    }
    extension on Foo {
      int copyWith(){
        return 1;
      }
    }
    
    getFoo() {
      return Foo();
    }
    void main() {
      final foo = getFoo();
      final un = foo.copyWith();
      print(un);
    }

If you said yes, you're correct. This code compiles. No issue. And it seems OK too. It will print 1. Right ?


But no, 

> NoSuchMethodError: Class 'Foo' has no instance method 'copyWith'.


How to fix it ? 

Change 
`getFoo() {` to `int getFoo() {`


Yes, it's crazy how an optional return type annotation can cause runtime errors. It will be desastreous if you work with nuclear code or medical software.

Is this is a bug with Dart ? If not, how to mitigate this ? Any linter or analysis option that enforce  .

- Best option: A hope that Dart team will make this a built-compiler error ? 

- Medium option: A linter option prohibit function call on untyped variable 

- Worse option: A linter option enforce return type as errors


