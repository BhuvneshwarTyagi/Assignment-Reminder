import 'package:assignment_reminder/database/Fetchdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'Notes.dart';
import 'Performance.dart';
import '../database/AuthenticationService.dart';
import 'Practical.dart';
import 'Profile.dart';
import 'Settings.dart';


class Nevigator extends StatefulWidget {
  const Nevigator({Key? key}) : super(key: key);

  @override
  State<Nevigator> createState() => _NevigatorState();
}

class _NevigatorState extends State<Nevigator> {
  int index = 0;
  TimeOfDay time= const TimeOfDay(hour: 00, minute: 00);
  TimeOfDay studyTime= const TimeOfDay(hour: 00, minute: 00);
  bool _isloding=false;
  dynamic data;
  final screens = [const Home(),const Notes(),const Practical(),const Performance(), const Profile(), const Setting()];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  @override
  Widget build(BuildContext context) {
    return _isloding?Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: MediaQuery.of(context).size.height*0.065,
        animationDuration: const Duration(milliseconds: 150),
        onTap: (index) {
          setState(() => this.index = index);
        },
        items:  [
          Icon(
            Icons.assignment,
            semanticLabel: 'Home',
            size: MediaQuery.of(context).size.height*0.04,
          ),
          Icon(
            Icons.file_copy_sharp,
            semanticLabel: 'Home',
            size: MediaQuery.of(context).size.height*0.04,
          ),
          Icon(
            Icons.notes_outlined,
            semanticLabel: 'Home',
            size: MediaQuery.of(context).size.height*0.04,
          ),
          Icon(Icons.add_chart,
            semanticLabel: 'Performance',
            size: MediaQuery.of(context).size.height*0.04,
          ),
          Icon(Icons.account_circle_outlined,
            semanticLabel: 'Profile',
            size: MediaQuery.of(context).size.height*0.04,
          ),
        ],
        backgroundColor: Colors.transparent.withOpacity(0),
        buttonBackgroundColor: Colors.red,
        color: Colors.red.shade200,
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.red,
        automaticallyImplyLeading: true,
        title: const Text('Assignment',
            style: TextStyle(color: Colors.white)),

      ),

      endDrawer: Drawer(
        elevation: 100,
        child: ListView(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height*0.04,
              left: MediaQuery.of(context).size.width*0.02,
              right: 8
          ),
          children: [
            // Image and name
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.all(0)
              ),
              onPressed: (){init();},
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black54,
                  maxRadius: MediaQuery.of(context).size.height*0.037,
                  foregroundImage: const AssetImage('assets/images/91.jpg'),
                ),
                Column(
                  children: [
                    Center(
                      child: Text("${data[0]['Name']}", style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 25),textAlign: TextAlign.center),
                    ),
                    Center(
                      child: Text("${data[0]['Rollnumber']}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.black45)),
                    ),
                  ],
                )

              ],
            ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Divider(
              height: MediaQuery.of(context).size.height * 0.004,
              indent: MediaQuery.of(context).size.width*0.00001,
              endIndent: MediaQuery.of(context).size.width*0.00001,
              color: Colors.black,
              thickness: MediaQuery.of(context).size.height * 0.004,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.all(0)
              ),
              onPressed: (){
                setState(() {
                  this.index = 5;
                });
              },
              child: Row(

                children: [
                  Icon(
                    color: Colors.black,
                    Icons.settings_outlined,
                    semanticLabel: 'Setting',
                    size: MediaQuery.of(context).size.height*0.035,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.02,
                  ),
                  const Text("Settings", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18),textAlign: TextAlign.center),

                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.all(0)
              ),
              onPressed: (){
                setState(() {
                  this.index = 5;
                });
              },
              child: Row(

                children: [
                  Icon(
                    color: Colors.black,
                    Icons.share_outlined,
                    semanticLabel: 'Setting',
                    size: MediaQuery.of(context).size.height*0.03,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.02,
                  ),
                  const Text("Share", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18),textAlign: TextAlign.center),

                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red.shade200)
              ),
                onPressed: () async{
                  studyTime= (await showTimePicker(
                      context: context,
                      initialTime: time,
                  ))!;
                  if(studyTime==null) return;
                  setState(() {
                    time=studyTime;
                  });
                  final user= FirebaseAuth.instance.currentUser?.uid;
                  await FirebaseFirestore.instance.collection('Students').doc(user).update({'Study_hours': studyTime.hour,'Study_minute':studyTime.minute});
                  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Study Time',style: TextStyle(color: Colors.black,fontSize: 18)),
                    Text('${data[0]['Study_hours']} : ${data[0]['Study_minute']}',style: const TextStyle(color: Colors.black45,fontSize: 18)),
                  ],
                )
            ),

            // Logout
            ElevatedButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: (){
                  AuthenticationService().signOut();
                  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Logout',style: TextStyle(fontSize: 20,color: Colors.black),)
                  ],
                )
            )
          ],
        ),
      ),
      body: screens[index],

    ):Container();
  }
  void init() async{
  data= await Fetch().fetchuserdata();
  if(data[0]==0){
  setState(() {
    _isloding=false;
  });
  }
  else {
  setState(() {
    _isloding=true;
  });
  }
}
}
