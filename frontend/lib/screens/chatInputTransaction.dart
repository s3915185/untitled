import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/Constants.dart';
import 'package:untitled/dto/TransactionElement.dart';
import 'package:untitled/layouts/BasicLayout.dart';
import 'package:untitled/utils/ImageUtils.dart';

import '../enum/NavBarTabType.dart';
import '../enum/TransactionCategory.dart';
import '../main.dart';
import '../widgets/list/TransactionList.dart';

class InputTransaction extends StatefulWidget {
  @override
  State<InputTransaction> createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  List<TransactionElement> data = [
    TransactionElement(
      DateTime(2025, 3, 8),
      "Dinner Date (Dining out)",
      "Food & Dining",
      -132.00,
    ),
    TransactionElement(
      DateTime(2025, 3, 7),
      "Gym membership Renewal",
      "Subscriptions & Recurring Cost",
      -450.00,
    ),
    TransactionElement(
      DateTime(2025, 3, 5),
      "Son's birthday gift",
      "Shopping & Leisure",
      -150.00,
    ),
    TransactionElement(
      DateTime(2025, 3, 2),
      "Salary M3/2025",
      "Housing & Bills",
      7516.00,
    ),
    TransactionElement(
      DateTime(2025, 3, 1),
      "Car's Tire fix",
      "Transportation",
      -85.00,
    ),
  ];

  void _showTransactionInputPopup() {
    TextEditingController nameController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    String selectedCategory = "Food & Dining";

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                height: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add New Transaction",
                          style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
                        ),
                        TextField(
                          controller: nameController,
                          style: TextStyle(fontSize: 12, fontFamily: 'Inter'),
                          decoration: InputDecoration(
                            labelText: "Transaction name",
                            labelStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                        TextField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 12, fontFamily: 'Inter'),
                          decoration: InputDecoration(
                            labelText: "Amount",
                            labelStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                        // DropdownButton<String>(
                        //   value: selectedCategory,
                        //   onChanged: (String? newValue) {
                        //     setModalState(() {
                        //       selectedCategory = newValue!;
                        //     });
                        //   },
                        //   items: TransactionCategoryType.values.map(
                        //         (TransactionCategoryType category) {
                        //       return DropdownMenuItem<TransactionCategoryType>(
                        //         value: category,
                        //         child: Text(category.toString().split('.').last),
                        //       );
                        //     },
                        //   ).toList(),
                        // ),
                      ],
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() {
                          data.add(
                            TransactionElement(
                              DateTime.now(),
                              nameController.text,
                              selectedCategory,
                              double.tryParse(amountController.text) ?? 0.0,
                            ),
                          );
                        });
                        Navigator.pop(context);
                      },
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 2),
                            child: Text(
                              "Add",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                color: Constants.COLOR_STRONG_BLUE,
                              ),
                            ),
                          ),
                          ImageUtils.formatSvg(
                            Constants.ICON_CHECK,
                            27,
                            color: Constants.COLOR_STRONG_BLUE,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BasicLayout(
        childrens: [
          GestureDetector(
            onTap:
                () => homePageKey.currentState?.switchTab(NavBarTabType.CHAT),
            child: Transform.translate(
              offset: Offset(-10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageUtils.formatSvg(
                    Constants.ICON_ARROW_LEFT,
                    30,
                    color: Constants.COLOR_STRONG_BLUE,
                  ),
                  Text(
                    "Go back",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: Constants.COLOR_STRONG_BLUE,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transactions",
                style: TextStyle(fontSize: 12, fontFamily: 'Inter'),
              ),
              Row(
                spacing: 10,
                children: [
                  GestureDetector(
                    onTap: _showTransactionInputPopup,
                    child: ImageUtils.formatSvg(
                      Constants.ICON_PLUS,
                      24,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => print("Search"),
                    child: ImageUtils.formatSvg(
                      Constants.ICON_SEARCH,
                      15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          TransactionList(
            dateStart: DateTime.now(),
            dateEnd: DateTime.now(),
            data: data,
            isEdit: true,
          ),
        ],
      ),
    );
  }
}
