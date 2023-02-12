import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_api/repository/search_repository.dart';

import '../model/repo.dart';

/// リポジトリ一覧状態プロバイダー
final reposStateProvider =
    StateNotifierProvider.autoDispose<ReposStateNotifier, List<Repo>>(
  (ref) => ReposStateNotifier(
    searchRepo: ref.watch(searchRepoProvider),
  ),
);

/// リポジトリ一覧状態Notifier
class ReposStateNotifier extends StateNotifier<List<Repo>> {
  ReposStateNotifier({
    required this.searchRepo,
  }) : super(const []);

  final SearchRepo searchRepo;

  Future<void> fetchList(
    String word,
  ) async {
    state = await searchRepo.searchRepos(queryString: word);
  }
}
