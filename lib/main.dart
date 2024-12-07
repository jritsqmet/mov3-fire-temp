import 'package:flutter/material.dart';

void main(){
  runApp( AppFire() );
}

class AppFire extends StatelessWidget {
  const AppFire({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo()
    );
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
          Text("Login"),
          login()
        ],
      ),
    );
  }
}


Widget login(){
TextEditingController _correo = TextEditingController();
  TextEditingController _pass = TextEditingController();

  return Column(
    children: [
       TextField(
        controller: _correo,
        decoration: InputDecoration(
          label: Text("correo"),
          border: OutlineInputBorder()
        ),
       ),
       TextField(
        controller: _pass,
        decoration: InputDecoration(
          label: Text("pass"),
          border: OutlineInputBorder()
        ),
       ),
       FilledButton(onPressed: ()=>(), child: Text("Login"))
    ],
  );
}