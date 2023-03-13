import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruralclap_app/constant/theme_color.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:get/get.dart';

class ContactDetails extends StatelessWidget {
  final UserController _userController = Get.find<UserController>();
  ContactDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      const IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: null,
                          icon: FaIcon(
                            FontAwesomeIcons.locationDot,
                            color: ColorConstant.textPrimaryBlack,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        _userController.user.location!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: null,
                      icon: FaIcon(
                        FontAwesomeIcons.speakap,
                        color: ColorConstant.textPrimaryBlack,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    _userController.user.language!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: null,
                      icon: FaIcon(
                        FontAwesomeIcons.calendar,
                        color: ColorConstant.textPrimaryBlack,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Can Work Immediately',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: null,
                      icon: FaIcon(
                        FontAwesomeIcons.envelope,
                        color: ColorConstant.textPrimaryBlack,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    _userController.user.email!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: null,
                      icon: FaIcon(
                        FontAwesomeIcons.phone,
                        color: ColorConstant.textPrimaryBlack,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    _userController.user.phone!.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
