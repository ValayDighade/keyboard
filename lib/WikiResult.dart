import 'package:flutter/material.dart';
import 'package:flutter_emoji_keyboard/flutter_emoji_keyboard.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController controller = TextEditingController();

  bool isShow=false;

  void onEmojiSelected(Emoji emoji) {
    controller.text += emoji.text;
  }

  Widget emojiBox(){
    return  isShow == true ? EmojiKeyboard(
      categoryIcons: CategoryIcons(
          people: Icons.sentiment_satisfied
      ),
      column: 6,
      floatingHeader: true,
      onEmojiSelected: onEmojiSelected,
    ) : Container();
  }


  double height=100.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        bottomSheet:TextFormField(
          onTap: () {
            // FocusScope.of(context).requestFocus(FocusNode());
          },
          controller: controller,
          maxLength: 150,
          maxLines: null,
          decoration: InputDecoration(
            counterText: "",
            prefixIcon: IconButton(

              onPressed: (){

                setState(() {
                  isShow=true;
                  FocusScope.of(context).requestFocus(FocusNode());
                  //FocusScope.of(context).unfocus();
                });

              },
              icon: Icon(Icons.insert_emoticon,color: Colors.black,),
            ),
            hintText: "Enter Email",
            focusedBorder: OutlineInputBorder(

              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            emojiBox()


          ],
        ),
      ),
    );
  }


  Widget buildInput() {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                children: <Widget>[
                  // Button send image
                  Material(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.0),
                      child: IconButton(
                        icon: Icon(Icons.face),
                        onPressed: () {
                          EmojiKeyboard(
                            onEmojiSelected: (Emoji emoji){},
                          );
                        },
                      ),
                    ),
                    color: Colors.white,
                  ),


                  // Edit text
                  Flexible(
                    child: Container(
                      child: TextField(
                        onSubmitted: (value) {
                          // postController.postCommentValidate(context,widget.post.id);
                        },
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                        // controller: postController.postCommentController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter comment...',
                          hintStyle: TextStyle(color: Colors.black),
                        ),

                      ),
                    ),
                  ),

                  // Button send message
                  Material(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child: IconButton(
                        icon: Icon(Icons.send),
                        //  onPressed: () =>  postController.postCommentValidate(context,widget.post.id),
                        color: Colors.black,
                      ),
                    ),
                    color: Colors.white,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black, width: 0.5)),
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );


  }
}
