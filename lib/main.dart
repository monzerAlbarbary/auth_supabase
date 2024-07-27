import 'package:flutter/material.dart';
import 'package:saas_subabase/home_page.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://nkdmokxsgddmnjarxmch.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5rZG1va3hzZ2RkbW5qYXJ4bWNoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjEyNDQyMTEsImV4cCI6MjAzNjgyMDIxMX0.3xkTnrhiW1YRQD0I2egg2edLCMEynY6iBejCvP_1uCs',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
