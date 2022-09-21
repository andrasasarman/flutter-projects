import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  ///
  /// Detects the weekday
  ///
  final String label;

  ///
  /// How much was spent on weekday
  ///
  final double spendingAmount;

  ///
  /// Spending percentage of total
  ///
  final double spendingPercentage;

  ///
  /// Main constructor
  ///
  const ChartBar(this.label, this.spendingAmount, this.spendingPercentage,
      {Key? key})
      : super(key: key);

  ///
  /// ChartBar builder
  ///
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          _buildAmountPerDay(),
          const SizedBox(
            height: 4,
          ),
          _buildPercentageBar(),
          const SizedBox(
            height: 4,
          ),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xff354259),
            ),
          ),
        ],
      ),
    );
  }

  ///
  /// Build a bar using a Stack which reflects the percentage of total sum spent
  /// in that day
  ///
  Widget _buildPercentageBar() {
    return SizedBox(
      height: 60,
      width: 10,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff354259),
              ),
              color: const Color(0xffCDC2AE),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          FractionallySizedBox(
            heightFactor: spendingPercentage,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffC2DED1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///
  /// Build a text which contains the total amount for a day
  ///
  Widget _buildAmountPerDay() {
    return SizedBox(
      height: 20,
      child: FittedBox(
        child: Text(
          '\$${spendingAmount.toStringAsFixed(0)}',
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Color(0xff354259),
          ),
        ),
      ),
    );
  }
}
