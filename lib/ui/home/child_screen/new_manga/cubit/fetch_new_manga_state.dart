import 'package:equatable/equatable.dart';
import 'package:full_comics/data/models/manga_models/new_commic_model.dart';

class FetchNewMangaState extends Equatable{
  @override
  List<Object> get props => [];
}
class FetchNewMangaInitial extends FetchNewMangaState{}
class FetchNewMangaLoading extends FetchNewMangaState{}
class FetchNewMangaLoaded extends FetchNewMangaState{
  final List<NewCommicModel> listNewCommic;
   FetchNewMangaLoaded({required this.listNewCommic});
  @override
  List<Object> get props => [listNewCommic];
}
class FetchNewMangaError extends FetchNewMangaState{}