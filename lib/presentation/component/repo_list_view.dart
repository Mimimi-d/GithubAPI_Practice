import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_api/repository/repo_state_notifier.dart';

import 'repo_card.dart';

class RepoListView extends ConsumerWidget {
  const RepoListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repos = ref.watch(reposStateProvider);
    return Center(
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: repos.length,
        itemBuilder: (BuildContext context, int index) {
          final repo = repos[index];
          return RepoCard(repo: repo);
        },
      ),
    );
  }
}
