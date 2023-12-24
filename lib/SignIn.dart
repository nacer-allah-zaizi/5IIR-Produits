import 'package:atelier4_n_zaizi_iir5g2/PlaceHolderScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:atelier4_n_zaizi_iir5g2/Listeproduits.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () async {
              try {
                UserCredential userCredential =
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );

                // Vérifier si l'utilisateur a les informations d'identification d'admin.
                if (emailController.text == 'admin@admin.com' &&
                    passwordController.text == 'admine') {
                  // L'utilisateur est admin, naviguer vers la page des produits.
                  print(".......................................");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListeProduits()),
                  );
                } else {
                  print("//////////////////////////////");

                  // L'utilisateur n'est pas admin, vous pouvez afficher une autre page d'accueil.
                  // Replacez PlaceholderScreen par le widget que vous souhaitez afficher.
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlaceholderScreen()),
                  );
                }
              } catch (e) {
                print('Error: $e');
              }
            },
            child: const Text('Se connecter'),
          ),
        ],
      ),
    );
  }
}
