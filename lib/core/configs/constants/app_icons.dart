import 'package:flutter/material.dart';

final class AppIcons {
  const AppIcons._();

  static const back = Icons.chevron_left_rounded;
  static const person = Icons.person;
  static const email = Icons.email;
  static IconData visibility(bool isVisible) =>
      isVisible ? Icons.visibility : Icons.visibility_off;
  static const lock = Icons.lock;
  static const logout = Icons.logout;
  static const camera = Icons.camera_alt;
  static const gallery = Icons.photo_library;
  static const bookmark = Icons.bookmark_rounded;
  static const chevronLeft = Icons.chevron_left;
  static const chevronRight = Icons.chevron_right;
  static const search = Icons.search;
  static const threeDotsVert = Icons.more_vert;
}
