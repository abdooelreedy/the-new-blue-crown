import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/data/repository/cart_repo.dart';
import 'package:theblue_crown/models/products_model.dart';
import 'package:theblue_crown/models/cart_model.dart';

class CartController extends GetxController{

  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items= {};
  Map<int, CartModel> get items => _items;

  // only for storage and sharedprefereneces
  List<CartModel> storageItems = [];

  int get totalAmount{
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
      // total += value.quantity! * value.price!;
    });
    return total;
  }

  int get totalDiscount{
    var totalDiscount = 0;
    _items.forEach((key, value) {
      totalDiscount = totalAmount - totalAmountAfterDiscount;
      // total += value.quantity! * value.price!;
    });
    return totalDiscount;
  }

  int get totalAmountAfterDiscount{
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * (
          value.quantity! >= 0 && value.quantity! <= value.quantity2! ?
          value.price! : value.quantity! >= value.quantity2! && value.quantity! <= value.quantity3! ?
          value.price2! : value.quantity! >= value.quantity3! && value.quantity! <= value.quantity4! ?
          value.price3! : value.price4!
      );
      // total += value.quantity! * value.price!;
    });
    return total;
  }

  int totalItemAmount (ProductModel product, int quantity) {
    var total = 0;
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value) {
        total = value.quantity! * (
            value.quantity! >= 0 && value.quantity! <= value.quantity2! ?
            value.price! : value.quantity! >= value.quantity2! && value.quantity! <= value.quantity3! ?
            value.price2! : value.quantity! >= value.quantity3! && value.quantity! <= value.quantity4! ?
            value.price3! : value.price4!
        );

        print("//////////////////////value.price : " + value.price.toString());
        print("//////////////////////value.stars : " + value.stars.toString());
        print("//////////////////////value.min : " + value.quantity2.toString());

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          stars: value.price!,
          weight: value.weight,
          quantity2: value.quantity2,
          price2: value.price2,
          quantity3: value.quantity3,
          price3: value.price3,
          quantity4: value.quantity4,
          price4: value.price4,
          max_quantity: value.max_quantity,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
      if(total <= 0){
        _items.remove(product.id);
      }
    }else{
      if(quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            stars: product.price!,
            weight: product.weight,
            quantity2: product.quantity2,
            price2: product.price2,
            quantity3: product.quantity3,
            price3: product.price3,
            quantity4: product.quantity4,
            price4: product.price4,
            max_quantity: product.max_quantity,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );}
        );
      }
    }
    cartRepo.addToCartList(getItems);
    return total;
  }

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value) {

        totalQuantity = value.quantity! + quantity;

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          stars: value.price!,
          weight: value.weight,
          quantity2: value.quantity2,
          price2: value.price2,
          quantity3: value.quantity3,
          price3: value.price3,
          quantity4: value.quantity4,
          price4: value.price4,
          max_quantity: value.max_quantity,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });

      if(totalQuantity <= 0){
        _items.remove(product.id);
      }
    }else{
      if(quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            stars: product.price!,
            weight: product.weight,
            quantity2: product.quantity2,
            price2: product.price2,
            quantity3: product.quantity3,
            price3: product.price3,
            quantity4: product.quantity4,
            price4: product.price4,
            max_quantity: product.max_quantity,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );}
        );
      }else{
        Get.snackbar(
          "Item count", "You should at least add an item in the cart !",
          backgroundColor: Colors.grey.shade200,
          colorText: Colors.blue,
        );
      }
    }
    cartRepo.addToCartList(getItems);
    update();
  }

  void customAddItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value) {

        totalQuantity = quantity;

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          stars: value.price!,
          weight: value.weight,
          quantity2: value.quantity2,
          price2: value.price2,
          quantity3: value.quantity3,
          price3: value.price3,
          quantity4: value.quantity4,
          price4: value.price4,
          max_quantity: value.max_quantity,
          img: value.img,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });

      if(totalQuantity <= 0){
        _items.remove(product.id);
      }
    }else{
      if(quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            stars: product.price!,
            weight: product.weight,
            quantity2: product.quantity2,
            price2: product.price2,
            quantity3: product.quantity3,
            price3: product.price3,
            quantity4: product.quantity4,
            price4: product.price4,
            max_quantity: product.max_quantity,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );}
        );
      }else{
        Get.snackbar(
          "Item count", "You should at least add an item in the cart !",
          backgroundColor: Colors.grey.shade200,
          colorText: Colors.blue,
        );
      }
    }
    cartRepo.addToCartList(getItems);
    update();
  }

  void removeItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value) {

        totalQuantity = 0;

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          stars: value.price!,
          weight: value.weight,
          quantity2: value.quantity2,
          price2: value.price2,
          quantity3: value.quantity3,
          price3: value.price3,
          quantity4: value.quantity4,
          price4: value.price4,
          max_quantity: value.max_quantity,
          img: value.img,
          quantity: value.quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });

      if(totalQuantity <= 0){
        _items.remove(product.id);
      }
    }else{
      if(quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            stars: product.price!,
            weight: product.weight,
            quantity2: product.quantity2,
            price2: product.price2,
            quantity3: product.quantity3,
            price3: product.price3,
            quantity4: product.quantity4,
            price4: product.price4,
            max_quantity: product.max_quantity,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );}
        );
      }else{
        Get.snackbar(
          "Item count", "You should at least add an item in the cart !",
          backgroundColor: Colors.grey.shade200,
          colorText: Colors.blue,
        );
      }
    }
    cartRepo.addToCartList(getItems);
    update();
  }

  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product){
    var quantity = 0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key == product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems{
    return _items.entries.map((e){
      return e.value;
    }).toList();
  }





  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();
    return storageItems;
  }


  set setCart(List<CartModel> items) {
    storageItems = items;
    //print("Length of cart items " + storageItems.length.toString());
    for(int i=0; i < storageItems.length; i++){
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  Future<void> addToHistory() async {
    cartRepo.addToCartHistoryList();
    clear();
  }

  void clear(){
    _items = {};
    update();
  }

  List<CartModel> getCartHistoryList(){
    return cartRepo.getCartHistoryList();
  }

  set setItems(Map<int, CartModel> setItems) {
    _items = {};
    _items = setItems;
  }

  void addToCartList(){
    cartRepo.addToCartList(getItems);
    update();
  }

  void clearCartHistory(){
    cartRepo.clearCartHistory();
    update();
  }

  void removeCartSharedPreference(){
    cartRepo.removeCartSharedPreference();
  }
}