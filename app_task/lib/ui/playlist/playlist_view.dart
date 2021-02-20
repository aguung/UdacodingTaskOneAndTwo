import 'dart:convert';
import 'dart:io';

import 'package:app_task/repository/favorite_repository.dart';
import 'package:app_task/ui/detail/detail_view.dart';
import 'package:app_task/ui/favorite/favorite_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class PlaylistView extends StatefulWidget {
  final String url;

  PlaylistView({this.url});

  @override
  _ListVideoState createState() => _ListVideoState();
}

class _ListVideoState extends State<PlaylistView> {
  Future<List> getData() async {
    final response = await http.get(widget.url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? PlayListVideo(
                  list: snapshot.data,
                )
              : Center(
                  child: Platform.isIOS
                      ? CupertinoActivityIndicator()
                      : CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class PlayListVideo extends StatelessWidget {
  final List list;
  final scaffoldState = GlobalKey<ScaffoldState>();
  final controllerVideoID = TextEditingController();
  final controllerVideoName = TextEditingController();
  final controllerVideoUrl = TextEditingController();
  final controllerVideoThumbnail = TextEditingController();
  final favoriteCubit = FavoriteCubit(
      repository: FavoriteRepository(
    Dio(),
  ));

  PlayListVideo({this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      body: BlocProvider<FavoriteCubit>(
        create: (context) => favoriteCubit,
        child: BlocListener<FavoriteCubit, FavoriteState>(
          listener: (context, state) async {
            if (state is FailureFavoriteState) {
              scaffoldState.currentState
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            } else if (state is SuccessFavoriteState) {
              scaffoldState.currentState.showSnackBar(
                  SnackBar(content: Text(state.favoriteUser.message)));
            }
          },
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints.tightFor(
                  height: MediaQuery.of(context).size.height),
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: list == null ? 0 : list.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => DetailView(
                                list[i]['snippet']['title'],
                                "https://youtube.com/embed/${list[i]['contentDetails']['videoId']}",
                                list[i]['snippet']['description'],
                                list[i]['snippet']['thumbnails']['high']
                                    ['url']))),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                            ),
                            elevation: 8.0,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 210.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(list[i]['snippet']
                                              ['thumbnails']['high']['url']),
                                          fit: BoxFit.cover)),
                                ),
                                Padding(padding: const EdgeInsets.all(10.0)),
                                Text(
                                  list[i]['snippet']['title'],
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Padding(padding: const EdgeInsets.all(8.0)),
                                RaisedButton(
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  child: Text("Add to favorite"),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  onPressed: () {
                                    String videoId =
                                        list[i]['contentDetails']['videoId'];
                                    String videoName =
                                        list[i]['snippet']['title'];
                                    String videoUrl =
                                        "https://youtube.com/embed/${list[i]['contentDetails']['videoId']}";
                                    String videoThumbnail = list[i]['snippet']
                                        ['thumbnails']['high']['url'];
                                    favoriteCubit.addFavorite(videoId,
                                        videoName, videoUrl, videoThumbnail);
                                  },
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<FavoriteCubit, FavoriteState>(
                      builder: (context, state) {
                    if (state is LoadingFavoriteState) {
                      return Container(
                        color: Colors.black.withOpacity(.5),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
