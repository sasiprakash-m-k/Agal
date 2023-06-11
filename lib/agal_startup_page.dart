import 'package:flutter/material.dart';
import 'AgalLoginPage.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/Agal_Startpage.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: const Alignment(0.0, 0.71),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red.shade400,
                    padding: const EdgeInsets.all(20.0),
                    fixedSize: const Size(300, 80),
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    elevation: 10,
                    shadowColor: Colors.red,
                    side: const BorderSide(color: Colors.white70, width: 7),
                    shape: const StadiumBorder()),
                child: const Text(
                  "LOGIN / REGISTER",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    ));
  }
}
