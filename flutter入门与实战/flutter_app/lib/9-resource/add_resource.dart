import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
// todo
void main() {
  var data = loadAsset();
  print(data);
}

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/configs/config.json');
}