import 'package:flutter/material.dart';

import '../constants/constants.dart';

class TxtField extends StatelessWidget {

  Function onChanged;
  Icon? suffixIcon;
  bool obsecure;
  Icon? prefixIcon;
  String? hintText;
  String? labelText;
  Function? validator;
  Function? onSaved;
  bool? isOutlined;
  bool? isReadOnly;
  // int? maxLength;
  int? maxLines;
  bool? isLimit;

  TextEditingController? controller;

  TxtField(
    
      {Key? key,
      required this.onChanged,
      this.isReadOnly=false,
      this.obsecure=false,
      this.suffixIcon,
      this.prefixIcon,
      this.labelText,
      this.controller,
      this.hintText,
      this.validator,
      this.onSaved,
      this.isOutlined = false,
    
      // this.maxLength = 500,
      this.maxLines = 1,
      this.isLimit = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value)=>onChanged(value),
      obscureText: obsecure,
      readOnly: isReadOnly!,
      keyboardType: TextInputType.multiline,

      toolbarOptions: ToolbarOptions(
        copy: true,
        paste: true,
        cut: true,
        selectAll: true,
      ),
      enableInteractiveSelection: true,
      

      validator: (val) => this.validator != null ? this.validator!(val) : null,
      //    onSaved:(val)=>this.onSaved!=null?this.onSaved!(val):null,

      controller: this.controller,
      //  cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
      //  initialValue: 'Input text',
      // maxLength: this.isLimit == true ? maxLength : null,
      maxLines: this.maxLines,
      decoration: InputDecoration(
        
        prefixIcon: prefixIcon,
        
          filled: true,
          // fillColor: bgColor,
          // hoverColor: bgColor,
          border: this.isOutlined == true ? OutlineInputBorder(
          borderSide: BorderSide.none,

borderRadius: BorderRadius.circular(10)

          ) : null,
          //   icon: Icon(Icons.favorite),
          labelText: this.labelText,
          hintText: this.hintText,
          //  helperText: 'Helper text',
          suffixIcon: this.suffixIcon),
    );
  }
}