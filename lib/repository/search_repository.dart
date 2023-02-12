import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/repo.dart';

/// repoListの
final repoListProvider = Provider<List<Repo>>(
  (ref) => [],
);
final searchRepoProvider = Provider<SearchRepo>(
  (ref) => SearchRepo(),
);

class SearchRepo {
  Future<List<Repo>> searchRepos({
    required String queryString,
  }) async {
    if (queryString != "") {
      try {
        final http.Response response;
        response =
            await http.get(Uri.https('api.github.com', '/search/repositories', {
          'q': queryString,
        }));
        switch (response.statusCode) {
          case 200:
            List<Repo> list = [];
            Map<String, dynamic> decoded = json.decode(response.body);
            for (var item in decoded['items']) {
              list.add(Repo.fromJson(item));
            }
            return list;
          default:
            return [];
        }
      } on SocketException catch (_) {
        return [];
      }
    } else {
      return [];
    }
  }
}
