import 'dart:io';

import 'package:SocialMediaComment/widget/comment.dart';
import 'package:SocialMediaComment/widget/comment_field.dart';
import 'package:SocialMediaComment/widget/image_post.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String commentText;
  File commentImage;
  List<Widget> _commentList = [];

  void _addComment(Widget comment) {
    setState(() {
      _commentList.add(comment);
    });
  }

  Widget buildComentList(){
    return ListView.builder(
      itemBuilder: (context, index){
        if (index < _commentList.length){
          return buildCommentItem(_commentList[index]);
        }
    });
  }

  Widget buildCommentItem(Widget comment){
    return ListTile(
      title: comment,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.75,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  pinned: false,
                  backgroundColor: Colors.white,
                  expandedHeight: 510.0,
                  flexibleSpace: FlexibleSpaceBar(
                  background:           
                    ImagePost(
                      commentCount: "${_commentList.length}",
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.grey[20],
                        child: buildCommentItem(_commentList[index]),
                      );
                    },
                    childCount: _commentList.length,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15, top: 12),
            child: Commentfield(
              textInput: (value){
                commentText = value;
              },
              onPressed: (){
                _addComment(
                  Comment(
                    comment: commentText,
                  )
                );
              },
            ),
          ),
        ],
      )
    );
  }
}