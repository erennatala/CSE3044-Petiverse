import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petiverse/screens/home/ForumPage.dart';
import 'package:petiverse/screens/home/main_page.dart';

import 'forum_quesion_comment.dart';

class ForumQuestionDetailPage extends StatefulWidget {
  final selectedQuestion;
  const ForumQuestionDetailPage({Key? key, required this.selectedQuestion})
      : super(key: key);

  @override
  _ForumQuestionDetailPageState createState() =>
      _ForumQuestionDetailPageState();
}

class _ForumQuestionDetailPageState extends State<ForumQuestionDetailPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: Color(0xFFEB5644),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://images.pexels.com/photos/1216491/pexels-photo-1216491.jpeg?cs=srgb&dl=pexels-samer-daboul-1216491.jpg&fm=jpg",
                            ),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      width: width * 1.1,
                      height: height * 0.3,
                    ),
                  ),
                  Container(
                    width: width * 0.95,
                    padding: EdgeInsets.only(
                      top: height * 0.02,
                      bottom: height * 0.01,
                      left: width * 0.03,
                      right: width * 0.2,
                    ),
                    child: Wrap(
                      children: [
                        Text(
                          widget.selectedQuestion.title,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.01,
                      bottom: height * 0.01,
                      left: width * 0.02,
                      right: width * 0.2,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.01),
                          child: Text(
                            'Pet\'s Type | ' + widget.selectedQuestion.petType,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: height * 0.01,
                      left: width * 0.02,
                      right: width * 0.2,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.01),
                          child: Text(
                            'Pet\'s Breed | ' +
                                widget.selectedQuestion.petBreed,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: height * 0.01,
                      left: width * 0.02,
                      right: width * 0.2,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.01),
                          child: Text(
                            'Pet\'s Age | ' + widget.selectedQuestion.petAge,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: height * 0.01,
                      left: width * 0.02,
                      right: width * 0.2,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.01),
                          child: Text(
                            'Disease Information | ' +
                                widget.selectedQuestion.disease,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.95,
                    padding: EdgeInsets.only(
                      top: height * 0.01,
                      bottom: height * 0.01,
                      left: width * 0.03,
                    ),
                    child: Wrap(
                      children: [
                        Text(
                          widget.selectedQuestion.detailedDescription,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: height * 0.01,
                      left: width * 0.02,
                      right: width * 0.2,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.01),
                          child: Text(
                            'Communication Information |\nName: ' +
                                widget.selectedQuestion.ownerName +
                                '\nCommunication Number: ' +
                                widget.selectedQuestion.communicationNumber,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Center(
                      child: ElevatedButton(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: "See the comments",
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      ForumQuestionCommentPage(
                                        name: 'temp',
                                        selectedQuestion:
                                            widget.selectedQuestion,
                                        Comments:
                                            widget.selectedQuestion.comments,
                                      )));
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
                    padding: EdgeInsets.only(top: height * 0.03),
                    child: Center(
                      child: ElevatedButton(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: "Return To Main Page",
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => MainPage()));
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
