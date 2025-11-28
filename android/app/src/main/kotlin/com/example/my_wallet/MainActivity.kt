package com.example.my_wallet
import com.tekartik.sqflite.SqflitePlugin

import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    SqflitePlugin.registerWith(registrarFor("com.tekartik.sqflite.SqflitePlugin"))
}
