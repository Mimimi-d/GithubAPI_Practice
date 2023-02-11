class GithubUser {
  final String login;

  final String avatarUrl;

  final String htmlUrl;

  final String type;

  GithubUser.fromJson(Map<String, dynamic> json)
      : login = json['login'] ?? '',
        avatarUrl = json['avatar_url'] ?? '',
        htmlUrl = json['html_url'] ?? '',
        type = json['type'] ?? '';
}
