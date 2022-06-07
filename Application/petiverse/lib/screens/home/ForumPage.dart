import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petiverse/model/forum_model.dart';
import 'package:petiverse/screens/home/detail_pages/forum_question_detail.dart';

class ForumPage extends StatefulWidget {
  final List forumQuestions;

  const ForumPage({Key? key, required this.forumQuestions}) : super(key: key);

  @override
  ForumPageState createState() => ForumPageState();
}

class ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    List<ForumModel> allForumQuestions = List.generate(
        widget.forumQuestions.length,
        (index) => ForumModel(
            widget.forumQuestions[index]['Title'],
            widget.forumQuestions[index]['Pet\'s Type'],
            widget.forumQuestions[index]['Pet\'s Age'],
            widget.forumQuestions[index]['Disease'],
            widget.forumQuestions[index]['Owner'],
            widget.forumQuestions[index]['Detailed Description'],
            widget.forumQuestions[index]['Pet\'s Breed'],
            widget.forumQuestions[index]['Communication Number'],
            widget.forumQuestions[index]['Pet\'s Gender'],
            widget.forumQuestions[index]['Date'],
            widget.forumQuestions[index]['Comments']));
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
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: allForumQuestions
                .map((ForumModel e) => ListTile(
                      title: Text(e.title),
                      subtitle: Text(e.petBreed),
                      leading: ClipRRect(
                        child: const Text("Image"),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) =>
                                ForumQuestionDetailPage(selectedQuestion: e),
                          ),
                        );
                      },
                    ))
                .toList(),
          ),
        )
      ]),
    );
  }
}
