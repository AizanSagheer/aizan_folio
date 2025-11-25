import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/colors.dart';
import '../../utils/external_links.dart';
import 'contact_form_widget.dart';
import 'custom_outlined_button.dart';

class DashboardContactSection extends StatelessWidget {
  final GlobalKey contactKey;
  const DashboardContactSection({super.key, required this.contactKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: contactKey,
      child: Column(
        children: [
          Center(
            child: Text('Contact Me',
                style: TextStyle(
                  color: AppColors().whiteColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                )),
          ),
          SizedBox(height: 40.0),
          Text(
            'Say Hello! or have any questions?',
            style: TextStyle(
              color: AppColors().whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          ContactFormWidget(),
          Center(
            child: Text('Or',
                style: TextStyle(
                  color: AppColors().whiteColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                )),
          ),
          SizedBox(height: 40.0),
          Center(
            child: CustomOutlinedButton(
              text: 'Email me directly',
              onPressed: () async {
                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: ExternalLinks.email,
                );
                if (await canLaunchUrl(emailUri)) {
                  await launchUrl(emailUri);
                }
              },
            ),
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
