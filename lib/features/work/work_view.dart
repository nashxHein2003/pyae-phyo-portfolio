import 'package:flutter/material.dart';
import 'package:pyae_phyo/core/theme/app_color.dart';
import 'package:responsive_framework/responsive_framework.dart';

class WorkView extends StatefulWidget {
  const WorkView({super.key});

  @override
  State<WorkView> createState() => _WorkViewState();
}

class _WorkViewState extends State<WorkView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Pyae Phyo',
            style: TextStyle(
                fontSize: ResponsiveValue(
                  context,
                  defaultValue: 135.0,
                  conditionalValues: [
                    const Condition.smallerThan(name: TABLET, value: 60.0),
                    const Condition.largerThan(name: DESKTOP, value: 150.0),
                  ],
                ).value,
                color: AppColor.white,
                fontWeight: FontWeight.w400),
          ),
          Text(
            'Hi! I’m a Product Designer based in Bangkok Thailand.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: ResponsiveValue(
                  context,
                  defaultValue: 48.0,
                  conditionalValues: [
                    const Condition.smallerThan(name: TABLET, value: 20.0),
                    const Condition.largerThan(name: DESKTOP, value: 50.0),
                  ],
                ).value,
                color: AppColor.white,
                fontWeight: FontWeight.w400),
          ),
          _buildProjectTile('assets/project/gxmarket.png'),
          _buildProjectTile('assets/project/northern.png'),
          _buildProjectTile('assets/project/radian.png'),
          _buildProjectTile('assets/project/foody.png'),
          _buildProjectTile('assets/project/dashcube.png'),
          _buildProjectTile('assets/project/grumman.png'),
          _buildProjectTile('assets/project/node.png'),
          const SizedBox(height: 65)
        ],
      ),
    );
  }

  Container _buildProjectTile(String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(top: 65),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 750, maxWidth: 1200),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
