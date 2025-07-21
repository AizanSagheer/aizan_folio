import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'custom_outlined_button.dart';
import '../../controllers/contact_controller.dart';
import '../../models/contact_form_data.dart';

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
  final ContactController _controller = ContactController();

  bool _isSending = false;
  String? _statusMessage;

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isSending = true;
      _statusMessage = null;
    });
    final formData = ContactFormData(
      name: _nameController.text,
      email: _emailController.text,
      message: _messageController.text,
    );
    final result = await _controller.submitContactForm(
      formData.name,
      formData.email,
      formData.message,
    );
    setState(() {
      _isSending = false;
      _statusMessage = result;
      if (result.contains('success')) {
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      }
    });
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
              validator: (value) => value!.isEmpty ? 'Enter your email' : null,
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
              child: CustomOutlinedButton(
                text: 'Send Message',
                onPressed: _submitForm,
                isLoading: _isSending,
              ),
            ),
            if (_statusMessage != null) ...[
              const SizedBox(height: 20),
              Center(
                child: Text(
                  _statusMessage!,
                  style: TextStyle(
                    color: _statusMessage!.contains('success')
                        ? AppColors().secondaryColor
                        : Colors.red,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
