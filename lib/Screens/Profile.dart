import 'package:flutter/material.dart';

import '../database/Fetchdata.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01),
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
              ),
              onPressed: (){},
              child: Container(
                height: MediaQuery.of(context).size.height*0.19,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.45,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black54,
                            maxRadius: MediaQuery.of(context).size.width*0.15,
                            foregroundImage: const AssetImage('assets/images/91.jpg'),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.01,
                          ),
                          Center(
                            child: Text("${data[0]['Name']}", style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 14),textAlign: TextAlign.center),
                          ),
                          Center(
                            child: Text("${data[0]['Rollnumber']}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color: Colors.black45)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(
                            child: Text("5", style: const TextStyle(color: Colors.black45,fontWeight: FontWeight.bold, fontSize: 35),textAlign: TextAlign.center),
                          ),
                          Center(
                            child: Text("Assignment Assigned", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14,color: Colors.black),textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(
                            child: Text("5", style: const TextStyle(color: Colors.black45,fontWeight: FontWeight.bold, fontSize: 35),textAlign: TextAlign.center),
                          ),
                          Center(
                            child: Text("Assignment Submitted", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14,color: Colors.black),textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(
                            child: Text("5", style: const TextStyle(color: Colors.black45,fontWeight: FontWeight.bold, fontSize: 35),textAlign: TextAlign.center),
                          ),
                          Center(
                            child: Text("Assignment Pending", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14,color: Colors.black),textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                    ),

                  ],

                ),
              )
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.002,
            ),
            Divider(
              height: MediaQuery.of(context).size.height * 0.004,
              indent: MediaQuery.of(context).size.width*0.00001,
              endIndent: MediaQuery.of(context).size.width*0.00001,
              color: Colors.black,
              thickness: MediaQuery.of(context).size.height * 0.004,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.59,
              child: Column(
                children: [
                  const Text('Basic details',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.01,
                  ),
                  //Name
                  Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height*0.004,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Name',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500)),
                        Text('${data[0]['Name']}',style: const TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  //rollnumber
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.008,
                      bottom: MediaQuery.of(context).size.height*0.004,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Roll Number',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500)),
                        Text('${data[0]['Rollnumber']}',style: const TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  //email id
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.008,
                      bottom: MediaQuery.of(context).size.height*0.004,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Email Address',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500)),
                        Text('${data[0]['Email']}',style: const TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.01,
                  ),

                  const Text('Academic details',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.01,
                  ),
                  //College
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height*0.008,
                            bottom: MediaQuery.of(context).size.height*0.004,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('College',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500)),
                              Text('${data[0]['College']}',style: const TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        //University
                        Container(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height*0.008,
                            bottom: MediaQuery.of(context).size.height*0.004,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('University',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500)),
                              Text('${data[0]['University']}',style: const TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        //Course
                        Container(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height*0.008,
                            bottom: MediaQuery.of(context).size.height*0.004,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Course',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500)),
                              Text('${data[0]['Course']}',style: const TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        //Branch
                        Container(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height*0.008,
                            bottom: MediaQuery.of(context).size.height*0.004,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Branch',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500)),
                              Text('${data[0]['Branch']}',style: const TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        //Year
                        Container(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height*0.008,
                            bottom: MediaQuery.of(context).size.height*0.004,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Year',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500)),
                              Text('${data[0]['Year']}',style: const TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        //Section
                        Container(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height*0.008,
                            bottom: MediaQuery.of(context).size.height*0.004,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Section',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500)),
                              Text('${data[0]['Section']}',style: const TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        //Subjects
                        Container(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height*0.008,
                            bottom: MediaQuery.of(context).size.height*0.004,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Subjects',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500)),
                              Text('${data[0]['No-of-subjects']}',style: const TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        //Study time
                        Container(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height*0.008,
                            bottom: MediaQuery.of(context).size.height*0.004,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Study Time',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500)),
                              Text('${data[0]['Study_hours']}:${data[0]['Study_minute']} PM',style: const TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    )
  );

}
