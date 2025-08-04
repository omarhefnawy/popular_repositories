class RepositoryModel {
  final String name;
  final String? language;
  final int stargazersCount;
  final DateTime createdAt;
  final String? htmlUrl;
  final String? avatarUrl;

  RepositoryModel({
    required this.name,
    required this.language,
    required this.stargazersCount,
    required this.createdAt,
    required this.htmlUrl,
    required this.avatarUrl,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      name: json['name'],
      language: json['language'],
      stargazersCount: json['stargazers_count'],
      createdAt: DateTime.parse(json['created_at']),
      htmlUrl: json['html_url'],
      avatarUrl: json['owner']?['avatar_url'],
    );
  }
}
