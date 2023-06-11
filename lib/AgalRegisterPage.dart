import 'package:agal/AgalHomeScreen.dart';
import 'package:agal/AgalLoginPage.dart';
import 'package:agal/Auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/Agal_Newuserpage.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(fit: StackFit.expand, children: [
              Align(
                  alignment: const Alignment(0.0, -0.30),
                  child: TextFormField(
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
                        labelStyle:
                            const TextStyle(fontSize: 22, color: Colors.black),
                        filled: true,
                        fillColor: null),
                  )),
              Align(
                  alignment: const Alignment(0.0, 0.0),
                  child: TextFormField(
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
                          borderSide: const BorderSide(),
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
                        labelStyle:
                            const TextStyle(fontSize: 22, color: Colors.black),
                        filled: true,
                        fillColor: null),
                  )),
              Align(
                  alignment: const Alignment(0.0, 0.3),
                  child: ElevatedButton(
                      onPressed: () async {
                        await authService
                            .createUserWithEmailAndPassword(
                                emailController.text, passController.text)
                            .then((userCreated) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red.shade400,
                          padding: const EdgeInsets.all(10.0),
                          fixedSize: const Size(235, 60),
                          textStyle: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          elevation: 15,
                          shadowColor: Colors.pink,
                          side:
                              BorderSide(width: 0, color: Colors.red.shade400),
                          shape: const StadiumBorder()),
                      child: const Text('Register'))),
              Align(
                  alignment: const Alignment(0.0, 0.55),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red.shade400,
                          padding: const EdgeInsets.all(10.0),
                          fixedSize: const Size(235, 60),
                          textStyle: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          elevation: 20,
                          shadowColor: Colors.pink,
                          side:
                              BorderSide(width: 0, color: Colors.red.shade400),
                          shape: const StadiumBorder()),
                      child: const Text('Login')))
            ])));
  }
}
