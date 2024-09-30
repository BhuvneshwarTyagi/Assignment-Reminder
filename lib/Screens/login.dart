import 'package:assignment_reminder/Screens/RegistrationScreen.dart';
import 'package:assignment_reminder/Screens/RegistrationVerification.dart';
import 'package:assignment_reminder/Screens/ResetPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Main_page.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _passwordVisible=true;
  Future signIn()  async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
    if(FirebaseAuth.instance.currentUser!.emailVerified){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
        return const MainPage();
      }), (r){
        return false;
      });
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationVerification(),));
    }
  }


  void initstate() {
    super.initState();
    passwordController.addListener(() => setState(() {}));
    emailController.addListener(() => setState(() {}));
    _passwordVisible=true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(
            child: Text('Assignment Reminder',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white))),
        //actions: [],
      ),
      //backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_logo.png'),
              ),
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white.withOpacity(0.8),
                            border: Border.all(color: Colors.black,width: 1.5),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 10,
                                  blurStyle: BlurStyle.outer,
                                  color: Colors.black26,
                                  offset: Offset(1, 1)
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              controller: emailController,
                              validator: (value) {
                                if (value!.contains('@')) {
                                  return null;
                                } else {
                                  return 'Please enter a valid email address';
                                }
                              },
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      emailController.clear();
                                    },
                                    icon: const Icon(Icons.clear),
                                    color: Colors.black,
                                  ),
                                  labelText: 'Email Address',
                                  labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700)),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              textAlign: TextAlign.center,
                              obscureText: _passwordVisible,
                              controller: passwordController,
                              cursorColor: Colors.black,
                              validator: (value) {
                                if (value.toString().length <6) {
                                  return ('Minimum Password length is six');
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  size: 30,
                                  color: Colors.red,
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusColor: Colors.black,
                                labelText: 'Password',
                                labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(
                                          () {
                                        _passwordVisible = !_passwordVisible;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword(),));
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.all(16.0),
                                textStyle: const TextStyle(fontSize: 25),
                              ),
                              child: const Text('Forgotten Password?',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blueAccent)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>const RegistrationScreen(),));
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.all(16.0),
                                textStyle: const TextStyle(fontSize: 25),
                              ),
                              child: const Text("Don't have an account? SignUp",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            side: const BorderSide(color: Colors.black,width: 1.5),
                            backgroundColor: Colors.red,
                            fixedSize: const Size(390, 55),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                        ),
                        onPressed: () {
                          if (_key.currentState!.validate())
                          {
                            signIn();
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            SizedBox(
                              width: 40,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Sign In',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.black,),
                              ),
                            ),
                            Icon(Icons.arrow_forward_sharp,color: Colors.black,size: 40,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
