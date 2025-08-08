import 'package:get/get.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
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
    final danielMaierPost = Post(
      id: '1',
      username:
          'Daniel Maier', // This seems to be the one from the image's original post
      userImage: AppConstants.profileImage,
      postImage: AppConstants.vegatable,
      userSubtitle: 'Meal prep & workouts',
      postOverlayText: 'Joining "Grow veg and herbs at home"',
      caption:
          'So proud of our little garden this year! With all the rain and all of the bugs 🐛 that have been flying around the past few weeks.',
      likes: '10',
      comments: '20',
      seeds: '3',
      shares: '15',
      isClimatehistory: true,
      followButton: true,
      reactedReactions: [AppIcons.handshake, AppIcons.clap, AppIcons.globe],
    );
    posts.addAll([
      Post(
        id: '2',
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
        reactedReactions: [AppIcons.handshake, AppIcons.clap, AppIcons.globe],
        selectedReactionIcon: AppIcons.clap,
      ),
      Post(
        id: '3',
        username: 'Daniel Maier',
        userImage: AppConstants.profileImage,
        postImage: AppConstants.vegatable,
        userSubtitle: 'Food prep & workout',
        postOverlayText: 'Joining "Grow veg and herbs at home"',
        caption:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo conseq',
        likes: '10',
        comments: '20',
        seeds: '3',
        shares: '15',
        followButton: true,
        isClipedpost: true,
      ),
      Post(
        id: '4',
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
        id: '5',
        username: 'Tony Lens', // The sharer
        userImage: AppConstants.profileImage, // Replace with Tony's image
        userSubtitle: 'Environmentalist', // Tony's subtitle
        postOverlayText: '', // Not relevant for this shared post example
        caption:
            'I\'ve got some left red wine in my fridge, does anyone know how to recycle it?', // Tony's shared thought
        likes: '15', // Tony's post likes (for the shared post itself)
        comments: '25', // Tony's post comments
        seeds: '5', // Tony's post seeds
        shares: '18', // Tony's post shares
        followButton: false,
        isSharedPost: true, // This is a shared post
        originalPost: danielMaierPost, // The original post being shared
        sharedThought:
            'I\'ve got some left red wine in my fridge, does anyone know how to recycle it?', // The thought Tony added
      ),
      Post(
        id: '6',
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
        isWorkshop: true,
        workshopTitle: AppStrings.workshopTitle,
      ),
      Post(
        id: '7',
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
