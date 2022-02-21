import 'package:covid_onboard/core/constans/strings/AppString.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController codeController;
  final TextInputType textInputType;
  final String labelText;
  bool isPassword;
  final FocusNode focusNode;
  var prefixIcon;
  var suffixIcon;
  CustomTextFormField(
      {Key? key,
      required this.codeController,
      required this.textInputType,
      required this.labelText,
      this.isPassword = false,
      required this.focusNode,
      required this.prefixIcon,
      required this.suffixIcon})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Bu alan boş kalmamalı";
            }
            if (value.length < 6) {
              return "6 dan küçük olamaz";
            }
            if (value.length > 20) {
              return "20 den büyük olamaz";
            }
          },
          focusNode: widget.focusNode,
          controller: widget.codeController,
          keyboardType: widget.textInputType,
          obscureText: widget.isPassword,
          decoration: widget.labelText == AppString().passwordText
              ? InputDecoration(
                  labelText: widget.labelText,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Icon(
                      widget.prefixIcon,
                      color: Colors.grey,
                    ),
                  ),
                  suffix: InkWell(
                      onTap: () {
                        setState(() {
                          widget.isPassword = !widget.isPassword;
                        });
                      },
                      child: Icon(
                        widget.isPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      )),
                  labelStyle: context.textTheme.headline5,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: context.appTheme.primaryColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: context.appTheme.primaryColor)),
                )
              : InputDecoration(
                  labelText: widget.labelText,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Icon(
                      widget.prefixIcon,
                      color: Colors.grey,
                    ),
                  ),
                  labelStyle: context.textTheme.headline5,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: context.appTheme.primaryColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: context.appTheme.primaryColor)),
                )),
    );
  }
}
