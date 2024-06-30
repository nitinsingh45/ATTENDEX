import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController usnController = TextEditingController();

    bool isValidUSN(String usn) {
      RegExp usnRegex = RegExp(r'^1MV\d{2}(CS|EC|IS|EE|ME|CV)\d{3}$');
      return usnRegex.hasMatch(usn);
    }

    void login() {
      String usn = usnController.text.trim();
      if (isValidUSN(usn)) {
        Navigator.pushReplacementNamed(context, '/MainScreen');
      } else {
        // Handle invalid USN (Optional: Show error message)
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid USN'),
              content: Text('Please enter a valid USN.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('ATTENDEX'),
        backgroundColor: Color.fromARGB(255, 117, 188, 242),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.indigo],
            ),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                height: 100.0,
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: usnController,
                decoration: InputDecoration(
                  labelText: 'Enter USN',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
