import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/config/size_config.dart';
import 'package:full_comics/ui/home/child_screen/new_manga/cubit/fetch_new_manga_cubit.dart';
import 'package:full_comics/ui/home/child_screen/new_manga/cubit/fetch_new_manga_state.dart';

class NewManga extends StatelessWidget {
  const NewManga({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewMangaCubit,FetchNewMangaState>(
      builder: (context,state){
        if (state is FetchNewMangaLoading) {
         return const CircularProgressIndicator();
        } else if(state is FetchNewMangaError){
          return const Text('Lỗi tải về');
        }else if(state is FetchNewMangaLoaded){
          final listNewCommic = state.listNewCommic;
          return listNewCommic.isEmpty 
          ? const Text('Không thể tải thành công')
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                // padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth),
                child: GridView.builder(
                  shrinkWrap: true,
                itemCount: listNewCommic.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20,
                  // mainAxisSpacing: 5,
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context,index){
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
                              image: DecorationImage(image: NetworkImage(listNewCommic[index].image.image_thumnail_rectangle!),fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Text(' ${listNewCommic[index].title} ',style: const TextStyle(color: Colors.white,fontSize: 20)),

                      ],
                    ),
                  );
                }
                ),
              ),
            );
        }
        return const SizedBox.shrink();
      }
      );
  }
}