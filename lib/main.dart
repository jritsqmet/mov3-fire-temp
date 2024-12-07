import 'package:app_fire2/screens/informacionScreen.dart';
import 'package:app_fire2/screens/registroScreen.dart';
import 'package:flutter/material.dart';

//FIREBASE
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(AppFire());
}

class AppFire extends StatelessWidget {
  const AppFire({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Cuerpo());
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fire"),
      ),
      body: Column(
        children: [
          const Text("Login"),
          login(context),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Registro())),
              child: Text("Regístrate"))
        ],
      ),
    );
  }
}

Widget login(context) {
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
          controller: _pass,
          decoration: InputDecoration(
              label: Text("pass"), border: OutlineInputBorder()),
        ),
      ),
      FilledButton(onPressed: () => loginUser(_correo.text, _pass.text, context), child: Text("Login"))
    ],
  );
}

Future<void> loginUser(correo, pass, context) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: correo, password: pass);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Informacion() ));

  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
