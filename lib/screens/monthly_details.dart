import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/expense.dart';
import 'package:untitled/model/income.dart';
import 'package:untitled/network/api_calls.dart';
import 'package:untitled/screens/calendar_datepicker.dart';
import 'package:untitled/screens/expenditure_details.dart';
import 'package:untitled/screens/income_details.dart';
import 'package:untitled/screens/pi_chart.dart';
import 'package:untitled/utils/U.dart';

class MonthlyDetails extends StatefulWidget {
  final int month;
  final int year;

  MonthlyDetails(this.month, this.year);

  @override
  MapScreenState createState() => MapScreenState(month, year);
}

class MapScreenState extends State<MonthlyDetails> with SingleTickerProviderStateMixin {
  final int _month;
  final int _year;

  MapScreenState(this._month, this._year);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(ctx, MaterialPageRoute(builder: (context) => CalendarScreen()));
        return true;
      },
      child: DefaultTabController(
          // initialIndex: 1,
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                title: Text(U.getDateStringMonthYear(1, _month, _year)),
                bottom: TabBar(
                    tabs: <Widget>[Icon(Icons.auto_graph_sharp), Icon(Icons.money), Icon(Icons.shopping_basket)]),
              ),
              body: TabBarView(
                children: <Widget>[
                  Center(
                      child: FutureBuilder<Expense>(
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.none || snapshot.hasData == false)
                              return CircularProgressIndicator();
                            else
                              return PieChartWidget(snapshot.data!);
                          },
                          future: fetchExpenseOfMonth(_month, _year))),
                  Center(
                      child: FutureBuilder<List<Income>>(
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.none || snapshot.hasData == false)
                              return CircularProgressIndicator();
                            else
                              return IncomeDetails(snapshot.data!);
                          },
                          future: fetchIncomeOfMonth(_month, _year))),
                  Center(
                      child: FutureBuilder<Expense>(
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.none || snapshot.hasData == false)
                              return CircularProgressIndicator();
                            else
                              return ExpenditureDetails(snapshot.data!);
                          },
                          future: fetchExpenseOfMonth(_month, _year)))
                ],
              ))),
    );
  }
}
