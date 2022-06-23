// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/extensions/extensions.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/models/script/script.dart';
import 'package:split_flap_tv/ui/widgets/appbars/custom_appbar.dart';
import 'package:split_flap_tv/ui/widgets/cards/custom_script_card_widget.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class AllScriptsScreen extends StatefulWidget {
  final List<Script> scripts;
  const AllScriptsScreen({
    Key? key,
    required this.scripts,
  }) : super(key: key);

  @override
  State<AllScriptsScreen> createState() => _AllScriptsScreenState();
}

class _AllScriptsScreenState extends State<AllScriptsScreen> {
  bool _isSearching = false;

  List<dynamic> searchResults = [];

  onChangeSearchText(String value) {
    searchResults.clear();
    if (value.isNotEmpty && value != "") {
      searchResults.addAll(
          widget.scripts.where((script) => script.scriptName!.contains(value)));

      setState(() {
        _isSearching = true;
      });
    } else {
      searchResults.clear();
      setState(() {
        _isSearching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppbar(title: "See All Scripts"),
      body: SingleChildScrollView(
        child: CustomContainer(
          margin: defaultMargin,
          child: Column(
            children: [
              CustomContainer(
                height: 48,
                child: CupertinoSearchTextField(
                  placeholder: "Search Devices by name...",
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
              (!_isSearching)
                  ? CustomText(
                      text: "List of Scripts",
                      textStyle: fontStyle7(),
                      marginBottom: 16,
                      marginTop: 32,
                    )
                  : const SizedBox(height: 20),
              (!_isSearching)
                  ? Column(
                      children: widget.scripts.map((script) {
                        return CustomContainer(
                          marginBottom: 16,
                          child: CustomScriptCardWidget(
                            script: script,
                            onTapItem: () {
                              Navigator.of(context)
                                  .pushNamed("/ScriptDetailsScreen");
                            },
                          ),
                        );
                      }).toList(),
                    )
                  : Column(
                      children: searchResults.map((script) {
                        return CustomContainer(
                          marginBottom: 16,
                          child: CustomScriptCardWidget(
                            script: script,
                            onTapItem: () {
                              Navigator.of(context)
                                  .pushNamed("/ScriptDetailsScreen");
                            },
                          ),
                        );
                      }).toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
