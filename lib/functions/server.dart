import "dart:convert";
import "dart:io";

import "package:flutter/widgets.dart";

Future<void> handleConnection(Socket client) async {
  debugPrint(
    "Connection from ${client.remoteAddress.address}:${client.remotePort}",
  );
  await client.close();
  client.listen((x) {
    final r = json.decode(utf8.decode(x)) as Map<String, dynamic>;
  });
}

Future<void> server() async {
  const port = 12345;
  final server = await ServerSocket.bind(InternetAddress.anyIPv4, port);
  debugPrint("Server started: ${InternetAddress.anyIPv4}:$port");
  await for (final Socket client in server) {
    await handleConnection(client);
  }
}
