import 'package:assignment_reminder/Progress%20chart/test.dart';
import 'package:assignment_reminder/Screens/bubble.dart';
import 'package:flutter/material.dart';
import '../database/AuthenticationService.dart';
import '../database/Fetchdata.dart';

class Performance extends StatefulWidget {
  const Performance({Key? key}) : super(key: key);

  @override
  State<Performance> createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  List prog = [];
  List<String> sub = [];
  bool wait = true;
  int inde = 0;
  @override
  void initState() {
    // TODO: implement initState
    for (int i = 1; i <= data[0]['No-of-subjects']; i++) {
      sub.add(data[0]['Subject $i']);
    }
    fetchuserdata(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: MediaQuery.of(context).size.height * 0.13,
          flexibleSpace: SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: sub.length,
              itemBuilder: (context, index) => SizedBox(
                width: MediaQuery.of(context).size.width * 0.33,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.zero),
                  ),
                  onPressed: () {
                    setState(() {
                      prog.clear();
                      wait = true;
                      fetchuserdata(index);
                    });
                  },
                  child: Bubble(lable: sub[index]),
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Divider(
                height: MediaQuery.of(context).size.height * 0.004,
                indent: 5,
                endIndent: 5,
                color: Colors.black,
                thickness: MediaQuery.of(context).size.height * 0.004,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6761,
                child: wait
                    ? Scaffold(
                        body: Container(),
                      )
                    : prog[0],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchuserdata(int index) async {
    dynamic result = await AuthenticationService().getUserData();
    if (result != null) {
      setState(() {
        wait = false;
        prog.add(
          Test(
              submitted: result[0]
                  ["${result[0]['Subject ${index + 1}']}-Assignment-Submitted"],
              subject: sub[index]),
        );
      });
    }
  }
}
