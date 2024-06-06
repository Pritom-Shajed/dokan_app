import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/utils/constants/app_icons/app_icons.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;

  const AppErrorWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: REdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIconWidgets.svgAssetIcon(iconPath: AppSvgIcons.appLogo, size: Dimensions.radius36),
              24.verticalSpace,
              AppTexts.smallText(
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                text: message,
              ),
            ],
          ),
        ),
      ),
    );
  }
}