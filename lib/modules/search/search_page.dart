import 'package:flutter/material.dart';
import 'package:music_app/modules/search/widgets/search_by_section.dart';

import '../../shared/widgets/custom_text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();
    if (_isSearching) {
      child = WillPopScope(
        onWillPop: () async {
          setState(() {
            _isSearching = !_isSearching;
          });
          return false;
        },
        child: const Center(
          child: MyText('pesquiando'),
        ),
      );
    }
    if (!_isSearching) {
      child = SearchBySection(
        onTap: () {
          setState(() {
            _isSearching = !_isSearching;
          });
        },
      );
    }
    return child;
  }
}
