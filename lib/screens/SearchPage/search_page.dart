import 'package:flutter/material.dart';
import 'package:jobsgo/screens/SearchPage/component/item_key_word.dart';
import 'package:jobsgo/services/job_service.dart';
import 'package:jobsgo/themes/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage(
      {super.key,
      this.isSearch = true,
      this.keyword = "",
      this.body = const Text("")});
  final bool isSearch;
  final String keyword;
  final Widget body;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String keyword = "";
  List<String> keywords = [];
  late TextEditingController _controller;

  getData() async {
    var tempData = await JobService().getRelateKeyWord(keyword, 50);
    setState(() {
      keywords = tempData;
    });
  }

  @override
  void initState() {
    _controller = TextEditingController(text: widget.keyword);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        iconTheme: IconThemeData(color: AppColor.black),
        toolbarHeight: 70,
        title: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: _controller,
              readOnly: !widget.isSearch,
              onTap: () {
                if (!widget.isSearch) {
                  Navigator.pop(context);
                }
              },
              //if search is true, then show search page
              onChanged: (value) {
                if (widget.isSearch) {
                  setState(() {
                    keyword = value;
                  });
                  getData();
                }
              },
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.sliders,
                      size: 20,
                      color: AppColor.black,
                    ),
                    onPressed: () {
                      /* Show option */
                    },
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
      body: widget.isSearch
          ? (keyword.isNotEmpty
              ? onDebound(context)
              : const Center(
                  child: Text('Search Page'),
                ))
          : widget.body,
    );
  }

  Widget onDebound(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemBuilder: (context, index) => ItemKeyWord(
          keyword: keywords.elementAt(index),
        ),
        itemCount: keywords.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
      ),
    );
  }
}
