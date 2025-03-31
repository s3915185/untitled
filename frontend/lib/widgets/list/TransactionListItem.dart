import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/Constants.dart';
import 'package:untitled/dto/TransactionElement.dart';
import 'package:untitled/enum/TransactionCategory.dart';
import 'package:untitled/utils/DateTimeUtils.dart';

import '../../utils/ImageUtils.dart';

class TransactionListItem extends StatelessWidget {
  final TransactionElement transactionElement;

  const TransactionListItem({Key? key, required this.transactionElement})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ImageUtils.formatJpg(Constants.ICON_GYM, 24),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${DateTimeUtils.dateTimeNormalFormat(transactionElement.dateTime!)}",
                  style: TextStyle(
                    fontFamily: 'Inter - Semi - Bold',
                    color: Colors.grey,
                    fontSize: 11,
                    height: 0.5,
                  ),
                  textHeightBehavior: TextHeightBehavior(
                    leadingDistribution:
                        TextLeadingDistribution
                            .proportional, // Moves text towards bottom
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${transactionElement.elementName}",
                      style: TextStyle(
                        fontFamily: 'Inter - Bold',
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      "${transactionElement.value! >= 0 ? '+' : '-'}${transactionElement.value!.abs()}",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Inter - Bold',
                        color:
                        transactionElement.value! >= 0
                                ? Constants.COLOR_STRONG_BLUE
                                : Color.fromARGB(255, 248, 156, 51),
                      ),
                    ),
                  ],
                ),
                Text(
                  "${TransactionCategory.getMessage(transactionElement.transactionCategoryType!)}",
                  style: TextStyle(
                    fontFamily: 'Inter - Semi - Bold',
                    color: Colors.grey,
                    fontSize: 12,
                    height: 0.9,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
