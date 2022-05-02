import 'package:flutter/material.dart';

class Legal extends StatefulWidget {
  const Legal({Key? key}) : super(key: key);

  @override
  _LegalState createState() => _LegalState();
}

class _LegalState extends State<Legal> {
  @override
  Widget build(BuildContext context) {
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
                  'Legal',
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
              color: Colors.grey.shade300,
              endIndent: 5,
              indent: 5,
            ),
            listItem(text: 'Privacy Policy'),
            listItem(text: 'Terms and Conditions'),
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
}
