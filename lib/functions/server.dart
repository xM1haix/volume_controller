import 'dart:convert';
import 'dart:io';

void server() async {
  final int port = 12345;
  final server = await ServerSocket.bind(InternetAddress.anyIPv4, port);
  print('Server started: ${InternetAddress.anyIPv4}:$port');
  await for (Socket client in server) {
    handleConnection(client);
  }
}

void handleConnection(Socket client) {
  print('Connection from ${client.remoteAddress.address}:${client.remotePort}');
  client.close();
  client.listen((x) {
    final r = json.decode(utf8.decode(x)) as Map<String, dynamic>;
  });
}
