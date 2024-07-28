This gives a runtime error.




    Future<int> nuclearPlant() async {
      await Future.delayed(Duration(seconds: 1));
      throw "up";
      return 999999999;
    }
    Future<void> main() async {
      final zillionVolts = await nuclearPlant().catchError((e) => "0");
      print(zillionVolts);
      print("Done, safely shutdown the plant.");
    }


> The error handler of Future.catchError must return a value of the
> future's type


I agree with the error. But why is it a runtime ?? Not a compiler error? How to enable a linter analysis check to prevent a code containing this  ?

In critical code example above, someone mistakenly put 0 as String during migration 2.0. As a result, the plant power plant did not shut down causing massive destruction because `Dart` allowed this code to run in production.
