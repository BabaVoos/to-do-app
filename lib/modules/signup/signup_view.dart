import 'package:flutter/material.dart';
import 'package:todo_application/core/helpers.dart';
import 'package:todo_application/modules/login/login_view.dart';
import 'package:todo_application/modules/login/widgets/text_form_field.dart';
import 'package:todo_application/modules/signup/widgets/signup_button.dart';
import 'package:todo_application/network_layer/firestore_utils.dart';

class SignupView extends StatelessWidget {
  static const String routeName = 'signupView';

  SignupView({Key? key}) : super(key: key);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/login_signup.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: buildAppBar(
          context,
        ),
        body: Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                height: context.screenHeight - context.screenHeight * .25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: context.screenHeight * .25,
                    ),
                    LoginTextFormField(
                      controller: firstNameController,
                      labelText: 'First name',
                      validator: (value) {
                        if (value!.isEmpty || value == "") {
                          return 'Please enter your first name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    LoginTextFormField(
                      controller: ageController,
                      labelText: 'Age',
                      validator: (value) {
                        if (value!.isEmpty || value == "") {
                          return 'Please enter your age';
                        } else {
                          return null;
                        }
                      },
                    ),
                    LoginTextFormField(
                      controller: emailController,
                      labelText: 'E-mail Address',
                      validator: (value) {
                        if (value == null || value == "") {
                          return 'Please enter email';
                        }
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                    ),
                    LoginTextFormField(
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (value == null) {
                          return 'Please enter password';
                        } else {
                          if (!regex.hasMatch(value)) {
                            return 'Please enter valid password';
                          } else {
                            return null;
                          }
                        }
                      },
                      controller: passwordController,
                      labelText: 'Password',
                    ),
                    const Spacer(),
                    SignupButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          FireStoreDatabase.signUp(
                            emailAddress: emailController.text,
                            password: passwordController.text,
                            age: ageController.text,
                            name: firstNameController.text,
                          ).then(
                            (value) {
                              emailController.clear();
                              passwordController.clear();
                              Navigator.pushNamedAndRemoveUntil(context,
                                  LoginView.routeName, (route) => false);
                            },
                          ).catchError(
                            (e) {
                              print(e);
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget? buildAppBar(
    BuildContext context,
  ) =>
      AppBar(
        toolbarHeight: context.screenHeight * 0.07,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(
            top: 30,
          ),
          child: Text(
            'Create Account',
            style: TextStyle(
              letterSpacing: 4,
              fontSize: 24,
            ),
          ),
        ),
      );
}
