import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final profileList = FirebaseFirestore.instance.collection('Students');
  Future<void> createUserData(
      String email,
      String password,
      String uid) async {
    return await profileList.doc(uid).set({
      'Email' : email,
      'Password':password,
      });

  }

  Future<void> createsubjectsData(List subjects, String uid,) async {
    for (var i=0;i<=subjects.length-1;i++) {
      print(subjects.length);
      await profileList.doc(uid).update({"Subject ${i+1}":subjects[i].text,'${subjects[i].text}-Assignment-Submitted':0});
    }
    await profileList.doc(uid).update({'No-of-subjects':subjects.length});
    return ;
  }
  Future<void> createbasicDetails(
      String name,String rollnumber,String university,String college,String branch,String course,String year,String section,
      String uid,) async {
      await profileList.doc(uid).update({
        "Name": name,
        'Rollnumber':rollnumber,
        'University':university,
        'College':college,
        'Branch':branch,
        'Course':course,
        'Year':year,
        'Section':section
      });
    return ;

  }



  Future updateUserList(String name,String rollnumber, String email,String password,String university,String course,String branch,String section,String uid) async {
    return await profileList.doc(uid).update({
      'name': name ,
      'rollnumber': rollnumber,
      'Email' : email,
      'Password':password,
      'University': university,
      'Course':course,
      'Branch':branch,
      'Section':section,
    });
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await profileList.get().then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          itemsList.add(element.data);
        }
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}