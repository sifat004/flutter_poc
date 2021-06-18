import 'package:flutter/material.dart';
import 'package:untitled/screens/calendar_datepicker.dart';
import 'package:untitled/screens/home.dart';
import 'package:untitled/network/api_calls.dart';
import 'package:untitled/screens/profile.dart';
import 'package:untitled/utils/S.dart';


  void login(String username, String password,BuildContext context){
    makeAuthRequest(username,password,() => loggedInAction(context));
  }

  void  loggedInAction(BuildContext context){
    print("loggedInAction");

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CalendarScreen()));

  }
