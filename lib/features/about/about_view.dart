import 'package:flutter/material.dart';
import 'package:pyae_phyo/core/constants/app_string.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:pyae_phyo/core/theme/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    Uri portfolioUrl = Uri.parse(
        'https://www.figma.com/design/KDUyTAUe5TWziDGXGJuSWh/Portfolio?node-id=6-29413&node-type=canvas&t=UWiLqcxORBjAzG3u-0');

    double fontSize = ResponsiveValue(
      context,
      defaultValue: 40.0,
      conditionalValues: [
        const Condition.smallerThan(name: TABLET, value: 16.0),
        const Condition.largerThan(name: DESKTOP, value: 40.0),
      ],
    ).value;

    return Column(
      children: [
        _buildParagraph(fontSize, AppString.firstPara),
        _buildParagraph(fontSize, AppString.secondPara),
        _buildParagraph(fontSize, AppString.thirdPara),
        _buildParagraph(fontSize, AppString.fourthPara),
        _buildTextLink(fontSize, portfolioUrl, 'Portfolio'),
        const SizedBox(height: 60)
      ],
    );
  }

  Widget _buildTextLink(double fontSize, Uri url, String text) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async {
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: AppColor.white,
                      decorationThickness: 2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildParagraph(double fontSize, String bodyText) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '-----------',
                  style: TextStyle(fontSize: fontSize),
                ),
                TextSpan(
                  text: bodyText,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: AppColor.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
