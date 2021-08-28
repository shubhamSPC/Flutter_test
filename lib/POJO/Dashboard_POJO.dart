import 'package:flutter_proj/POJO/Support_POJO.dart';
import 'package:flutter_proj/POJO/User_POJO.dart';
import 'dart:core';

class Dashboard_POJO{
  String page;
  String per_page;
  String total;
  String total_pages;
  List<User_Pojo>?  data;
  Support_POJO support;

  Dashboard_POJO(this.page, this.per_page, this.total, this.total_pages,
      this.data, this.support);

  // factory Dashboard_POJO.fromJson(dynamic json) {
  //   var tagObjsJson = json['data'] as List;
  //   return Dashboard_POJO(
  //     page:json['page'],
  //     per_page:json['per_page'],
  //     total:json['total'],
  //     total_pages:json['total_pages'],
  //     data: (json['data'] != null
  //         ? tagObjsJson.map((tagJson) => User_Pojo.fromJson(tagJson)).toList()
  //         : null),
  //     support:json['support'],
  //   );
  // }
  @override
  String toString() {
    return '{ ${this.page}, ${this.per_page}, ${this.total}, ${this.total_pages}, ${this.data} , ${this.support}  }';
  }
}