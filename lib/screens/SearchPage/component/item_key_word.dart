import 'package:flutter/material.dart';
import 'package:jobsgo/screens/SearchPage/component/list_job_match.dart';

import 'package:jobsgo/screens/SearchPage/search_page.dart';

class ItemKeyWord extends StatelessWidget {
  const ItemKeyWord({super.key, this.keyword = ""});
  final String keyword;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchPage(
            isSearch: false,
            body: ListJobMatch(
              keyword: keyword,
            ),
            keyword: keyword,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(keyword),
            ),
            const Divider(
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
