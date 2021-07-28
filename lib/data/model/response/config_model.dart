class ConfigModel {
  String restaurantName;
  String restaurantOpenTime;
  String restaurantCloseTime;
  String restaurantLogo;
  String restaurantAddress;
  String restaurantPhone;
  String restaurantEmail;
  RestaurantLocationCoverage restaurantLocationCoverage;
  int minimumOrderValue;
  BaseUrls baseUrls;
  String currencySymbol;
  String deliveryCharge;
  String cashOnDelivery;
  String digitalPayment;
  List<Branches> branches;
  String termsAndConditions;

  ConfigModel(
      {this.restaurantName,
        this.restaurantOpenTime,
        this.restaurantCloseTime,
        this.restaurantLogo,
        this.restaurantAddress,
        this.restaurantPhone,
        this.restaurantEmail,
        this.restaurantLocationCoverage,
        this.minimumOrderValue,
        this.baseUrls,
        this.currencySymbol,
        this.deliveryCharge,
        this.cashOnDelivery,
        this.digitalPayment,
        this.branches,
        this.termsAndConditions});

  ConfigModel.fromJson(Map<String, dynamic> json) {
    restaurantName = json['restaurant_name'];
    restaurantOpenTime = json['restaurant_open_time'];
    restaurantCloseTime = json['restaurant_close_time'];
    restaurantLogo = json['restaurant_logo'];
    restaurantAddress = json['restaurant_address'];
    restaurantPhone = json['restaurant_phone'];
    restaurantEmail = json['restaurant_email'];
    restaurantLocationCoverage = json['restaurant_location_coverage'] != null
        ? new RestaurantLocationCoverage.fromJson(
        json['restaurant_location_coverage'])
        : null;
    minimumOrderValue = json['minimum_order_value'];
    baseUrls = json['base_urls'] != null
        ? new BaseUrls.fromJson(json['base_urls'])
        : null;
    currencySymbol = json['currency_symbol'];
    deliveryCharge = json['delivery_charge'];
    cashOnDelivery = json['cash_on_delivery'];
    digitalPayment = json['digital_payment'];
    if (json['branches'] != null) {
      branches = new List<Branches>();
      json['branches'].forEach((v) {
        branches.add(new Branches.fromJson(v));
      });
    }
    termsAndConditions = json['terms_and_conditions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurant_name'] = this.restaurantName;
    data['restaurant_open_time'] = this.restaurantOpenTime;
    data['restaurant_close_time'] = this.restaurantCloseTime;
    data['restaurant_logo'] = this.restaurantLogo;
    data['restaurant_address'] = this.restaurantAddress;
    data['restaurant_phone'] = this.restaurantPhone;
    data['restaurant_email'] = this.restaurantEmail;
    if (this.restaurantLocationCoverage != null) {
      data['restaurant_location_coverage'] =
          this.restaurantLocationCoverage.toJson();
    }
    data['minimum_order_value'] = this.minimumOrderValue;
    if (this.baseUrls != null) {
      data['base_urls'] = this.baseUrls.toJson();
    }
    data['currency_symbol'] = this.currencySymbol;
    data['delivery_charge'] = this.deliveryCharge;
    data['cash_on_delivery'] = this.cashOnDelivery;
    data['digital_payment'] = this.digitalPayment;
    if (this.branches != null) {
      data['branches'] = this.branches.map((v) => v.toJson()).toList();
    }
    data['terms_and_conditions'] = this.termsAndConditions;
    return data;
  }
}

class RestaurantLocationCoverage {
  String longitude;
  String latitude;
  int coverage;

  RestaurantLocationCoverage({this.longitude, this.latitude, this.coverage});

  RestaurantLocationCoverage.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
    coverage = json['coverage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['coverage'] = this.coverage;
    return data;
  }
}

class BaseUrls {
  String productImageUrl;
  String customerImageUrl;
  String bannerImageUrl;
  String categoryImageUrl;
  String reviewImageUrl;
  String notificationImageUrl;
  String restaurantImageUrl;
  String deliveryManImageUrl;
  String chatImageUrl;

  BaseUrls(
      {this.productImageUrl,
        this.customerImageUrl,
        this.bannerImageUrl,
        this.categoryImageUrl,
        this.reviewImageUrl,
        this.notificationImageUrl,
        this.restaurantImageUrl,
        this.deliveryManImageUrl,
        this.chatImageUrl});

  BaseUrls.fromJson(Map<String, dynamic> json) {
    productImageUrl = json['product_image_url'];
    customerImageUrl = json['customer_image_url'];
    bannerImageUrl = json['banner_image_url'];
    categoryImageUrl = json['category_image_url'];
    reviewImageUrl = json['review_image_url'];
    notificationImageUrl = json['notification_image_url'];
    restaurantImageUrl = json['restaurant_image_url'];
    deliveryManImageUrl = json['delivery_man_image_url'];
    chatImageUrl = json['chat_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_image_url'] = this.productImageUrl;
    data['customer_image_url'] = this.customerImageUrl;
    data['banner_image_url'] = this.bannerImageUrl;
    data['category_image_url'] = this.categoryImageUrl;
    data['review_image_url'] = this.reviewImageUrl;
    data['notification_image_url'] = this.notificationImageUrl;
    data['restaurant_image_url'] = this.restaurantImageUrl;
    data['delivery_man_image_url'] = this.deliveryManImageUrl;
    data['chat_image_url'] = this.chatImageUrl;
    return data;
  }
}

class Branches {
  int id;
  String name;
  String email;
  String longitude;
  String latitude;
  String address;
  int coverage;

  Branches(
      {this.id,
        this.name,
        this.email,
        this.longitude,
        this.latitude,
        this.address,
        this.coverage});

  Branches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    address = json['address'];
    coverage = json['coverage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['address'] = this.address;
    data['coverage'] = this.coverage;
    return data;
  }
}
