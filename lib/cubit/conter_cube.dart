import 'package:app_news_api/cubit/statesCounter.dart';
import 'package:app_news_api/scrren/scrren_sients.dart';
import 'package:app_news_api/scrren/scrren_sprot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modles/shared_prafrnce.dart';
import '../rimot/dio_helper.dart';
import '../scrren/screen_buisnc.dart';

class AppNwes extends Cubit<States> {
  AppNwes() : super(InaitalStatNews());

  static AppNwes get(context) => BlocProvider.of(context);
  int index = 0;
  void changInadex(int i) {
    if (i == 1) {
      getBuisnss();
    } else if (i == 2) {
      getScience();
    }
    index = i;
    emit(ChangNavigator());
  }

  List<Widget> scrren = [
    ScrrenSport(),
    ScreenBuisns(),
    ScrrenSiantes(),
    // ScrrenSittings(),
  ];
  List<BottomNavigationBarItem> bottonNavigton = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'science',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.settings), //settinges
    //   label: 'settinges',
    // ),
  ];
  List buisens = [];
  void getBuisnss() {
    emit(LodingBuissnsn());
    if (buisens.isEmpty) {
      DigHelper.getData(url: 'v2/top-headlines', qur: {
        'country': 'eg',
        'category': 'business',
        'apikey': '673e81becfa04297a137ae37a7d7098d',
      }).then((value) {
        buisens.addAll(value.data['articles']);
        emit(SicssBuissns());
      }).catchError((e) {
        print('خطأ');
        emit(ErerrBuissns(e.toString()));
      });
    } else {
      emit(SicssBuissns());
    }
  }

  List sports = [];
  void getSports() {
    emit(LodingSports());

    DigHelper.getData(url: 'v2/top-headlines', qur: {
      'country': 'eg',
      'category': 'sports',
      'apikey': '673e81becfa04297a137ae37a7d7098d',
    }).then((value) {
      sports.addAll(value.data['articles']);

      emit(SicssSports());
    }).catchError((e) {
      emit(ErerrSports(e.toString()));
    });
  }

  List science = [];
  void getScience() {
    emit(LodingScience());
    if (science.isEmpty) {
      DigHelper.getData(url: 'v2/top-headlines', qur: {
        'country': 'eg',
        'category': 'science',
        'apikey': '673e81becfa04297a137ae37a7d7098d',
      }).then((value) {
        science.addAll(value.data['articles']);
        emit(SicssScience());
      }).catchError((e) {
        emit(ErerrScience(e.toString()));
      });
    } else {
      emit(SicssScience());
    }
  }

  List search = [];
  void getSearech(String value1) {
    emit(LodingSearch());

    DigHelper.getData(url: 'v2/everything', qur: {
      'q': '$value1',
      'apiKey': '673e81becfa04297a137ae37a7d7098d',
    }).then((value) {
      search.addAll(value.data['articles']);
      print('|||||||||||||||||||||||||||||||||||||||||||||||||||||||');
      print(search);
      emit(SicssSearch());
    }).catchError((e) {
      emit(ErerrSearch(e.toString()));
    });
  }

  bool isDark = false;
  // ignore: non_constant_identifier_names
  void ChangeMode({bool? from}) {
    if (from != null) {
      isDark = from;
      emit(StateMode());
    } else {
      isDark = !(isDark);
      ShaerdPrafrnce.putData(key: 'isDark', value: isDark).then((value) {
        emit(StateMode());
      });
    }
    //emit(StatInialMode());

    print(isDark);
  }
}
