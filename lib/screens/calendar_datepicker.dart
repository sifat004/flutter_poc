import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:untitled/model/expense.dart';
import 'package:untitled/network/api_calls.dart';
import 'package:untitled/screens/login.dart';
import 'package:untitled/screens/monthly_details.dart';
import 'package:untitled/screens/line_chart.dart';


late BuildContext ctx;

class CalendarScreen extends StatefulWidget {
  @override
  CalendarScreenState createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> with SingleTickerProviderStateMixin {
 static int visibleYear= DateTime.now().year;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    DateTime _selectedDate = args.value;
    Navigator.push(ctx,
        MaterialPageRoute(builder: (context) => MonthlyDetails(_selectedDate.month, _selectedDate.year)));
  }

  void _onViewChanged(DateRangePickerViewChangedArgs args) {
    print("_onViewChanged " + args.toString());
    PickerDateRange range = args.visibleDateRange;
    DateRangePickerView view = args.view;
    DateTime _selectedDate = range.startDate ?? DateTime.now();

    if ( visibleYear != _selectedDate.year) {
      visibleYear = _selectedDate.year;
      print("_onViewChanged visibleYear" + visibleYear.toString());
      WidgetsBinding.instance!.addPostFrameCallback((_){
        setState(() {});
      });

    }
    if (view == DateRangePickerView.month) {
      Navigator.push(ctx,
          MaterialPageRoute(builder: (context) => MonthlyDetails(_selectedDate.month, _selectedDate.year)));
    }
  }
 @override
 void initState() {
   super.initState();
   print("initState");

   this.setState(() {});
 }

  @override
  Widget build(BuildContext context) {
    print("build");
    var year= visibleYear;
    ctx = context;
    return WillPopScope(
        onWillPop: () async {
          Navigator.push(ctx,
              MaterialPageRoute(builder: (context) => LogIn()));
          return true;
        },
        child: Scaffold(
            appBar: AppBar(title: Text('Welcome Aboard')),
            body:
            Container(
                color: Colors.white,
                child: ListView(children: <Widget>[
                  calendarPicker(),
                FutureBuilder<List<Expense>>(
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.none || snapshot.hasData == false) {
                        return LineChartWidget(Expense.emptyExpenseListOfYear());
                      }

                      else{
                        print(" snapshot "+snapshot.data.toString());
                        return LineChartWidget(snapshot.data!);
                      }

                    },
                    future: fetchExpenseOfYear(year))
                ],
                )
            ))
    );
  }

  Widget calendarPicker() {
    print("calendarPicker");
    return Padding(
        padding: EdgeInsets.all(5),
        child: picker());
  }

  SfDateRangePicker picker() {
    print("picker");

    return SfDateRangePicker(
      onSelectionChanged: _onSelectionChanged,
      selectionMode: DateRangePickerSelectionMode.single,
      view: DateRangePickerView.year,
      onViewChanged: _onViewChanged,
      navigationMode: DateRangePickerNavigationMode.snap,
      showActionButtons: false,
      showNavigationArrow: true,
      headerHeight: 60,
      selectionColor: Colors.greenAccent,
      todayHighlightColor: Colors.blue,
      backgroundColor: Colors.white,

      // cellBuilder: cellBuilder,
    );
  }
}


