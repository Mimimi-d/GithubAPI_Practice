import 'package:flutter/material.dart';
import 'package:github_api/model/repo.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoCard extends StatelessWidget {
  const RepoCard({
    super.key,
    required this.repo,
  });
  final Repo repo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final url = Uri.parse(repo.htmlUrl);
        if (await canLaunchUrl(url)) {
          launchUrl(url);
        }
      },
      child: Card(
        child: Row(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.all(8.0),
              child: Image.network(repo.avatarUrl),
            ),
            Text(repo.fullName)
          ],
        ),
      ),
    );
  }
}
