import 'package:flutter/material.dart';
import 'package:flutter_grocery/provider/splash_provider.dart';
import 'package:flutter_grocery/utill/color_resources.dart';
import 'package:flutter_grocery/utill/dimensions.dart';
import 'package:flutter_grocery/utill/images.dart';
import 'package:flutter_grocery/utill/styles.dart';
import 'package:provider/provider.dart';

class SubCategoryItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;

  SubCategoryItem(
      {@required this.title, @required this.icon, @required this.isSelected});

  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(bottom: 8.0),
      width: 100,
      height: 200,
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL, horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        // color: isSelected
        //     ? Theme.of(context).primaryColor
        //     : ColorResources.getBackgroundColor(context)
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            height: 60,
            width: 60,
            alignment: Alignment.center,
            //padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: isSelected
              //     ? ColorResources.getCategoryBgColor(context)
              //     : ColorResources.getGreyLightColor(context)
              //         .withOpacity(0.05),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: FadeInImage.assetNetwork(
                placeholder: Images.placeholder,
                image:
                    '${Provider.of<SplashProvider>(context, listen: false).baseUrls.categoryImageUrl}/$icon',
                fit: BoxFit.cover,
                width: 100,
                height: 100,
                imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder,
                    height: 100, width: 100, fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.PADDING_SIZE_DEFAULT,
                horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: Text(title,
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: poppinsSemiBold.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    color: isSelected
                        ? ColorResources.getBackgroundColor(context)
                        : ColorResources.getTextColor(context))),
          ),
        ]),
      ),
    );
  }
}
