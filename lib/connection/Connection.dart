import 'dart:convert';

class Connection {
  final String ip;
  final String port;
  final String username;
  final String password;
  final String screens;

  Connection({
    this.ip = "192.168.1.92",
    this.port = "22",
    this.username = "lg",
    this.password = "1234asdfASDF",
    this.screens = "3",
  });

  Map<String, dynamic> toJson() {
    return {
      'ip': ip,
      'port': port,
      'username': username,
      'password': password,
      'screens': screens,
    };
  }
  String toJsonString() {
    return jsonEncode(toJson());
  }
}