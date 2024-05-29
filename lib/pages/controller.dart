import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:volume_controller/customs/popup.dart';
import 'package:volume_controller/functions/nav.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  String? device;
  final _ipController = TextEditingController(),
      _portController = TextEditingController();
  Socket? _socket;

  void _setConnection() async {
    final confirm = await popup(
      context: context,
      title: const Text("Set connection"),
      content: SizedBox(
        width: 400,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _ipController,
                decoration: const InputDecoration(labelText: 'IP Address'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: _portController,
                decoration: const InputDecoration(labelText: 'Port'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
      actions: [('Connect', true), ('Cancel', false)],
    );
    if (!mounted || confirm != true) return;
    loading(context);
    bool isLoading = true;
    final String ip = _ipController.text;
    final int port = int.tryParse(_portController.text) ?? 0;
    try {
      if (ip.isEmpty) throw "IP invalid";
      if (port < 0 || port > 65535) throw "Invalid port value";
      if (_socket != null) {
        _socket!.destroy();
      }
      final socket =
          await Socket.connect(ip, port, timeout: const Duration(seconds: 10));
      socket.listen(_listen);
      setState(() {
        _socket = socket;
        device = '$ip:$port';
      });
      if (!mounted) return;
      back(context);
      isLoading = false;
      _socket!.write("hi");
    } catch (e) {
      if (isLoading) {
        if (!mounted) return;
        back(context);
      }
      if (!mounted) return;
      errorPopup(context, e);
    }
  }

  void _mute() => _socket!.write(sendVolume({"MUTE": true}));
  void _sendVolume(double s) => _socket!.write(sendVolume({"SET": s}));

  void _listen(Uint8List x) {
    print(utf8.decode(x));
  }

  final double _volume = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(device ?? 'Not connected'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _setConnection,
          ),
        ],
      ),
      body: device == null
          ? const Center(
              child: Text('Connect to the device'),
            )
          : ListView(
              children: [
                Row(
                  children: [
                    Slider(
                      min: 0,
                      max: 100,
                      value: _volume,
                      onChangeEnd: _sendVolume,
                      onChanged: (s) => print(s),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_off_outlined),
                      onPressed: _mute,
                    )
                  ],
                )
              ],
            ),
    );
  }
}

String sendVolume(Map x) => json.encode({'VOLUME': x});
