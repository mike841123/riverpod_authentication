import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll/model/providers/user_providers.dart';
import 'package:infinite_scroll/pages/home/providers/home_providers.dart';

import '../../config/routes/routes_location.dart';
import '../../domain/response/home_page_response/banner_list_response.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            final userState = ref.watch(userProvider);
            final String avatar = userState.userInfoResult?.avatar ?? "";
            return Row(
              children: [
                InkWell(
                  onTap: () async {
                    ref.read(userProvider.notifier).modifyAvatar();
                  },
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: avatar.isNotEmpty
                        ? ClipOval(
                            child: CachedNetworkImage(
                              width: 100,
                              height: 100,
                              errorWidget: (context, url, error) {
                                return const Icon(Icons.image_not_supported_outlined);
                              },
                              imageUrl: userState.userInfoResult?.avatar ?? "",
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(Icons.person),
                  ),
                ),
                const Gap(10),
                Text("帳號：${userState.userInfoResult?.username ?? ""}"),
              ],
            );
          }),
          const Gap(20),
          Consumer(builder: (context, ref, child) {
            final homeState = ref.watch(homeProvider);
            return CarouselSlider(
              options: CarouselOptions(height: 136, viewportFraction: 1, enableInfiniteScroll: false),
              items: homeState.bannerList.map((BannerItem item) {
                return Builder(
                  builder: (BuildContext context) {
                    return CachedNetworkImage(
                      width: 390,
                      height: 136,
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.image_not_supported_outlined);
                      },
                      imageUrl: item.cnImage,
                      fit: BoxFit.cover,
                    );
                  },
                );
              }).toList(),
            );
          }),
          const Gap(20),
          ElevatedButton(
            onPressed: () {
              context.push(RouteLocation.flow);
            },
            child: Text("go to flow page"),
          )
        ],
      ),
    );
  }
}
