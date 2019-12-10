
import 'package:flutter_redux_infinite_list/redux/states/githubissue_state.dart';


class AppState {
  final GithubIssueState githubIssueState;
  AppState({
    this.githubIssueState,
  });


  factory AppState.initial() => AppState(
        githubIssueState: GithubIssueState.initial(),
      );

  AppState copyWith({
    githubIssueState,
  }) {
    return AppState(
      githubIssueState: githubIssueState ?? this.githubIssueState,
    );
  }

  
}
