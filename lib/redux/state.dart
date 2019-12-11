
import 'package:flutter_redux_infinite_list/redux/states/transaction_state.dart';


class AppState {
  final TransactionState transactionState;
  AppState({
    this.transactionState,
  });


  factory AppState.initial() => AppState(
        transactionState: TransactionState.initial(),
      );

  AppState copyWith({
    transactionState,
  }) {
    return AppState(
      transactionState: transactionState ?? this.transactionState,
    );
  }

  
}
