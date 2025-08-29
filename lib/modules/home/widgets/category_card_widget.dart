import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:news/core/constants/color_pallete.dart';
import 'package:news/modules/home/model/category_data_model.dart';

class CategoryCardWidget extends StatelessWidget {
  final CategoryDataModel categoryDataModel;

  CategoryCardWidget({
    super.key,
    required this.categoryDataModel,
    required this.index,
    required this.onTap,
  });

  int index;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: ColorPallete.textDark,
        image: DecorationImage(
          image: AssetImage(categoryDataModel.img),
          alignment: index % 2 == 0 ? Alignment.topLeft : Alignment.topRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 50,
            left: 16,
            right: index % 2 == 0 ? 20 : 150,
            child: Text(
              categoryDataModel.title,
              textAlign: index % 2 == 0 ? TextAlign.right : TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: index % 2 == 0 ? 16 : 150,
            child: Bounceable(
              onTap: () => onTap(categoryDataModel),
              child: Container(
                width: 169,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(84),
                  color: Colors.white54,
                ),
                child: Directionality(
                  textDirection: index % 2 == 0
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "View All",
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: ColorPallete.backgroundLight,
                        foregroundColor: ColorPallete.backgroundLight,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: ColorPallete.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
