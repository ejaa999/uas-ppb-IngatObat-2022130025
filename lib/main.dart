import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'login_screen.dart';
import 'list_obat_screen.dart';
import 'home_page_mulai.dart';
import 'notification_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/mulai',
      routes: {
        '/mulai': (context) => const HomePageMulai(),
        '/login': (context) => const LoginScreen(),
        '/izin': (context) => NotificationPage(user: FirebaseAuth.instance.currentUser!),
        '/list-obat': (context) => const ListObatScreen(),
      },
    );
  }
}
