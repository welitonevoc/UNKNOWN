import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:mybible/app/core/models/book_model/book_model.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'bible_version_enum.dart';
part 'bible_store.g.dart';

class BibleStore = _BibleStoreBase with _$BibleStore;

abstract class _BibleStoreBase with Store {
  @observable
  BibleVersion versionBible = BibleVersion.NVI;

  @observable
  List<BookModel> version = <BookModel>[];

  @observable
  int? indexCurrentBook;

  @observable
  int? currentChapter;

  @observable
  bool isLoading = false;

  _BibleStoreBase() {
    loadData();
  }

  @action
  Future<void> loadData() async {
    try {
      isLoading = true;
      print(
          "LOADING: ${'assets/${returnBibleVersionName(versionBible)}.json'}");
      String bibleData = await rootBundle
          .loadString('assets/${returnBibleVersionName(versionBible)}.json');

      List<dynamic> json = jsonDecode(bibleData);
        
      version = <BookModel>[];
      json.asMap().forEach((key, value) {
        version.add(BookModel.fromJson(value));
      });
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }

  @computed
  BookModel? get currentBook =>
      indexCurrentBook != null ? version[indexCurrentBook!] : null;

  @computed
  String get getCurrentBook =>
      "${currentBook != null ? currentBook?.name : "Livro"} - ${currentChapter != null ? currentChapter! + 1 : "Capítulo"}";

  @computed
  String get getCurrentVersion =>
      returnBibleVersionName(versionBible).toString().toUpperCase();

  @action
  String getBibleVersions(int index) =>
      returnBibleVersionName(BibleVersion.values[index])
          .toString()
          .toUpperCase();
}
