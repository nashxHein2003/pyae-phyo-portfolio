import 'package:flutter/material.dart';
import 'package:pyae_phyo/core/theme/app_color.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TabItem extends StatelessWidget {
  const TabItem(
      {super.key, required this.title, this.bgColor, this.color, this.onTap});
  final String title;
  final Color? color;
  final Color? bgColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveValue(
            context,
            defaultValue: 40.0,
            conditionalValues: [
              const Condition.smallerThan(name: TABLET, value: 16.0),
              const Condition.largerThan(name: DESKTOP, value: 40.0),
            ],
          ).value,
          vertical: ResponsiveValue(
            context,
            defaultValue: 20.0,
            conditionalValues: [
              const Condition.smallerThan(name: TABLET, value: 10.0),
              const Condition.largerThan(name: DESKTOP, value: 20.0),
            ],
          ).value,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bgColor ?? Colors.transparent,
        ),
        child: Text(
          title,
          style: TextStyle(
              fontSize: ResponsiveValue(
                context,
                defaultValue: 24.0,
                conditionalValues: [
                  const Condition.smallerThan(name: TABLET, value: 16.0),
                  const Condition.largerThan(name: DESKTOP, value: 32.0),
                ],
              ).value,
              fontWeight: FontWeight.w500,
              color: color ?? AppColor.white),
        ),
      ),
    );
  }
}
