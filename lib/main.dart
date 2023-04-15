import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/core/inject/intect.dart';
import 'package:music_app/firebase_options.dart';
import 'package:music_app/shared/utils/router.dart';

void main() async {
  Inject.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  var link = Uri.parse('https://accounts.spotify.com/api/token');
  var teste = await http.post(link, body: {
    'grant_type': 'client_credentials',
    'client_id': 'b19c8682f8fe46a7b11e3c21844ca624',
    'client_secret': '7d52a96042674ea7ae4def1207981a69'
  });

  print(teste);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
    );
  }
}
