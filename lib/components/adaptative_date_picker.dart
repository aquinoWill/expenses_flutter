import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChange;

  AdaptativeDatePicker({this.selectedDate, this.onDateChange});

  @override
  Widget build(BuildContext context) {
    _showDatePicker(BuildContext context) {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2019),
              lastDate: DateTime.now())
          .then((pickedDate) {
        if (pickedDate == null) {
          return;
        }

        onDateChange(pickedDate);
      });
    }

    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChange,
            ),
          )
        : Container(
            child: Row(children: [
            Text(selectedDate == null
                ? 'Nenhuma data selecionada!'
                : DateFormat('dd/MM/y').format(selectedDate)),
            FlatButton(
              textColor: Theme.of(context).primaryColor,
              child: Text(
                'Selecionar data',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => _showDatePicker(context),
            ),
          ]));
  }
}
