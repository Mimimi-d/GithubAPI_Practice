import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_api/model/github_user.dart';

final StateProvider<List<GithubUser>> userProvider = StateProvider((ref) => []);
final searchWordProvider = StateProvider((ref) => '');
