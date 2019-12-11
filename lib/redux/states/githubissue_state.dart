import 'package:flutter_redux_infinite_list/models/user_transaction.dart';
class GithubIssueState {
GithubIssueState({
    this.isDataLoading,
    this.isNextPageAvailable,
    this.items,
    this.error,
  });

  final bool isDataLoading;
  final bool isNextPageAvailable;
  final List<Transaction> items;
  final Exception error;

  static const int itemsPerPage = 20;

  factory GithubIssueState.initial() => GithubIssueState(
        isDataLoading: false,
        isNextPageAvailable: false,
        items: const [],
      );

  GithubIssueState copyWith({
    isDataLoading,
    isNextPageAvailable,
    items,
    error,
  }) {
    return GithubIssueState(
      isDataLoading: isDataLoading ?? this.isDataLoading,
      isNextPageAvailable: isNextPageAvailable ?? this.isNextPageAvailable,
      items: items ?? this.items,
      error: error != this.error ? error : this.error,
    );
  }

  @override
  String toString() {
    return "AppState: isDataLoading = $isDataLoading, "
        "isNextPageAvailable = $isNextPageAvailable, "
        "itemsLength = ${items.length}, "
        "error = $error.";
  }
}