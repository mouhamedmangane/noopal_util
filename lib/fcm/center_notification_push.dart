
import 'package:noppal_util/notification_push/info_view_notification.dart';
import 'package:noppal_util/notification_push/line_np.dart';

abstract class CenterNP{
  AndroidNotificationChannel channel;
  CenterNP({required this.channel})
  Map<String,LineNP> lines();
  LineNP? defaultLine();

  make(RemoteMessage event){
    Map<String,LineNP> l= lines();
    LineNP lineNP;
    if(l.containsKey(event.tilte)){
      lineNP= l[event.title]!;
    }
    else{
      lineNP=defaultLine();
    }

    lineNP.run(event);
    if(lineNP.showNotification){
      showLocalNotification(event,infoViewNotification)
    }
    
  }



  _showLocalNotification(RemoteMessage event,InfoViewNotification infoViewNotification){
    print(event.data);
    RemoteNotification? notification = event.notification;
    AndroidNotification? android = event.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          infoViewNotification.title,
          infoViewNotification.body,
          infoViewNotification.details
      );
    }
  }
}