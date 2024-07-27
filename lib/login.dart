import 'package:flutter/material.dart';
import 'package:saas_subabase/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
Login() async {
  try {
    await supabase.auth.signInWithPassword(
      password: passController.text,
      email: emailController.text,
    );
    print('success');
  } catch (e) {
    print(e);
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Login();
                  },
                  child: Text('Log in ')),
            ),
          ],
        ),
      )),
    );
  }
}
