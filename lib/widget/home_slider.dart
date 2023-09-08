import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/data/images.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: 280,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.orange,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 90,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SvgPicture.asset(
                    "assets/images/Image Icon.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSmallText(
                      text: "Get",
                      size: 30,
                      fontWeight: FontWeight.w100,
                    ),
                    AppLargeText(text: "50% OFF", color: AppColors.black1),
                    AppSmallText(
                      text: "On first 03 orders",
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ImageSlider extends StatelessWidget {
  final int imageLength;
  final String image;
  final List<String> imagesForSlider;
  const ImageSlider(
      {super.key,
      required this.imageLength,
      required this.image,
      required this.imagesForSlider});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 200,
        child: PageView.builder(
          itemCount: imageLength,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imagesForSlider[index]),
                    fit: BoxFit.cover),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  imageLength,
                  (dotIndex) => Container(
                    margin: EdgeInsets.all(5),
                    width: 20,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: index == dotIndex
                            ? AppColors.orange
                            : AppColors.black20),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
