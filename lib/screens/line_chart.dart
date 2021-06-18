import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/expense.dart';

class LineChartWidget extends StatefulWidget {
   static List<Expense> _expenseList=<Expense>[];
   static List<double> _grossExpenses=<double>[];
   static List<double> _grossIncomes=<double>[];
   static List<FlSpot> _spotsLine1=<FlSpot>[];
   static List<FlSpot> _spotsLine2=<FlSpot>[];
   static List<String> _months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];
   static int leftTileDistance = 10000;
  // List<double> incomes;
  LineChartWidget(List<Expense>  expenseList){
    _expenseList.clear();
    _expenseList.addAll(expenseList);
    _grossExpenses.clear();
    _grossExpenses.addAll(getGrossExpenseList(expenseList));
    _grossIncomes.clear();
    _grossIncomes.addAll(getGrossIncomeList(expenseList));
    _spotsLine1.clear();
    _spotsLine2.clear();
    for (int i = 0; i < _grossExpenses.length; i++)
      _spotsLine1.add(FlSpot(i / 1, _grossExpenses[i] / leftTileDistance));
    for (int i = 0; i < _grossIncomes.length; i++)
      _spotsLine2.add(FlSpot(i / 1, _grossIncomes[i] / leftTileDistance));
    createState();
  }

   List<double> getGrossExpenseList( List<Expense> expenseList) {
     List<double> totalExpenses= <double>[0,0,0,0,0,0,0,0,0,0,0,0];
     for(Expense e in expenseList) {
       totalExpenses[e.month-1]= e.grossExpense;
     }
     return totalExpenses;
   }
   List<double> getGrossIncomeList( List<Expense> expenseList) {
     List<double> totalIncomes= <double>[0,0,0,0,0,0,0,0,0,0,0,0];
     for(Expense e in expenseList) {
       totalIncomes[e.month-1]= e.grossIncome;
     }
     return totalIncomes;
   }

  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xFFF44336),
  ];
  int currMonth = DateTime.now().month;
  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                lineChartData(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'BDT',
              style: TextStyle(fontSize: 12, color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),

      ],

    );
  }

  LineChartData lineChartData() {
    var spots= LineChartWidget._spotsLine1;
    var months= LineChartWidget._months;
    print("points "+spots.toString());
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) =>
              const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return months[2];
              case 5:
                return months[5];
              case 8:
                return months[8];
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
              case 7:
                return '70k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData:linesBarData(),
    );
  }


  List<LineChartBarData> linesBarData() {
    final lineChartBarData1 = LineChartBarData(
      spots: LineChartWidget._spotsLine1,
      isCurved: true,
      colors: [Colors.redAccent,Colors.red],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true,),
      belowBarData: BarAreaData(show: false,),
    );

    final lineChartBarData2 = LineChartBarData(
      spots: LineChartWidget._spotsLine2,
      isCurved: true,
      colors: [Colors.green,Colors.greenAccent],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true,),
      belowBarData: BarAreaData(show: false),
      shadow: Shadow()
    );


    return [ lineChartBarData1,
      lineChartBarData2,


    ];
  }

}
