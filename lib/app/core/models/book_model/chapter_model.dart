import 'package:mobx/mobx.dart';

import 'versicle_model.dart';

class ChapterModel {
  List<VersicleModel>? versicles;

  ChapterModel(this.versicles);

  ChapterModel.fromJson(List<dynamic> data) {
    versicles = <VersicleModel>[];
    data.forEach((element) {
      versicles?.add(VersicleModel.fromJson(element));
    });
  }
}
