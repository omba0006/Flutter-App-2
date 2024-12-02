import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? name;
  String? email;
  String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Page')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Contact Us',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => name = value,
                  validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Enter your email',
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => email = value,
                  validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.message),
                    hintText: 'Enter your message',
                    labelText: 'Message',
                  ),
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: null,
                  onSaved: (value) => message = value,
                  validator: (value) => value!.isEmpty ? 'Please enter a message' : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _formKey.currentState!.reset();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Form submitted successfully!')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}