import 'package:flutter/material.dart';
import 'package:my_expenses/widgets/chart.dart';
import 'package:my_expenses/widgets/new_transaction.dart';
import 'package:my_expenses/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
  runApp(const MaterialApp(home: ExpensesApp()));
}

class ExpensesApp extends StatefulWidget {
  ///
  /// Main constructor
  ///
  const ExpensesApp({
    Key? key,
  }) : super(key: key);

  @override
  State<ExpensesApp> createState() => _ExpensesAppState();
}

class _ExpensesAppState extends State<ExpensesApp> {
  //? STATE
  ///
  /// The combination of the title and the value we spent
  ///
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  //? GETTERS
  ///
  /// Obtains the transactions from last week filtering the [_userTransactions]
  /// list
  ///
  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where(
          (element) => element.date.isAfter(
            DateTime.now().subtract(
              const Duration(days: 7),
            ),
          ),
        )
        .toList();
  }

  ///
  /// Main builder
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Chart(recentTransactions: _recentTransactions),
          TransactionList(
              userTransactions: _userTransactions,
              deleteTransaction: _deleteTransaction),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  ///
  /// Customize a FloatingActionButton
  ///
  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => _startAddNewTransaction(context),
      backgroundColor: const Color(0xffC2DED1),
      child: const Icon(Icons.add),
    );
  }

  ///
  /// Customize the app bar
  ///
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xffC2DED1),
      actions: [
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: const Icon(
            Icons.add,
          ),
        ),
      ],
      title: const Center(
        child: Text(
          'My Expenses',
          style: TextStyle(
              color: Color(0xff354259), fontFamily: 'Pacifico', fontSize: 25),
        ),
      ),
    );
  }

  //?===========================================================================
  //? HANDLERS
  //?===========================================================================

  ///
  /// Starts the process of adding a new transaction by showing the input area
  /// for that new transaction
  ///
  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => NewTransaction(_addNewTransaction),
        backgroundColor: Colors.transparent,
        isScrollControlled: true);
  }

  ///
  /// Adding a new transaction to [_userTransactions] list
  ///
  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: chosenDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  ///
  /// Deleting a transaction from [_userTransactions] list
  ///
  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }
}
