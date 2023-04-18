import 'package:equatable/equatable.dart';
import 'package:full_comics/data/models/manga_models/hot_comics_model.dart';


class FetchHotMangaState extends Equatable{
  const FetchHotMangaState();
  @override
  List<Object> get props => [];
}
class FetchInitial extends FetchHotMangaState{}
class FetchLoading extends FetchHotMangaState{}
class FetchLoaded extends FetchHotMangaState{
  final List<HotComic> listHotCommic;
  const FetchLoaded({required this.listHotCommic});
  @override
  List<Object> get props => [listHotCommic];
}
class FetchError extends FetchHotMangaState{}