import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_api/presentation/component/repo_list_view.dart';

import '../common/my_color_style.dart';
import '../model/repo.dart';
import '../repository/repo_state_notifier.dart';

class GithubSearchPage extends ConsumerWidget {
  GithubSearchPage({super.key});
  List<Repo>? state;
  ReposStateNotifier? notifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    state = ref.watch(reposStateProvider);
    notifier = ref.watch(reposStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        backgroundColor: MyColorStyle.appBarColor,
        title: Column(
          children: [
            const SizedBox(
              height: 45,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'GithubAPI',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: screenSize.width * 0.9,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: MyColorStyle.backgroundScaffoldColor,
                    ),
                    child: SizedBox(
                      child: Center(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'repository',
                            hintStyle: TextStyle(
                              color: MyColorStyle.hintTextColor,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xff668CEA),
                            ),
                            suffixIcon: Icon(
                              Icons.clear,
                              color: Color(0xff668CEA),
                            ),
                            fillColor: MyColorStyle.backgroundScaffoldColor,
                          ),
                          onFieldSubmitted: (text) {
                            notifier!.fetchList(text);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: const RepoListView(),
    );
  }
}
