enum FormInputType { text, email, phone, date, password }

class InputFormModel {
  String? inputText;
  FormInputType? type;
  InputFormModel({this.inputText, this.type});
}
