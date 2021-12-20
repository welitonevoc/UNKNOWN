import 'dart:convert';

import 'package:mobx/mobx.dart';

import 'chapter_model.dart';

class BookModel {
  String? abbrev;
  String? name;
  List<ChapterModel>? chapters;

  BookModel({this.abbrev, this.name, this.chapters});

  @override
  String toString() {
    return 'BookModel(abbrev: $abbrev, name: $name, chapters: $chapters)';
  }

  BookModel.fromJson(Map<String, dynamic> data) {
    abbrev = data['abbrev'] as String?;
    name = data['name'] as String?;
    if (data['chapters'] != null) {
      chapters = <ChapterModel>[];
      data['chapters'].forEach((element) {
        chapters?.add(ChapterModel.fromJson(element));
      });
    }
  }

  String toJson() => json.encode({
        'abbrev': abbrev,
        'name': name,
        'chapters': chapters,
      });

  BookModel copyWith({
    String? abbrev,
    String? name,
    List<ChapterModel>? chapters,
  }) {
    return BookModel(
      abbrev: abbrev ?? this.abbrev,
      name: name ?? this.name,
      chapters: chapters ?? this.chapters,
    );
  }
}



