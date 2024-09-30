import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Main_page.dart';

class RegistrationVerification extends StatefulWidget {
  const RegistrationVerification({Key? key}) : super(key: key);

  @override
  State<RegistrationVerification> createState() => _RegistrationVerificationState();
}

class _RegistrationVerificationState extends State<RegistrationVerification> {
  @override
  void initState(){
    sendemailVerification();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.red,
            title: const Text('Assignment Reminder',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white),),
          ),
          //backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
                width: double.maxFinite,
                //color: Colors.redAccent,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    opacity: 200,
                    image: AssetImage('assets/images/bg_logo.png'),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Please Verify Your Email',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.black),textAlign: TextAlign.center),
                    const Text('Notice : Please check your Email to verify',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.red),textAlign: TextAlign.center),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                        onPressed: (){
                      if(!FirebaseAuth.instance.currentUser!.emailVerified){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                          return const MainPage();
                        }), (r){
                          return false;
                        });
                      }
                      },
                        child: const Text('Verified',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),)),

                  ],
                )
            ),
          ),
        )
    );
  }
  Future sendemailVerification() async{
    try {
       await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      print('Email Sent');
    } catch (e) {
      print(e.toString());
    }
  }
}

