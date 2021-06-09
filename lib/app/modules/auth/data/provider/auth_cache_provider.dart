import 'package:my_app/core/cache/cache_helper.dart';

class AuthCacheProvider {
  final CacheHelper _helper = CacheHelper();

  Future saveTokenToCache() async {
    print("saving login infos to cache");
    await _helper.save('is_connected', 'true');
  }

  retrieveTokenFromCache() async {
    final String? result = await _helper.read('is_connected');
    return result;
  }

  Future removeTokenFromCache() async {
    await _helper.remove('is_connected');
  }
}
