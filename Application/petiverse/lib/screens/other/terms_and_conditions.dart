import 'package:flutter/material.dart';
import 'package:petiverse/utilities/white_appbar.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WhiteAppbar(appbar: AppBar()),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
