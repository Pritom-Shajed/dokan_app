import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/models/models.dart';
import 'package:dokan_app/modules/home/home.dart';
import 'package:dokan_app/modules/home/view/pages/products/products.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:dokan_app/utils/enums/enums.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepository _productRepo;

  ProductController({required ProductRepository productRepo}) : _productRepo = productRepo;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  /// LOADING INITIAL PRODUCTS
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set isLoading(value) => _isLoading.value = value;

  RxList<Product> products = <Product>[].obs;

  Future<ResponseModel> loadProducts () async{
    isLoading = true;
    products.clear();
    try {

      await _productRepo.loadProducts().then((product){
          product.forEach((e) => products.add(Product.fromJson(e)));
      });

      isLoading = false;
      return ResponseModel(true, 'Successfully fetched');
    } catch (e){
      isLoading = false;
      return ResponseModel(false, e.toString());
    }

  }


  /// FILTERING
  final _selectedFilter = FilterProduct.none.obs;

  FilterProduct get selectedFilter => _selectedFilter.value;

  set selectedFilter(value) => _selectedFilter.value = value;

  toggleFilterValue (FilterProduct value){
    selectedFilter = value;
  }

  filterProducts (){
    if(selectedFilter == FilterProduct.priceLowToHigh){
      products.sort((a,b) => double.parse(a.price ?? '0.00').compareTo(double.parse(b.price ?? '0.00')));
    }
    if(selectedFilter == FilterProduct.priceHighToLow){
      products.sort((a,b) => double.parse(b.price ?? '0.00').compareTo(double.parse(a.price ?? '0.00')));
    }
    if(selectedFilter == FilterProduct.rating){
      products.sort((a,b) => (b.averageRating ?? 0.00).compareTo(a.averageRating ?? 0.00));
    }
    if(selectedFilter == FilterProduct.none){
      loadProducts();
    }

  }
}