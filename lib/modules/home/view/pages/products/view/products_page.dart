import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/modules/home/home.dart';
import 'package:dokan_app/utils/constants/app_icons/app_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar.common(text: 'Product List', suffixIconPath: AppSvgIcons.search),
      body: Padding(
        padding: REdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          children: [
            HomeWidgets.fiterBar(),
            24.verticalSpace,
            Expanded(child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.55),
                itemBuilder: (context, index){
                      return ProductsWidgets.productCard(
                          productImageUrl: '',
                          title: 'Product',
                          salePrice: '10',
                          regularPrice: '5',
                          totalSold: '155');
                    }))
          ],
        ),
      ),
    );
  }
}
