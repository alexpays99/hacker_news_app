import '../../data/models/story.dart';

abstract class StoriesRepository {
  Future<List<Story>> getTopStories();
  Future<Story> getStory(int id);
}
