class friendsCatch {
  String timestamp;
  List info;

  friendsCatch(this.timestamp, this.info);

  @override

  List list() {
    return [this.timestamp, this.info];
  }
}