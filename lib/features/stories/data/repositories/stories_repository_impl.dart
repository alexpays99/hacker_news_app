import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/config/providers.dart';
import '../datasources/stories_api_service.dart';
import '../models/story.dart';
import '../../../../core/services/cache_service.dart';

part 'stories_repository_impl.g.dart';

abstract class StoriesRepository {
  Future<List<Story>> getTopStories();
  Future<Story?> getStory(int id);
}

class StoriesRepositoryImpl implements StoriesRepository {
  StoriesRepositoryImpl(this._apiService);

  final StoriesApiService _apiService;

  @override
  Future<List<Story>> getTopStories() async {
    try {
      // Check cache first
      final cachedStories =
          CacheService.getCachedData(CacheService.storiesBox, 'top_stories');
      if (cachedStories != null) {
        return (cachedStories as List)
            .map((story) => Story.fromJson(story))
            .toList();
      }

      // If not in cache, fetch from API
      final storyIds = await _apiService.getTopStories();
      final stories =
          await Future.wait(storyIds.take(30).map((id) => getStory(id)));
      final validStories = stories
          .where((story) => story != null)
          .map((story) => story!)
          .toList();

      // Cache the fetched stories
      await CacheService.cacheData(CacheService.storiesBox, 'top_stories',
          validStories.map((story) => story.toJson()).toList());

      return validStories;
    } catch (e) {
      debugPrint('Error fetching top stories: $e');
      return [];
    }
  }

  @override
  Future<Story?> getStory(int id) async {
    try {
      // Check cache first
      final cachedStory =
          CacheService.getCachedData(CacheService.storiesBox, 'story_$id');
      if (cachedStory != null) {
        return Story.fromJson(cachedStory);
      }

      // If not in cache, fetch from API
      final story = await _apiService.getStory(id);
      await CacheService.cacheData(
          CacheService.storiesBox, 'story_$id', story.toJson());
      return story;
    } catch (e) {
      debugPrint('Error fetching story $id: $e');
      return null;
    }
  }
}

@riverpod
StoriesRepository storiesRepository(StoriesRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  final apiService = StoriesApiService(dio);
  return StoriesRepositoryImpl(apiService);
}
