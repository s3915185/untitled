import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/dto/TransactionElement.dart';
import 'package:untitled/enum/TransactionCategory.dart';
import 'package:untitled/widgets/handler/TransactionListHandler.dart';
import 'package:untitled/widgets/list/TransactionListItem.dart';

class TransactionList extends StatefulWidget {
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final List<TransactionElement> data;
  final bool isEdit;

  const TransactionList({
    Key? key,
    required this.dateStart,
    required this.dateEnd,
    required this.data,
    required this.isEdit,
  }) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  void _deleteTransaction(int index) {
    setState(() {
      widget.data.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionListHandler(
          dateStart: widget.dateStart,
          dateEnd: widget.dateEnd,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            spacing: 20,
            children:
                widget.isEdit
                    ? widget.data.asMap().entries.map((entry) {
                      final index = entry.key;
                      final element = entry.value;
                      return Dismissible(
                        key: Key(
                          element.elementName! + element.dateTime.toString(),
                        ),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) => _deleteTransaction(index),
                        child: TransactionListItem(transactionElement: element),
                      );
                    }).toList()
                    : widget.data.map((element) {
                      return TransactionListItem(
                        transactionElement: TransactionElement(
                          element.dateTime,
                          element.elementName,
                          element.transactionCategory,
                          element.value,
                        ),
                      );
                    }).toList(),
          ),
        ),
      ],
    );
  }
}
