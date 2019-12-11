
import 'package:flutter_redux_infinite_list/redux/states/transaction_state.dart';


class AppState {
  final TransactionState githubIssueState;
  AppState({
    this.githubIssueState,
  });


  factory AppState.initial() => AppState(
        githubIssueState: TransactionState.initial(),
      );

  AppState copyWith({
    githubIssueState,
  }) {
    return AppState(
      githubIssueState: githubIssueState ?? this.githubIssueState,
    );
  }

  
}
