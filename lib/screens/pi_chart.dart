import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:untitled/model/expense.dart';
import 'package:untitled/screens/bar_chart.dart';
import 'package:untitled/utils/common_widgets.dart';
import '../style.dart';
import 'indicator.dart';

class PieChartWidget extends StatefulWidget {
   Expense expense;
   PieChartWidget(this.expense);

  @override
  State<StatefulWidget> createState() => PieChartState(expense);
}

class PieChartState extends State {
  int touchedIndex = -1;
  Expense _expense;
  PieChartState(this._expense);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.white,
          child: Card(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.only(top: 10),
              children: <Widget>[
                textWidgetWithIconAtTheFront("Total Income  : ${(_expense.grossIncome/1000).round()}K", FontSize.Mini,Icons.crop_square),
                textWidgetWithIconAtTheFront("Total Expense : ${(_expense.grossExpense/1000).round()}K", FontSize.Mini,Icons.crop_square),
                BarChartWidget(_expense),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.3,
                    child: PieChart(
                      PieChartData(
                          pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                            setState(() {
                              final desiredTouch = pieTouchResponse.touchInput is! PointerExitEvent &&
                                  pieTouchResponse.touchInput is! PointerUpEvent;
                              if (desiredTouch && pieTouchResponse.touchedSection != null) {
                                touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                              } else {
                                touchedIndex = -1;
                              }
                            });
                          }),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 1,
                          centerSpaceRadius: 0,
                          sections: showingSections()),
                    ),
                  ),
                ),

        Expanded(
          child: AspectRatio(
            aspectRatio: 2,
            child: pieTitles()))


              ],
            ),
          ),
        );


  }

  Widget pieTitles(){
    return  ListView(
      padding: EdgeInsets.only(left: 10),
      children: const <Widget>[
        Indicator(
          color: Colors.indigo,
          text: 'Electricity Bills',
          isSquare: true,
        ),
        Indicator(
          color: Colors.redAccent,
          text: 'Gas Bills',
          isSquare: true,
        ),
        Indicator(
          color: Colors.orangeAccent,
          text: 'Water Bills',
          isSquare: true,
        ),
        Indicator(
          color: Colors.greenAccent,
          text: 'Security Wages',
          isSquare: true,
        ),
        Indicator(
          color: Colors.lightBlueAccent,
          text: 'Lift Charges',
          isSquare: true,
        ),
        Indicator(
          color: Colors.teal,
          text: 'Cleaning Charges',
          isSquare: true,
        ),
        Indicator(
          color: Colors.purpleAccent,
          text: 'Others',
          isSquare: true,
        ),
      ],
    );
  }

  PieChartSectionData pieSec(double value,int index,Color color){
    var percentage=0;
    if (_expense.grossExpense!=0) {
      percentage=((value/ _expense.grossExpense)*100).round();
    }
    final isTouched = index == touchedIndex;
    final fontSize = isTouched ? 25.0 : 16.0;
    final radius = isTouched ? 130.0 : 110.0;
    return PieChartSectionData(
      color: color,
      value: percentage/1,
      title: '$percentage%',
      radius: radius,
      titleStyle: TextStyle(
          fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
    );
  }
  List<PieChartSectionData> showingSections() {
    return List.generate(7, (i) {

      switch (i) {
        case 0:return pieSec(_expense.electricityBill, i,Colors.indigo);
        case 1:return pieSec(_expense.gasBill, i,Colors.redAccent);
        case 2:return pieSec(_expense.waterBill, i,Colors.orangeAccent);
        case 3:return pieSec(_expense.securityWages, i,Colors.greenAccent);
        case 4:return pieSec(_expense.liftCharges, i,Colors.lightBlueAccent);
        case 5:return pieSec(_expense.cleaningCharges, i,Colors.teal);
        case 6:return pieSec(_expense.others, i,Colors.purpleAccent);
        default:
          throw Error();
      }
    });
  }
}