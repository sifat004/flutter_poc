import 'package:get_storage/get_storage.dart';
import 'package:untitled/model/user.dart';

final pref = GetStorage();
const USER_ID = "userId";
const BEARER = "bearerToken";
const USER_NAME = "userName";
const USER_JSON = "userJson";
const IS_ADMIN = "isAdmin";

abstract class S {
  static setUserId(value) {
    pref.write(USER_ID, value);
  }

  static int getUserId() {
    return pref.read(USER_ID) ?? 0;
  }

  static setUserName(value) {
    pref.write(USER_NAME, value);
  }

  static String getUserName() {
    return pref.read(USER_NAME) ?? "";
  }

  static setBearerToken(value) {
    pref.write(BEARER, value);
  }

  static String getBearerToken() {
    return pref.read(BEARER) ?? "";
  }

  static setUserJson(value) {
    pref.write(USER_JSON, value);
  }

  static dynamic getUserJson() async {
    return pref.read(USER_JSON) ?? "";
  }

  static User getUser() {
    final uJson = pref.read(USER_JSON) ?? "{}";
    return User.fromJson(uJson);
  }

  static setIsAdmin(value) {
    pref.write(IS_ADMIN, value);
  }

  static bool isAdmin() {
    return pref.read(IS_ADMIN) ?? false;
  }
}
