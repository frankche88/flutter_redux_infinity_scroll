import 'package:flutter/material.dart';
import 'package:flutter_redux_infinite_list/models/user_transaction.dart';

class GithubIssueListItem extends StatelessWidget {
  const GithubIssueListItem({
    Key key,
    @required this.itemIndex,
    @required this.githubIssue,
  }) : super(key: key);

  final int itemIndex;
  final Transaction githubIssue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
        title: Text(
          '#${itemIndex + 1}: ${githubIssue.transactionType}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(githubIssue.createdAtFormatted),
            Text(githubIssue.transactionType),
          ],
        ),
        isThreeLine: true,
      ),
      height: 60.0,
    );
  }
}
