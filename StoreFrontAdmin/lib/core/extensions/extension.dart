import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension FicListExtension<T> on List<T> {
  Iterable<E> mapIndexed<E>(E Function(int index, T item) map) sync* {
    for (var index = 0; index < length; index++) {
      yield map(index, this[index]);
    }
  }
}

extension IntegerExtension on int {
  // Height
  SizedBox get rH => SizedBox(height: toDouble().h); //real Height
  SizedBox get nH => SizedBox(height: toDouble()); // normal Height

  // Width
  SizedBox get rW => SizedBox(width: toDouble().w); //real Width
  SizedBox get nW => SizedBox(width: toDouble()); // normal Width
}

extension on List {
  // ignore: unused_element
  bool equals(List list) {
    if (length != list.length) return false;
    return every((item) => list.contains(item));
  }
}
