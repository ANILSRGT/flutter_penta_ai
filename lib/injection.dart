import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final class Injection {
  Injection._init();
  static final Injection _instance = Injection._init();
  static Injection get I => _instance;

  final _sl = GetIt.instance;
  final globalKey = GlobalKey<NavigatorState>();

  Future<void> init() async {}

  T read<T extends Object>() => _sl.get<T>();
}
