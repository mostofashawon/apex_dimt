// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'dart:convert';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
  String? statusCode;
  String? statusMessage;
  CompanyList? companyList;

  Company({
    this.statusCode,
    this.statusMessage,
    this.companyList,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    statusCode: json["status_code"],
    statusMessage: json["status_message"],
    companyList:  CompanyList.fromJson(json["company_list"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status_message": statusMessage,
    "company_list": companyList,
  };
}

class CompanyList {
  int? currentPage;
  List<Datum>? data;
  // String? firstPageUrl;
  // int? from;
  // int? lastPage;
  // String? lastPageUrl;
  // List<Link>? links;
  // dynamic nextPageUrl;
  // String? path;
  // int? perPage;
  // dynamic prevPageUrl;
  // int? to;
  // int? total;

  CompanyList({
    this.currentPage,
    this.data,
    // this.firstPageUrl,
    // this.from,
    // this.lastPage,
    // this.lastPageUrl,
    // this.links,
    // this.nextPageUrl,
    // this.path,
    // this.perPage,
    // this.prevPageUrl,
    // this.to,
    // this.total,
  });

  factory CompanyList.fromJson(Map<String, dynamic> json) => CompanyList(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    // firstPageUrl: json["first_page_url"],
    // from: json["from"],
    // lastPage: json["last_page"],
    // lastPageUrl: json["last_page_url"],
    // links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    // nextPageUrl: json["next_page_url"],
    // path: json["path"],
    // perPage: json["per_page"],
    // prevPageUrl: json["prev_page_url"],
    // to: json["to"],
    // total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    // "first_page_url": firstPageUrl,
    // "from": from,
    // "last_page": lastPage,
    // "last_page_url": lastPageUrl,
    // "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
    // "next_page_url": nextPageUrl,
    // "path": path,
    // "per_page": perPage,
    // "prev_page_url": prevPageUrl,
    // "to": to,
    // "total": total,
  };
}

class Datum {
  String? companyName;
  String? email;
  String? phone;


  Datum({
    this.companyName,
    this.email,
    this.phone,

  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    companyName: json["company_name"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "company_name": companyName,
    "email": email,
    "phone": phone,
  };
}

// class Link {
//   String? url;
//   String? label;
//   bool? active;
//
//   Link({
//     this.url,
//     this.label,
//     this.active,
//   });
//
//   factory Link.fromJson(Map<String, dynamic> json) => Link(
//     url: json["url"],
//     label: json["label"],
//     active: json["active"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "url": url,
//     "label": label,
//     "active": active,
//   };
// }
