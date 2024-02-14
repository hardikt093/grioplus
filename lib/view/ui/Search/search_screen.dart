import 'package:flutter/material.dart';

import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_extensions.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/base_constants/text_style.dart';
import '../../../utils/common/common_recommended_widget.dart';
import '../../../utils/widgets/text_view.dart';
import 'search_screen_components/search_filter_chip.dart';
import 'search_screen_components/search_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.primaryColor,
      appBar: AppBar(
        backgroundColor: BaseColors.primaryColor,
        centerTitle: true,
        title: const TextView(BaseStrings.search,
            textStyle: BaseTextStyles.appBarText),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SearchWidget(),
            15.toVSB,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SearchFilterChip(),
                    20.toVSB,
                    const CommonRecommendedWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
