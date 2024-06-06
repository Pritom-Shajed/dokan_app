import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/modules/home/home.dart';
import 'package:dokan_app/modules/home/view/pages/products/products.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final _controller = Get.find<ProductController>();

  @override
  void initState() {
    if(_controller.products.isEmpty){
      _controller.loadProducts();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: GlobalAppBar.common(
          text: 'Product List', suffixIconPath: AppSvgIcons.search),
      body: Obx(() => ((){
        if(!_controller.isLoading && _controller.products.isEmpty) {
          return const AppErrorWidget(message: Strings.noProductsFound);
        } else {
          return Skeletonizer(
            enabled: _controller.isLoading,
            child: Column(
              children: [
                ProductsWidgets.fiterBar(
                    onTapFilter: () => AppBottomSheets.filterBottomSheet(
                        context, onTapApply: _controller.filterProducts)),
                24.verticalSpace,
                Expanded(
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _controller.products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.6),
                        itemBuilder: (context, index) {
                          final info = _controller.products[index];
                          return ProductsWidgets.productCard(
                            index: index,
                            productImageUrl: info.images.firstOrNull?.src ?? '',
                            avrgRating: info.averageRating,
                            title: info.name,
                            price: info.price,
                            salePrice: info.salePrice,
                            regularPrice: info.regularPrice,
                          );
                        }))
              ],
            ),
          );
        }
      }())),
    );
  }
}
