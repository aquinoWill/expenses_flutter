import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'adaptative_button.dart';
import 'adaptavive_textfield.dart';
import 'adaptative_date_picker.dart';

class TransactionFrom extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionFrom(this.onSubmit) {
    print('Construtor Transaction');
  }

  @override
  _TransactionFromState createState() => _TransactionFromState();
}

class _TransactionFromState extends State<TransactionFrom> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _TransactionFromState() {
    print('Construtor TransactionFromState');
  }

  @override
  void initialState() {
    super.initState();
    print('intialState() TransactionFromState');
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget _TransactionFormState');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose _TransactionFormState');
  }

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AdaptativeTextField(
            labelText: 'Título',
            onSubmit: (_) => _submitForm(),
            controller: _titleController,
          ),
          AdaptativeTextField(
            onSubmit: (_) => _submitForm(),
            labelText: 'Valor (R\$)',
            controller: _valueController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          AdaptativeDatePicker(
            selectedDate: _selectedDate,
            onDateChange: (newDate) {
              setState(() {
                _selectedDate = newDate;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AdataptiveButton(label: 'Nova Trasação', onPressed: _submitForm)
            ],
          ),
        ],
      ),
    );
  }
}
