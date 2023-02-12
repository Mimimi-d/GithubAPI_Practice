class Repo {
  final String fullName;

  final String avatarUrl;

  final String htmlUrl;

  final int stargazersCount;

  Repo.fromJson(Map<String, dynamic> json)
      : fullName = json['full_name'] ?? '',
        avatarUrl = json['owner']['avatar_url'] ?? '',
        htmlUrl = json['html_url'] ?? '',
        stargazersCount = json['stargazersCount'] ?? 0;
}
