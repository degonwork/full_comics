import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/data/models/manga_models/all_new_manga_model.dart';
import 'package:full_comics/data/models/manga_models/new_commic_model.dart';
import 'package:full_comics/data/repo/manga_repo/all_new_manga_repo.dart';
import 'package:full_comics/ui/home/child_screen/all_new_manga/cubit/fetch_all_new_manga_state.dart';

class FetchAllNewMangaCubit extends Cubit<FetchAllNewMangaState> {
  final AllNewMangaRepo allNewMangaRepo;
  FetchAllNewMangaCubit({required this.allNewMangaRepo}) : super(FetchAllNewMangaInitial());
  Future<void> fetchAllNewManga()async{
    emit(FetchAllNewMangaLoading());
    try {
      final List<AllNewMangaModel> listAllNewManga = await allNewMangaRepo.fetchAllNewMangaRepo();
      emit(FetchAllNewMangaLoaded(listAllNewManga: listAllNewManga));
    } catch (e) {
      emit(FetchAllNewMangaError());
    }
  }
}