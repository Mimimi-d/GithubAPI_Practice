import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/github_user.dart';
import '../provider/provider.dart';

final searchUsersProvider = FutureProvider<List<GithubUser>>((ref) async {
  final searchWord = ref.watch(searchWordProvider);
  if (searchWord != "") {
    try {
      final http.Response response;

      response =
          await http.get(Uri.https('api.github.com', '/search/repositories', {
        'q': searchWord,
      }));
      switch (response.statusCode) {
        case 200:
          List<GithubUser> list = [];
          Map<String, dynamic> decoded = json.decode(response.body);
          for (var item in decoded['items']) {
            list.add(GithubUser.fromJson(item));
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
});
