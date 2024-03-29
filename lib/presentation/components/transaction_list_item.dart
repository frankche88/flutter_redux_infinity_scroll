import 'package:flutter/material.dart';
import 'package:flutter_redux_infinite_list/models/user_transaction.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key key,
    @required this.itemIndex,
    @required this.transaction,
  }) : super(key: key);

  final int itemIndex;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
        title: Text(
          '#${itemIndex + 1}: ${transaction.transactionId}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(transaction.amount.toString()),
            Text(transaction.createdAtFormatted),
            Text(transaction.transactionType),
          ],
        ),
        isThreeLine: true,
      ),
      height: 60.0,
    );
  }
}
