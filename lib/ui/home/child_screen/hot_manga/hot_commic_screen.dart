import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/config/size_config.dart';
import 'package:full_comics/data/database/commic_database.dart';
import 'package:full_comics/data/models/manga_models/hot_comics_model.dart';
import 'package:full_comics/ui/home/child_screen/hot_manga/cubit/fetch_hot_manga_cubit.dart';
import 'package:full_comics/ui/home/child_screen/hot_manga/cubit/fetch_hot_manga_state.dart';

class HotCommic extends StatelessWidget {
  const HotCommic({super.key});

  @override
  Widget build(BuildContext context) {
    //  final CommicDB commicDB = CommicDB.instance;
    // return FutureBuilder(
    //   future: commicDB.readListHotCommic(),
    //   builder: (context,AsyncSnapshot<List<HotComic>> snapshot){
    //       if (snapshot.hasData) {
    //         return GridView.builder(
    //           itemCount: snapshot.data?.length,
    //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisSpacing: 20,
    //                 // mainAxisSpacing: 5,
    //                 crossAxisCount: 2,
    //                 childAspectRatio: 0.7,
    //               ),
    //           itemBuilder: (context,index){
    //             return SizedBox(
    //                   height: SizeConfig.screenHeight / 3.78,
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       InkWell(
    //                         child: Container(
    //                           margin: EdgeInsets.zero,
    //                           height: SizeConfig.screenHeight / 4.2,
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(10),
    //                             // color: Colors.red,
    //                             image: DecorationImage(image: NetworkImage(snapshot.data![index].image.toString()),fit: BoxFit.fill),
    //                           ),
    //                         ),
    //                       ),
    //                       Text(' ${snapshot.data![index].title.toString()} ',style: const TextStyle(color: Colors.white,fontSize: 20),),

    //                     ],
    //                   ),

    //             );
    //           }
    //           );
    //       }
    //     return const CircularProgressIndicator();
    //   }
    //   );
    return BlocBuilder<FetchHotCommicCubit, FetchHotMangaState>(
        builder: (context, state) {
      if (state is FetchLoading) {
        return const CircularProgressIndicator();
      } else if (state is FetchError) {
        return const Text('Lỗi tải về');
      } else if (state is FetchLoaded) {
        final listHotCommic = state.listHotCommic;
        return listHotCommic.isEmpty
            ? const Text('Không thể tải thành công')
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth / 24),
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: listHotCommic.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 20,
                        // mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: SizeConfig.screenHeight / 3.78,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                child: Container(
                                  margin: EdgeInsets.zero,
                                  height: SizeConfig.screenHeight / 4.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Colors.red,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            listHotCommic[index].image.image_thumnail_rectangle!),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              Text(
                                ' ${listHotCommic[index].title} ',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              );
      }
      return const SizedBox.shrink();
    });
  }
}
