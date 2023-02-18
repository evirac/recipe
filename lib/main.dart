import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:provider/provider.dart';
import 'package:recipe_bok/auth_provider.dart';
// import 'package:recipe_bok/pages/register.dart';
// import 'pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'pages/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyCoNCscMcD_2w7dQ-dJPVeaGJ8_SYaTQR4',
      appId: '1:801925109081:web:38b5e746d640555800a848',
      messagingSenderId: '801925109081',
      projectId: 'fluttergram-2b03d',
      storageBucket: 'fluttergram-2b03d.appspot.com',
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      ColorScheme lightColorScheme;
      ColorScheme darkColorScheme;

      if (lightDynamic != null && darkDynamic != null) {
        lightColorScheme = lightDynamic;
        darkColorScheme = darkDynamic.copyWith();
      } else {
        lightColorScheme = ColorScheme.fromSeed(seedColor: Colors.greenAccent);
        darkColorScheme = ColorScheme.fromSeed(
            seedColor: Colors.greenAccent, brightness: Brightness.dark);
      }

      return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
          darkTheme:
              ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
          home: const WelcomePage(),
        ),
      );
    });
  }
}
