import 'package:flutter/material.dart';
import 'package:my_care_archives/model/activity/activity_model.dart';

class IconSelection extends StatelessWidget {
  const IconSelection({
    super.key,
    required this.width,
    required this.height,
    required this.bg,
    required this.singleActivity,
  });

  final double width;
  final double height;
  final Color bg;
  final ActivityModel singleActivity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 0.75))
            ],
          ),
          child: Icon(singleActivity.ic),
        ),
        SizedBox(height: 10.0),
        Text(singleActivity.name!),
      ],
    );
  }
}
