import 'dart:ffi';

import 'package:flutter/material.dart';

const String FontNameDefault = 'Montserrat';



TextStyle _textStyle(double fontSize) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w400);
}

TextStyle _titleStyle(double fontSize) {
  return TextStyle(
  fontSize: fontSize,
  fontWeight: FontWeight.bold);
}
TextStyle titleStyle(FontSize fontSize) {

  switch (fontSize) {
    case FontSize.ExtraLarge: return _titleExtraLarge;
    case FontSize.Large: return _titleLarge;
    case FontSize.Medium: return _titleMedium;
    case FontSize.Small: return _titleSmall;
    case FontSize.Mini: return _titleMini ;
    default: return _titleMedium;
}

}

TextStyle textStyle(FontSize fontSize) {
  switch (fontSize) {
    case FontSize.ExtraLarge: return _textExtraLarge;
    case FontSize.Large: return _textLarge;
    case FontSize.Medium: return _textMedium;
    case FontSize.Small: return _textSmall;
    case FontSize.Mini: return _textMini ;
    default: return _textMedium;
  }

}

var _titleExtraLarge = _titleStyle(26.0);
var _titleLarge = _titleStyle(22.0);
var _titleMedium = _titleStyle(20.0);
var _titleSmall = _titleStyle(18.0);
var _titleMini = _titleStyle(16.0);

var _textExtraLarge = _textStyle(26.0);
var _textLarge = _textStyle(22.0);
var _textMedium = _textStyle(20.0);
var _textSmall = _textStyle(18.0);
var _textMini = _textStyle(16.0);

enum FontSize {
  ExtraLarge,
  Large,
  Medium,
  Small,
  Mini
}