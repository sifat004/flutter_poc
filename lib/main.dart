import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';

main() async {
  await GetStorage.init();
  runApp(App());
}