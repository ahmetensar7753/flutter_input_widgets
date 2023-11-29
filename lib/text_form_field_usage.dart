import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldUsage extends StatefulWidget {
  const TextFormFieldUsage({Key? key}) : super(key: key);

  @override
  State<TextFormFieldUsage> createState() => _TextFormFieldUsageState();
}

class _TextFormFieldUsageState extends State<TextFormFieldUsage> {
  String _email = "";
  String _password = "";
  String _username = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Form Field Usage"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //initialValue: "ensarbesir", ilk değer ataması
                  decoration: const InputDecoration(
                    //errorStyle: TextStyle(color: Colors.orange), error style değişimi olabiliyor.
                    labelText: "Username",
                    hintText: "Username",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.length < 4) {
                      return "Enter at least 4 char";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _username = value!;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //initialValue: "ensarbesir7753@gmail.com", ilk değer ataması
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "E-mail",
                    hintText: "E-mail",
                    border: OutlineInputBorder(),
                  ),
                  validator: (deger) {
                    if (!EmailValidator.validate(deger!)) {
                      // email form kontrolü yapılıyor. Emailvalidator bağımlılığı sayesinde
                      return "Enter a valid e-mail address";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //initialValue: "ensarbesir7753@gmail.com", ilk değer ataması
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Enter at least 6 char";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    bool validate = _formKey.currentState!.validate();
                    if (validate) {
                      _formKey.currentState!.save();
                      String result =
                          "username :$_username\nemail :$_email\npassword :$_password";

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.orangeAccent,
                          content: Text(
                            result,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      );
                      _formKey.currentState!.reset();
                    }
                  },
                  child: const Text("Approve"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
