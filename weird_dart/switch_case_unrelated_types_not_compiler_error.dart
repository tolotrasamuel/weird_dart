/**
There is a linter we can enable for equality check. What about switch case ? This does not seem to work. https://stackoverflow.com/a/78736339/6727914 



How to convert the warning into errors ?

Example:


*/

/// @deprecated
enum Role {
  guest,
  user,
  admin,
}
enum RoleV2 {
  guest,
  user,
  admin,
}
void giveAccessToEverything() {
  /// nuclear codes
}
void main () {
  final isAdmin = RoleV2.guest; // Database guy Changed to V2 enum during migration 2.0
  switch (isAdmin) {
    case Role.guest; // nobody saw these
      print("guest");
      break;
    case Role.user: // nobody saw these
      print("superAdmin");
      break;
    default:
      break;
  }
  /// neither guest nor user, hence admin
  giveAccessToEverything();
}
