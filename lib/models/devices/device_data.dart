import 'device.dart';

class DeviceData {
  DeviceData({
    required this.devices,
  });

  List<Device> devices;

  factory DeviceData.empty() => DeviceData(devices: []);

  factory DeviceData.fromJson(Map<String, dynamic> json) => DeviceData(
        devices: (json["data"] != null)
            ? List<Device>.from(json["data"].map((x) => Device.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "devices": List<dynamic>.from(devices.map((x) => x.toJson())),
      };
}
