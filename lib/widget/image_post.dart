import 'package:flutter/material.dart';

class ImagePost extends StatefulWidget {
	String caption;
  String commentCount;
	NetworkImage image;

	ImagePost({
		Key key,
		this.caption = "Name",
		this.image,
    this.commentCount,

	});

	@override
	_ImagePost createState() => _ImagePost();
}

class _ImagePost extends State<ImagePost> {

	Widget build(BuildContext context) {
		return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
          child:  Row(
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  color: Colors.redAccent,
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
              SizedBox(width:15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(  
                    'NANON',  
                    style: TextStyle(
                      fontSize: 21.0,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[850]
                    ),  
                  ),
                  SizedBox(height:5),
                  Text(  
                    'Atthanon Panrat',  
                    style: TextStyle(
                      fontSize: 12.0,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[850]
                    ),  
                  ),
                ] 
              )
            ]
          )
        ),  
        Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
          child: Text(  
            'A tablet is a wireless touch screen computer that is smaller than a notebook but larger than a smartphone.',  
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[700]
            ),  
          )  ,
        ),
        Image.network(
          'https://www.umipro.com/pub/media/wysiwyg/img-1_4.jpg',
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.chat_bubble_outline,
                color: Colors.grey[500],
                size: 25.0,
              ),
              SizedBox(width:15),
              Text(  
                this.widget.commentCount ?? "0",  
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[500]
                ),
              ),
            ],
          ), 
        ),
      ],  
    );
	}
}