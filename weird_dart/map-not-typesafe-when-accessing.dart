    final foo = <int, int>{};
    foo["123"] = "123"; // error when setting
    final d = foo["123"]; // no type error when getting

/// btw dart equality is not type safe too . T == Object
