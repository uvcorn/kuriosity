import 'package:get/get.dart';
import '../models/post_model.dart';
import '../../../../utils/app_const/app_const.dart';

class PostController extends GetxController {
  RxList<Post> posts = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadPosts();
  }

  void _loadPosts() {
    posts.addAll([
      Post(
        username: 'Wendy Suzuki',
        userImage: AppConstants.profileImage,
        postImage: AppConstants.vegatable,
        userSubtitle: 'Self-taught sewist',
        postOverlayText: 'Self-taught sewist\n& Upcycler',
        caption:
            'Celebrating women-owned brands, ethical fashion,& #internationalwomensday with @wolfandbadger and some incredible women ...more',
        likes: '19',
        comments: '23',
        seeds: '4',
        shares: '23',
        isClipedpost: false,
      ),
      Post(
        username: 'Daniel Maier',
        userImage: AppConstants.profileImage,
        videoUrl:
            'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
        userSubtitle: 'Food prep & workout',
        postOverlayText: 'Joining "Grow veg and herbs at home"',
        caption:
            'So proud of our little garden this year! With all the rain and all of the bugs 🐛 that have been flying around the past few weeks.',
        likes: '10',
        comments: '20',
        seeds: '3',
        followButton: true,
        shares: '15',
        isClimatehistory: true,
      ),
      Post(
        username: 'Daniel Maier',
        userImage: AppConstants.profileImage,
        postImage: AppConstants.vegatable,
        userSubtitle: 'Food prep & workout',
        postOverlayText: 'Joining "Grow veg and herbs at home"',
        caption: 'So proud of our little garden this year! ...',
        likes: '10',
        comments: '20',
        seeds: '3',
        shares: '15',
        followButton: true,
        isClipedpost: true,
      ),
      Post(
        username: 'Amy Hyman',
        userImage: AppConstants.profileImage,
        userSubtitle: 'Happy homemaker',
        postOverlayText: 'Happy thoughts!',
        caption:
            '💛 I loved this caption! I can\'t wait to join... Check out this interesting article: https://www.google.com/about/',
        likes: '5',
        comments: '10',
        seeds: '1',
        shares: '5',
        isClimatehistory: true,
      ),
      Post(
        username: 'Tony Lane',
        userImage: AppConstants.profileImage,
        postImage: AppConstants.vegatable,
        userSubtitle: 'Wine enthusiast',
        postOverlayText: 'Good wine, good times',
        caption: 'I\'ve got some left red wine in my fridge...',
        likes: '15',
        comments: '25',
        seeds: '5',
        shares: '18',
        followButton: true,
      ),
    ]);
  }
}
