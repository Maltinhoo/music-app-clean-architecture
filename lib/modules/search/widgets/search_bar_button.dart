import 'package:flutter/material.dart';

import '../../../shared/utils/custom_colors.dart';
import '../../../shared/widgets/bounce_widget.dart';
import '../../../shared/widgets/custom_text.dart';
import '../../../shared/widgets/vectors.dart';

class SearchBarButton extends StatelessWidget {
  final VoidCallback onTap;
  const SearchBarButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onTap: onTap,
      child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          decoration: const BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            children: const [
              Vector(
                Vectors.search,
                color: Colors.black,
              ),
              SizedBox(width: 10),
              Expanded(
                child: MyText('Artists, songs, or podcasts',
                    fontWeight: FontWeight.w500,
                    size: 18,
                    color: Color(0xff131313)),
              ),
            ],
          )),
    );
  }
}
