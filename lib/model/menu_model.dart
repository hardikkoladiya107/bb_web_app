import 'dart:convert';

List<MenuModel> menuModelFromJson(dynamic json) {
  return (json as List).map((e) => MenuModel.fromJson(e)).toList();
}

class MenuModel {
  MenuModel({
    String? id,
    String? title,
    String? categoryId,
    String? type,
    String? code,
    int? order,
    List<Menus>? menus,
  }) {
    _id = id;
    _title = title;
    _categoryId = categoryId;
    _type = type;
    _code = code;
    _order = order;
    _menus = menus;
  }

  MenuModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _categoryId = json['category_id'];
    _type = json['type'];
    _code = json['code'];
    _order = json['order'];
    if (json['menus'] != null) {
      _menus = [];
      json['menus'].forEach((v) {
        _menus?.add(Menus.fromJson(v));
      });
    }
  }

  String? _id;
  String? _title;
  String? _categoryId;
  String? _type;
  String? _code;
  int? _order;
  List<Menus>? _menus;

  MenuModel copyWith({
    String? id,
    String? title,
    String? categoryId,
    String? type,
    String? code,
    int? order,
    List<Menus>? menus,
  }) =>
      MenuModel(
        id: id ?? _id,
        title: title ?? _title,
        categoryId: categoryId ?? _categoryId,
        type: type ?? _type,
        code: code ?? _code,
        order: order ?? _order,
        menus: menus ?? _menus,
      );

  String? get id => _id;

  String? get title => _title;

  String? get categoryId => _categoryId;

  String? get type => _type;

  String? get code => _code;

  int? get order => _order;

  List<Menus>? get menus => _menus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['category_id'] = _categoryId;
    map['type'] = _type;
    map['code'] = _code;
    map['order'] = _order;
    if (_menus != null) {
      map['menus'] = _menus?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Menus menusFromJson(String str) => Menus.fromJson(json.decode(str));

String menusToJson(Menus data) => json.encode(data.toJson());

class Menus {
  Menus({
    String? id,
    String? title,
    String? categoryId,
    String? code,
    String? iconUrl,
    int? order,
  }) {
    _id = id;
    _title = title;
    _categoryId = categoryId;
    _code = code;
    _iconUrl = iconUrl;
    _order = order;
  }

  Menus.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _categoryId = json['category_id'];
    _code = json['code'];
    _iconUrl = json['icon_url'];
    _order = json['order'];
  }

  String? _id;
  String? _title;
  String? _categoryId;
  String? _code;
  String? _iconUrl;
  int? _order;

  Menus copyWith({
    String? id,
    String? title,
    String? categoryId,
    String? code,
    String? iconUrl,
    int? order,
  }) =>
      Menus(
        id: id ?? _id,
        title: title ?? _title,
        categoryId: categoryId ?? _categoryId,
        code: code ?? _code,
        iconUrl: iconUrl ?? _iconUrl,
        order: order ?? _order,
      );

  String? get id => _id;

  String? get title => _title;

  String? get categoryId => _categoryId;

  String? get code => _code;

  String? get iconUrl => _iconUrl;

  int? get order => _order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['category_id'] = _categoryId;
    map['code'] = _code;
    map['icon_url'] = _iconUrl;
    map['order'] = _order;
    return map;
  }
}
