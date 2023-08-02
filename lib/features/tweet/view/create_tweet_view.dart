import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/loading_page.dart';
import '../../../common/rounded_small_button.dart';
import '../../../theme/pallete.dart';
import '../../auth/controller/auth_controller.dart';

class CreateTweetScreen extends ConsumerStatefulWidget {
    static route() => MaterialPageRoute(
        builder: (context) => const CreateTweetScreen(),
      );
  const CreateTweetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateTweetScreenState();
}

class _CreateTweetScreenState extends ConsumerState<CreateTweetScreen> {


void shareTweet() {
    // ref.read(tweetControllerProvider.notifier).shareTweet(
    //       images: images,
    //       text: tweetTextController.text,
    //       context: context,
    //       repliedTo: '',
    //       repliedToUserId: '',
    //     );
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
     final currentUser = ref.watch(currentUserDetailsProvider).value;
     
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close, size: 30),
        ),
        actions: [
          RoundedSmallButton(
            onTap: shareTweet,
            label: 'Tweet',
            backgroundColor: Pallete.blueColor,
            textColor: Pallete.whiteColor,
          ),
        ],
      ),body: currentUser == null ?
      const Loader() : 
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(currentUser.profilePic),
                    radius: 30,
                  ),
                  const SizedBox(width: 15),
                  // Expanded(
                  //   child: TextField(
                  //     controller: tweetTextController,
                  //     style: const TextStyle(
                  //       fontSize: 22,
                  //     ),
                  //     decoration: const InputDecoration(
                  //       hintText: "What's happening?",
                  //       hintStyle: TextStyle(
                  //         color: Pallete.greyColor,
                  //         fontSize: 22,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //       border: InputBorder.none,
                  //     ),
                  //     maxLines: null,
                  //   ),
                  // ),
                ],
              ),
              // if (images.isNotEmpty)
              //   CarouselSlider(
              //     items: images.map(
              //       (file) {
              //         return Container(
              //           width: MediaQuery.of(context).size.width,
              //           margin: const EdgeInsets.symmetric(
              //             horizontal: 5,
              //           ),
              //           child: Image.file(file),
              //         );
              //       },
              //     ).toList(),
              //     options: CarouselOptions(
              //       height: 400,
              //       enableInfiniteScroll: false,
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}