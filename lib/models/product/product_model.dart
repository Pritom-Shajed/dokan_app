class Product {
  int? id;
  String? name;
  String? slug;
  String? postAuthor;
  String? permalink;
  bool? featured;
  String? catalogVisibility;
  String? shortDescription;
  String? price;
  String? regularPrice;
  String? salePrice;
  bool? onSale;
  bool? purchasable;
  int? totalSales;
  double? averageRating;
  int? ratingCount;
  bool? inStock;
  List<Images>? images;
  int? menuOrder;
  Store? store;

  Product(
      {this.id,
        this.name,
        this.slug,
        this.postAuthor,
        this.permalink,
        this.featured,
        this.catalogVisibility,
        this.shortDescription,
        this.price,
        this.regularPrice,
        this.salePrice,
        this.onSale,
        this.purchasable,
        this.totalSales,
        this.averageRating,
        this.ratingCount,
        this.inStock,
        this.images,
        this.menuOrder,
        this.store});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    postAuthor = json['post_author'];
    permalink = json['permalink'];
    featured = json['featured'];
    catalogVisibility = json['catalog_visibility'];
    shortDescription = json['short_description'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    onSale = json['on_sale'];
    purchasable = json['purchasable'];
    totalSales = json['total_sales'];
    averageRating = double.parse(json['average_rating']);
    ratingCount = json['rating_count'];
    inStock = json['in_stock'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    menuOrder = json['menu_order'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
  }

}

class Images {
  int? id;
  String? src;
  String? name;

  Images(
      {this.id,
        this.src,
        this.name});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    src = json['src'];
    name = json['name'];
  }
}

class Store {
  int? id;
  String? name;
  String? url;
  String? avatar;
  Address? address;

  Store({this.id, this.name, this.url, this.avatar, this.address});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    avatar = json['avatar'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
  }

}

class Address {
  String? street1;
  String? street2;
  String? city;
  String? zip;
  String? country;
  String? state;

  Address(
      {this.street1,
        this.street2,
        this.city,
        this.zip,
        this.country,
        this.state});

  Address.fromJson(Map<String, dynamic> json) {
    street1 = json['street_1'];
    street2 = json['street_2'];
    city = json['city'];
    zip = json['zip'];
    country = json['country'];
    state = json['state'];
  }

}