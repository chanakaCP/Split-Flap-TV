class Device {
  Device({
    this.displayId,
    this.userId,
    this.displayName,
    this.orientation,
    this.guid,
    this.timezone,
    this.refreshRate,
    this.brand,
    this.model,
    this.serialNumber,
  });

  String? displayId;
  String? userId;
  String? displayName;
  String? orientation;
  String? guid;
  String? timezone;
  String? refreshRate;
  String? brand;
  String? model;
  String? serialNumber;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        displayId: json["DisplayID"],
        userId: json["UserID"],
        displayName: json["DisplayName"],
        orientation: json["Orientation"],
        guid: json["GUID"],
        timezone: json["Timezone"],
        refreshRate: json["RefreshRate"],
        brand: json["Brand"],
        model: json["Model"],
        serialNumber: json["SerialNumber"],
      );

  Map<String, dynamic> toJson() => {
        "DisplayID": displayId,
        "UserID": userId,
        "DisplayName": displayName,
        "Orientation": orientation,
        "GUID": guid,
        "Timezone": timezone,
        "RefreshRate": refreshRate,
        "Brand": brand,
        "Model": model,
        "SerialNumber": serialNumber,
      };
}
