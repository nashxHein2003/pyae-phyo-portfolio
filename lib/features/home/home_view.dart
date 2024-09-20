import 'package:flutter/material.dart';
import 'package:pyae_phyo/core/theme/app_color.dart';
import 'package:pyae_phyo/features/home/components/tab_item.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ResponsiveRowColumn(
          layout: ResponsiveRowColumnType.COLUMN,
          children: [
            ResponsiveRowColumnItem(
                child: Padding(
              padding: const EdgeInsets.only(top: 65, bottom: 120),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[700],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TabItem(title: 'Work', bgColor: AppColor.paleGold),
                      const TabItem(title: 'About'),
                      const TabItem(title: 'Resume')
                    ],
                  ),
                ),
              ),
            )),
            ResponsiveRowColumnItem(
                child: Center(
              child: Column(
                children: [
                  Text(
                    'Pyae Phyo',
                    style: TextStyle(
                        fontSize: ResponsiveValue(
                          context,
                          defaultValue: 135.0,
                          conditionalValues: [
                            const Condition.smallerThan(
                                name: TABLET, value: 60.0),
                            const Condition.largerThan(
                                name: DESKTOP, value: 150.0),
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
                            const Condition.smallerThan(
                                name: TABLET, value: 20.0),
                            const Condition.largerThan(
                                name: DESKTOP, value: 50.0),
                          ],
                        ).value,
                        color: AppColor.white,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )),
            ResponsiveRowColumnItem(
                child: _buildProjectTile('assets/project/gxmarket.png')),
            ResponsiveRowColumnItem(
                child: _buildProjectTile('assets/project/northern.png')),
            ResponsiveRowColumnItem(
                child: _buildProjectTile('assets/project/radian.png')),
            ResponsiveRowColumnItem(
                child: _buildProjectTile('assets/project/grumman.png')),
            ResponsiveRowColumnItem(
                child: _buildProjectTile('assets/project/foody.png')),
            ResponsiveRowColumnItem(
                child: _buildProjectTile('assets/project/dashcube.png')),
            ResponsiveRowColumnItem(
                child: _buildProjectTile('assets/project/node.png')),
          ],
        ),
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
