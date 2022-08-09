import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lil_broc/pages/login_page.dart';
import 'package:lil_broc/provider/lists_provider.dart';
import 'package:lil_broc/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ListsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "lil'broc",
        theme: AppTheme.generalTheme(context),
        home: const LoginPage(),
      ),
    );
  }
}
