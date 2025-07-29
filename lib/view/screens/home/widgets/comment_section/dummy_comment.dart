import '../../../../../utils/app_const/app_const.dart';
import '../../models/comment_model.dart';
import '../../models/post_model.dart';

final List<Comment> dummyComments = [
  Comment(
    id: '1',
    username: 'user1',
    userImage: AppConstants.profile2Image,
    commentText: 'This is a great post!',
    likes: 5,
  ),
  Comment(
    id: '2',
    username: 'user2',
    userImage: AppConstants.profileImage,
    commentText: 'Thanks for sharing!',
    likes: 3,
  ),
  Comment(
    id: '3',
    username: 'user3',
    userImage: AppConstants.profile2Image,
    commentText: 'Interesting perspective.',
    likes: 1,
  ),
  Comment(
    id: '4',
    username: 'user4',
    userImage: AppConstants.profileImage,
    commentText: 'Loved the visuals!',
    likes: 2,
  ),
  Comment(
    id: '5',
    username: 'user5',
    userImage: AppConstants.profile2Image,
    commentText: 'Totally agree with your point.',
    likes: 4,
  ),
  Comment(
    id: '6',
    username: 'user6',
    userImage: AppConstants.profileImage,
    commentText: 'This inspired me a lot.',
    likes: 6,
  ),
  Comment(
    id: '7',
    username: 'user7',
    userImage: AppConstants.profile2Image,
    commentText: 'Nice work!',
    likes: 2,
  ),
  Comment(
    id: '8',
    username: 'user8',
    userImage: AppConstants.profileImage,
    commentText: 'How did you come up with this?',
    likes: 1,
  ),
  Comment(
    id: '9',
    username: 'user9',
    userImage: AppConstants.profile2Image,
    commentText: 'Couldn’t agree more.',
    likes: 5,
  ),
  Comment(
    id: '10',
    username: 'user10',
    userImage: AppConstants.profileImage,
    commentText: 'Great thought process!',
    likes: 3,
  ),
  Comment(
    id: '11',
    username: 'user11',
    userImage: AppConstants.profile2Image,
    commentText: 'Keep posting more like this.',
    likes: 2,
  ),
  Comment(
    id: '12',
    username: 'user12',
    userImage: AppConstants.profileImage,
    commentText: 'I shared this with my team.',
    likes: 4,
  ),
  Comment(
    id: '13',
    username: 'user13',
    userImage: AppConstants.profile2Image,
    commentText: 'This deserves more attention!',
    likes: 7,
  ),
  Comment(
    id: '14',
    username: 'user14',
    userImage: AppConstants.profileImage,
    commentText: 'Super informative, thanks!',
    likes: 3,
  ),
  Comment(
    id: '15',
    username: 'user15',
    userImage: AppConstants.profile2Image,
    commentText: 'Perfectly explained.',
    likes: 6,
  ),
];

final Post dummyPost = Post(
  id: '1',
  username: 'postUser',
  userImage: AppConstants.profileImage,
  userSubtitle: 'Subtitle',
  postOverlayText: 'Overlay Text',
  caption: 'This is a sample post caption.',
  likes: '10',
  comments: '3',
  seeds: '2',
  shares: '1',
);
