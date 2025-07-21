import 'package:http/http.dart' as http;
import '../models/contact_form_data.dart';

class ContactController {
  Future<String> submitContactForm(
      String name, String email, String message) async {
    final uri = Uri.parse(
        'https://formspree.io/f/yourFormID');  
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: '''{
        "name": "$name",
        "email": "$email",
        "message": "$message"
      }''',
    );
    if (response.statusCode == 200) {
      return 'Message sent successfully!';
    } else {
      return 'Something went wrong. Please try again.';
    }
  }

  Future<String> submitContactFormData(ContactFormData data) async {
    return submitContactForm(data.name, data.email, data.message);
  }
}
