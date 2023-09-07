import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_application/core/helpers.dart';
import 'package:todo_application/layout/home_layout.dart';
import 'package:todo_application/modules/login/widgets/login_button.dart';
import 'package:todo_application/modules/login/widgets/text_form_field.dart';
import 'package:todo_application/modules/signup/signup_view.dart';
import 'package:todo_application/network_layer/firestore_utils.dart';

class LoginView extends StatelessWidget {
  static const String routeName = 'loginView';

  LoginView({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(
    BuildContext context,
  ) {
    var theme = Theme.of(
      context,
    );
    var lang = AppLocalizations.of(context)!;
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: context.screenHeight * .25,
                  ),
                  const Text(
                    'Welcome back!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  LoginTextFormField(
                    controller: emailController,
                    labelText: 'Email',
                    validator: (value) {
                      if (value == null || value == "") {
                        return 'please enter username';
                      }
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return 'please enter valid email';
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
                  LoginButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        FireStoreDatabase.login(
                                emailController.text, passwordController.text)
                            .then((value) {
                          emailController.clear();
                          passwordController.clear();
                          Navigator.pushNamedAndRemoveUntil(
                              context, HomeLayout.routeName, (route) => false);
                        }).catchError(
                          (e) {
                            print(e);
                          },
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      context.pushNamed(
                        widget: SignupView.routeName,
                      );
                    },
                    child: const Text(
                      'Or Create My Account',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
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
            'Login',
            style: TextStyle(
              letterSpacing: 4,
              fontSize: 24,
            ),
          ),
        ),
      );
}
