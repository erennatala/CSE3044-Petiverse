import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  String _submitText = '';
  List<String> items = [
    'Submit a Course',
    'Submit a Gig Platform',
    'Other',
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                  'Contact us',
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
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04),
              child: Text(
                'Subject',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff28346c),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: CupertinoPicker(
                useMagnifier: true,
                itemExtent: 50,
                onSelectedItemChanged: (index) {
                  setState(() {
                    this.index = index;
                  });
                },
                children: items.map((item) {
                  return Center(child: Text(item));
                }).toList(),
                backgroundColor: Colors.transparent,
                looping: true,
              ),
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                    top: height * 0.02,
                    bottom: height * 0.01,
                    left: width * 0.03,
                    right: width * 0.03,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: 'Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff28346c),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  height: 200,
                  child: Expanded(
                    flex: 5,
                    child: TextFormField(
                      onSaved: (value) {
                        _submitText = value!;
                        print('name: ' + _submitText);
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.2,
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.2,
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Say something',
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                      maxLines: 200,
                      textAlignVertical: TextAlignVertical.top,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: height * 0.04,
                    left: width * 0.03,
                    right: width * 0.03,
                  ),
                  width: double.infinity,
                  height: height * 0.12,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: RichText(
                      text: TextSpan(
                        text: 'Send Message',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffff203468),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
