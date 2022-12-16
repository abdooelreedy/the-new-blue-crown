class SingleReply {
  late List<RepliesModel> _comments;

  SingleReply({List<RepliesModel>? comments}) {
    if (comments != null) {
      this._comments = comments;
    }
  }

  List<RepliesModel> get comments => _comments;
  set comments(List<RepliesModel> comments) => _comments = comments;

  SingleReply.fromJson(Map<String, dynamic> json) {
    if (json['comments'] != null) {
      _comments = <RepliesModel>[];
      json['comments'].forEach((v) {
        _comments.add(new RepliesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._comments != null) {
      data['comments'] = this._comments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RepliesModel {
  int? _id;
  int? _userId;
  int? _feedId;
  String? _body;
  String? _createdAt;
  String? _updatedAt;
  Feed? _feed;
  User? _user;

  RepliesModel(
      {int? id,
        int? userId,
        int? feedId,
        String? body,
        String? createdAt,
        String? updatedAt,
        Feed? feed,
        User? user}) {
    if (id != null) {
      this._id = id;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (feedId != null) {
      this._feedId = feedId;
    }
    if (body != null) {
      this._body = body;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (feed != null) {
      this._feed = feed;
    }
    if (user != null) {
      this._user = user;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  int? get feedId => _feedId;
  set feedId(int? feedId) => _feedId = feedId;
  String? get body => _body;
  set body(String? body) => _body = body;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  Feed? get feed => _feed;
  set feed(Feed? feed) => _feed = feed;
  User? get user => _user;
  set user(User? user) => _user = user;

  RepliesModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _feedId = json['feed_id'];
    _body = json['body'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _feed = json['feed'] != null ? new Feed.fromJson(json['feed']) : null;
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_id'] = this._userId;
    data['feed_id'] = this._feedId;
    data['body'] = this._body;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._feed != null) {
      data['feed'] = this._feed!.toJson();
    }
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    return data;
  }
}

class Feed {
  int? _id;
  int? _userId;
  String? _content;
  String? _createdAt;
  String? _updatedAt;
  bool? _liked;

  Feed(
      {int? id,
        int? userId,
        String? content,
        String? createdAt,
        String? updatedAt,
        bool? liked}) {
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

  Feed.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _content = json['content'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _liked = json['liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_id'] = this._userId;
    data['content'] = this._content;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['liked'] = this._liked;
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