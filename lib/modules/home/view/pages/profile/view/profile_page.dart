import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/modules/home/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar.common(text: 'My Account'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: REdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: [

               ProfileWidgets.profileHeader(),


                60.verticalSpace,

                ProfileWidgets.options(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


