import 'package:flutter_redux_infinite_list/redux/reducers/transaction_reducer.dart';


import 'package:flutter_redux_infinite_list/redux/state.dart';


AppState appReducer(AppState state, dynamic action) =>
    new AppState(
        transactionState: githubIssueReducer(state.transactionState,action)
    );

