import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/screens/home_page.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:notes_app/screens/login_page.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/providers/auth_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotesProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
