import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruralclap_app/constant/theme_color.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({
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
                children: const [
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: null,
                      icon: FaIcon(
                        FontAwesomeIcons.suitcase,
                        color: ColorConstant.textPrimaryBlack,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Fresher',
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
                children: const [
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: null,
                      icon: FaIcon(
                        FontAwesomeIcons.locationDot,
                        color: ColorConstant.textPrimaryBlack,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Pune, India',
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
                    'Can Join Immediately',
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
                children: const [
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: null,
                      icon: FaIcon(
                        FontAwesomeIcons.envelope,
                        color: ColorConstant.textPrimaryBlack,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'utkarshsharma@gmail.com',
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
                children: const [
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: null,
                      icon: FaIcon(
                        FontAwesomeIcons.phone,
                        color: ColorConstant.textPrimaryBlack,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '7004114774',
                    style: TextStyle(
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
