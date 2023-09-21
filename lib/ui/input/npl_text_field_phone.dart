


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:noppal_util/ui/inputs/npl_input_formatters/npl_phone_text_input_formatter.dart';

class NplTextFieldPhone extends StatefulWidget {
  List<String> ? countries;
  TextEditingController ? controller;
  void Function(String)? onChanged;
  bool ? disableValidate;
  String ? attributName;
  TextStyle ?  style;
  int  minLength;
  int  maxLength;

  NplTextFieldPhone({
    Key? key,
    this.onChanged,
    this.controller,
    this.style,
    required this.minLength,
    required this.maxLength,
    this.disableValidate=false,
    this.attributName='N° téléphone',
  }) : super(key: key);

  @override
  State<NplTextFieldPhone> createState() => _TextFieldPhoneState();
}

class _TextFieldPhoneState extends State<NplTextFieldPhone> {
  late FocusNode myFocusNodeNumber= FocusNode();
  bool isFocus=false;
  double left=85;
  double top=15;
  String  text='';
   Color ? _colorTextLabel;
  late double _fontSizeLabel;
  String ? errorMsg;

  @override
  void initState() {
    // TODO: implement initState
    _fontSizeLabel = 16;
    myFocusNodeNumber.addListener(() {
      if(myFocusNodeNumber.hasFocus){
        isFocus=true;
        deplacerEnHaut();
        applyColor();
      }
      else{
          isFocus=false;
          print("p${text}p");
          if(text.isEmpty){
            deplacerAuMilieu();
          }
          applyColor();
      }
    });
    super.initState();
    deplacerAuMilieu();
  }

 void applyColor(){
    if(isFocus){
      setState(() {
        _colorTextLabel=   Theme.of(context).colorScheme.primary;
      });
    }
    else{
      setState(() {
        _colorTextLabel= Theme.of(context).hintColor;
      });
    }
  }

  void deplacerEnHaut(){
    setState(() {
      left=0;
      top=0;
      if(widget.style!=null)
        _fontSizeLabel=14;
      else
        _fontSizeLabel= widget.style!.fontSize! - 6;
    });
  }

  void deplacerAuMilieu(){
    left=85;
    top=25;
    _fontSizeLabel=((widget.style!=null) ? widget.style!.fontSize: 16)!;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            top: top,
            left: left,
            child: Text(widget.attributName!,
              style: TextStyle(
                fontSize: _fontSizeLabel,
                color: (_colorTextLabel==null)?Theme.of(context).hintColor:_colorTextLabel,
              ),
            ),
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: IntlPhoneField(
              style:  widget.style,
              focusNode: myFocusNodeNumber,
              autovalidateMode: AutovalidateMode.disabled,
              invalidNumberMessage: "Numero téléphone invalide",
              showDropdownIcon: false,
              dropdownTextStyle: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide()
                  ),
                  contentPadding: EdgeInsets.only(top: 14),
              ),
              keyboardType: TextInputType.phone,

              inputFormatters: [
                // FilteringTextInputFormatter.allow(RegExp(r'[0-9]|[ ]')),
                // LengthLimitingTextInputFormatter(widget.maxLength),
                // NplPhoneTextInputFormatter(maxLength: widget.maxLength)
              ],
              disableLengthCheck: widget.disableValidate!,
              initialCountryCode: 'SN',
              countries: widget.countries ?? ['SN'],
              onChanged:(PhoneNumber phone){
                text = phone.number;
                if(widget.onChanged != null){
                  if(phone.number.isEmpty)
                    widget.onChanged!('');
                  else
                    widget.onChanged!('(${phone.countryCode}) ${phone.number}');
                }

              },
            ),
          ),
        ],
      ),
    );
  }

  // String ?  _validate(){
  //   if(text.isEmpty)
  //       return 'Le numero ne doit pas etre null';
  //   else if(text.length<widget.minLength || text.length>widget.maxLength)
  //       return 'numero telephone invalide';
  //   return null;
  // }
  //
  // bool validate(){
  //   String ? message= _validate();
  //   setState(() {
  //     errorMsg=message;
  //   });
  //   return message==null;
  // }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
   // _numberController.dispose();
    myFocusNodeNumber.dispose();

    super.dispose();
  }
}
