import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'configuration/initial_bindings.dart';
import 'router/pages.dart';

void main() {
  runApp(const BilgiYarismasi());
}

class BilgiYarismasi extends StatelessWidget {
  const BilgiYarismasi({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("tr", "TR"),
      supportedLocales: const [Locale("en", "US"), Locale("tr", "TR")],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      getPages: AppPages.pages,
      initialRoute: Routes.INITIAL,
      initialBinding: InitialBinding(),
    );
  }
}
