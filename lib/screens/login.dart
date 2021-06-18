import 'package:flutter/material.dart';
import 'package:untitled/helpers/loginhelper.dart';

class LogIn extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen'),
        ),
        body: SafeArea(
            child: Center(
                child: Container(
                    padding: EdgeInsets.all(0),
                    alignment: Alignment.center,
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(20.0),
                      children: <Widget>[
                        Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Dynamic Solution Innovators',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.w500, fontSize: 30),
                            )),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        Visibility(
                            visible: false,
                            child: FlatButton(
                              onPressed: () {
                                //forgot password screen
                              },
                              textColor: Colors.cyan,
                              child: Text('Forgot Password'),
                            )),
                        Visibility(
                            visible: true,
                            child: Container(
                                height: 70,
                                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                child:
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                                  onPressed: () {
                                    login(nameController.text, passwordController.text, context);
                                  },
                                  child: const Text('Login'),
                                ),
                                )),
                        Visibility(
                            visible: false,
                            child: Container(
                                child: Row(
                              children: <Widget>[
                                Text('Does not have account?'),
                                FlatButton(
                                  textColor: Colors.cyan,
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    //signup screen
                                  },
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            )))
                      ],
                    )))));
  }
}
