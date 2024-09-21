import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pyae_phyo/core/utils/shared/app_state_provider.dart';
import 'package:pyae_phyo/features/about/about_view.dart';
import 'package:pyae_phyo/features/home/components/toggle_switch.dart';
import 'package:pyae_phyo/features/work/work_view.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<AppState>(
            builder: (BuildContext context, AppState appState, Widget? child) {
          return ResponsiveRowColumn(
            layout: ResponsiveRowColumnType.COLUMN,
            children: [
              const ResponsiveRowColumnItem(
                  child: Padding(
                padding: EdgeInsets.only(top: 60, bottom: 120),
                child: Center(child: ToggleSwitch()),
              )),
              appState.isToggled
                  ? const ResponsiveRowColumnItem(child: WorkView())
                  : const ResponsiveRowColumnItem(child: AboutView())
            ],
          );
        }),
      ),
    );
  }
}
