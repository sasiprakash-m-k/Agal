import 'package:agal/agal_startup_page.dart';
import 'package:flutter/material.dart';
import 'package:agal/Auth_services.dart';
import 'package:provider/provider.dart';
import 'package:agal/AgalHBVscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> signOut() async {
    await AuthService().signOut();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade400,
          title: const Text('AGAL\'S HOME'),
          elevation: 5,
          actions: [
            IconButton(
              onPressed: () async {
                await authService.signOut().then((signedOut) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StartPage()));
                });
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: Center(
            child: IconButton(
                icon: const Icon(Icons.favorite_border_rounded),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HBV()));
                })));
  }
}
