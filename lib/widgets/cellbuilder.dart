
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

Widget cellBuilder(
    BuildContext context, DateRangePickerCellDetails cellDetails) {
   {
    return Column(
      children: [
        Container(
          child: Text(DateFormat('dd').format(cellDetails.date)),
          alignment: Alignment.center,
        )
      ],
    );
  }
}