import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  const Bubble({Key? key, required this.lable}) : super(key: key);
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade200,
        shape: BoxShape.circle,
      ),
      child: Center(
          child: Text('$lable',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black,),)),

    );
  }
}
