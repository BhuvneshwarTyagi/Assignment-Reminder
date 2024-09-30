import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../database/Fetchdata.dart';
import 'bubble.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> with SingleTickerProviderStateMixin {
  List prog=[];
  List<String> sub=[];
  int inde=0;
  @override
  void initState() {
    // TODO: implement initState
    sub.clear();
    for(int i=1;i<=data[0]['No-of-subjects'];i++){
      sub.add(data[0]['Subject $i']);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: MediaQuery.of(context).size.height*0.13,
          flexibleSpace: SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: sub.length,
              itemBuilder: (context, index) => SizedBox(
                width: MediaQuery.of(context).size.width*0.33,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.zero),
                  ),
                  onPressed: () {
                    setState(() {
                      inde=index;
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
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.008),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(
                      MediaQuery.of(context).size.height * 0.0,
                    )),
                    border: Border.all(
                        color: Colors.black,
                        width: MediaQuery.of(context).size.height * 0.002)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      '${data[0]['Subject ${inde + 1}']} \n Notes 1 ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.courgette(textStyle: const TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w600,
                          fontSize: 35)),
                    ),
                    ElevatedButton(

                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade200
                      ),
                      onPressed: () {},
                      child: Container(

                        margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.008),
                        height: MediaQuery.of(context).size.height*0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${data[0]['Subject ${inde + 1}']} Notes 1 ',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22),
                            ),
                            Icon(Icons.download,size: MediaQuery.of(context).size.height * 0.04,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
