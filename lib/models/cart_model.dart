import 'package:theblue_crown/models/products_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  int? stars;
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
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;

  CartModel(
      {this.id,
        this.name,
        this.price,
        this.stars,
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
        this.img,
        this.quantity,
        this.isExist,
        this.time,
      this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    stars = json['stars'];
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
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson(){
    return{
      "id": this.id,
      "name": this.name,
      "price": this.price,
      // "price": this.quantity! >= 0 && this.quantity! <= this.quantity2! ?
      // this.price! : this.quantity! >= this.quantity2! && this.quantity! <= this.quantity3! ?
      // this.price2! : this.quantity! >= this.quantity3! && this.quantity! <= this.quantity4! ?
      // this.price3! : this.price4!,

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
      "quantity": this.quantity,
      "isExist": this.isExist,
      "time": this.time,
      "product": this.product!.toJson(),
    };
  }
}