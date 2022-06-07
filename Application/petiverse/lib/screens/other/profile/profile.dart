import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petiverse/screens/account/change_password_page.dart';
import 'package:petiverse/screens/account/sign_in_page.dart';
import 'package:petiverse/services/back_end.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

String _name = "aa";

class _ProfileState extends State<Profile> {
  fetchFileData() async {
    // _name = await back_end().getName(widget.email);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    fetchFileData();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff28346c),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.15),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              thickness: 1,
              color: Colors.grey.shade400,
              endIndent: 5,
              indent: 5,
            ),
            SizedBox(height: 25),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/1.png'),
              radius: MediaQuery.of(context).size.width * 0.15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                _name,
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff28346c),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50),
            listItem(
              text: 'Edit Profile',
              onClicked: () => selectedItem(context, 0),
            ),
            listItem(
              text: 'Change Password',
              onClicked: () => selectedItem(context, 1),
            ),
            listItem(
              text: 'Notification Settings',
              onClicked: () => selectedItem(context, 2),
            ),
            listItem(
              text: 'Change Email Address',
              onClicked: () => selectedItem(context, 3),
            ),
            listItem(
              text: 'Change Profile Picture',
              onClicked: () => selectedItem(context, 4),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03),
              child: GestureDetector(
                onTap: () async {
                  //add sign out mech
                  // signout the active user
                  _signOut();
                  // notify the user that he/she has signed out
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Signed Out")));
                  // send the user to signin page
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => SignInPage()));
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
              ),
            )
          ],
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

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0: /*
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => EditProfile(),
          ),
        );*/
        break;
      case 1:
        /*Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ChangePassword(),
          ),
        );*/
        break;
      case 2:
        /* Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => NotificationSettings(),
          ),
        );*/
        break;
      case 3:
        /* Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ChangeEmail(),
          ),
        );*/
        break;
      case 4:
        //Navigate Change Profile Picture
        break;
    }
  }
}

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}
