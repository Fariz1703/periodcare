import 'package:flutter/material.dart';
import 'package:periodcare/provider/providers.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null);
  runApp(MultiProvider(providers: appProviders, child: const PeriodCareApp()));
}
