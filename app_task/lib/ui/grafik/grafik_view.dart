import 'dart:io';

import 'package:app_task/model/favorite_user.dart';
import 'package:app_task/repository/favorite_repository.dart';
import 'package:app_task/ui/grafik/grafik_cubit.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GrafikView extends StatefulWidget {
  @override
  _GrafikState createState() => _GrafikState();
}

class _GrafikState extends State<GrafikView> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  final grafikCubit = GrafikCubit(
      repository: FavoriteRepository(
    Dio(),
  ));

  @override
  void initState() {
    grafikCubit.getGrafik();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldState,
        body: BlocProvider<GrafikCubit>(
          create: (_) => grafikCubit,
          child: BlocListener<GrafikCubit, GrafikState>(
            listener: (_, state) {
              if (state is FailureGrafikState) {
                scaffoldState.currentState.showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                  ),
                );
              }
            },
            child: BlocBuilder<GrafikCubit, GrafikState>(
              builder: (_, state) {
                if (state is LoadingGrafikState) {
                  return Center(
                    child: Platform.isIOS
                        ? CupertinoActivityIndicator()
                        : CircularProgressIndicator(),
                  );
                } else if (state is SuccessGrafikState) {
                  var listFavorite = state.favoriteUser.favorite;
                  var series = [
                    charts.Series(
                        domainFn: (Favorite favorite, _) => favorite.favoriteId,
                        measureFn: (Favorite favorite, _) =>
                            int.parse(favorite.favoriteVideoId),
                        id: 'Favorite',
                        data: listFavorite,
                        labelAccessorFn: (Favorite favorite, _) =>
                            favorite.favoriteVideoName)
                  ];
                  var chart = charts.BarChart(
                    series,
                    vertical: false,
                    barRendererDecorator: charts.BarLabelDecorator<String>(),
                  );
                  return listFavorite.isEmpty
                      ? Center(child: Text('Empty Grafik'))
                      : SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Favorite Grafik",
                                style: TextStyle(fontSize: 24.0),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: chart),
                            ],
                          ),
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
