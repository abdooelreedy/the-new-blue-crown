class PlaceReplyBody {
  late String _body;

  PlaceReplyBody(
      {
        required String body
      }){
    this._body = body;
  }
  String get body => _body;

  // set message(String? message) => _message = message;

  PlaceReplyBody.fromJson(Map<String, dynamic> json) {
    _body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this._body;
    return data;
  }
}