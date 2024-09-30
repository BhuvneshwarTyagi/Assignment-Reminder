import 'package:assignment_reminder/Screens/Basicdetails.dart';
import 'package:assignment_reminder/Screens/login.dart';
import 'package:flutter/material.dart';
import '../database/AuthenticationService.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _key = GlobalKey<FormState>();
  final AuthenticationService _auth = AuthenticationService();
  final TextEditingController _emailContoller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = true;
  @override

  void initState() {
    super.initState();
    _passwordVisible = true;
    _emailContoller.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(
            child: Text('Assignment Reminder',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white))),
      ),
      //backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_logo.png'),
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Create Account',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 110,
                    ),
                    Container(
                      width: 500,
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
                            controller: _emailContoller,
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
                                    _emailContoller.clear();
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
                            controller: _passwordController,
                            cursorColor: Colors.black,
                            validator: (value) {
                              if (value.toString().length <6) {
                                return ('Password must be 6-digit long');
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
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                const Login(),));
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(fontSize: 25),
                            ),
                            child: const Text("Already have an account? Login",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 140,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              createUser();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => BasicDetails(),));
                            }
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 25),
                          ),
                          child: const Text("Next",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),textAlign: TextAlign.end),
                        ),
                        const Icon(Icons.arrow_forward_sharp,size: 35,color: Colors.black,)
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  createUser() async {
    dynamic result = await _auth.createNewUser(
      _emailContoller.text.trim(),
      _passwordController.text.trim(),

    );
    if (result == null) {
      print('Email is not valid');
    } else {
      print(result.toString());
      _passwordController.clear();
      _emailContoller.clear();
    }
  }
}
