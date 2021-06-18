import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style.dart';

Widget titleWidget(String title, FontSize fontSize) {
  return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: new Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[new Text(title, style: titleStyle(fontSize))],
        )
      ]));
}

Widget titleWidgetWithIconAtTheEnd(String title, FontSize fontSize, Widget icon) {
  return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 5.0, top: 25.0),
      child:
          new Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[new Text(title, style: titleStyle(fontSize))],
        ),
        new Column(mainAxisAlignment: MainAxisAlignment.end, mainAxisSize: MainAxisSize.min, children: <Widget>[icon])
      ]));
}

Widget titleWidgetWithIconAtTheFront(String title, FontSize fontSize, IconData icon) {
  return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 5.0, top: 25.0),
      child: new Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
        new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Padding(padding: EdgeInsets.all(5.0), child: Icon(icon))]),
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[new Text(title, style: textStyle(fontSize))],
        )
      ]));
}

Widget textWidgetWithIconAtTheFront(String title, FontSize fontSize, IconData icon) {
  return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 2.0),
      child: new Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
        new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Padding(padding: EdgeInsets.all(2.0), child: Icon(icon))]),
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[new Text(title, style: textStyle(fontSize))],
        )
      ]));
}

Widget editableTextWidget(String text, bool editEnabled, FontSize? fontSize) {
  return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Flexible(
            child: new TextField(
              decoration: InputDecoration(
                hintText: text,
              ),
              enabled: editEnabled,
              autofocus: editEnabled,
              style: textStyle(fontSize ?? FontSize.Medium),
            ),
          ),
        ],
      ));
}

Widget normalTextWidget(String text, FontSize? fontSize /* ,MainAxisAlignment? mAlignment = null*/) {
  return Padding(
      padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 2.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[new Text(text, style: textStyle(fontSize ?? FontSize.Medium))],
          )
        ],
      ));
}

Widget normalTextWidgetWithBottomLine(String text, FontSize? fontSize /* ,MainAxisAlignment? mAlignment = null*/) {
  return Padding(
      padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 2.0),
      child: new Container(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.black26))),
          child: new Padding(
              padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 5.0),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[new Text(text, style: textStyle(fontSize ?? FontSize.Medium))],
                  )
                ],
              ))));
}

Widget getCircularIconButton(Color bgColor, Icon ic, VoidCallback callbackAction) {
  return ElevatedButton(
      child: ic,
      onPressed: () {
        callbackAction.call();
      },
      style: ElevatedButton.styleFrom(primary: bgColor, shape: CircleBorder(), padding: EdgeInsets.all(0)

          /*new CircleAvatar(backgroundColor: bgColor, radius: 18.0, child: ic),*/
          ));
}
