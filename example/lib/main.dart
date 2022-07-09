import 'package:lumen/lumen.dart';

import 'package:flutter/material.dart';
import 'package:lumen_flutter_example/app.dart';

const lumenApiKey = "<< your-api-key >>";

void main() {
  Lumen.init(lumenApiKey);

  runApp(const MyApp());
}
