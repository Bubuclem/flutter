import 'package:my_app/app/modules/auth/data/provider/auth_cache_provider.dart';

class AuthRepository {
  final _historyCache = AuthCacheProvider();

  Future saveLogin() async {
    await _historyCache.saveTokenToCache();
  }

  Future<String?> retrieve() async {
    return await _historyCache.retrieveTokenFromCache();
  }

  logout() async {
    await _historyCache.removeTokenFromCache();
  }
}
