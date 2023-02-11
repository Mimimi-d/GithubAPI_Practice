import 'package:flutter/material.dart';
import 'package:github_api/common/my_color_style.dart';

class GithubSearchPage extends StatelessWidget {
  const GithubSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
                      color: MyColorStyle.backgroundScaffoldColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: SizedBox(
                      child: Center(
                        child: TextFormField(
                          onChanged: (text) {},
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
    );
  }
}
