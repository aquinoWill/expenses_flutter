import 'package:flutter/material.dart';
import '../modules/transaction.dart';
import './transaction_item.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionsList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return (Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.05),
                Container(
                  height: constraints.maxHeight * 0.3,
                  child: Text(
                    'Nenhuma Transação cadastrada!',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                Container(
                  height: constraints.maxHeight *
                      0.6, // constrainsts tem acesso as dimenssões que do local que o component será exibido
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ));
          })
        : ListView(
          children: transactions.map((tr) {
            return TransactionItem(
              key: ValueKey(tr.id),
              trans: tr,
              onRemove: onRemove
            );
          }).toList(),
        );
  }
}
