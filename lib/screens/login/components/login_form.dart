import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/default_button.dart';
import 'package:store_app/components/form_error.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/providers/customer_provider.dart';
import 'package:store_app/screens/login_done/login_done_screen.dart';
import 'package:store_app/size_config.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errorsList = [];
  String? userEmail;
  String? userPass;
  String? userFname;
  String? userLname;
  bool? rememberMe = false;
  final Logger _logger = Logger();
  @override
  Widget build(BuildContext context) {
    final customerProvider = Provider.of<CustomerProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFisrtNameFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildEmailFormField(),

          Row(
            children: [
              Checkbox(
                value: rememberMe,
                activeColor: purpleText,
                onChanged: (value) {
                  setState(() {
                    rememberMe = value;
                  });
                },
              ),
              Text("Remember Me!"),
              Spacer(),
              /* Text(
                "Forgot Password!",
                style: TextStyle(decoration: TextDecoration.underline),
              ),*/
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
          FormError(errorsList: errorsList),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            buttonText: "Login",
            onButtonPress: () async {
              // Loading State

              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder:
                      (context) =>
                          const Center(child: CircularProgressIndicator()),
                );
                await Future.delayed(const Duration(seconds: 3));
                _logger.i('Login form validated, attempting login...');
                try {
                  await customerProvider.login(userEmail!);
                  if (customerProvider.isLoggedIn) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: background.withOpacity(0.3),
                          content: Row(
                            children: [
                              Icon(Icons.check, color: Colors.teal),
                              SizedBox(width: 10),
                              Expanded(child: Text("Logged Succsessfully")),
                            ],
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                    await Future.delayed(Duration(milliseconds: 2200));

                    _logger.i(
                      'Login successful, navigating to LoginDoneScreen',
                    );
                    if (context.mounted) {
                      Navigator.pushNamed(context, LoginDoneScreen.routeName);
                    }
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.white.withOpacity(0.3),
                        content: Row(
                          children: [
                            Icon(Icons.error, color: Colors.red),
                            SizedBox(width: 10),
                            Expanded(child: Text("Your Email Doesnt exists")),
                          ],
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {
        userEmail = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errorsList.contains(emptyEmailField)) {
          setState(() {
            errorsList.remove(emptyEmailField);
          });
        } else if (emailRegex.hasMatch(value) &&
            errorsList.contains(emailPatternError)) {
          setState(() {
            errorsList.remove(emailPatternError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errorsList.contains(emptyEmailField)) {
          setState(() {
            errorsList.add(emptyEmailField);
          });
          return "";
        } else if (!emailRegex.hasMatch(value) &&
            !errorsList.contains(emailPatternError)) {
          setState(() {
            errorsList.add(emailPatternError);
          });
          return "";
        }
        return null;
      },

      decoration: InputDecoration(
        //The whole textFormField Theme is defined in Screen theme.dart
        labelText: "Email",
        hintText: "Please enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.email, color: Colors.grey),
      ),
    );
  }

  TextFormField buildFisrtNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) {
        userFname = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errorsList.contains(emptyFirstNameField)) {
          setState(() {
            errorsList.remove(emptyFirstNameField);
          });
        } else if (nameRegex.hasMatch(value) &&
            errorsList.contains(nameFPatternError)) {
          setState(() {
            errorsList.remove(nameFPatternError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errorsList.contains(emptyFirstNameField)) {
          setState(() {
            errorsList.add(emptyFirstNameField);
          });
          return "";
        } else if (!nameRegex.hasMatch(value) &&
            !errorsList.contains(nameFPatternError)) {
          setState(() {
            errorsList.add(nameFPatternError);
          });
          return "";
        }
        return null;
      },

      decoration: InputDecoration(
        //The whole textFormField Theme is defined in Screen theme.dart
        labelText: "First Name",
        hintText: "Please enter your First Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person_2, color: Colors.grey),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) {
        userLname = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errorsList.contains(emptyLastNameField)) {
          setState(() {
            errorsList.remove(emptyLastNameField);
          });
        } else if (nameRegex.hasMatch(value) &&
            errorsList.contains(nameLPatternError)) {
          setState(() {
            errorsList.remove(nameLPatternError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errorsList.contains(emptyLastNameField)) {
          setState(() {
            errorsList.add(emptyLastNameField);
          });
          return "";
        } else if (!nameRegex.hasMatch(value) &&
            !errorsList.contains(nameLPatternError)) {
          setState(() {
            errorsList.add(nameLPatternError);
          });
          return "";
        }
        return null;
      },

      decoration: InputDecoration(
        //The whole textFormField Theme is defined in Screen theme.dart
        labelText: "Last Name",
        hintText: "Please enter your Last Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person_4, color: Colors.grey),
      ),
    );
  }
}

/*
  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) {
        userPass = newValue;
      },
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty && errorsList.contains(emptyPassField)) {
          setState(() {
            errorsList.remove(emptyPassField);
          });
        } else if (value.length >= 10 && errorsList.contains(shortPassError)) {
          setState(() {
            errorsList.remove(shortPassError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errorsList.contains(emptyPassField)) {
          setState(() {
            errorsList.add(emptyPassField);
          });
          return "";
        } else if (value.isNotEmpty &&
            value.length < 10 &&
            !errorsList.contains(shortPassError)) {
          setState(() {
            errorsList.add(shortPassError);
          });
          return "";
        }
        return null;
      },

      decoration: InputDecoration(
        //The whole textFormField Theme is defined in Screen theme.dart
        labelText: "Password",
        hintText: "Please enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.password, color: iconColor),
      ),
    );
  }
  */
