import 'package:lumen/lumen.dart';

import 'package:flutter/material.dart';
import 'package:lumen_flutter_example/app.dart';

const lumenApiKey = "0chNiXNhssz4sVovTitulBkFI65Iaz23No";

void main() {
  Lumen.init(lumenApiKey);

  runApp(const MyApp());
}
