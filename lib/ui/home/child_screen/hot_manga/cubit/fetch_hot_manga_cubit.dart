import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/data/models/manga_models/hot_comics_model.dart';
import 'package:full_comics/data/repo/manga_repo/hot_commic_repo.dart';
import 'package:full_comics/ui/home/child_screen/hot_manga/cubit/fetch_hot_manga_state.dart';

class FetchHotCommicCubit extends Cubit<FetchHotMangaState> {
  final HotCommicRepo hotMangaRepo;
   FetchHotCommicCubit({required this.hotMangaRepo}) : super(FetchInitial());
   Future<void> fetchHotCommic() async {
    emit(FetchLoading());
    try {
      final List<HotComic> listHotCommic = await hotMangaRepo.fetchHotComics();
      emit(FetchLoaded(listHotCommic: listHotCommic));
    } catch (e) {
      emit(FetchError());
      // print(e.toString());
    }
   }
}