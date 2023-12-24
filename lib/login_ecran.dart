import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:atelier4_n_zaizi_iir5g2/SignIn.dart';
import 'package:atelier4_n_zaizi_iir5g2/Listeproduits.dart';

class login_ecran extends StatelessWidget {
  const login_ecran({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SignInScreen();
          }
          return const ListeProduits();
        },
      ),
    );
  }
}
