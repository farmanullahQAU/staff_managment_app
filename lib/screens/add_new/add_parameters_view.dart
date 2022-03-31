// import 'dart:io';

// import 'package:flutter/material.dart';


// import 'package:bot_toast/bot_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../components/dropdown_form_field.dart';
// import '../../components/mybutton.dart';
// import '../../components/text_field.dart';

// class AddParametersView extends StatelessWidget {
//   final _controller = Get.find<AddParametersController>();

//   AddParametersView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
     
//           body: SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.only(top: 30, left: 10, right: 10),
//               child: Form(
//                 // key: _entryFormController.formKey,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [


//                   GetBuilder<AddParametersController>(
//                     builder:(controller)=> _controller.imageFile==null?Text("NO IMAGE SELECTED"):Image.file(File(_controller.imageFile!.path),width: Get.width,
                    
//                     height: 120,
                    
//                     fit: BoxFit.cover,),
//                   ),

//                   columSizedBox
// ,                    Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
                     
//                         Expanded(
//                             child: TxtField(
//                           isReadOnly: true,
//                           validator: (String? val) => val == null || val.isEmpty
//                               ? priceEmptyErrorMessage
//                               : null,
//                           // controller: _entryFormController.tieController,
//                           hintText: pricerHintText,
//                         ))
//                       ,
//                       SizedBox(
//                           width: 10,
//                         ),
//                           Expanded(
//                             child: DropDownField(
//                                 // value: _entryFormController.partSize,
//                                 validator: (int? val) =>
//                                     val == null
//                                         ?dimeterEmptyErrorMessage
//                                         : null,
//                                 onChanged: (partSize) {
//                                   // _entryFormController.partSize = partSize;
//                                 },
//                                 items: _controller.rimDimetersValues,
//                                 hintText: dimeterHintText)
                                
                                
//                                 ),
                     
//                       ],
//                     ),
//                    columSizedBox,
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                             child: TxtField(
//                           validator: (String? val) => val == null || val.isEmpty
//                               ? rimDescriptionEmptyErrorMessage
//                               : null,
//                           // controller: _controller.weightController,
//                           hintText: descriptionHintText,
//                         )),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                             child: DropDownField(
//                                 // value: _controller.status,
//                                 validator: (double? val) =>
//                                     val == null
//                                         ? rimWidthEmptyErrorMessage
//                                         : null,
//                                 onChanged: (status) {
//                                   // _controller.status = status;
//                                 },
//                                 items: _controller.rimWidth,
//                                 hintText: rimWidthHintText))
//                       ],
//                     ),
//                                      columSizedBox,

              
//                          Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                             child: TxtField(
//                           validator: (String? val) => val == null || val.isEmpty
//                               ? rimBrandEmptyErrorMessage
//                               : null,
//                           // controller: _controller.weightController,
//                           hintText: brandHintText,
//                         )),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                             child: DropDownField(
//                                 // value: _controller.status,
//                                 validator: (int? val) =>
//                                     val == null
//                                         ? rimOffsetEmptyErrorMessage
//                                         : null,
//                                 onChanged: (status) {
//                                   // _controller.status = status;
//                                 },
//                                 items: _controller.rimDimetersValues,
//                                 hintText: offsetHintText))
//                       ],

//                     ),

//                     columSizedBox,
//                       Container(
//                         width:Get.width*0.5,
                        
//                         child: MyButton(buttonText: 'Add Photo',onTap: (){


//                           _controller.pickProfileImage();
//                         },icon: Icon(Icons.add_a_photo),)),
//                     columSizedBox,

//         Container(
//           height: 50,
//                         width:Get.width,
                        
//                         child: MyButton(buttonText:continueText,onTap: (){


//                          Get.snackbar("Added", "parameters added successfully",snackPosition: SnackPosition.BOTTOM);
//                         })),
//                   ],
//                 ),
//               ),
//             ),
//           )),
//     );
//   }
// }
