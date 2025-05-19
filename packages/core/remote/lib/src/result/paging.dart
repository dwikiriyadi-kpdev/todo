import 'package:equatable/equatable.dart';

class Paging<T> extends Equatable{
  final int limit;
  final bool nextPage;
  final int page;
  final int totalPage;
  final bool prevPage;
  final int total;
  final List<T> items;

  const Paging({
    this.limit = 0,
    this.nextPage = false,
    this.page = 0,
    this.totalPage = 0,
    this.prevPage = false,
    this.total = 0,
    this.items = const [],
  });
  
  @override
  List<Object?> get props => [
    limit,
    nextPage,
    page,
    totalPage,
    prevPage,
    total,
    items,
  ];
}
