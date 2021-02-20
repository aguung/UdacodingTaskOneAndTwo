import 'package:app_task/ui/favorite/favorite_view.dart';
import 'package:app_task/ui/grafik/grafik_view.dart';
import 'package:app_task/ui/playlist/playlist_view.dart';
import 'package:app_task/ui/profil/profil_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  final widgetOptions = [
    PlaylistView(url: "https://taskudacoding.herokuapp.com/",),
    FavoriteView(),
    GrafikView(),
    ProfilView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uda Tube App'),
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.video_collection), label: 'Playlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.equalizer), label: 'Grafik'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profil'),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}