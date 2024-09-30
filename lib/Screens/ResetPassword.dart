import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();
  final _emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.red,
            title: const Text('Assignment Reminder',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white),),
          ),
          //backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              //color: Colors.redAccent,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  opacity: 200,
                  image: AssetImage('assets/images/bg_logo.png'),
                ),
              ),
              child: Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text('Enter the confirmation code',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      const Text('Notice : Please check your E-mails to reset your password',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.red),textAlign: TextAlign.center),
                      TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.black,
                        controller: _emailController,
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
                                _emailController.clear();
                              },
                              icon: const Icon(Icons.clear),
                              color: Colors.black,
                            ),
                            labelText: 'Registered Email Address',
                            labelStyle: const TextStyle(
                                color: Colors.black54,
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
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Colors.green
                              )
                          ),
                          onPressed: (){
                            if (_key.currentState!.validate()) {
                              FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("Request Reset",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),))
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
