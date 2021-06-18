import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/model/User.dart';
import 'package:get_storage/get_storage.dart';

/*

abstract class P {
  static late SharedPreferences? preferences=null;
  static String USER_ID = "userId";
  static String BEARER = "bearerToken";
  static String USER_NAME = "userName";
  static String USER_JSON = "userJson";
  static String IS_ADMIN = "isAdmin";


  static Future<SharedPreferences> _getPref() async {
    if (P.preferences!=null) return P.preferences!;
    P.preferences = await SharedPreferences.getInstance();
    return P.preferences!;
  }

  static setUserId(value) async {
    final pref = await _getPref();
    pref.setString(P.USER_ID, value);
  }

  static Future<String> getUserId() async{
    final pref = await _getPref();
    return pref.getString(P.USER_ID)?? "";
  }

  static setUserName(value) async {
    final pref = await _getPref();
    pref.setString(P.USER_NAME, value);
  }

  static Future<String> getUserName() async{
    final pref = await _getPref();
    return pref.getString(P.USER_NAME)?? "";
  }

  static setBearerToken(value) async {
    final pref = await _getPref();
    pref.setString(P.BEARER, value);
  }

  static Future<String> getBearerToken() async{
    final pref = await _getPref();
    return pref.getString(P.BEARER)?? "";
  }


  static setUserJson(value) async {
    final pref = await _getPref();
    pref.setString(P.USER_JSON, value);
  }

  static Future<String> getUserJson() async{
    final pref = await _getPref();
    return pref.getString(P.USER_JSON)?? "";
  }

  static Future<User> getUser() async{
    final pref = await _getPref();
    final uJson= pref.getString(P.USER_JSON)?? "";
    return User(uJson);
  }

  static setIsAdmin(value) async {
    final pref = await _getPref();
    pref.setBool(P.IS_ADMIN, value);
  }

  static Future<bool> isAdmin() async{
    final pref = await _getPref();
    return pref.getBool(P.IS_ADMIN)?? false;
  }



}
*/
