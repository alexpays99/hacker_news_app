import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/config/providers.dart';
import '../datasources/stories_api_service.dart';
import '../models/story.dart';

part 'stories_repository_impl.g.dart';

abstract class StoriesRepository {
  Future<List<Story>> getTopStories();
  Future<Story> getStory(int id);
}

class StoriesRepositoryImpl implements StoriesRepository {
  StoriesRepositoryImpl(this._apiService);

  final StoriesApiService _apiService;

  @override
  Future<List<Story>> getTopStories() async {
    final storyIds = await _apiService.getTopStories();
    final stories = await Future.wait(
        storyIds.take(30).map((id) async => await getStory(id)));
    return stories;
  }

  @override
  Future<Story> getStory(int id) async {
    return _apiService.getStory(id);
  }
}

@riverpod
StoriesRepository storiesRepository(StoriesRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  final apiService = StoriesApiService(dio);
  return StoriesRepositoryImpl(apiService);
}
