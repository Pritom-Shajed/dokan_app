import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/modules/home/home.dart';
import 'package:dokan_app/modules/home/view/pages/products/products.dart';
import 'package:dokan_app/utils/constants/app_icons/app_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    return Scaffold(
      appBar: GlobalAppBar.common(
          text: 'Product List', suffixIconPath: AppSvgIcons.search),
      body: Obx(() => controller.isLoading
          ? Center(child: AppLoaders.dancingSquare())
          : Column(
            children: [
              ProductsWidgets.fiterBar(
                  onTapFilter: () => AppBottomSheets.filterBottomSheet(
                          context, onTapApply: controller.filterProducts)),
              24.verticalSpace,
              Expanded(
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.products.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.6),
                      itemBuilder: (context, index) {
                        final info = controller.products[index];
                        return ProductsWidgets.productCard(
                          index: index,
                          productImageUrl: info.images?.firstOrNull?.src ?? '',
                          avrgRating: info.averageRating ?? 0,
                          title: info.name ?? '',
                          price: info.price ?? '',
                          salePrice: info.salePrice ?? '',
                          regularPrice: info.regularPrice ?? '',
                        );
                      }))
            ],
          )),
    );
  }
}
