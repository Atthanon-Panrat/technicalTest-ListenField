import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';

class Comment extends StatefulWidget {
	String comment;
	File image;

	Comment({
		Key key,
		this.comment,
		this.image,

	});

	@override
	_Comment createState() => _Comment();
}

class _Comment extends State<Comment> {

	Widget build(BuildContext context) {
		return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height:10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(3, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            SizedBox(width:10),
            Text(  
              'SOMEONE',  
              style: TextStyle(
                fontSize: 16.0,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                color: Colors.grey[850]
              ),  
            ),
          ],  
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 15, 10),
          child: Text(  
            this.widget.comment ?? '',  
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey[600]
            ),  
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 5),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(20)),
            clipBehavior: Clip.antiAlias,
            child: this.widget.image == null ?
            Image.file(
              this.widget.image,
            ):
            SizedBox(height: 0)
            // Image.network(
            //   "https://www.newshub.co.nz/dam/form-uploaded-images-ordered/2019/08/08/KNOWYOURMEME-sad-cat-crying-1120.JPG",
            //   width: double.maxFinite,
            // ),
          )
        )
      ],
    );
	}
}
