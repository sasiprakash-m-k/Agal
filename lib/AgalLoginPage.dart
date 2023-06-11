// ignore_for_file: non_constant_identifier_names, file_names
import 'package:agal/AgalHomeScreen.dart';
import 'package:agal/AgalRegisterPage.dart';
import 'package:agal/Auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/Agal_Loginpage.png"),
                fit: BoxFit.fill,
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: Stack(fit: StackFit.expand, children: [
              Align(
                  alignment: const Alignment(0.0, -0.30),
                  child: BuildTextField1()),
              Align(
                  alignment: const Alignment(0.0, 0.0),
                  child: BuildTextField2()),
              Align(
                  alignment: const Alignment(0.0, 0.3),
                  child: ElevatedButton(
                      onPressed: () {
                        authService
                            .signInWithEmailAndPassword(
                                emailController.text, passController.text)
                            .then((signedIn) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.red.shade400,
                          //padding: const EdgeInsets.all(.0),
                          fixedSize: const Size(140, 50),
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          elevation: 15,
                          shadowColor: Colors.pink,
                          side:
                              BorderSide(width: 0, color: Colors.red.shade400),
                          shape: const StadiumBorder()),
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white),
                      ))),
              Align(
                  alignment: const Alignment(0.0, 0.6),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const RegisterPage())));
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red.shade400,
                          padding: const EdgeInsets.all(10.0),
                          fixedSize: const Size(230, 55),
                          textStyle: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          elevation: 15,
                          shadowColor: Colors.pink,
                          side:
                              BorderSide(width: 0, color: Colors.red.shade400),
                          shape: const StadiumBorder()),
                      child: const Text(
                        "Create Account",
                        style: TextStyle(color: Colors.white),
                      )))
            ])));
  }

  Widget BuildTextField1() => TextField(
        cursorColor: Colors.black,
        cursorHeight: 30,
        controller: emailController,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            suffixIcon: IconButton(
              color: Colors.black,
              onPressed: () {
                emailController.clear();
              },
              icon: const Icon(Icons.clear),
            ),
            labelText: "Enter your email address",
            labelStyle: const TextStyle(fontSize: 22, color: Colors.black),
            filled: true,
            fillColor: null),
      );
  Widget BuildTextField2() => TextFormField(
        cursorColor: Colors.black,
        cursorHeight: 30,
        obscureText: true,
        obscuringCharacter: '•',
        controller: passController,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: const Icon(
              Icons.password,
              color: Colors.black,
            ),
            suffixIcon: IconButton(
              color: Colors.black,
              onPressed: () {
                passController.clear();
              },
              icon: const Icon(Icons.clear),
            ),
            labelText: "Enter password",
            labelStyle: const TextStyle(fontSize: 22, color: Colors.black),
            filled: true,
            fillColor: null),
      );
}
