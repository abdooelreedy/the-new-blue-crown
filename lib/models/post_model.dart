// // To parse this JSON data, do
// //
// //     final postModel = postModelFromJson(jsonString);
//
// import 'dart:convert';
//
// import 'package:theblue_crown/models/user_model.dart';
//
// import 'comment_model.dart';
//
// // class Product {
// //   int? _totalSize;
// //   int? _typeId;
// //   int? _offset;
// //   late List<PostModel> _products;
// //   List<PostModel> get products => _products;
// //
// //   Product({required totalSize, required typeId, required offset, required products}){
// //     this._totalSize = totalSize;
// //     this._typeId = typeId;
// //     this._offset = offset;
// //     this._products = products;
// //   }
// //
// //   Product.fromJson(Map<String, dynamic> json) {
// //     _totalSize = json['total_size'];
// //     _typeId = json['type_id'];
// //     _offset = json['offset'];
// //     if (json['products'] != null) {
// //       _products = <PostModel>[];
// //       json['products'].forEach((v) {
// //         _products.add(PostModel.fromJson(v));
// //       });
// //     }
// //   }
// //
// //
// // }
//
// // PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));
// //
// // String postModelToJson(PostModel data) => json.encode(data.toJson());
//
// class PostModel {
//
//   late int id;
//   late int userId;
//   String? content;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   bool? liked;
//   UserModel? user;
//
//   PostModel({
//     required this.id,
//     required this.userId,
//     this.content,
//     this.createdAt,
//     this.updatedAt,
//     this.liked,
//     this.user,
//   });
//
//   /*OrderModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];*/
//   PostModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['userId'];
//     content = json['content'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     liked = json['liked'];
//     user = UserModel.fromJson(json["user"]);
//   }
//
//   // factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
//   //   id: json["id"],
//   //   userId: json["user_id"],
//   //   content: json["content"],
//   //   createdAt: DateTime.parse(json["created_at"]),
//   //   updatedAt: DateTime.parse(json["updated_at"]),
//   //   liked: json["liked"],
//   //   // user: UserModel.fromJson(json["user"]),
//   //     user : json['user'],
//   // );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "user_id": userId,
//     "content": content,
//     "created_at": createdAt!.toIso8601String(),
//     "updated_at": updatedAt!.toIso8601String(),
//     "liked": liked,
//     "user": user!.toJson(),
//   };
// }
//
// // class User {
// //   User({
// //     this.id,
// //     this.name,
// //     this.username,
// //     this.email,
// //     this.emailVerifiedAt,
// //     this.createdAt,
// //     this.updatedAt,
// //   });
// //
// //   int? id;
// //   String? name;
// //   String? username;
// //   String? email;
// //   dynamic? emailVerifiedAt;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //
// //   factory User.fromJson(Map<String, dynamic> json) => User(
// //     id: json["id"],
// //     name: json["name"],
// //     username: json["username"],
// //     email: json["email"],
// //     emailVerifiedAt: json["email_verified_at"],
// //     createdAt: DateTime.parse(json["created_at"]),
// //     updatedAt: DateTime.parse(json["updated_at"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "name": name,
// //     "username": username,
// //     "email": email,
// //     "email_verified_at": emailVerifiedAt,
// //     "created_at": createdAt!.toIso8601String(),
// //     "updated_at": updatedAt!.toIso8601String(),
// //   };
// // }

class Autogenerated {
  /*late List<ProductModel> _products;
  List<ProductModel> get products => _products;*/
  late List<PostModel> _feeds;

  Autogenerated({List<PostModel>? feeds}) {
    if (feeds != null) {
      this._feeds = feeds;
    }
  }

  List<PostModel> get feeds => _feeds;
  set feeds(List<PostModel> feeds) => _feeds = feeds;

  Autogenerated.fromJson(Map<String, dynamic> json) {
    if (json['feeds'] != null) {
      _feeds = <PostModel>[];
      json['feeds'].forEach((v) {
        _feeds.add(new PostModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._feeds != null) {
      data['feeds'] = this._feeds.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostModel {
  int? _id;
  int? _userId;
  String? _content;
  String? _createdAt;
  String? _updatedAt;
  bool? _liked;
  User? _user;

  PostModel(
      {int? id,
        int? userId,
        String? content,
        String? createdAt,
        String? updatedAt,
        bool? liked,
        User? user}) {
    if (id != null) {
      this._id = id;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (content != null) {
      this._content = content;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (liked != null) {
      this._liked = liked;
    }
    if (user != null) {
      this._user = user;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get content => _content;
  set content(String? content) => _content = content;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  bool? get liked => _liked;
  set liked(bool? liked) => _liked = liked;
  User? get user => _user;
  set user(User? user) => _user = user;

  PostModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _content = json['content'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _liked = json['liked'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_id'] = this._userId;
    data['content'] = this._content;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['liked'] = this._liked;
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    return data;
  }
}

class User {
  int? _id;
  String? _fName;
  String? _phone;
  String? _email;
  Null? _image;
  int? _status;
  Null? _emailVerifiedAt;
  String? _createdAt;
  String? _updatedAt;
  int? _orderCount;

  User(
      {int? id,
        String? fName,
        String? phone,
        String? email,
        Null? image,
        int? status,
        Null? emailVerifiedAt,
        String? createdAt,
        String? updatedAt,
        int? orderCount}) {
    if (id != null) {
      this._id = id;
    }
    if (fName != null) {
      this._fName = fName;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (email != null) {
      this._email = email;
    }
    if (image != null) {
      this._image = image;
    }
    if (status != null) {
      this._status = status;
    }
    if (emailVerifiedAt != null) {
      this._emailVerifiedAt = emailVerifiedAt;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (orderCount != null) {
      this._orderCount = orderCount;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get fName => _fName;
  set fName(String? fName) => _fName = fName;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get email => _email;
  set email(String? email) => _email = email;
  Null? get image => _image;
  set image(Null? image) => _image = image;
  int? get status => _status;
  set status(int? status) => _status = status;
  Null? get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(Null? emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get orderCount => _orderCount;
  set orderCount(int? orderCount) => _orderCount = orderCount;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _fName = json['f_name'];
    _phone = json['phone'];
    _email = json['email'];
    _image = json['image'];
    _status = json['status'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _orderCount = json['order_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['f_name'] = this._fName;
    data['phone'] = this._phone;
    data['email'] = this._email;
    data['image'] = this._image;
    data['status'] = this._status;
    data['email_verified_at'] = this._emailVerifiedAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['order_count'] = this._orderCount;
    return data;
  }
}