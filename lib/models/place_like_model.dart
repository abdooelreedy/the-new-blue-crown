class PlaceLikeBody {
  late int commentId;

  PlaceLikeBody({required this.commentId});

  PlaceLikeBody.fromJson(Map<String, dynamic> json) {
    commentId = json['commentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentId'] = this.commentId;
    return data;
  }
}

// class PlaceLikeBody {
//   late int _commentId;
//
//   PlaceLikeBody(
//       {
//         required int commentId
//       }){
//     this._commentId = commentId;
//   }
//   int get commentId => _commentId;
//
//   // set message(String? message) => _message = message;
//
//   PlaceLikeBody.fromJson(Map<String, dynamic> json) {
//     _commentId = json['commentId'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['commentId'] = this._commentId;
//     return data;
//   }
// }

// class PlaceLikeBody {
//   late String message;
//
//   PlaceLikeBody({required this.message});
//
//   PlaceLikeBody.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     return data;
//   }
// }

// class PlaceLikeBody {
//   late String _message;
//
//   PlaceLikeBody({
//     required String message
//   }){
//       this._message = message;
//   }
//
//   String get message => _message;
//   // set message(String? message) => _message = message;
//
//   PlaceLikeBody.fromJson(Map<String, dynamic> json) {
//     _message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this._message;
//     return data;
//   }
// }
