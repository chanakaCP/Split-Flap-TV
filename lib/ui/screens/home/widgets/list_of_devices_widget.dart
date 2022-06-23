import 'package:flutter/material.dart';
import 'package:split_flap_tv/api/api_calls.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/models/devices/device_data.dart';
import 'package:split_flap_tv/ui/screens/devices/all_devices_screen.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_text_button.dart';
import 'package:split_flap_tv/ui/widgets/cards/custom_device_card_widget.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/loadings/script_list_loading.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class ListOfDevicesWidget extends StatefulWidget {
  const ListOfDevicesWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ListOfDevicesWidget> createState() => _ListOfDevicesWidgetState();
}

class _ListOfDevicesWidgetState extends State<ListOfDevicesWidget> {
  bool _isLoadingDevices = true;
  DeviceData _deviceData = DeviceData.empty();

  @override
  void initState() {
    _getAllDevices();
    super.initState();
  }

  _getAllDevices() async {
    ApiCalls.getDevices().then((response) {
      if (!mounted) {
        return;
      }
      if (response.isSuccess) {
        _deviceData = DeviceData.fromJson(response.jsonBody);
        setState(() {
          _isLoadingDevices = false;
        });
      }
    });
  }

  onTapSeeMore(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllDevicesScreen(devices: _deviceData.devices),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      marginTop: 32,
      child: (!_isLoadingDevices)
          ? (_deviceData.devices.isNotEmpty)
              ? Column(
                  children: [
                    CustomContainer(
                      margin: defaultHorizontalMargin,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "List of Devices",
                            textStyle: fontStyle1(),
                          ),
                          CustomTextButton(
                            text: "See All",
                            onPressed: () => onTapSeeMore(context),
                          )
                        ],
                      ),
                    ),
                    CustomContainer(
                      marginTop: 12,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            for (var device in _deviceData.devices)
                              CustomContainer(
                                marginRight: 16,
                                child: CustomDeviceCardWidget(
                                  device: device,
                                  onTapItem: () {},
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink()
          : const ScriptListLoading(),
    );
  }
}
