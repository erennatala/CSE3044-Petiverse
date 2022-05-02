import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:petiverse/screens/other/contact_us.dart';
import 'package:petiverse/screens/other/legal.dart';
import 'package:petiverse/screens/other/profile/profile.dart';
import 'package:petiverse/services/back_end.dart';

String _name = "";

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Container(
                          padding: EdgeInsets.only(left: 8),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xff28346c),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade300,
                endIndent: 5,
                indent: 5,
              ),
              listItem(
                text: 'My Profile',
                onClicked: () => selectedItem(context, 0, _name),
              ),
              listItem(
                text: 'FAQ',
                onClicked: () => selectedItem(context, 1, _name),
              ),
              listItem(
                text: 'Invite a Friend',
                onClicked: () => selectedItem(context, 2, _name),
              ),
              listItem(
                text: 'Contact Us',
                onClicked: () => selectedItem(context, 3, _name),
              ),
              listItem(
                text: 'Legal',
                onClicked: () => selectedItem(context, 4, _name),
              ),
              listItem(
                text: 'About',
                onClicked: () => selectedItem(context, 5, _name),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  //Sign out the user.
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem({
    required String text,
    VoidCallback? onClicked,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              elevation: 0,
              primary: Colors.white,
              side: BorderSide(
                color: Colors.transparent,
              ),
            ),
            onPressed: onClicked,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff28346c),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Color(0xff28346c),
                )
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.shade300,
          endIndent: 5,
          indent: 5,
        ),
      ],
    );
  }

  void selectedItem(BuildContext context, int index, String _name) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => Profile(
              name: _name,
            ),
          ),
        );
        break;
      case 1:
        //Navigate faq
        break;
      case 2:
        //Navigate invite a friend
        break;
      case 3:
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ContactUs(),
          ),
        );
        break;
      case 4:
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => Legal(),
          ),
        );
        break;
      case 5:
        //Navigate about
        break;
    }
  }
}
