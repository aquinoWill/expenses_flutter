import 'dart:math';
import 'package:intl/intl.dart';
import '../modules/transaction.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatefulWidget {
  final Transaction trans;
  final void Function(String) onRemove;

  const TransactionItem({
    Key key,
    @required this.trans,
    @required this.onRemove,
  }) : super(key: key);

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black,
  ];

  Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: _backgroundColor,
            radius: 30,
            child: Padding(
                padding: const EdgeInsets.all(6),
                child: FittedBox(child: Text('R\$${widget.trans.value}')))),
        title: Text(
          widget.trans.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(DateFormat('d MMM y').format(widget.trans.date)),
        trailing: MediaQuery.of(context).size.width > 480
            ? FlatButton.icon(
                onPressed: () => widget.onRemove(widget.trans.id),
                icon: const Icon(Icons.delete),
                label: const Text(
                    'Excluir'), // add to const to optimized to performance
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.onRemove(widget.trans.id),
              ),
      ),
    );
  }
}
