import 'package:flutter/material.dart';
import '../../model/input/input_form_model.dart';
import 'package:email_validator/email_validator.dart';

class InputCustomText extends StatefulWidget {
  TextEditingController? ctrl = TextEditingController();
  FormInputType? type = FormInputType.text;
  String? text = "";
  InputCustomText({Key? key, this.ctrl, this.type, this.text})
      : super(key: key);

  @override
  State<InputCustomText> createState() => _InputCustomTextState();
}

class _InputCustomTextState extends State<InputCustomText> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.ctrl,
      obscureText: widget.type == FormInputType.password,
      validator: (value) {
        if (widget.type == FormInputType.text) {
          return (value == null || value.isEmpty)
              ? 'Por favor llenar el campo ${widget.text}'
              : null;
        }

        if (widget.key == FormInputType.email) {
          return (EmailValidator.validate(value as String))
              ? '${widget.text} contiene valores invalidos.'
              : null;
        }

        if (widget.type == FormInputType.phone) {
          return (_isNumeric(value as String))
              ? null
              : 'El campo ${widget.text} no contiene un numero valido.';
        }

        return (value == null || value.isEmpty)
            ? 'Por favor llenar el campo ${widget.text}'
            : null;
      },
      decoration: inputDecoration(widget.text, Icons.person),
    );
  }
}

InputDecoration inputDecoration(String? labelText, IconData iconData,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.grey),
    fillColor: Colors.grey.shade200,
    filled: true,
    prefixText: prefix,
    prefixIconConstraints: const BoxConstraints(minWidth: 60),
    focusedBorder:
        const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
    errorBorder:
        const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  );
}

bool _isNumeric(String result) {
  if (result == null) {
    return false;
  }
  return double.tryParse(result) != null;
}
