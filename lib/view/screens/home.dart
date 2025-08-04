import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:popular_repositories/core/utils/enums/github_status.dart';
import '../../controllers/bloc/cubit/popularRepoCubit.dart';
import '../../controllers/bloc/states/popularRepoStates.dart';
import '../widgets/repo_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PopularRepoCubit>();
    final languages = ['Dart', 'JavaScript', 'Python', 'Java', 'C++'];
    final limits = [10, 50, 100];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular GitHub Repositories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔹 Date Picker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<PopularRepoCubit, PopularRepoStates>(
                  buildWhen: (prev, curr) => prev.selectedDate != curr.selectedDate,
                  builder: (context, state) {
                    return Text(
                      'From: ${DateFormat('yyyy-MM-dd').format(state.selectedDate)}',
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: cubit.state.selectedDate,
                      firstDate: DateTime(2019),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) cubit.updateDate(date);
                  },
                  child: const Text('Pick Date'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 🔹 Language Dropdown
            BlocBuilder<PopularRepoCubit, PopularRepoStates>(
              buildWhen: (prev, curr) => prev.selectedLanguage != curr.selectedLanguage,
              builder: (context, state) {
                return DropdownButtonFormField<String>(
                  value: state.selectedLanguage,
                  decoration: const InputDecoration(labelText: 'Language'),
                  items: languages
                      .map((lang) => DropdownMenuItem(
                    value: lang,
                    child: Text(lang),
                  ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) cubit.updateLanguage(value);
                  },
                );
              },
            ),
            const SizedBox(height: 16),

            // 🔹 Limit Dropdown
            BlocBuilder<PopularRepoCubit, PopularRepoStates>(
              buildWhen: (prev, curr) => prev.selectedLimit != curr.selectedLimit,
              builder: (context, state) {
                return DropdownButtonFormField<int>(
                  value: state.selectedLimit,
                  decoration: const InputDecoration(labelText: 'Result Limit'),
                  items: limits
                      .map((limit) => DropdownMenuItem(
                    value: limit,
                    child: Text(limit.toString()),
                  ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) cubit.updateLimit(value);
                  },
                );
              },
            ),
            const SizedBox(height: 16),

            // 🔹 Search Button
            ElevatedButton(
              onPressed: () => cubit.getPopularRepo(),
              child: const Text('Search'),
            ),
            const SizedBox(height: 20),

            // 🔹 Results List
            Expanded(
              child: BlocBuilder<PopularRepoCubit, PopularRepoStates>(
                buildWhen: (prev, curr) =>
                prev.status != curr.status || prev.data != curr.data,
                builder: (context, state) {
                  if (state.status == GithubStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.status == GithubStatus.failure) {
                    return Center(child: Text(state.massege ?? 'Error occurred'));
                  } else if (state.status == GithubStatus.empty) {
                    return const Center(child: Text('No repositories found.'));
                  } else if (state.status == GithubStatus.success) {
                    return ListView.builder(
                      itemCount: state.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final repo = state.data![index];
                        return RepoCard(repo: repo);
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
