// To parse this JSON data, do
//
//     final flowerEntry = flowerEntryFromJson(jsonString);

import 'dart:convert';

List<FlowerEntry> flowerEntryFromJson(String str) => List<FlowerEntry>.from(json.decode(str).map((x) => FlowerEntry.fromJson(x)));

String flowerEntryToJson(List<FlowerEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FlowerEntry {
    String model;
    String pk;
    Fields fields;

    FlowerEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory FlowerEntry.fromJson(Map<String, dynamic> json) => FlowerEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    int stocks;
    String imgUrl;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.stocks,
        required this.imgUrl,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        stocks: json["stocks"],
        imgUrl: json["img_url"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "stocks": stocks,
        "img_url": imgUrl,
    };
}
