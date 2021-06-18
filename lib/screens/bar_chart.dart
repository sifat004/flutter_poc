import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:untitled/model/expense.dart';

class BarChartWidget extends StatefulWidget {
  Expense expense;

  BarChartWidget(this.expense);

  @override
  State<StatefulWidget> createState() => BarChartWidgetState(expense);
}

class BarChartWidgetState extends State<BarChartWidget> {
  final Color leftBarColor = const Color(0xffff5182);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 7;
  Expense _expense;

  BarChartWidgetState(this._expense);

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, _expense.electricityBill / 1000.round(), Colors.indigo);
    final barGroup2 = makeGroupData(1, _expense.gasBill / 1000.round(), Colors.redAccent);
    final barGroup3 = makeGroupData(2, _expense.waterBill / 1000.round(), Colors.orangeAccent);
    final barGroup4 = makeGroupData(3, _expense.securityWages / 1000.round(), Colors.greenAccent);
    final barGroup5 = makeGroupData(4, _expense.liftCharges / 1000.round(), Colors.lightBlueAccent);
    final barGroup6 = makeGroupData(5, _expense.cleaningCharges / 1000.round(), Colors.teal);
    final barGroup7 = makeGroupData(6, _expense.others / 1000.round(), Colors.purpleAccent);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: Colors.white30,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BarChart(
                    BarChartData(
                      maxY: 15,
                      barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.grey,
                            getTooltipItem: (_a, _b, _c, _d) => null,
                          ),
                          touchCallback: (response) {
                            if (response.spot == null) {
                              setState(() {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                              });
                              return;
                            }

                            touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                       /*     setState(() {
                              if (response.touchInput is PointerExitEvent || response.touchInput is PointerUpEvent) {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                              } else {
                                showingBarGroups = List.of(rawBarGroups);
                                if (touchedGroupIndex != -1) {
                                  var sum = 0.0;
                                  for (var rod in showingBarGroups[touchedGroupIndex].barRods) {
                                    sum += rod.y;
                                  }
                                  final avg = sum / showingBarGroups[touchedGroupIndex].barRods.length;

                                  showingBarGroups[touchedGroupIndex] = showingBarGroups[touchedGroupIndex].copyWith(
                                    barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                                      return rod.copyWith(y: avg);
                                    }).toList(),
                                  );
                                }
                              }
                            });*/
                          }),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (value) =>
                              const TextStyle(color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                          margin: 20,
                          getTitles: (double value) {
                            switch (value.toInt()) {
                              case 0:
                                return 'Ele';
                              case 1:
                                return 'Gas';
                              case 2:
                                return 'Wat';
                              case 3:
                                return 'Sec';
                              case 4:
                                return 'Lif';
                              case 5:
                                return 'Cle';
                              case 6:
                                return 'Oth';
                              default:
                                return '';
                            }
                          },
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (value) =>
                              const TextStyle(color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                          margin: 32,
                          reservedSize: 14,
                          getTitles: (value) {
                            if (value == 0) {
                              return '0K';
                            } else if (value == 5) {
                              return '5K';
                            } else if (value == 10) {
                              return '10K';
                            }
                            else if (value == 15) {
                              return '15K';
                            }else if (value == 20) {
                              return '20K';
                            } else if (value == 25) {
                              return '25K';
                            } else if (value == 30) {
                              return '30K';
                            } else if (value == 35) {
                              return '35K';
                            } else if (value == 10) {
                              return '40K';
                            } else if (value == 10) {
                              return '45K';
                            } else if (value == 10) {
                              return '50K';
                            }  else {
                              return '';
                            }
                          },
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingBarGroups,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, Color color) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [color],
        width: width,
      ),
      BarChartRodData(
        y: 0,
        colors: [rightBarColor],
        width: width,
      ),
    ]);
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}
