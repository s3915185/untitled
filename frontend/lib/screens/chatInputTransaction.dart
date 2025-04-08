import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Constants.dart';
import 'package:untitled/dto/TransactionElement.dart';
import 'package:untitled/dto/UserTransactionDTO.dart';
import 'package:untitled/layouts/BasicLayout.dart';
import 'package:untitled/screens/ChatInputTransactionService.dart';
import 'package:untitled/utils/ImageUtils.dart';

import '../GlobalConfig.dart';
import '../api/ApiClient.dart';
import '../enum/NavBarTabType.dart';
import '../enum/TransactionCategory.dart';
import '../main.dart';
import '../widgets/list/TransactionList.dart';

class InputTransaction extends StatefulWidget {
  @override
  State<InputTransaction> createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  final chatInputTransactionService = ChatInputTransactionService(ApiClient());
  late List<TransactionElement> data = [];

  @override
  void initState() {
    super.initState();
    _getUserTransactions();
  }

  Future<void> _getUserTransactions() async {
    try {
      final userTransactionList = await chatInputTransactionService
          .getUserTransactionsByUserInfoId(1);
      setState(() {
        data =
            userTransactionList!.map((element) {
              return TransactionElement(
                element.id,
                element.localDate,
                element.name,
                element.transactionCategory,
                element.amount,
              );
            }).toList();
      });
    } catch (e) {
      setState(() {});
    }
  }

  Future<void> _addNewOneTransaction(
    double amount,
    DateTime localDate,
    String name,
    String category,
    int userInfoId,
  ) async {
    try {
      UserTransactionDTO userTransactionDTO = UserTransactionDTO(
        userInfoId: 1,
        transactionCategory: category,
        name: name,
        localDate: localDate,
        amount: -amount,
      );
      final userTransactionData = await chatInputTransactionService
          .postSingleTransaction(userTransactionDTO.toJson());
      setState(() {
        data.add(TransactionElement(
          userTransactionData!.id,
          userTransactionData.localDate,
          userTransactionData.name,
          userTransactionData.transactionCategory,
          userTransactionData.amount,
        ));
      });
    } catch (e) {
      setState(() {});
    }
  }

  Future<void> _deleteTransaction(int? index) async {
    final userTransactionData = await chatInputTransactionService
        .deleteSingleTransaction(index!);
    if (userTransactionData!) {
      setState(() {
        data.removeWhere((item) => item.id == index);
      });
    }
  }

  void _showTransactionInputPopup() {
    final config = Provider.of<GlobalConfig>(context, listen: false);
    TextEditingController nameController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    String selectedCategory =
        config.categories.isEmpty ? "new category" : config.categories.first;
    DateTime selectedDate = DateTime.now();

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
                        DropdownButton<String>(
                          value: selectedCategory,
                          onChanged: (String? newValue) {
                            setModalState(() {
                              selectedCategory = newValue!;
                            });
                          },
                          items:
                              config.categories.map((String category) {
                                return DropdownMenuItem<String>(
                                  value: category,
                                  child: Text(
                                    category.toString().split('.').last,
                                  ),
                                );
                              }).toList(),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null && picked != selectedDate) {
                              setModalState(() {
                                selectedDate = picked;
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today, size: 18),
                              SizedBox(width: 8),
                              Text(
                                "${selectedDate.toLocal()}".split(' ')[0],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        _addNewOneTransaction(
                          double.tryParse(amountController.text) ?? 0.0,
                          selectedDate,
                          nameController.text,
                          selectedCategory,
                          1,
                        );
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
            dateStart: null,
            dateEnd: null,
            data: data,
            isEdit: true,
            onItemDeleted: _deleteTransaction,
          ),
        ],
      ),
    );
  }
}
