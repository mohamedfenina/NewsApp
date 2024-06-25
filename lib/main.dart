import 'package:flutter/material.dart';
import 'package:news_app/providers/post_provider.dart';
import 'package:news_app/providers/post_provider.dart';
import 'package:news_app/screens/post_screen.dart';
import 'package:news_app/screens/post_screen.dart';
import 'package:news_app/screens/splash_screen.dart';
import 'package:news_app/shared/remote/dio_helper.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => PostProvider()),
    ],
    child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'News App',
    theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
    useMaterial3: false,
    ),
    home: SplashScreen(),
    ),
    );
  }
}
