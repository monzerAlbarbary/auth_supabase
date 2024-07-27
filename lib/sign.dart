import 'package:flutter/material.dart';
import 'package:saas_subabase/main.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
sigup() async {
  try {
    await supabase.auth.signUp(
        password: passController.text,
        email: emailController.text,
        data: {
          'name': nameController.text,
          "lastName": lastNameController.text,
        });
  } catch (e) {
    print(e);
  }
}

class _SingUpState extends State<SingUp> {
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
              controller: nameController,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(hintText: 'LastName'),
            ),
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
                    sigup();
                  },
                  child: Text('Signup')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                  onPressed: () {
                    print(
                        '------------------------------------------------------');
                    print(supabase.auth.currentUser!.toJson());
                  },
                  child: Text('currentUser')),
            ),
          ],
        ),
      )),
    );
  }
}
