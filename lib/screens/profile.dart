import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/model/user.dart';
import 'package:untitled/utils/common_widgets.dart';

import '../style.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  ProfilePage({required this.user});

  @override
  MapScreenState createState() => MapScreenState(user);
}

class MapScreenState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  bool _notEditable = true;
  final FocusNode myFocusNode = FocusNode();
  final User userProfile;

  MapScreenState(this.userProfile);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      color: Colors.white,
      child: new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                height: 250.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 20.0),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 22.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: new Text('PROFILE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      fontFamily: 'sans-serif-light',
                                      color: Colors.black)),
                            )
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: new Stack(fit: StackFit.loose, children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                                width: 140.0,
                                height: 140.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    image: new ExactAssetImage('assets/images/as.png'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 70.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 25.0,
                                  child: new Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                      ]),
                    )
                  ],
                ),
              ),
              new Container(
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionIcons() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 8.0, top: 0.0),
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Visibility(child: _getDoneButton(), visible: !_notEditable),
          Visibility(child: _getCancelButton(), visible: !_notEditable),
          Visibility(child: _getEditButton(), visible: _notEditable)
        ],
      ),
    );
  }

  Widget _getEditButton() {
    return getCircularIconButton(
        Colors.red,
        new Icon(
          Icons.edit,
          color: Colors.white,
          size: 18.0,
        ),
        () => editButtonTap());
  }

  Widget _getCancelButton() {
    return getCircularIconButton(
        Colors.redAccent,
        new Icon(
          Icons.cancel,
          color: Colors.white,
          size: 18.0
        ),
        () => cancelButtonTap());
  }

  Widget _getDoneButton() {
    return getCircularIconButton(
        Colors.greenAccent,
        new Icon(
          Icons.done_rounded,
          color: Colors.white,
          size: 18.0,
        ),
        () => doneButtonTap());
  }

  void editButtonTap() {
    setState(() {
      _notEditable = false;
    });
  }

  void doneButtonTap() {
    setState(() {
      //Todo saving data
      _notEditable = true;
      FocusScope.of(context).requestFocus(new FocusNode());
    });
  }

  void cancelButtonTap() {
    setState(() {
      _notEditable = true;
      FocusScope.of(context).requestFocus(new FocusNode());
    });
  }
}
