

import 'package:noppal_util/notification_push/info_view_notification.dart';

abstract class LineNP{
  bool showNotification=true;
  InfoViewNotification show();
  run(RemoteMessage message);
}