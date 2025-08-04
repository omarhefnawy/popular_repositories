import 'package:bloc/bloc.dart';
import 'package:popular_repositories/core/utils/enums/github_status.dart';
import 'package:popular_repositories/service/get_popular_repos.dart';

import '../states/popularRepoStates.dart';

class PopularRepoCubit extends Cubit<PopularRepoStates> {
  final PopularRepos popularRepos;

  PopularRepoCubit({required this.popularRepos}) : super(PopularRepoStates.initial());

  void updateDate(DateTime newDate) {
    emit(state.copyWith(selectedDate: newDate));
  }

  void updateLanguage(String newLanguage) {
    emit(state.copyWith(selectedLanguage: newLanguage));
  }

  void updateLimit(int newLimit) {
    emit(state.copyWith(selectedLimit: newLimit));
  }

  Future<void> getPopularRepo() async {
    try {
      emit(state.copyWith(status: GithubStatus.loading));

      final data = await popularRepos.getPopularRepos(
        date: state.selectedDate,
        programingLanguage: state.selectedLanguage,
        limit: state.selectedLimit,
      );

      if (data.isEmpty) {
        emit(state.copyWith(status: GithubStatus.empty, data: []));
        return;
      }

      emit(state.copyWith(status: GithubStatus.success, data: data));
    } catch (e) {
      emit(state.copyWith(
        status: GithubStatus.failure,
        massege: "Error Fetching Popular Repos: ${e.toString()}",
      ));
    }
  }
}
