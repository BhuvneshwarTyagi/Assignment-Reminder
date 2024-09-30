import 'AuthenticationService.dart';
dynamic data;
class Fetch{

  Future fetchuserdata() async{

    try{
      dynamic result = await AuthenticationService().getUserData();
      if(result!=null){
        data=result;
        return data;
      }
    }
    catch (e){
      print(e.toString());
    }
  }
}