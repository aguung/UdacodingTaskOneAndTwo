import 'package:app_task/utils/video_play.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  String title, url, description, thumbnail;

  DetailView(this.title, this.url, this.description, this.thumbnail);

  @override
  _DetailView createState() => _DetailView();
}

class _DetailView extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 210.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.thumbnail),
                      fit: BoxFit.cover)),
            ),
            Padding(padding: const EdgeInsets.all(10.0)),
            Text(
              widget.description,
              style: TextStyle(fontSize: 18.0),
            ),
            Padding(padding: const EdgeInsets.all(8.0)),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Play Video"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => VideoPlay(
                          url: widget.url,
                        )));
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
