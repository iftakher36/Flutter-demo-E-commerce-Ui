class HomeBottomItem {
  late String imgPath;
  late String title;
  late String subTitle;

  HomeBottomItem(this.imgPath, this.title, this.subTitle);

  set setImgPath(String imgPath) {
    this.imgPath = imgPath;
  }

  String get getImgPath {
    return imgPath;
  }
}
