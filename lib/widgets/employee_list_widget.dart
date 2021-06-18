import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:untitled/model/user.dart';
import 'package:untitled/network/api_calls.dart';
import 'package:untitled/screens/financial_profile.dart';
import 'package:untitled/screens/profile.dart';
import 'package:untitled/utils/P.dart';
import 'package:untitled/utils/S.dart';

class EmployeeListWidget extends StatelessWidget {
  late Future<List<User>> users;

  Widget card(User user, BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        child: listItem(user,context),
      ),
    );
  }

  Widget listItem(User user,BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilePage(user: user)),
          );
        },
        title: Text(user.userName),
        subtitle: Text("userId " + user.userId.toString()),
        leading: Icon(Icons.verified_user));
  }

  Widget employeeListWidget() {
    return FutureBuilder<List<User>>(
      builder: (context, employeeSnap) {
        if (employeeSnap.connectionState == ConnectionState.none ||
            employeeSnap.hasData==false) return CircularProgressIndicator();

        else return ListView.builder(
          itemCount: employeeSnap.data!.length,
          itemBuilder: (context, index) {
            User user = employeeSnap.data![index];
            return card(user, context);
          },
        );
      },
      future:null /*fetchUser(S.getUserName())*/,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(title: Text('Welcome Aboard')),
        body: Container(
            margin: new EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
            child: employeeListWidget()));
  }
}
