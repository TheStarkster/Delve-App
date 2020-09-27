package com.grevity.delve_app

import android.annotation.SuppressLint
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.graphics.BitmapFactory
import android.os.Build
import android.util.Log
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage

@SuppressLint("MissingFirebaseInstanceTokenRefresh")
class NotificationService : FirebaseMessagingService() {
    lateinit var notificationManager : NotificationManager
    lateinit var notificationChannel : NotificationChannel
    lateinit var builder : Notification.Builder
    val channelId = "com.grevity.delve_app"
    val description = "Test notification"
    val context = this
    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        remoteMessage.data.isNotEmpty().let {
            Log.d("MyFirebaseService", "Message data payload: " + remoteMessage.notification)
            // db.insertData(Temp(remoteMessage.data["message"].toString()))

            val intent = Intent(this,MainActivity::class.java)
            val pendingIntent = PendingIntent.getActivity(this,0,intent,PendingIntent.FLAG_UPDATE_CURRENT)

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                notificationChannel = NotificationChannel(channelId,description,NotificationManager.IMPORTANCE_HIGH)
                notificationChannel.enableVibration(true)
                notificationManager.createNotificationChannel(notificationChannel)
                builder = Notification.Builder(this,channelId)
                        .setSmallIcon(R.drawable.common_google_signin_btn_icon_dark)
                        .setContentTitle(remoteMessage.data["title"].toString()).setContentText(remoteMessage.data["body"].toString())
                        .setLargeIcon(BitmapFactory.decodeResource(this.resources,R.drawable.common_full_open_on_phone))
                        .setContentIntent(pendingIntent)

            }else{
                builder = Notification.Builder(this)
                        .setSmallIcon(R.drawable.common_google_signin_btn_icon_dark).setContentTitle(remoteMessage.data["title"].toString()).setContentText(remoteMessage.data["body"].toString())
                        .setLargeIcon(BitmapFactory.decodeResource(this.resources,R.drawable.common_full_open_on_phone))
                        .setContentIntent(pendingIntent)
            }
            notificationManager.notify(1234,builder.build())
        }
    }
}