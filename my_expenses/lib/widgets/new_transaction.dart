import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expenses/widgets/text_input.dart';

class NewTransaction extends StatefulWidget {
  ///
  /// Used to add new transaction
  ///
  final Function addTx;

  ///
  /// Main constructor
  ///
  const NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //? STATE
  ///
  /// New transaction title
  ///
  String _titleInput = '';

  ///
  /// New transaction amount
  ///
  double _amountInput = 0;

  ///
  /// New transaction date
  ///
  DateTime? _selectedDate;

  ///
  /// NewTransaction builder
  ///
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 300,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.white),
        child: Column(
          children: [
            _buildTextInputs(),
            _buildDateSection(),
            _buildAddTransactionButton(),
          ],
        ),
      ),
    );
  }

  ///
  /// Build an ElevatedButton for adding the transaction
  ///
  Widget _buildAddTransactionButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color(0xffC2DED1).withOpacity(0.7)),
      ),
      onPressed: _submitData,
      child: const Text(
        'Add Transaction',
        style: TextStyle(
            color: Color(0xff354259), fontFamily: 'Pacifico', fontSize: 15),
      ),
    );
  }

  ///
  /// Build a row with a choose date option
  ///
  Widget _buildDateSection() {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            _selectedDate != null
                ? DateFormat('y MMMM d ').format(_selectedDate!)
                : 'No date chosen!',
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xff354259),
            ),
          ),
          GestureDetector(
            onTap: () {
              _presentDatePicker();
            },
            child: const Text(
              'Choose date!',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xff354259),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///
  /// Build the text inputs for adding a title and an amount
  ///
  Widget _buildTextInputs() {
    return Column(
      children: [
        TextInput(
          hintText: 'TITLE',
          onChanged: (value) {
            setState(() {
              _titleInput = value;
            });
          },
          onSubmitted: (_) => _submitData(),
        ),
        TextInput(
          hintText: 'AMOUNT',
          onChanged: (value) {
            setState(() {
              _amountInput = double.parse(value);
            });
          },
          onSubmitted: (_) => _submitData(),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  //?===========================================================================
  //? HANDLERS
  //?===========================================================================
  ///
  /// Adding a new transaction to the list
  ///
  void _submitData() {
    if (_titleInput.isEmpty || _amountInput <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(_titleInput, _amountInput, _selectedDate);
    Navigator.of(context).pop();
  }

  ///
  /// A method which shows a date picker
  ///
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        } else {
          setState(() {
            _selectedDate = pickedDate;
          });
        }
      },
    );
  }
}
