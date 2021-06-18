import 'dart:ffi';

import 'package:untitled/utils/U.dart';

class Expense {
  int eId;
  String dateString;
  int month;
  int year;
  double electricityBill;
  double gasBill;
  double waterBill;
  double securityWages;
  double cleaningCharges;
  double liftCharges;
  double others;
  double grossIncome;
  double grossExpense;

  Expense(this.eId, this.dateString, this.month, this.year, this.electricityBill, this.gasBill, this.waterBill,
      this.securityWages, this.cleaningCharges, this.liftCharges, this.others, this.grossIncome, this.grossExpense);

  factory Expense.fromJson(dynamic json) {

    print("Expense.fromJson -> $json");
    return Expense(
        json['id'],
        json['date'],
        U.getMonthFromDateString(json['date']),
        U.getYearFromDateString(json['date']),
        json['electricity'].toDouble(),
        json['gas'].toDouble(),
        json['water'].toDouble(),
        json['security'].toDouble(),
        json['cleaner'].toDouble(),
        json['lift'].toDouble(),
        json['others'].toDouble(),
        json['grossIncome'].toDouble(),
        json['grossExpense'].toDouble());
  }
  static List<Expense> emptyExpenseListOfYear(){
  var emptyExp= Expense.emptyExpense();
  return [emptyExp, emptyExp, emptyExp, emptyExp, emptyExp,
  emptyExp, emptyExp, emptyExp, emptyExp, emptyExp, emptyExp, emptyExp, emptyExp, emptyExp, emptyExp];
}
  static Expense emptyExpense(){
    final date = DateTime.now();
    return Expense.fromJson({
      "id": 0,
      "date": U.getDateString(date.day, date.month, date.year),
      "electricity": 0,
      "gas": 0,
      "water": 0,
      "security": 0,
      "cleaner": 0,
      "lift": 0,
      "others": 0,
      "grossIncome": 0,
      "grossExpense": 0
    });
  }

}
