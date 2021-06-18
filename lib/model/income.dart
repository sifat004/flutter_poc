import 'package:untitled/utils/U.dart';

class Income {
  String fId;
  String dateString;
  int month;
  int year;
  double maintenanceCharge;

  Income(this.fId, this.dateString, this.month, this.year, this.maintenanceCharge);
  factory Income.fromJson(dynamic json) {

    print("Income.fromJson -> $json");
    return Income(
        json['flatNo'],
        json['date'],
        U.getMonthFromDateString(json['date']),
        U.getYearFromDateString(json['date']),
        json['serviceCharge'].toDouble());
  }

  static List<Income> getIncomeOfMonth(int month,int year){

    List<Income> dummyIncomes = [];
    var flats = ["A1","A2","A3","A4","A5","A6","A7","A8","A9","A10",
      "B1","B2","B3","B4","B5","B6","B7","B8","B9","B10",
      "C1","C2","C3","C4","C5","C6","C7","C8","C9","C10",
      "D1","D2","D3","D4","D5","D6","D7","D8","D9","D10",
      "E1","E2","E3","E4","E5","E6","E7","E8","E9","E10",
      "F1","F2","F3","F4","F5","F6","F7","F8","F9","F10",
      ];
    for(String i in flats)
      {
        dummyIncomes.add(Income(i,U.getDateString(1, month, year), month, year, 20000));
      }
    return dummyIncomes;
  }
}
