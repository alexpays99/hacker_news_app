import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/story.dart';

part 'stories_api_service.g.dart';

@RestApi()
abstract class StoriesApiService {
  factory StoriesApiService(Dio dio) = _StoriesApiService;

  @GET('/topstories.json')
  Future<List<int>> getTopStories();

  @GET('/item/{id}.json')
  Future<Story> getStory(@Path('id') int id);
}