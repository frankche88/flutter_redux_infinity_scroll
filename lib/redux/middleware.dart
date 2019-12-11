import 'dart:convert';
import 'package:flutter_redux_infinite_list/models/user_transaction.dart';
import 'package:flutter_redux_infinite_list/redux/actions.dart';
import 'package:flutter_redux_infinite_list/redux/state.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

List<Middleware<AppState>> createAppMiddleware() {
  return [
    TypedMiddleware<AppState, LoadItemsPageAction>(_loadItemsPage()),
    LoggingMiddleware.printer(),
  ];
}

_loadItemsPage() {
  return (Store<AppState> store, LoadItemsPageAction action,
      NextDispatcher next) {
    next(action);

    _loadFlutterTransaction(action.pageNumber, action.itemsPerPage).then(
      (itemsPage) {
        store.dispatch(ItemsPageLoadedAction(itemsPage));
      },
    ).catchError((exception, stacktrace) {
      store.dispatch(ErrorOccurredAction(exception));
    });
  };
}

Future<List<Transaction>> _loadFlutterTransaction(
    int page, int perPage) async {
      // <TODO: CAmbiar por los parametros de busqueda

  String customerID = "4ac5d6f2-f546-4e5b-a7ac-c5cd9817602e";
  String fromDate="01122019";  
  String toDate="12122019";

  //http://206.189.58.66:8085/transactions/$customerID?fromDate=$fromDate&pageNo=$page&pageSize=$pageSize&toDate=$toDate
  var response = await http.get(
      'http://206.189.58.66:8085/transactions/$customerID?fromDate=$fromDate&pageNo=$page&pageSize=$perPage&toDate=$toDate');
  if (response.statusCode == 200) {
    final paged = json.decode(response.body);
    final items = paged["content"] as List;
    return items.map((item) => Transaction.fromJson(item)).toList();
  } else {
    throw Exception('Error getting data, http code: ${response.statusCode}.');
  }
}
