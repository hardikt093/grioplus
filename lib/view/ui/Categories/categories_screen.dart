import 'package:flutter/material.dart';

import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_extensions.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/base_constants/text_style.dart';
import '../../../utils/common/common_recommended_widget.dart';
import '../../../utils/widgets/text_view.dart';
import 'categories_components/categories_grid.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.primaryColor,
      appBar: AppBar(
        backgroundColor: BaseColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextView(
                BaseStrings.seeWhatYouLookingFor,
                textStyle: BaseTextStyles.categoriesHeaderText,
              ),
              15.toVSB,
              const CategoriesGrid(),
              20.toVSB,
              const CommonRecommendedWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
