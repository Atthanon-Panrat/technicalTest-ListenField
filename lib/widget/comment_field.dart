import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Commentfield extends StatefulWidget {
  String commentfieldCount;
  Function onPressed;
  Function onTap;
  ValueChanged<String> textInput;

	Commentfield({
		Key key,
    this.onPressed,
    this.textInput,
	});

	@override
	_Commentfield createState() => _Commentfield();
}

class _Commentfield extends State<Commentfield> {
  final myController = TextEditingController();
  File imageFile;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        print('$imageFile');
      } else {
        print('No image selected.');
      }
    });
  }
  
	Widget build(BuildContext context) {
		return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: getImage,
          child: Icon(
            Icons.photo_camera,
            size: 32,
            color: Colors.grey[500],
            ),
        ),
        imageFile != null ?
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              image: DecorationImage(
              image: FileImage(imageFile),
              fit: BoxFit.cover,
            ),
          ),
        ): SizedBox(width:0),
        SizedBox(width:15),
        Container(
          width: MediaQuery.of(context).size.width*0.65,
          child:TextFormField(
            onChanged: (String string){
              this.widget.textInput(myController.text);
            },
            controller: myController,
            decoration: InputDecoration(
              labelText: "Add your comment",
              fillColor: Colors.grey[200],
              border:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ),
        SizedBox(width:15),
        FloatingActionButton(
          onPressed: (){
            this.widget.onPressed();
            setState(() {
              myController.clear();
            });
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.send,
            color: Colors.white,
          ),
        ),
      ],  
    );
	}

  static Widget previewImge(imgPreview){
    return Stack(
      children: <Widget>[
        new Container(
          width: 75,
          height: 75,
          alignment: Alignment.center,
          color: Colors.redAccent,
          decoration: BoxDecoration(
              image: DecorationImage(
              image: FileImage(imgPreview),
              fit: BoxFit.cover,
            ),
          ),
        )
       ] ,
    );
  }
}

