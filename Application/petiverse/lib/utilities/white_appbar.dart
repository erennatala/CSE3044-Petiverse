import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class WhiteAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color secondaryColor;
  final AppBar appbar;

  const WhiteAppbar({
    Key? key,
    this.secondaryColor = const Color(0xFFec5444),
    required this.appbar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        splashRadius: 1,
        onPressed: () async {
          await closeKeyboard(context);
          await Future.delayed(Duration(milliseconds: 200));
          Navigator.pop(context);
        },
        icon: Icon(
          FontAwesome.angle_left,
          size: 50,
        ),
        color: secondaryColor,
      ),
      titleSpacing: 0,
      elevation: 0,
      leadingWidth: 30,
      title: Container(
        padding: EdgeInsets.only(top: 12),
        child: RichText(
          text: TextSpan(
            text: 'Back',
            style: GoogleFonts.roboto(
              fontSize: 20,
              color: secondaryColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Future closeKeyboard(BuildContext context) async {
    FocusScope.of(context).unfocus();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appbar.preferredSize.height);
}
