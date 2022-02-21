import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:link_text/link_text.dart';
import '../../../core/constans/strings/AppString.dart';
import '../../../products/widgets/custom_text.dart';
import '../../Sign_up.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isCheckBox = false;
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool isValidate = false;
  double _borderRadius = 6;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: _emailNode.hasFocus || _passwordNode.hasFocus
            ? const ScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: context.dynamicHeight(1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppString().Welcome,
                      style: context.textTheme.headlineSmall,
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                       AppString().signInText,
                      style: context.textTheme.headlineLarge,
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    color: Color.fromARGB(255, 228, 203, 203),
                  ),
                  child: _textFields(),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form _textFields() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
          left: 10,
          right: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              focusNode: _emailNode,
              codeController: _mailController,
              labelText: AppString().emailText,
              textInputType: TextInputType.emailAddress,
              prefixIcon: Icons.email,
              suffixIcon: null,
            ),
            CustomTextFormField(
              focusNode: _passwordNode,
              codeController: _passwordController,
              labelText: AppString().passwordText,
              isPassword: true,
              textInputType: TextInputType.visiblePassword,
              prefixIcon: Icons.password,
              suffixIcon: Icons.visibility,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      activeColor: Color(0xff00C8E8),
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                      value: _isChecked,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.height * 0.01),
                    Text(AppString().RememberMeText,
                        style: const TextStyle(
                            color: Color(0xff646464),
                            fontSize: 15,
                            fontFamily: 'Rubic'))
                  ],
                ),
                Text(AppString().forgotPasswordText,
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontSize: 15,
                        fontFamily: 'Rubic'))
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.85, 50),
                maximumSize: Size(MediaQuery.of(context).size.width * 0.85, 50),
              ),
              onPressed: () {},
              child: Text(
                AppString().signInText,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppString().DontHaveAccount,
                    style: TextStyle(
                        color: Color(0xff646464),
                        fontSize: 18,
                        fontFamily: 'Rubic')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SignUpPage()));
                    },
                    child: Text(
                      AppString().signUp,
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ],
        ),
      ),
    );
  }
}
