class UserModel {
  int id;
  String fName;
  String email;
  String phone;
  int orderCount;

  UserModel({
    required this.id,
    required this.fName,
    required this.email,
    required this.phone,
    required this.orderCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        id: json['id'],
        fName: json['f_name'],
        email: json['email'],
        phone: json['phone'],
        orderCount: json['order_count'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": fName,
    "phone": phone,
    "email": email,
    "orderCount": orderCount
  };

}