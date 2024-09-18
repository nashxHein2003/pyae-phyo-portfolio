import 'package:flutter/material.dart';
import 'package:pyae_phyo/core/theme/app_color.dart';
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
                      _buildTabItem('Home', null, AppColor.paleGold, null),
                      _buildTabItem('About', null, null, null),
                      _buildTabItem('Contact', null, null, null),
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
                        fontSize: 135,
                        color: AppColor.white,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Hi! I’m a Product Designer based in Bangkok Thailand.',
                    style: TextStyle(
                        fontSize: 48,
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
                child: _buildProjectTile('assets/project/radian.png'))
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

  Widget _buildTabItem(
      String title, Color? color, Color? bgColor, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bgColor ?? Colors.transparent,
        ),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: color ?? AppColor.white),
        ),
      ),
    );
  }
}
