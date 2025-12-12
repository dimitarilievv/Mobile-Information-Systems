import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import '../services/api_service.dart';
import '../main.dart';

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static StreamSubscription<RemoteMessage>? _onMessageSub;
  static StreamSubscription<RemoteMessage>? _onMessageOpenedAppSub;
  static bool _handlersAttached = false;

  static bool _isInitialized = false;

  static Future<void> initialize() async {
    try {
      await _ensureFirebaseInitialized();
      await _initializeFirebaseMessaging();
      _isInitialized = true;
    } catch (e) {
      // Swallow init errors to avoid crashes
    }
  }

  static Future<void> _ensureFirebaseInitialized() async {
    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
      }
    } catch (_) {}
  }

  static Future<void> _initializeFirebaseMessaging() async {
    await FirebaseMessaging.instance.setAutoInitEnabled(true);

    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    if (_handlersAttached) {
      await _onMessageSub?.cancel();
      await _onMessageOpenedAppSub?.cancel();
      _handlersAttached = false;
    }

    _onMessageSub = FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    });

    _onMessageOpenedAppSub = FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      await _navigateToRandomRecipeFromNotification();
    });

    _handlersAttached = true;

    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      await _navigateToRandomRecipeFromNotification();
    }

    await subscribeToDailyRecipeTopic();

    final token = await _messaging.getToken();
    print("FCM TOKEN: $token");

  }

  static Future<String?> getFcmToken() async {
    try {
      final token = await _messaging.getToken();
      return token;
    } catch (_) {
      return null;
    }
  }

  static Future<void> subscribeToDailyRecipeTopic() async {
    try {
      await _messaging.subscribeToTopic('daily_recipe');
    } catch (_) {}
  }

  static Future<void> _navigateToRandomRecipeFromNotification() async {
    try {
      final apiService = ApiService();
      final randomMeal = await apiService.getRandomMeal();
      if (randomMeal != null) {
        navigatorKey.currentState?.pushNamed(
          '/meal-details',
          arguments: randomMeal.id,
        );
      } else {
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          '/home',
          (route) => false,
        );
      }
    } catch (_) {
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        '/home',
        (route) => false,
      );
    }
  }
}
