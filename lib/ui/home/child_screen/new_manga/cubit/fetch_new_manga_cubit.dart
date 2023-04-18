import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/data/models/manga_models/new_commic_model.dart';
import 'package:full_comics/data/repo/manga_repo/new_commic_repo.dart';
import 'package:full_comics/ui/home/child_screen/new_manga/cubit/fetch_new_manga_state.dart';

class FetchNewMangaCubit extends Cubit<FetchNewMangaState> {
  final NewCommicRepo newCommicRepo;
  FetchNewMangaCubit({required this.newCommicRepo}): super(FetchNewMangaInitial());
  Future<void> fetchNewManga()async{
    emit(FetchNewMangaLoading());
    try {
      final List<NewCommicModel> listNewCommic = await newCommicRepo.fetchNewCommic();
      emit(FetchNewMangaLoaded(listNewCommic: listNewCommic));
    } catch (e) {
      emit(FetchNewMangaError());
    }
  }
}