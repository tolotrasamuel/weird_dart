The actual question is "How to make this work", my attempt was to extend a List<T>  but it seems to not work.

> The class 'FooList' can't extend 'List' because 'List' only has
> factory constructors (no generative constructors), and 'FooList' has
> at least one generative constructor


Here is the context:

    typedef JsonMap = Map<String, dynamic>;
    
    typedef JsonList = List<JsonMap>;
    
    class Foo {
      final String foo;
    
      Foo(this.foo);
    
      factory Foo.fromJson(JsonMap json) {
        return Foo(json['foo']);
      }
    
      JsonMap toJson() {
        return {'foo': foo};
      }
    }

My goal is to `fromJson` parse a list of `JsonMap` 


    typedef FooList = List<Foo>;
    void main() {
      final jsonList = [
        {'foo': 'bar'},
        {'foo': 'baz'},
      ];
    
      final foos = jsonList.map((e) => Foo.fromJson(e)).toList(); // I don't like this, too verbose
 
      print(foosBetter);
    }


In traditional Dart development, the above is ok, but it seems to verbose. Something like this will be ideal.

` final foosBetter = FooList.from(jsonList); // I like this better, but this is obviously not working`


So my attempt was instead of declaring `FooList` as a simple alias:



    abstract class FooList extends List<Foo> {
      FooList.from(List<JsonMap> jsonList) {
        addAll(jsonList.map((e) => Foo.fromJson(e)));
      }
    }


Which leads to the error quoted above.

