import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/model/expense.dart';
import 'package:untitled/utils/common_widgets.dart';
import 'dart:developer';

import '../style.dart';

class ExpenditureDetails extends StatefulWidget {
  final Expense expense;
  ExpenditureDetails(this.expense);
  @override
  MapScreenState createState() => MapScreenState(expense);
}

class MapScreenState extends State<ExpenditureDetails> with SingleTickerProviderStateMixin {
  bool _notEditable = true;
  final FocusNode myFocusNode = FocusNode();
  //final User userProfile;
  final Expense _exp ;
  MapScreenState(this._exp);

  @override
  Widget build(BuildContext context) {
    print("ExpenditureDetails "+_exp.toString());
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
                    children: <Widget>[
                      //titleWidget("Expenditure Information", FontSize.Large),
                      titleWidgetWithIconAtTheFront("Electricity Bill", FontSize.Small,Icons.electrical_services),
                      normalTextWidgetWithBottomLine(_exp.electricityBill.toString(), null),
                      titleWidgetWithIconAtTheFront("Gas Bill", FontSize.Small,Icons.local_gas_station),
                      normalTextWidgetWithBottomLine(_exp.gasBill.toString(), null),
                      titleWidgetWithIconAtTheFront("Water Bill", FontSize.Small,Icons.water),
                      normalTextWidgetWithBottomLine(_exp.waterBill.toString(), null),
                      titleWidgetWithIconAtTheFront("Security Guards' Wages", FontSize.Small,Icons.security),
                      normalTextWidgetWithBottomLine(_exp.securityWages.toString(), null),
                      titleWidgetWithIconAtTheFront("Cleaning Charges", FontSize.Small,Icons.cleaning_services),
                      normalTextWidgetWithBottomLine(_exp.cleaningCharges.toString(), null),
                      titleWidgetWithIconAtTheFront("Lift Charges", FontSize.Small,Icons.elevator),
                      normalTextWidgetWithBottomLine(_exp.liftCharges.toString(), null),
                      titleWidgetWithIconAtTheFront("Others", FontSize.Small,Icons.miscellaneous_services),
                      normalTextWidgetWithBottomLine(_exp.others.toString(), null),
                      titleWidgetWithIconAtTheFront("Total Expenditure", FontSize.Small,Icons.summarize),
                      normalTextWidget(_exp.grossExpense.toString(), null),

                    ],
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

  Widget _getActionIcons() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 8.0, top: 0.0),
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Visibility(child: _getDoneButton(), visible: !_notEditable),
          Visibility(child: _getCancelButton(), visible: !_notEditable),
          Visibility(child: _getEditButton(), visible: _notEditable)
        ],
      ),
    );
  }

  Widget _getEditButton() {
    return getCircularIconButton(
        Colors.red,
        new Icon(
          Icons.edit,
          color: Colors.white,
          size: 18.0,
        ),
        () => editButtonTap());
  }

  Widget _getCancelButton() {
    return getCircularIconButton(
        Colors.redAccent,
        new Icon(
          Icons.cancel,
          color: Colors.white,
          size: 18.0,
        ),
        () => cancelButtonTap());
  }

  Widget _getDoneButton() {
    return getCircularIconButton(
        Colors.greenAccent,
        new Icon(
          Icons.done_rounded,
          color: Colors.white,
          size: 18.0,
        ),
        () => doneButtonTap());
  }

  void editButtonTap() {
    setState(() {
      _notEditable = false;
    });
  }

  void doneButtonTap() {
    setState(() {
      //Todo saving data
      _notEditable = true;
      FocusScope.of(context).requestFocus(new FocusNode());
    });
  }

  void cancelButtonTap() {
    setState(() {
      _notEditable = true;
      FocusScope.of(context).requestFocus(new FocusNode());
    });
  }
}
