import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:insta_clone/constants/common_size.dart';
import 'package:insta_clone/constants/screen_size.dart';

class SharePostScreen extends StatelessWidget {
  final File imageFile;
  final String postKey;

  SharePostScreen(this.imageFile, {Key key, @required this.postKey})
      : super(key: key);

  bool checked =false;
  List<String> _tagItems = [
    "approval",
    "pigeon",
    "brown",
    "expenditure",
    "compromise",
    "citizen",
    "inspire",
    "relieve",
    "grave",
    "incredible",
    "invasion",
    "voucher",
    "girl",
    "relax",
    "problem",
    "queue",
    "aviation",
    "profile",
    "palace",
    "drive",
    "money",
    "revolutionary",
    "string",
    "detective",
    "follow",
    "text",
    "bet",
    "decade",
    "means",
    "gossip"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Post'),
          actions: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Text(
                  "Share",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ))
          ],
        ),
        body: ListView(
          children: <Widget>[
            _captionWithImage(),
            _divider,
            _sectionButton('Tag People'),
            _divider,
            _sectionButton('Add Location'),
            _tags(),
            SizedBox(
              height: common_s_gap,
            ),
            _divider,
            SectionSwitch('Facebook'),
            SectionSwitch('Instagram'),
            SectionSwitch('Tumblr'),
            _divider
          ],
        ));
  }

  Tags _tags() {
    return Tags(
      horizontalScroll: true,
      itemCount: _tagItems.length,
      heightHorizontalScroll: 30,
      spacing: 4,
      itemBuilder: (index) => ItemTags(
        index: index,
        title: _tagItems[index],
        activeColor: Colors.grey[200],
        textActiveColor: Colors.black87,
        borderRadius: BorderRadius.circular(4),
        elevation: 2,
        splashColor: Colors.grey[800],
        color: Colors.red,
      ),
    );
  }

  Divider get _divider => Divider(
        color: Colors.grey[400],
        thickness: 1,
        height: 1,
      );

  ListTile _sectionButton(String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.navigate_next),
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: common_gap),
    );
  }



  ListTile _captionWithImage() {
    return ListTile(
      contentPadding:
          EdgeInsets.symmetric(vertical: common_gap, horizontal: common_gap),
      trailing: Image.file(
        imageFile,
        width: size.width / 6,
        height: size.width / 6,
        fit: BoxFit.cover,
      ),
      title: TextField(
        decoration: InputDecoration(
          hintText: 'Write a caption...',
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class SectionSwitch extends StatefulWidget {
  final String _title;
  const SectionSwitch(this._title,{
    Key key,
  }) : super(key: key);

  @override
  _SectionSwitchState createState() => _SectionSwitchState();
}

class _SectionSwitchState extends State<SectionSwitch> {
  bool checked =false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget._title,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: CupertinoSwitch(
        value: checked,
        onChanged: (onValue) {
          setState(() {
            checked = onValue;
          });
        },
      ),
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: common_gap),
    );
  }
}
