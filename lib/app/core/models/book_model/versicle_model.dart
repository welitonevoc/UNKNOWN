class VersicleModel {
  String? versicle;
  bool isSelected = false;

  VersicleModel(this.versicle);

  VersicleModel.fromJson(String v) {
    versicle = v;
  }

  selectVersicle() => isSelected = !isSelected;
}
