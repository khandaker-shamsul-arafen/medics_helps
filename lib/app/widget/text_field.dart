import 'package:flutter/material.dart';

class TextFormFieldData {
  static InputDecoration getInputDecoration(BuildContext context) {
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      counterText: "",
      counterStyle: const TextStyle(
        height: double.minPositive,
      ),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(30)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueGrey, width: 2),
          borderRadius: BorderRadius.circular(30)),
    );
  }

  static TextFormField getTextFormField(
      BuildContext context, TextEditingController editingController) {
    return TextFormField(
      autocorrect: false,
      maxLength: 1,
      textAlign: TextAlign.center,
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
      textInputAction: TextInputAction.next,
      decoration: getInputDecoration(context),
      validator: (value) {
        if (value!.trim().isEmpty || value == 'null') {
          return '* Required';
        }
        return null;
      },
      autofocus: false,
      keyboardType: TextInputType.number,
      controller: editingController,
    );
  }
}
