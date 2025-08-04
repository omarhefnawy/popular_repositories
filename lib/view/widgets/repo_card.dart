import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:popular_repositories/model/repo_model.dart';

class RepoCard extends StatelessWidget {
  final RepositoryModel repo;

  const RepoCard({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // 🔹 Avatar
            CircleAvatar(
              radius: 28,
              backgroundImage: repo.avatarUrl != null
                  ? NetworkImage(repo.avatarUrl!)
                  : null,
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(width: 16),

            // 🔹 Repo Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    repo.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('⭐ ${repo.stargazersCount}'),
                      Text(repo.language ?? 'Unknown'),
                      Text(DateFormat('yyyy-MM-dd').format(repo.createdAt)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
