class Company {
  String _desc;
  List<dynamic> _gallery;

  String get desc => _desc;
  List<dynamic> get gallery => _gallery;

  setDescription(String desc){
    _desc = desc;
  }

  setGallery(List<dynamic> images){
    _gallery = images;
  }
}