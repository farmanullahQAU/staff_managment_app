// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../components/mybutton.dart';
import '../../components/text_field.dart';
import '../../constants/constants.dart';
import '../../constants/text_styles.dart';
import '../../constants/theme.dart';
import '../group/groups_view_controller.dart';
import 'login_controller.dart';

class Loginview extends StatelessWidget {
  Loginview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  ClipPath(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    clipper: CustomClipPath(),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Theme.of(context).primaryColor.withOpacity(0.9),
                          Theme.of(context).primaryColor.withOpacity(0.3),
                        ],
                      )),
                      width: Get.width,
                      height: Get.height * 0.3,
                      child: Center(child: _addLoginText()),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  //   decoration: BoxDecoration(

                  //   color: Colors.blueGrey,

                  // borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  //     shape: BoxShape.rectangle),

                  margin: EdgeInsets.symmetric(horizontal: 15),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TxtField(
                        prefixIcon: Icon(Icons.email),
                        isOutlined: true,
                        labelText: "Username", onChanged: (){},
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      TxtField(
                        obsecure: true,
                        prefixIcon: Icon(Icons.lock),
                        isOutlined: true,
                        labelText: "Passsword", onChanged: (){},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: Get.width,
                        child: MyButton(buttonText: login, onTap: () {


                          
                          
                          binding: BindingsBuilder.put(
                            
                            ()=>
                            NavigationRailController()
                            
                            
                            );
                        }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _addLines(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: Get.width * 0.4,
                        child: MyButton(
                            primary: Colors.blue,
                            onTap: () {},
                            buttonText: 'GOOGLE',
                            icon: FaIcon(FontAwesomeIcons.google))),
                    Container(
                        width: Get.width * 0.4,
                        child: MyButton(
                            primary: Colors.indigo.shade900,
                            onTap: () {},
                            buttonText: 'FACEBOOK',
                            icon: FaIcon(FontAwesomeIcons.facebook))),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      text: TextSpan(
                          text: accounDoesnotExistText,
                          style: Theme.of(context).textTheme.subtitle1,
                          children: [
                            TextSpan(
                              // recognizer: new TapGestureRecognizer()..onTap = () => Get.to(SignupView()),
                                text: signup,
                                style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.blue)
                                   )
                          ]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }

  Widget _addLoginText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          loginHeading.toUpperCase(),
          style: StyledText.actorFontStyle.copyWith(fontSize: 30),
        ),
        Text(login),
      ],
    );
  }

  _addLines() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: Get.width * 0.2,
          height: 3,
          color: Theme.of(Get.context!).primaryColor,
        ),
        Text("OR LOGIN WITH"),
        Container(
          width: Get.width * 0.2,
          height: 3,
          color: Theme.of(Get.context!).primaryColor,
        )
      ],
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width * 0.2, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
