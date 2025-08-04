import 'package:popular_repositories/core/utils/enums/github_status.dart';
import 'package:popular_repositories/model/repo_model.dart';

class PopularRepoStates {
  final GithubStatus status;
  final List<RepositoryModel>? data;
  final String? massege;

  final DateTime selectedDate;
  final String selectedLanguage;
  final int selectedLimit;

  const PopularRepoStates({
    required this.status,
    this.data,
    this.massege,
    required this.selectedDate,
    required this.selectedLanguage,
    required this.selectedLimit,
  });

  factory PopularRepoStates.initial() {
    return PopularRepoStates(
      status: GithubStatus.initial,
      selectedDate: DateTime.now().subtract(const Duration(days: 7)),
      selectedLanguage: 'Dart',
      selectedLimit: 10,
    );
  }

  PopularRepoStates copyWith({
    GithubStatus? status,
    List<RepositoryModel>? data,
    String? massege,
    DateTime? selectedDate,
    String? selectedLanguage,
    int? selectedLimit,
  }) {
    return PopularRepoStates(
      status: status ?? this.status,
      data: data ?? this.data,
      massege: massege ?? this.massege,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      selectedLimit: selectedLimit ?? this.selectedLimit,
    );
  }
}
