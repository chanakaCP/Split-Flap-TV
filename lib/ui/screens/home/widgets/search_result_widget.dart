import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/style/app_style.dart';
import 'package:split_flap_tv/ui/widgets/cards/custom_script_card_widget.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';

class SearchResultWidget extends StatelessWidget {
  final List searchResultList;

  const SearchResultWidget({
    Key? key,
    required this.searchResultList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: defaultMargin,
      child: Column(
        children: [
          for (var result in searchResultList)
            CustomContainer(
              marginBottom: 16,
              child: CustomScriptCardWidget(
                script: result,
                onTapItem: () {
                  Navigator.of(context).pushNamed("/ScriptDetailsScreen");
                },
              ),
            ),
        ],
      ),
    );
  }
}
