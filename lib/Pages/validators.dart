import 'package:flutter/material.dart';

class PhoneFieldValidation extends StatefulWidget {
  @override
  _PhoneFieldValidationState createState() => _PhoneFieldValidationState();
}

class NameFieldValidation extends StatefulWidget {
  @override
  _NameFieldValidationState createState() => _NameFieldValidationState();
}


class EmailFieldValidation extends StatefulWidget {
  @override
  _EmailFieldValidationState createState() => _EmailFieldValidationState();
}



class _PhoneFieldValidationState extends State<PhoneFieldValidation> {
  final TextEditingController _controller = TextEditingController();
  String? _errorMessage;

  void _validatePhoneNumber(String value) {
    // Allowed maximum lengths and prefixes
    final maxLengths = [9, 10];
    final validPrefixes = ['09', '07', '9', '7', '2519', '2517'];

    // Check if the input starts with valid prefixes and adheres to the max lengths
    if ((value.length == 10 && (value.startsWith('09') || value.startsWith('07'))) ||
        (value.length == 9 && (value.startsWith('9') || value.startsWith('7'))) ||
        (value.length == 12 && (value.startsWith('2519') || value.startsWith('2517')))) {
      setState(() {
        _errorMessage = null; // Valid phone number
      });
    } else if (value.length > maxLengths.last) {
      // Enforce max length by truncating
      _controller.text = value.substring(0, maxLengths.last);
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length)); // Maintain cursor position
    } else {
      // Invalid phone number
      setState(() {
        _errorMessage = 'Invalid phone number (start with 09,07,7 or 9 and not exceed 10 digit)'; // Display error message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 330,
            height: 50,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number, // Ensures only numbers are allowed
              onChanged: _validatePhoneNumber, // Validate input dynamically and enforce constraints
              decoration: InputDecoration(
                labelText: 'Phone',
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 3,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 15,
                ),
                hintText: 'Enter your phone number...',
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontStyle: FontStyle.italic,
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              maxLines: 1,
            ),
          ),
          if (_errorMessage != null) // Show error message if invalid
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                _errorMessage!,
                style: TextStyle(
                  color: Colors.red, // Red color for the error message
                  fontSize: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _NameFieldValidationState extends State<NameFieldValidation> {
  final TextEditingController _controller1 = TextEditingController();
  String? _errorMessage;
  final RegExp nameRegex = RegExp(r'^[a-zA-Z]+$');

  void _validateName(String value) {
    // Check if the name only contains letters and adheres to length constraints


    if (value.isEmpty) {
      setState(() {
        _errorMessage = 'Name cannot be empty';
      });
    }else if (!nameRegex.hasMatch(value)) {
      setState(() {
        _errorMessage = 'Name can only contain letters';
      });
    } else if (value.length < 3) {
      setState(() {
        _errorMessage = 'Name must be at least 3 characters long';
      });
    } else if (value.length > 20) {
      setState(() {
        _errorMessage = 'Name must be at most 20 characters long';
      });
    }  else {
      setState(() {
        _errorMessage = null; // Valid name
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller1,
            keyboardType: TextInputType.text, // Ensures only numbers are allowed
            onChanged: _validateName, // Validate input dynamically and enforce constraints
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),





            ),

          ),
          if (_errorMessage != null) // Show error message if invalid
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                _errorMessage!,
                style: TextStyle(
                  color: Colors.red, // Red color for the error message
                  fontSize: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }
}


class _EmailFieldValidationState extends State<EmailFieldValidation> {
  final TextEditingController _controller = TextEditingController();
  String? _errorMessage;
  // Regular expression to validate email format
  final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$'); // Simple email validation

  void _validateEmail(String value) {
    // Check if the email is valid
    if (value.isEmpty) {
      setState(() {
        _errorMessage = 'Email cannot be empty';
      });
    } else if (!value.contains('@')) {
      setState(() {
        _errorMessage = 'Email must include "@"';
      });
    } else if (!value.contains('.')) {
      setState(() {
        _errorMessage = 'Email must include a domain like ".com" or ".org"';
      });
    } else if (!emailRegex.hasMatch(value)) {
      setState(() {
        _errorMessage = 'Please enter a valid email address (e.g., example@mail.com)';
      });
    } else {
      setState(() {
        _errorMessage = null; // Valid email
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 330,
            height: 50,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.text, // Ensures only numbers are allowed
              onChanged: _validateEmail, // Validate input dynamically and enforce constraints
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 3,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 15,
                ),
                hintText: 'Enter your Email...',
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontStyle: FontStyle.italic,
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              maxLines: 1,
            ),
          ),
          if (_errorMessage != null) // Show error message if invalid
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                _errorMessage!,
                style: TextStyle(
                  color: Colors.red, // Red color for the error message
                  fontSize: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }
}