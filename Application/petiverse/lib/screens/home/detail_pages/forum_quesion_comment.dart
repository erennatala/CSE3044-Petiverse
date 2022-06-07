import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petiverse/model/forum_model.dart';
import 'package:petiverse/screens/home/detail_pages/forum_question_detail.dart';
import 'package:petiverse/screens/home/main_page.dart';
import 'package:petiverse/services/back_end.dart';

class ForumQuestionCommentPage extends StatefulWidget {
  String name;
  final selectedQuestion;
  List Comments;
  ForumQuestionCommentPage(
      {Key? key,
      required this.selectedQuestion,
      required this.Comments,
      required this.name})
      : super(key: key);

  @override
  ForumQuestionCommentPageState createState() =>
      ForumQuestionCommentPageState();
}

Map _comment = {'comment': '', 'name': ''};

class ForumQuestionCommentPageState extends State<ForumQuestionCommentPage> {
  bool _displayNewTextField = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List comments = widget.Comments;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(children: [
        SafeArea(
          child: Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.02,
              right: MediaQuery.of(context).size.width * 0.02,
              top: MediaQuery.of(context).size.height * 0.01,
              bottom: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey.shade200,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 4, 3, 1),
                      child: GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Icon(
                          Icons.list,
                          size: 40,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Image.asset(
                    'assets/images/petiverse-logo.png',
                    height: 100,
                    width: 200,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey.shade200,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.search,
                      size: 40,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: comments
                .map((e) => ListTile(
                      title: Text(e["comment"]),
                      subtitle: Text(e["name"]),
                    ))
                .toList(),
          ),
        ),
        Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(children: [
            Visibility(
              visible: _displayNewTextField,
              child: TextFormField(
                onSaved: (value) {
                  _comment['name'] = value!;
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(fontSize: 16 * height * 0.0013)),
              ),
            ),
            Visibility(
              visible: _displayNewTextField,
              child: TextFormField(
                onSaved: (value) {
                  _comment['comment'] = value!;
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter your comment',
                    hintStyle: TextStyle(fontSize: 16 * height * 0.0013)),
              ),
            ),
          ]),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.grey.shade200,
          ),
          child: Padding(
            padding: EdgeInsets.all(6),
          ),
        ),
        Visibility(
          visible: _displayNewTextField,
          child: ElevatedButton(
            child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "Share Comment",
                )),
            onPressed: () async {
              _formKey.currentState!.save();

              comments.add(_comment);
              await BackEndServices().addForumTopicToFireStore(
                  widget.selectedQuestion.title,
                  widget.selectedQuestion.petType,
                  widget.selectedQuestion.petAge,
                  widget.selectedQuestion.disease,
                  widget.selectedQuestion.ownerName,
                  widget.selectedQuestion.detailedDescription,
                  widget.selectedQuestion.petBreed,
                  widget.selectedQuestion.communicationNumber,
                  widget.selectedQuestion.petGender,
                  widget.selectedQuestion.date,
                  comments);
              setState(() {
                widget.Comments = comments;
                _displayNewTextField = false;
              });
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 118, 5, 101),
              minimumSize: Size(width * 0.9, 58 * height * 0.0013),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.grey.shade200,
          ),
          child: Padding(
            padding: EdgeInsets.all(6),
          ),
        ),
        Container(
          child: Center(
            child: ElevatedButton(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "Add Comment",
                  )),
              onPressed: () {
                setState(() {
                  _displayNewTextField = true;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 118, 5, 101),
                minimumSize: Size(width * 0.9, 58 * height * 0.0013),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.grey.shade200,
          ),
          child: Padding(
            padding: EdgeInsets.all(6),
          ),
        ),
        Container(
          child: Center(
            child: ElevatedButton(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "Return To Main Page",
                  )),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => MainPage()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 118, 5, 101),
                minimumSize: Size(width * 0.9, 58 * height * 0.0013),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
