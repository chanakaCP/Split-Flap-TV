import 'page.dart';

class PageData {
  PageData({
    required this.pages,
  });

  List<Page> pages;

  factory PageData.empty() => PageData(pages: []);

  factory PageData.fromJson(Map<String, dynamic> json) => PageData(
        pages: List<Page>.from(json["data"].map((x) => Page.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pages": List<dynamic>.from(pages.map((x) => x.toJson())),
      };
}
