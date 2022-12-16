// class PlacePostBody {
//   String? _message;
//
//   PlacePostBody({String? message}) {
//     if (message != null) {
//       this._message = message;
//     }
//   }
//
//   String? get message => _message;
//   set message(String? message) => _message = message;
//
//   PlacePostBody.fromJson(Map<String, dynamic> json) {
//     _message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this._message;
//     return data;
//   }
// }

class PlacePostBody {
  late String _content;

  PlacePostBody(
      {
        required String content
      }){
      this._content = content;
  }
  String get content => _content;

  // set message(String? message) => _message = message;

  PlacePostBody.fromJson(Map<String, dynamic> json) {
    _content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this._content;
    return data;
  }
}

// class PlacePostBody {
//   String? message;
//
//   PlacePostBody({this.message});
//
//   PlacePostBody.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     return data;
//   }
// }