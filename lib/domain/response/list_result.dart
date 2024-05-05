/// 部分分頁 response 可繼承此類
class ListResult<T> {
  ListResult({
    this.current = 1,
    this.total = 0,
    this.pages = 1,
    this.size = 10,
    this.records = const [],
    this.searchCount = false,
  });

  int current;
  int total;
  int pages;
  int size;
  List<T> records;
  bool searchCount;
}
