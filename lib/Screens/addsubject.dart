import 'package:assignment_reminder/Screens/Main_page.dart';
import 'package:flutter/material.dart';
import '../database/AuthenticationService.dart';

class Subject extends StatefulWidget {

  const Subject({Key? key}) : super(key: key);

  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  final List<TextEditingController> _subjectcontroller = [];
  final List<TextFormField> _fields = [];
  final _key = GlobalKey<FormState>();
  @override
  void dispose() {
    for (final controller in _subjectcontroller) {
      controller.dispose();
      _fields.removeAt(_fields.length-1);
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red[300],
          appBar: AppBar(
            centerTitle: true,
            titleSpacing: 10,
            elevation: 5,
            backgroundColor: Colors.red,
            automaticallyImplyLeading: true,
            title: const Text('Assignment Reminder',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_logo.png'),
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(0.5),
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
                      height: 500,
                      width: 450,
                      child: Column(
                        children: [
                          Expanded(child: _listview()),
                          _addtile()
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            side: const BorderSide(color: Colors.black,width: 1.5),
                            backgroundColor: Colors.green.withOpacity(0.8),
                            fixedSize: const Size(390, 55),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                          ),
                          onPressed: () {
                            if (_key.currentState!.validate())
                            {
                              addsubject();
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                                return const MainPage();
                              }), (r){
                                return false;
                              });
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
                                    'Sign Up',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.black,),
                                ),
                              ),
                              Icon(Icons.arrow_forward_sharp,color: Colors.black,size: 40,)
                            ],
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(height: 10,)
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }

  Widget _addtile() {
    return ListTile(
      title: const Center(child: Text('Add Subjects',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),)),
      onTap: () {
        final controller = TextEditingController();
        final field = TextFormField(
          textAlign: TextAlign.center,
          cursorColor: Colors.black,

          textCapitalization: TextCapitalization.sentences,
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Subject 1 cannot be empty';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    int index=_subjectcontroller.indexOf(controller);
                    _subjectcontroller.removeAt(index);
                    _fields.removeAt(index);
                  });
                },
                icon: const Icon(Icons.delete),
                color: Colors.black,
              ),
              labelText: "Subject ${_subjectcontroller.length + 1}",
              labelStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700)),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        );
        setState(() {
          _subjectcontroller.add(controller);
          _fields.add(field);
        });
      },
    );
  }

  Widget _listview() {
    ScrollController listScrollController = ScrollController();
    if(listScrollController.hasClients){
      setState(() {
        final position = listScrollController.position.maxScrollExtent;
        listScrollController.jumpTo(position);
      });
    }
    return ListView.builder(
      controller: listScrollController,
      itemCount: _fields.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.only(left: 10),
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
          margin: const EdgeInsets.all(5),
          child: _fields[index],
        );
      },
    );
  }
  void addsubject() async {
    dynamic result = await AuthenticationService().addNewSubjects(_subjectcontroller);
    dispose();
    if (result == null) {
      print(result);
    } else {
      print(result.toString());
      dispose();
    }
  }
}
