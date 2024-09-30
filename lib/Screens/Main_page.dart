import 'package:assignment_reminder/Screens/RegistrationScreen.dart';
import 'package:assignment_reminder/Screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Nevigator.dart';



class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const RegistrationScreen();
        } else if (snapshot.connectionState == ConnectionState.active && !snapshot.hasData) {
          return const RegistrationScreen();
        } else if (snapshot.connectionState == ConnectionState.active && snapshot.hasData)
        {
          if(FirebaseAuth.instance.currentUser!.emailVerified){
            return const Nevigator();
          }
          else{
            return const Login();
          }
        }
        else{
          return const RegistrationScreen();}
      },

    );
  }
}
