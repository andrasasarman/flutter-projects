import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  ///
  /// Contains all the transactions added
  ///
  final List<Transaction> userTransactions;

  ///
  /// Function used to delete a transaction
  ///
  final Function deleteTransaction;

  ///
  /// Main constructor
  ///
  const TransactionList(
      {Key? key,
      required this.userTransactions,
      required this.deleteTransaction})
      : super(key: key);

  ///
  /// TransactionList builder
  ///
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: _buildCircleAvatar(index),
            title: _buildTransactionName(index),
            subtitle: _buildTransactionDate(index),
            trailing: _buildAddButton(index),
          );
        },
        itemCount: userTransactions.length,
      ),
    );
  }

  ///
  /// Customize an InconButton
  ///
  Widget _buildAddButton(int index) {
    return IconButton(
      onPressed: () => deleteTransaction(userTransactions[index].id),
      icon: const Icon(Icons.delete),
      color: const Color(0xffC2DED1),
    );
  }

  ///
  /// Customize the transaction date as a subtitle for ListTile
  ///
  Widget _buildTransactionDate(int index) {
    return Text(
      DateFormat('y MMMM d ').format(userTransactions[index].date),
      style: const TextStyle(
          color: Color(0xffCDC2AE),
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.bold),
    );
  }

  ///
  /// Customize the transaction name as a title for ListTile
  ///
  Widget _buildTransactionName(int index) {
    return Text(
      userTransactions[index].title,
      style: const TextStyle(
          color: Color(0xff354259),
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.bold),
    );
  }

  ///
  /// Customize an avatar which contains the amount of transaction
  ///
  Widget _buildCircleAvatar(int index) {
    return CircleAvatar(
      backgroundColor: const Color(0xffCDC2AE),
      radius: 30,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Text(
            '\$${userTransactions[index].amount.toStringAsFixed(2)}',
            style: const TextStyle(
                color: Color(0xff354259),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
