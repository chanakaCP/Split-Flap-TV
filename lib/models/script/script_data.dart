import 'script.dart';

class ScriptData {
  ScriptData({
    required this.scripts,
  });

  List<Script> scripts;

  factory ScriptData.empty() => ScriptData(scripts: []);

  factory ScriptData.fromJson(Map<String, dynamic> json) => ScriptData(
        scripts: List<Script>.from(json["data"].map((x) => Script.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "scripts": List<dynamic>.from(scripts.map((x) => x.toJson())),
      };
}
