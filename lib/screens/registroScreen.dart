import 'package:app_fire2/main.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Registro extends StatelessWidget {
  const Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
      ),
      body: registro(context)
    );
  }
}

Widget registro(context) {
  TextEditingController _correo = TextEditingController();
  TextEditingController _pass = TextEditingController();

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _correo,
          decoration: InputDecoration(
              label: Text("correo"), border: OutlineInputBorder()),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          obscureText: true,
          controller: _pass,
          decoration: InputDecoration(
              label: Text("pass"), border: OutlineInputBorder()),
        ),
      ),
      FilledButton(onPressed: () => registroUser(_correo.text, _pass.text, context), child: Text("Login"))
    ],
  );
}

Future<void> registroUser(correo, pass, context) async {
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: correo,
    password: pass,
  );

  Navigator.push(context, MaterialPageRoute(builder: (context)=> AppFire()  ));

} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
}