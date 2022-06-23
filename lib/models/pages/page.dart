class Page {
  Page({
    this.scriptPageId,
    this.scriptId,
    this.sequence,
    this.messages,
    this.attributes,
    this.duration,
  });

  String? scriptPageId;
  String? scriptId;
  String? sequence;
  String? messages;
  String? attributes;
  String? duration;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        scriptPageId: json["ScriptPageID"],
        scriptId: json["ScriptID"],
        sequence: json["Sequence"],
        messages: json["Messages"],
        attributes: json["Attributes"],
        duration: json["Duration"],
      );

  Map<String, dynamic> toJson() => {
        "ScriptPageID": scriptPageId,
        "ScriptID": scriptId,
        "Sequence": sequence,
        "Messages": messages,
        "Attributes": attributes,
        "Duration": duration,
      };
}
