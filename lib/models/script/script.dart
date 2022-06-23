class Script {
  Script({
    this.scriptId,
    this.userId,
    this.scriptName,
    this.silent,
    this.rows,
    this.columns,
  });

  String? scriptId;
  String? userId;
  String? scriptName;
  String? silent;
  String? rows;
  String? columns;

  factory Script.fromJson(Map<String, dynamic> json) => Script(
        scriptId: json["ScriptID"],
        userId: json["UserID"],
        scriptName: json["ScriptName"],
        silent: json["Silent"],
        rows: json["Rows"],
        columns: json["Columns"],
      );

  Map<String, dynamic> toJson() => {
        "ScriptID": scriptId,
        "UserID": userId,
        "ScriptName": scriptName,
        "Silent": silent,
        "Rows": rows,
        "Columns": columns,
      };
}
