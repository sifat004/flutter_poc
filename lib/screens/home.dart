import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:untitled/model/user.dart';
import 'package:untitled/network/api_calls.dart';
import 'package:untitled/screens/profile.dart';
import 'package:untitled/utils/S.dart';
import 'package:untitled/widgets/employee_list_widget.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    if (S.isAdmin())
      return EmployeeListWidget();

    else
      return FutureBuilder <User>(
          builder: (context, userSnap) {
            if (userSnap.connectionState == ConnectionState.none ||
                userSnap.hasData == false)
              return CircularProgressIndicator();
            else
              return ProfilePage(user: userSnap.data!);
          }, future: fetchUser(S.getUserName())
      );
  }

}
