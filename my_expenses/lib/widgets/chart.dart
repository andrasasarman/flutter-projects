import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expenses/models/transaction.dart';
import 'package:my_expenses/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  ///
  /// The list of all transactions from the last 7 days
  ///
  final List<Transaction> recentTransactions;

  ///
  /// Main constructor
  ///
  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  ///
  /// Chart builder
  ///
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: const Color(0xffCDC2AE),
          elevation: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues
                .map((e) => Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                          e['day'].toString(),
                          double.parse(e['amount'].toString()),
                          (e['amount'] as double) / totalSpending),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  ///
  /// Calculates the total spending sum for the last 7 days and returns a map
  /// with those values
  ///
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      var weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  ///
  /// Gets the total spending in the last 7 days
  ///
  double get totalSpending {
    return groupedTransactionValues.fold(
        0.0, (sum, item) => sum + (item['amount'] as double));
  }
}
