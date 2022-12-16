class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  Product({required totalSize, required typeId, required offset, required products}){
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        _products.add(ProductModel.fromJson(v));
      });
    }
  }


}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? quantity2;
  int? price2;
  int? quantity3;
  int? price3;
  int? quantity4;
  int? price4;
  int? max_quantity;
  String? weight;
  String? tare_weight;
  String? net_weight;
  String? gross_weight;
  String? concentration;
  int? production_date;
  String? expiration;
  String? company;
  String? origin;
  String? type;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;
  // bool? productLiked;

  ProductModel(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.quantity2,
        this.price2,
        this.quantity3,
        this.price3,
        this.quantity4,
        this.price4,
        this.max_quantity,
        this.weight,
        this.tare_weight,
        this.net_weight,
        this.gross_weight,
        this.concentration,
        this.expiration,
        this.production_date,
        this.company,
        this.origin,
        this.type,
        this.stars,
        this.img,
        this.location,
        this.createdAt,
        this.updatedAt,
        this.typeId,
        // this.productLiked,
      });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    quantity2 = json['quantity2'];
    price2 = json['price2'];
    quantity3 = json['quantity3'];
    price3 = json['price3'];
    quantity4 = json['quantity4'];
    price4 = json['price4'];
    max_quantity = json['max_quantity'];
    weight = json['weight'];
    tare_weight = json['tare_weight'];
    net_weight = json['net_weight'];
    gross_weight = json['gross_weight'];
    concentration = json['concentration'];
    expiration = json['expiration'];
    production_date = json['production_date'];
    company = json['company'];
    origin = json['origin'];
    type = json['type'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
    // productLiked = json['productLiked'];
  }

  Map<String, dynamic> toJson(){
    return{
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "stars": this.stars,
      "quantity2": this.quantity2,
      "price2": this.price2,
      "quantity3": this.quantity3,
      "price3": this.price3,
      "quantity4": this.quantity4,
      "price4": this.price4,
      "max_quantity": this.max_quantity,
      "weight": this.weight,
      "tare_weight": this.tare_weight,
      "net_weight": this.net_weight,
      "gross_weight": this.gross_weight,
      "concentration": this.concentration,
      "expiration": this.expiration,
      "production_date": this.production_date,
      "company": this.company,
      "origin": this.origin,
      "type": this.type,
      "img": this.img,
      "location": this.location,
      "createdAt": this.createdAt,
      "updatedAt": this.updatedAt,
      "typeId": this.typeId,
      // "productLiked": this.productLiked,
    };
  }
}