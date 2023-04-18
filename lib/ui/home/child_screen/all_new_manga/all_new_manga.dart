import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/config/size_config.dart';
import 'package:full_comics/ui/home/child_screen/all_new_manga/cubit/fetch_all_new_manga_cubit.dart';
import 'package:full_comics/ui/home/child_screen/all_new_manga/cubit/fetch_all_new_manga_state.dart';

class AllNewManga extends StatelessWidget {
  const AllNewManga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FetchAllNewMangaCubit,FetchAllNewMangaState>(
        builder: (context,state){
          if (state is FetchAllNewMangaLoading) {
           return const CircularProgressIndicator();
          }else if(state is FetchAllNewMangaError){
           return const Text('Load failed');
          }else if(state is FetchAllNewMangaLoaded){
            final listAllNewManga = state.listAllNewManga;
           return listAllNewManga.isEmpty
            ? const Text('Load failed')
            :  SizedBox(
              // height: double.infinity,
              // width: double.infinity,
              child: SizedBox(
                child: GridView.builder(
                  shrinkWrap: true,
                itemCount: listAllNewManga.length,
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
                              image: DecorationImage(image: NetworkImage(listAllNewManga[index].image),fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Text(' ${listAllNewManga[index].title} ',style: const TextStyle(color: Colors.black,fontSize: 20)),
            
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
        ),
    );
  }
}