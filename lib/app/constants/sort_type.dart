import 'package:flutter/cupertino.dart';

enum SortType {
  ascending,
  descending,
}

extension SortTypeExtension on SortType {
  IconData get iconData {
    switch (this) {
      case SortType.ascending:
        return CupertinoIcons.sort_down;
      case SortType.descending:
        return CupertinoIcons.sort_up;
    }
  }
}
