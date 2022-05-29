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
            widget.forumQuestions[index]['Date'],
            widget.forumQuestions[index]['Comments']));
    return Scaffold(
      body: ListView(
        children: allForumQuestions
            .map((ForumModel e) => ListTile(
                  title: Text(e.title),
                  subtitle: Text(e.petType),
                  leading: ClipRRect(
                    child: const Text("Image"),
                  ),
                  trailing: Text("sasa"),
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
    );
  }
}
