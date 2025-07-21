import 'package:flutter/material.dart';
import 'dashboard_contact_section.dart';

class ContactSection extends StatelessWidget {
  final GlobalKey contactKey;
  const ContactSection({super.key, required this.contactKey});

  @override
  Widget build(BuildContext context) {
    return DashboardContactSection(contactKey: contactKey);
  }
}
