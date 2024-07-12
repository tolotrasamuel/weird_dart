/**
There is a linter to it https://dart.dev/tools/linter-rules/unrelated_type_equality_checks but it just shows a warning, rendering it almost useless for large projects.



How to convert the warning into errors ?

Example:
*/


void giveAccessToEverything() {
  /// nuclear codes
}
void main () {
  final isAdmin = "isAdmin"; // Database guy Changed to enum during migration 2.0

  if (isAdmin != true) { //  nobody saw this, I don't blame the team, I blame Dart
    return;
  }
  giveAccessToEverything();
}
