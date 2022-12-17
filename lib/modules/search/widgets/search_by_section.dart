import 'package:flutter/material.dart';
import 'package:music_app/modules/search/widgets/search_bar_button.dart';

import '../../../shared/widgets/custom_text.dart';
import 'collection_card.dart';

class SearchBySection extends StatelessWidget {
  final VoidCallback onTap;
  const SearchBySection({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight - 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyText(
            'Search',
            fontWeight: FontWeight.w700,
            size: 28,
            margin: EdgeInsets.only(
              left: 15,
              bottom: 15,
            ),
          ),
          SearchBarButton(onTap: onTap),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  const Center(
                    child: MyText(
                      'Browse all sections',
                      fontWeight: FontWeight.w700,
                      size: 22,
                      margin: EdgeInsets.only(bottom: 15, top: 5),
                    ),
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children:
                        List.generate(15, (index) => const CollectionCard()),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
