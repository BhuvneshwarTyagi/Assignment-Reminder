import 'package:assignment_reminder/database/AuthenticationService.dart';
import 'package:flutter/material.dart';
import 'addsubject.dart';

class BasicDetails extends StatelessWidget {
  BasicDetails({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _rollnumberController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _collegeController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  void dispose() {
    _sectionController.dispose();
    _branchController.dispose();
    _collegeController.dispose();
    _courseController.dispose();
    _universityController.dispose();
    _rollnumberController.dispose();
    _nameController.dispose();
    _yearController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red[300],
        appBar: AppBar(
          centerTitle: true,
          titleSpacing: 10,
          elevation: 0,
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
            child: Center(
              child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Basic Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white.withOpacity(0.7),
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
                              child: TextFormField(
                                  cursorColor: Colors.black,
                                  controller: _nameController,
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Name cannot be empty';
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
                                          _nameController.clear();
                                        },
                                        icon: const Icon(Icons.clear),
                                        color: Colors.black,
                                      ),
                                      labelText: 'Name',
                                      labelStyle: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700)),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white.withOpacity(0.7),
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
                              child: TextFormField(
                                cursorColor: Colors.black,
                                controller: _rollnumberController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Roll Number cannot be empty';
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
                                        _rollnumberController.clear();
                                      },
                                      icon: const Icon(Icons.clear),
                                      color: Colors.black,
                                    ),
                                    labelText: 'Roll Number',
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white.withOpacity(0.7),
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
                              child: TextFormField(
                                cursorColor: Colors.black,
                                onChanged: (value) {
                                  _universityController.value =
                                      TextEditingValue(
                                          text: value.toUpperCase(),
                                          selection: _universityController.selection);
                                },
                                controller: _universityController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'University cannot be empty';
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
                                        _universityController.clear();
                                      },
                                      icon: const Icon(Icons.clear),
                                      color: Colors.black,
                                    ),
                                    labelText: 'University',
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),

                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white.withOpacity(0.7),
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
                              child: TextFormField(
                                cursorColor: Colors.black,
                                onChanged: (value) {
                                  _collegeController.value =
                                      TextEditingValue(
                                          text: value.toUpperCase(),
                                          selection: _collegeController.selection);
                                },
                                controller: _collegeController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'College cannot be empty';
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
                                        _collegeController.clear();
                                      },
                                      icon: const Icon(Icons.clear),
                                      color: Colors.black,
                                    ),
                                    labelText: 'College',
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),


                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white.withOpacity(0.7),
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
                              child: TextFormField(
                                cursorColor: Colors.black,
                                controller: _courseController,
                                onChanged: (value) {
                                  _courseController.value =
                                      TextEditingValue(
                                          text: value.toUpperCase(),
                                          selection: _courseController.selection);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Course cannot be empty';
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
                                        _courseController.clear();
                                      },
                                      icon: const Icon(Icons.clear),
                                      color: Colors.black,
                                    ),
                                    labelText: 'Course',
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white.withOpacity(0.7),
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
                              child: TextFormField(
                                cursorColor: Colors.black,
                                onChanged: (value) {
                                  _branchController.value =
                                      TextEditingValue(
                                          text: value.toUpperCase(),
                                          selection: _branchController.selection);
                                },
                                controller: _branchController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Branch cannot be empty';
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
                                        _branchController.clear();
                                      },
                                      icon: const Icon(Icons.clear),
                                      color: Colors.black,
                                    ),
                                    labelText: 'Branch',
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),

                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white.withOpacity(0.7),
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
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.black,
                                controller: _yearController,
                                onChanged: (value) {
                                  _yearController.value =
                                      TextEditingValue(
                                          text: value.toUpperCase(),
                                          selection: _yearController.selection);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Year cannot be empty';
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
                                        _yearController.clear();
                                      },
                                      icon: const Icon(Icons.clear),
                                      color: Colors.black,
                                    ),
                                    labelText: 'Year',
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),

                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white.withOpacity(0.7),
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
                              child: TextFormField(
                                cursorColor: Colors.black,
                                controller: _sectionController,
                                onChanged: (value) {
                                  _sectionController.value =
                                      TextEditingValue(
                                          text: value.toUpperCase(),
                                          selection: _sectionController.selection);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Section cannot be empty';
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
                                        _sectionController.clear();
                                      },
                                      icon: const Icon(Icons.clear),
                                      color: Colors.black,
                                    ),
                                    labelText: 'Section',
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),

                            Row(

                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    if (_key.currentState!.validate())
                                    {
                                      addbasicdetails();
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Subject(),)
                                      );
                                    }
                                  },
                                  child: const Text('Continue',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.black)),
                                ),
                                const Icon(Icons.arrow_forward_sharp,size: 35,)
                              ],
                            ),
                          ],
                        ),
                      ),
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
  void addbasicdetails() async {
    dynamic result = await AuthenticationService().addBasicDetails(
      _nameController.text.trim(),
      _rollnumberController.text.trim(),
      _universityController.text.trim(),
      _collegeController.text.trim(),
      _branchController.text.trim(),
      _courseController.text.trim(),
      _yearController.text.trim(),
      _sectionController.text.trim(),
    );
    dispose();
    if (result == null) {
      print(result);
    } else {
      print(result.toString());
      dispose();
    }
  }
}
