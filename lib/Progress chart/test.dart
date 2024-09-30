import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
class Test extends StatefulWidget {
  final String subject;
  final int submitted;
  const Test({Key? key, required this.subject, required this.submitted}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    final datamap =<String,double>{
      'Submitted': widget.submitted.toDouble(),
      'Can be Submitted':15
    };
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.025),
        Text(
            widget.subject,
            style: const TextStyle(fontWeight: FontWeight.w800,fontSize: 38,color: Colors.black,)
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.025),
        PieChart(
          degreeOptions: const DegreeOptions(initialAngle: 0,totalDegrees: 360),
            colorList: const [Colors.green,Colors.orangeAccent],
            legendOptions: const LegendOptions(
                legendPosition: LegendPosition.bottom,
                legendShape: BoxShape.rectangle,
                showLegends: true,
                showLegendsInRow: false,
                legendTextStyle: TextStyle(fontSize: 22,fontWeight: FontWeight.w700)
            ),
           // centerText: widget.subject,
            ringStrokeWidth: MediaQuery.of(context).size.height*0.025,
            initialAngleInDegree: -90,
            chartRadius: MediaQuery.of(context).size.height*0.35,
            dataMap: datamap,
            chartType: ChartType.ring,
            baseChartColor: Colors.red,
            animationDuration: const Duration(milliseconds: 400),
            totalValue: 100,
            chartLegendSpacing: MediaQuery.of(context).size.height*0.09,
            chartValuesOptions: const ChartValuesOptions(
              decimalPlaces: 2,
              showChartValuesOutside: true,
              chartValueStyle: TextStyle(fontWeight: FontWeight.w800,fontSize: 25,color: Colors.black),
              showChartValueBackground: true,
              showChartValuesInPercentage: true,
              chartValueBackgroundColor: Colors.transparent,
              showChartValues: true,
            ),
          ),
      ],
    );
  }
}
