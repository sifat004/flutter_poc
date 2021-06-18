import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:untitled/model/expense.dart';
import 'package:untitled/model/income.dart';
import 'package:untitled/model/user.dart';
import 'package:untitled/utils/S.dart';
import 'package:untitled/utils/U.dart';


const String baseUrl = "https://apartment-expense-tracker.herokuapp.com";
String _bearerToken = "";
const String authApi = "/api/authenticate";
const String getUserApi = "/api/users";
const String getExpenseSummaryApi = "/api/expenses/summary/date";
const String getExpenseListApi = "/api/expenses/date";   //range
const String getIncomeListApi = "/api/charges/date";

Future<http.Response> getRequest(String endPoint,dynamic queryParams,dynamic headerParams){
  final endPointUrl = Uri.parse(baseUrl+endPoint);
  print('endPointUrl $endPointUrl');

  String queryString = Uri(queryParameters: queryParams??"").query;
  var requestUrl =Uri.parse( endPointUrl.toString() + '?' + queryString);
  print('requestUrl: $requestUrl');


  String token=  S.getBearerToken();
  final headers =headerParams?? {  'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'};
  return  get(requestUrl, headers: headers);
}

dynamic processResponse(http.Response response){
  print('Status code: ${response.statusCode}');
  print('Body: ${response.body}');
  final dJson = jsonDecode(response.body);
  return dJson;
}

Future<User> fetchUser(String userName) async{
  final url = Uri.parse(baseUrl + getUserApi+ "/{$userName}");
  print('url: $url');
  String token=  S.getBearerToken();
  final headers = {  'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',};
  final response= await get(url,headers: headers);
  print('Status code: ${response.statusCode}');
  print('Body: ${response.body}');
  final dJson = jsonDecode(response.body);
  S.setUserJson(dJson);
  return User.fromJson(dJson);
}

Future<List<User>> fetchAllUsers(String userName) async{
  final url = Uri.parse(baseUrl + getUserApi);
  print('url: $url');
  String token=  S.getBearerToken();
  final headers = {  'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',};
  final response= await get(url,headers: headers);
  print('Status code: ${response.statusCode}');
  print('Body: ${response.body}');
  final dJson = jsonDecode(response.body);

  var tagObjsJson = jsonDecode(dJson) as List;
  List<User> userObjs = tagObjsJson.map((userJson) => User.fromJson(userJson)).toList();
  //S.setUserJson(dJson);
  return userObjs;
}

Future<http.Response> updateUser(User user) {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}



Future<Expense> fetchExpenseOfMonth(int month,int year) async{

  Map<String, String> queryParams = {
    'startDate': U.getDateString(1, month, year),
    'endDate': U.getDateString(28, month, year)
  };

  final response= await getRequest(getExpenseListApi, queryParams, null);
  final dJson = processResponse(response) as List;
  List<Expense> listExpense = dJson.map((jsonObj) => Expense.fromJson(jsonObj)).toList();
  if (listExpense.length==0) return Expense.emptyExpense();
  return listExpense[0];

}

Future<List<Expense>> fetchExpenseOfYear(int year) async{

  Map<String, String> queryParams = {
    'startDate': U.getDateString(1, 1, year),
    'endDate': U.getDateString(31, 12, year)
  };

  final response= await getRequest(getExpenseListApi, queryParams, null);
  final dJson = processResponse(response) as List;
  List<Expense> listExpense = dJson.map((jsonObj) => Expense.fromJson(jsonObj)).toList();
  print("listExpense $listExpense");
  return listExpense;
}

Future<List<double>> fetchTotalExpensesOfMonthsOfYear(int year) async{
  List<Expense> listExpense = await fetchExpenseOfYear(year);
  List<double> totalExpenses= <double>[0,0,0,0,0,0,0,0,0,0,0,0];


  for(Expense e in listExpense) {
      totalExpenses[e.month-1]= e.grossExpense;
  }
  print("totalExpenses $totalExpenses");
  return totalExpenses;
}

Future<List<Income>> fetchIncomeOfMonth(int month,int year) async{
  Map<String, String> queryParams = {
    'startDate': U.getDateString(1, month, year),
    'endDate': U.getDateString(28, month, year)
  };
  final response= await getRequest(getIncomeListApi, queryParams, null);
  final dJson = processResponse(response) as List;
  if (dJson.length==0) return [];
  Map mapValue = dJson[0];
  final dJsonArray= mapValue["chargeDTOList"] as List;
  print('dJsonArray: $dJsonArray ');
  List<Income> listIncome = dJsonArray.map((jsonObj) => Income.fromJson(jsonObj)).toList();
  return listIncome;
}

Future<void> makeAuthRequest(String username, String password,VoidCallback onLoggedIn) async {

  /*onLoggedIn.call();
  return;*/
  final url = Uri.parse(baseUrl + authApi);
  print('url: $url');

  final headers = {"accept": "application/json","Content-type": "application/json"};
  final json =  jsonEncode({"username": username, "password": password});

  final response = await post(url, headers: headers, body: json);
  final parsedJson = jsonDecode(response.body);
  print('Status code: ${response.statusCode}');
  print('Body: ${response.body}');
  _bearerToken = parsedJson['jwt'];
  print('_bearerToken: $_bearerToken');
  S.setBearerToken(_bearerToken);
  S.setIsAdmin(parsedJson['admin']);
  if (_bearerToken.isNotEmpty) onLoggedIn.call();

}




