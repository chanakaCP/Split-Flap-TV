import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'container_loading.dart';

class ScriptListLoading extends StatelessWidget {
  const ScriptListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomContainer(
              alignment: Alignment.topLeft,
              margin: defaultHorizontalMargin,
              child: const ContainerLoading(height: 21, width: 200),
            ),
            CustomContainer(
              alignment: Alignment.topLeft,
              margin: defaultHorizontalMargin,
              child: const ContainerLoading(height: 21, width: 50),
            ),
          ],
        ),
        CustomContainer(
          marginTop: 12,
          height: 192,
          alignment: Alignment.topLeft,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (_, __) {
              return const CustomContainer(
                marginLeft: 16,
                child: ContainerLoading(height: 180, width: 300),
              );
            },
          ),
        ),
      ],
    );
  }
}
