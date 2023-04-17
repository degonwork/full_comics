import 'package:equatable/equatable.dart';
import 'package:full_comics/data/models/manga_models/all_new_manga_model.dart';
import 'package:full_comics/data/models/manga_models/new_commic_model.dart';

class FetchAllNewMangaState extends Equatable{
  @override
  List<Object> get props => [];
}
class FetchAllNewMangaInitial extends FetchAllNewMangaState{}
class FetchAllNewMangaLoading extends FetchAllNewMangaState{}
class FetchAllNewMangaLoaded extends FetchAllNewMangaState{
  final List<AllNewMangaModel> listAllNewManga;
  FetchAllNewMangaLoaded({required this.listAllNewManga});
  @override
  List<Object> get props => [listAllNewManga];
}
class FetchAllNewMangaError extends FetchAllNewMangaState{}