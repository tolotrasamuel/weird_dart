
/// Question, when you have an extension with the same name, both defined on the class and one of its superclass, which one will be used?

import 'package:app_core/model/app/custom/app_base.dart';

void main() {

  AppBase().empty();

}

/// Conclusion,
/// If they are not imported, they are removed from the arena.
/// the extension defined on the class will be used, not the one defined on the superclass.
/// when the extension is not defined on the class, the one defined on the most immediate superclass will be used.