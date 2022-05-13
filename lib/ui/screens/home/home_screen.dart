import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/consts/consts.dart';
import 'package:split_flap_tv/config/extensions/extensions.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/appbars/custom_appbar.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_button.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/images/custom_image.dart';

import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false;

//! temp
  List<String> tempScriptList = [
    "Split-Flap-TV app with 50″ television",
    "Split-Flap-TV app with 60″ television",
    "Split-Flap-TV app with 70″ television",
    "Split-Flap-TV app with 80″ television",
    "Split-Flap-TV app with 90″ television",
    "Split-Flap-TV app with 100″ television",
  ];
  List<String> tempDeviceList = [
    "Split-Flap-TV app with 1″ television",
    "Split-Flap-TV app with 2″ television",
    "Split-Flap-TV app with 3″ television",
    "Split-Flap-TV app with 4″ television",
    "Split-Flap-TV app with 5″ television",
    "Split-Flap-TV app with 7″ television",
  ];

  List<String> tempSearchResults = [];

  onChangeSearchText(String value) {
    tempSearchResults.clear();
    if (value.isNotEmpty && value != "") {
      tempSearchResults
          .addAll(tempScriptList.where((script) => script.contains(value)));
      tempSearchResults
          .addAll(tempDeviceList.where((device) => device.contains(value)));

      setState(() {
        _isSearching = true;
      });
    } else {
      tempSearchResults.clear();
      setState(() {
        _isSearching = false;
      });
    }
  }

  onTapLeadingIcon() {
    tempSearchResults.clear();
    if (_isSearching == true) {
      setState(() {
        _isSearching = false;
      });
    } else {
      //TODO : open menu
    }
  }

  onTapTailingIcon() {}

  onClickCreateScript() {
    Navigator.of(context).pushNamed("/CreateNewScriptScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppbar(
        tailingIcon: (_isSearching) ? null : Icons.person_outline_rounded,
        leadingIcon:
            (_isSearching) ? Icons.arrow_back_rounded : Icons.menu_rounded,
        leadingCallback: () => onTapLeadingIcon(),
        tailingCallback: () => onTapTailingIcon(),
        titleWidget: (_isSearching)
            ? const SizedBox(height: 35)
            : const CustomImage(
                imagePath: logoImage,
                height: 35,
              ),
      ),
      bottomSheet: (_isSearching)
          ? null
          : CustomContainer(
              height: 112,
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
              bgColor: backgroundColor,
              child: CustomButton(
                text: "Create New Scripts",
                onPressed: () => onClickCreateScript(),
              ),
            ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: CustomContainer(
          child: Column(
            children: [
              CustomContainer(
                margin: defaultMargin,
                height: 48,
                child: CupertinoSearchTextField(
                  placeholder: "Search scripts by name...",
                  borderRadius: 16.fullRadius,
                  backgroundColor: primaryBlackColor,
                  itemColor: white,
                  itemSize: 24,
                  padding: 16.vertical,
                  prefixInsets: const EdgeInsets.fromLTRB(18, 0, 10, 0),
                  suffixInsets: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  placeholderStyle: customFontStyle(
                    fontColor: hintTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                  onChanged: (term) => onChangeSearchText(term),
                ),
              ),
              (_isSearching)
                  ? SearchResultWidget(searchResultList: tempSearchResults)
                  : CustomContainer(
                      child: Column(
                        children: [
                          ListOfDevicesWidget(deviceList: tempDeviceList),
                          ListOfScriptsWidget(scriptList: tempScriptList),
                        ],
                      ),
                    ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
