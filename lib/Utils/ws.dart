import 'package:web_socket_channel/io.dart';
import "../globals.dart" as globals;
import 'dart:convert';

void sendMessage(msg) {
  IOWebSocketChannel? channel;
  try {
    channel = IOWebSocketChannel.connect("ws://localhost:5000");
  } catch (e) {
    print("Error connecting to websocket: " + e.toString());
  }
  var sendDetails = jsonEncode({"message": msg, "token": globals.token});
  channel?.sink.add(sendDetails);

  channel?.stream.listen((event) {
    if (event!.isNotEmpty) {
      print("This is what came back >>>> $event");
    }
  });
}
