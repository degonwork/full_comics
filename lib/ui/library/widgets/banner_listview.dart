import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/config/size_config.dart';
import 'package:full_comics/data/database/commic_database.dart';
import 'package:full_comics/data/models/banner.dart';
import 'package:full_comics/ui/home/child_screen/hot_manga/cubit/fetch_hot_manga_cubit.dart';
import 'package:full_comics/ui/home/child_screen/hot_manga/cubit/fetch_hot_manga_state.dart';

import '../../../data/models/manga_models/hot_comics_model.dart';

class BannerListview extends StatelessWidget {
  // final ScrollController scrollController;
  // final List image;
  const BannerListview({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // final CommicDB commicDB = CommicDB.instance;
    // return
      // FutureBuilder(
      //   future: commicDB.readListHotCommic(),
      //   builder:
      //       (BuildContext context, AsyncSnapshot<List<HotComic>> snapshot) {
      //     if (snapshot.hasData) {
      //       return Container(
      //         padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.0265),
      //         height: SizeConfig.screenHeight * 0.266,
      //         child: CarouselSlider.builder(
      //           itemCount: snapshot.data!.length,
      //           itemBuilder: (context, index, index1) {
      //             return CachedNetworkImage(
      //               imageUrl: snapshot.data![index].image.toString(),
      //               imageBuilder: (context, imageProvider) {
      //                 return Container(
      //                   decoration: BoxDecoration(
      //                     image: DecorationImage(
      //                         image: imageProvider, fit: BoxFit.fill),
      //                   ),
      //                 );
      //               },
      //               placeholder: (context, url) =>
      //                   const CircularProgressIndicator(),
      //               errorWidget: (context, url, error) =>
      //                   const Icon(Icons.error),
      //             );
      //             // return Container(
      //             //   decoration: BoxDecoration(
      //             //       borderRadius: BorderRadius.circular(10),
      //             //       image: DecorationImage(
      //             //           image: NetworkImage(
      //             //               snapshot.data![index].image.toString()),
      //             //           fit: BoxFit.fill)),
      //             // );
      //           },
      //           options: CarouselOptions(
      //             height: SizeConfig.screenHeight * 0.265,
      //             aspectRatio: 16 / 9,
      //             viewportFraction: 0.8,
      //             initialPage: 0,
      //             enableInfiniteScroll: true,
      //             reverse: false,
      //             autoPlay: true,
      //             autoPlayInterval: const Duration(seconds: 3),
      //             autoPlayAnimationDuration: const Duration(milliseconds: 500),
      //             autoPlayCurve: Curves.easeInOut,
      //             enlargeCenterPage: true,
      //             enlargeFactor: 0.3,
      //             scrollDirection: Axis.horizontal,
      //           ),
      //         ),
      //       );
      //     }
          // return const CircularProgressIndicator();
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
                    : Container(
                        padding: EdgeInsets.only(
                            top: SizeConfig.screenHeight * 0.0265),
                        height: SizeConfig.screenHeight * 0.266,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CarouselSlider.builder(
                          itemCount: listHotCommic.length,
                          itemBuilder: (context, index, index1) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        listHotCommic[index].image.image_thumnail_rectangle!),
                                    fit: BoxFit.fill),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            height: SizeConfig.screenHeight * 0.265,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 500),
                            autoPlayCurve: Curves.easeInOut,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                          ),
                        ));
              }
              return const SizedBox.shrink();
            },
          );
        // });
  }
}
