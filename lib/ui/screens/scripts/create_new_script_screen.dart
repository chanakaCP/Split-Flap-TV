import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/extensions/extensions.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/appbars/custom_appbar.dart';
import 'package:split_flap_tv/ui/widgets/buttons/custom_button.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:split_flap_tv/ui/widgets/form_contents/custom_form_field.dart';
import 'package:split_flap_tv/ui/widgets/texts/custom_text.dart';
import 'widgets/widgets.dart';

class CreateNewScriptScreen extends StatefulWidget {
  @override
  _CreateNewScriptScreenState createState() => _CreateNewScriptScreenState();
}

class _CreateNewScriptScreenState extends State<CreateNewScriptScreen> {
  TextEditingController _scriptNameController = TextEditingController();
  TextEditingController _scriptColumnsController = TextEditingController();
  TextEditingController _scriptRowsController = TextEditingController();

  bool _isSilentUpdate = false;
  int _pageCount = 1;

  onTapSilentUpdate() {
    setState(() {
      _isSilentUpdate = !_isSilentUpdate;
    });
  }

  onTapAddNewPage() {
    setState(() {
      _pageCount = _pageCount + 1;
    });
  }

  onTapSaveScript() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppbar(title: "Create New Scripts"),
      body: SingleChildScrollView(
        child: CustomContainer(
          margin: defaultMargin,
          child: Column(
            children: [
              CustomFormField(
                controller: _scriptNameController,
                formTitle: "Scripts Name",
              ),
              CustomContainer(
                marginTop: 32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomFormField(
                      formTitle: "Number of Rows",
                      controller: _scriptRowsController,
                      inputType: TextInputType.number,
                      width: (MediaQuery.of(context).size.width - 48) / 2,
                    ),
                    CustomFormField(
                      formTitle: "Number of Colunms ",
                      controller: _scriptColumnsController,
                      inputType: TextInputType.number,
                      width: (MediaQuery.of(context).size.width - 48) / 2,
                    )
                  ],
                ),
              ),
              CustomContainer(
                marginTop: 16,
                borderRadius: 8.fullRadius,
                height: 48,
                bgColor: primaryBlackColor,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Silent Updating",
                      textStyle: fontStyle8(),
                    ),
                    InkWell(
                      borderRadius: 5.fullRadius,
                      child: CustomContainer(
                        height: 22.5,
                        width: 22.5,
                        borderRadius: 8.fullRadius,
                        border: Border.all(color: primaryBlueColor, width: 2),
                        bgColor:
                            (_isSilentUpdate) ? primaryBlueColor : transparent,
                        child: const Icon(
                          Icons.check,
                          size: 17.5,
                          color: primaryBlackColor,
                        ),
                      ),
                      onTap: () {
                        onTapSilentUpdate();
                      },
                    )
                  ],
                ),
              ),
              ScriptPageList(pageCount: _pageCount),
              CustomButton.outline(
                text: "Add new Page",
                marginTop: 32,
                onPressed: () => onTapAddNewPage(),
              ),
              CustomButton(
                text: "Done",
                marginTop: 15,
                onPressed: () => onTapSaveScript(),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
