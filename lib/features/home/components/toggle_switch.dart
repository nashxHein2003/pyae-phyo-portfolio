import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pyae_phyo/core/theme/app_color.dart';
import 'package:pyae_phyo/core/utils/shared/app_state_provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ToggleSwitch extends StatelessWidget {
  const ToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    double activeBlockWidth = ResponsiveValue(
      context,
      defaultValue: 150.0,
      conditionalValues: [
        const Condition.smallerThan(name: TABLET, value: 90.0),
        const Condition.largerThan(name: DESKTOP, value: 160.0),
      ],
    ).value;

    double activeBlockHeight = ResponsiveValue(
      context,
      defaultValue: 70.0,
      conditionalValues: [
        const Condition.smallerThan(name: TABLET, value: 50.0),
        const Condition.largerThan(name: DESKTOP, value: 80.0),
      ],
    ).value;

    double toggleWidth = ResponsiveValue(
      context,
      defaultValue: 150.0,
      conditionalValues: [
        const Condition.smallerThan(name: TABLET, value: 90.0),
        const Condition.largerThan(name: DESKTOP, value: 150.0),
      ],
    ).value;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: ResponsiveValue(
        context,
        defaultValue: 70.0,
        conditionalValues: [
          const Condition.smallerThan(name: TABLET, value: 50.0),
          const Condition.largerThan(name: DESKTOP, value: 80.0),
        ],
      ).value,
      child: Align(
        alignment: Alignment.center,
        child: Consumer<AppState>(
          builder: (BuildContext context, AppState appState, Widget? child) {
            return Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(8),
              ),
              width: ResponsiveValue(
                context,
                defaultValue: 300.0,
                conditionalValues: [
                  const Condition.smallerThan(name: TABLET, value: 180.0),
                  const Condition.largerThan(name: DESKTOP, value: 320.0),
                ],
              ).value,
              height: ResponsiveValue(
                context,
                defaultValue: 70.0,
                conditionalValues: [
                  const Condition.smallerThan(name: TABLET, value: 50.0),
                  const Condition.largerThan(name: DESKTOP, value: 80.0),
                ],
              ).value,
              child: Stack(
                children: [
                  AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      right: appState.isToggled ? toggleWidth : 0.0,
                      left: appState.isToggled ? 0.0 : toggleWidth,
                      child: Container(
                        width: activeBlockWidth,
                        height: activeBlockHeight,
                        decoration: BoxDecoration(
                          color: AppColor.paleGold,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            if (!appState.isToggled) appState.toggle();
                          },
                          child: Center(
                            child: Text(
                              'Work',
                              style: TextStyle(
                                  fontSize: ResponsiveValue(
                                    context,
                                    defaultValue: 24.0,
                                    conditionalValues: [
                                      const Condition.smallerThan(
                                          name: TABLET, value: 16.0),
                                      const Condition.largerThan(
                                          name: DESKTOP, value: 32.0),
                                    ],
                                  ).value,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            if (appState.isToggled) appState.toggle();
                          },
                          child: Center(
                            child: Text(
                              'About',
                              style: TextStyle(
                                  fontSize: ResponsiveValue(
                                    context,
                                    defaultValue: 24.0,
                                    conditionalValues: [
                                      const Condition.smallerThan(
                                          name: TABLET, value: 16.0),
                                      const Condition.largerThan(
                                          name: DESKTOP, value: 32.0),
                                    ],
                                  ).value,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
