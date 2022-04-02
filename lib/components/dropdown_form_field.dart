import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DropDownField extends StatelessWidget {
  final String hintText;
  final dynamic value;
  final Function? validator;

  final Function onChanged;
  final List<dynamic> items;
  const DropDownField(

    

    
      {Key? key,
      required this.items,
      required this.hintText,
      required this.onChanged,
      this.value,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      
        child: DropdownButtonFormField(

          
          isExpanded: true,

        isDense: true,
      value: 
      
      value==null||value==""?null:
      value,
      validator: (value) =>
          validator != null ? validator!(value) : null,
      items: items.map((dynamic category) {

       
        return  DropdownMenuItem(

          
          
            value: category,
            child: FittedBox(child:
            
            category is bool?Text(category==false?"Status-0":"Status-1"):
            
             Text(category.toString())));
      }).toList(),
      onChanged: (value) => onChanged(value),
      decoration: InputDecoration(
         contentPadding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 8),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)


        ),
        
        hintText: hintText,
        // fillColor: bgColor,
        // hoverColor: bgColor,

        //  helperText: 'Helper text',
      ),
    ));
  }
}
