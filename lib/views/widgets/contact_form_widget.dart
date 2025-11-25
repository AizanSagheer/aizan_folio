import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/colors.dart';
import '../../utils/external_links.dart';
import 'custom_outlined_button.dart';

class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({super.key});

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  final _isSending = ValueNotifier<bool>(false);
  final _statusMessage = ValueNotifier<String?>(null);

  @override
  void dispose() {
    _isSending.dispose();
    _statusMessage.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    
    _isSending.value = true;
    _statusMessage.value = null;

    try {
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final message = _messageController.text.trim();
      
      // Create subject with sender's name
      final subject = 'Contact from Portfolio - $name';
      
      // Create email body with sender info and message
      final body = '''Hello Aizan,

My name is $name and my email is $email.

$message

Best regards,
$name''';

      // Encode the URI components
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: ExternalLinks.email,
        queryParameters: {
          'subject': subject,
          'body': body,
        },
      );

      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
        _isSending.value = false;
        _statusMessage.value = 'Opening email client...';
        // Clear form after a short delay
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            _nameController.clear();
            _emailController.clear();
            _messageController.clear();
            _statusMessage.value = null;
          }
        });
      } else {
        _isSending.value = false;
        _statusMessage.value = 'Could not open email client. Please try again.';
      }
    } catch (e) {
      _isSending.value = false;
      _statusMessage.value = 'An error occurred. Please try again.';
    }
  }

  InputDecoration _getInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: AppColors().textColor.withOpacity(0.7),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors().textColor.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors().secondaryColor,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors().redColor.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors().redColor.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      filled: true,
      fillColor: AppColors().containerBackgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: _getInputDecoration('Name'),
              style: TextStyle(color: AppColors().textColor),
              validator: (value) => value!.isEmpty ? 'Enter your name' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: _getInputDecoration('Email'),
              style: TextStyle(color: AppColors().textColor),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your email';
                }
                if (!value.contains('@') || !value.contains('.')) {
                  return 'Enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _messageController,
              decoration: _getInputDecoration('Message'),
              style: TextStyle(color: AppColors().textColor),
              maxLines: 5,
              validator: (value) => value!.isEmpty ? 'Enter a message' : null,
            ),
            const SizedBox(height: 30),
            Center(
              child: ValueListenableBuilder<bool>(
                valueListenable: _isSending,
                builder: (context, isSending, child) {
                  return CustomOutlinedButton(
                    text: 'Send Message',
                    onPressed: _submitForm,
                    isLoading: isSending,
                  );
                },
              ),
            ),
            ValueListenableBuilder<String?>(
              valueListenable: _statusMessage,
              builder: (context, statusMessage, child) {
                if (statusMessage == null) return const SizedBox.shrink();
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        statusMessage,
                        style: TextStyle(
                          color: statusMessage.contains('Opening') || 
                                 statusMessage.contains('success')
                            ? AppColors().secondaryColor
                            : Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
