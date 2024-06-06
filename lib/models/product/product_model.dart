class Product {
  int id;
  String name;
  String slug;
  String permalink;
  bool featured;
  String catalogVisibility;
  String postAuthor;
  String shortDescription;
  String price;
  String regularPrice;
  String salePrice;
  bool onSale;
  bool purchasable;
  int totalSales;
  double averageRating;
  int ratingCount;
  bool inStock;
  List<Images> images;
  int menuOrder;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.featured,
    required this.catalogVisibility,
    required this.postAuthor,
    required this.shortDescription,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.onSale,
    required this.purchasable,
    required this.totalSales,
    required this.averageRating,
    required this.ratingCount,
    required this.inStock,
    required this.images,
    required this.menuOrder,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      permalink: json['permalink'] ?? '',
      featured: json['featured'] ?? false,
      catalogVisibility: json['catalog_visibility'] ?? '',
      postAuthor: json['post_author'] ?? '',
      shortDescription: json['short_description'] ?? '',
      price: json['price'] ?? '0.00',
      regularPrice: json['regular_price'] ?? '0.00',
      salePrice: json['sale_price'] ?? '0.00',
      onSale: json['on_sale'] ?? false,
      purchasable: json['purchasable'] ?? false,
      totalSales: json['total_sales'] ?? 0,
      averageRating: double.parse(json['average_rating'] ?? '0.00'),
      ratingCount: json['rating_count'] ?? 0,
      inStock: json['in_stock'] ?? false,
      images: json['images'] != null
          ? List<Images>.from(json['images'].map((x) => Images.fromJson(x)))
          : [],
      menuOrder: json['menu_order'] ?? 0,
    );
  }
}

class Images {
  int id;
  String src;
  String name;

  Images({
    required this.id,
    required this.src,
    required this.name,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      id: json['id'] ?? 0,
      src: json['src'] ?? '',
      name: json['name'] ?? '',
    );
  }
}


class Address {
  String street1;
  String street2;
  String city;
  String zip;
  String country;
  String state;

  Address({
    required this.street1,
    required this.street2,
    required this.city,
    required this.zip,
    required this.country,
    required this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street1: json['street_1'] ?? '',
      street2: json['street_2'] ?? '',
      city: json['city'] ?? '',
      zip: json['zip'] ?? '',
      country: json['country'] ?? '',
      state: json['state'] ?? '',
    );
  }
}