import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/model/expense.dart';
import 'package:untitled/model/income.dart';
import 'package:untitled/utils/common_widgets.dart';
import 'dart:developer';

import '../style.dart';

class IncomeDetails extends StatefulWidget {
  final List<Income> incomeList;
  IncomeDetails(this.incomeList);
  @override
  MapScreenState createState() => MapScreenState(incomeList);
}

class MapScreenState extends State<IncomeDetails> with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  //final User userProfile;
  final List<Income> _incomeList;
  MapScreenState(this._incomeList);

  @override
  Widget build(BuildContext context) {
    print("IncomeDetails "+_incomeList.toString());

    double totalIncome= 0.0;
    List <Widget> widgets = <Widget>[];
     for(Income i in _incomeList){
       widgets.add(titleWidgetWithIconAtTheFront(i.fId, FontSize.Small,Icons.home));
       widgets.add(normalTextWidgetWithBottomLine(i.maintenanceCharge.toString(),FontSize.Medium));
       totalIncome+=i.maintenanceCharge;
     }
    widgets.add(titleWidget("Total", FontSize.Medium));
    widgets.add(normalTextWidgetWithBottomLine(totalIncome.toString(),FontSize.Medium));

    return new Scaffold(
        body: new Container(
      color: Colors.white,
      child: new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: widgets,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }


}
