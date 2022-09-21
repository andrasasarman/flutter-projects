///
///
/// How a transaction should look like
///
class Transaction {
  ///
  /// A unique ID that identifies each transaction
  ///
  final String id;

  ///
  /// Name of expense
  ///
  final String title;

  ///
  /// How much we spend
  ///
  final double amount;

  ///
  /// Transaction date
  ///
  final DateTime date;

  ///
  /// Main constructor
  ///
  const Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}
