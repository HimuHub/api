class Products {
  bool success;
  String message;
  List<Datum> data;

  Products({
    required this.success,
    required this.message,
    required this.data,
  });
}

class Datum {
  String id;
  bool onSale;
  int salePercent;
  int sold;
  bool sliderNew;
  bool sliderRecent;
  bool sliderSold;
  String date;
  String title;
  Categories categories;
  Categories subcat;
  Shop shop;
  String price;
  String saleTitle;
  String salePrice;
  String description;
  String color;
  String size;
  bool inWishlist;
  List<Image> images;

  Datum({
    required this.id,
    required this.onSale,
    required this.salePercent,
    required this.sold,
    required this.sliderNew,
    required this.sliderRecent,
    required this.sliderSold,
    required this.date,
    required this.title,
    required this.categories,
    required this.subcat,
    required this.shop,
    required this.price,
    required this.saleTitle,
    required this.salePrice,
    required this.description,
    required this.color,
    required this.size,
    required this.inWishlist,
    required this.images,
  });
}

class Categories {
  String id;
  String type;
  int salePercent;
  String date;
  String name;
  String image;

  Categories({
    required this.id,
    required this.type,
    required this.salePercent,
    required this.date,
    required this.name,
    required this.image,
  });
}

class Image {
  String id;
  String url;

  Image({
    required this.id,
    required this.url,
  });
}

class Shop {
  String id;
  bool isActive;
  String createdAt;
  String name;
  String description;
  String shopemail;
  String shopaddress;
  String shopcity;
  String userid;
  String image;

  Shop({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.name,
    required this.description,
    required this.shopemail,
    required this.shopaddress,
    required this.shopcity,
    required this.userid,
    required this.image,
  });
}
