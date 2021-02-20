import 'dart:io';

import 'package:app_task/repository/favorite_repository.dart';
import 'package:app_task/ui/favorite/favorite_cubit.dart';
import 'package:app_task/utils/video_play.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatefulWidget {
  @override
  _ListVideoState createState() => _ListVideoState();
}

class _ListVideoState extends State<FavoriteView> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  final favoriteCubit = FavoriteCubit(
      repository: FavoriteRepository(
    Dio(),
  ));

  @override
  void initState() {
    favoriteCubit.getFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldState,
        body: BlocProvider<FavoriteCubit>(
          create: (_) => favoriteCubit,
          child: BlocListener<FavoriteCubit, FavoriteState>(
            listener: (_, state) {
              if (state is FailureFavoriteState) {
                scaffoldState.currentState.showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                  ),
                );
              } else if (state is SuccessFavoriteState) {
                if (state.message != null) {
                  scaffoldState.currentState.showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              }
            },
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (_, state) {
                if (state is LoadingFavoriteState) {
                  return Center(
                    child: Platform.isIOS
                        ? CupertinoActivityIndicator()
                        : CircularProgressIndicator(),
                  );
                } else if (state is SuccessFavoriteState) {
                  var listFavorite = state.favoriteUser.favorite;
                  return listFavorite == null || listFavorite.isEmpty
                      ? Center(child: Text('Empty Favorite'))
                      : ListView.builder(
                          itemCount: listFavorite.length,
                          itemBuilder: (context, index) {
                            var favorite = listFavorite[index];
                            return GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          VideoPlay(
                                            url: favorite.favoriteVideoUrl,
                                          ))),
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
                                                image: NetworkImage(favorite
                                                    .favoriteVideoThumbnail),
                                                fit: BoxFit.cover)),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(10.0)),
                                      Text(
                                        favorite.favoriteVideoName,
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0)),
                                      RaisedButton(
                                          color: Colors.blue,
                                          textColor: Colors.white,
                                          child: Text("Delete Favorite"),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          onPressed: () =>
                                              favoriteCubit.deleteFavorite(
                                                  favorite.favoriteId)),
                                      Divider(),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ));
  }
}
