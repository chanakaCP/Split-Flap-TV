import 'package:flutter/material.dart';
import 'package:split_flap_tv/api/api_calls.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/models/script/script_data.dart';
import 'package:split_flap_tv/ui/screens/scripts/all_scripts_screen.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_text_button.dart';
import 'package:split_flap_tv/ui/widgets/cards/custom_script_card_widget.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/loadings/script_list_loading.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';

class ListOfScriptsWidget extends StatefulWidget {
  const ListOfScriptsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ListOfScriptsWidget> createState() => _ListOfScriptsWidgetState();
}

class _ListOfScriptsWidgetState extends State<ListOfScriptsWidget> {
  bool _isLoadingScripts = true;
  ScriptData _scriptData = ScriptData.empty();

  @override
  void initState() {
    _getAllScripts();
    super.initState();
  }

  _getAllScripts() async {
    ApiCalls.getScripts().then((response) {
      if (!mounted) {
        return;
      }
      if (response.isSuccess) {
        _scriptData = ScriptData.fromJson(response.jsonBody);
        setState(() {
          _isLoadingScripts = false;
        });
      }
    });
  }

  onTapSeeMore(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllScriptsScreen(scripts: _scriptData.scripts),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      marginTop: 32,
      child: (!_isLoadingScripts)
          ? (_scriptData.scripts.isNotEmpty)
              ? Column(
                  children: [
                    CustomContainer(
                      margin: defaultHorizontalMargin,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "List of Scripts",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 16),
                            for (var script in _scriptData.scripts)
                              CustomContainer(
                                marginRight: 16,
                                child: CustomScriptCardWidget(
                                  script: script,
                                  onTapItem: () {
                                    Navigator.of(context)
                                        .pushNamed("/ScriptDetailsScreen");
                                  },
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
