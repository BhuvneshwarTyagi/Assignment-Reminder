import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'DatabaseManager.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// registration with email and password

  Future createNewUser(String email, String password,) async {try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await DatabaseManager().createUserData(
          email,
          password,
          user!.uid);
      return user;
    } catch (e) {
      print(e.toString());
    }
  }
//Add subjects
  Future addNewSubjects(List subjects) async {try{
    final user=FirebaseAuth.instance.currentUser;
    await DatabaseManager().createsubjectsData(subjects, user!.uid);
    signOut();
    return user;
  } catch (e) {
    print(e.toString());
  }
  }
  Future addBasicDetails(String name,String rollnumber,String university,String college,String branch,String course,String year,String section,) async {try{
    final user=FirebaseAuth.instance.currentUser;
    await DatabaseManager().createbasicDetails(name,rollnumber,university,college,branch,course,year,section,user!.uid);
    return user;
  } catch (e) {
    print(e.toString());
  }
  }


// sign with email and password

  Future loginUser(String email, String rollnumber) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: rollnumber);
      return result.user;
    } catch (e) {
      print(e.toString());
    }
  }

//signout
  Future getUserData() async{
    List userdetail=[];
    User? user= FirebaseAuth.instance.currentUser;
    try {
      await FirebaseFirestore.instance.collection("Students").doc(user!.uid).get().then((value) {
        userdetail.add(value.data()!);
      });
     return userdetail;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getdata() async{
    List list=[];
    try {
      await FirebaseFirestore
          .instance
          .collection("Students")
          .where('Name',isEqualTo: 'Bhanu' )
          .get().then((value){
        for (var element in value.docs) {list.add(element.data());}});
      return list;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}