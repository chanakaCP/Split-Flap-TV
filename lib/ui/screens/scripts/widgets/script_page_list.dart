import 'package:flutter/material.dart';
import 'package:split_flap_tv/ui/screens/scripts/widgets/widgets.dart';

import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';

class ScriptPageList extends StatelessWidget {
  final int pageCount;

  const ScriptPageList({
    Key? key,
    required this.pageCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      marginTop: 20,
      child: Column(
        children: [
          for (var i = 0; i < pageCount; i++)
            ScriptPageWidget(
              pageName: "Page ${i + 1}",
            ),
        ],
      ),
    );
  }
}
