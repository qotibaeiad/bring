import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  // Private constructor
  SocketService._private(String serverIp) {
    socket = IO.io('http://$serverIp', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
  }

  // Singleton instance
  static SocketService? _instance;

  factory SocketService(String serverIp) {
    _instance ??= SocketService._private(serverIp);
    return _instance!;
  }

  // Static getter for the instance
  static SocketService? get instance => _instance;

  void connect() {
    socket.connect();
  }

  void disconnect() {
    socket.disconnect();
  }

  void sendMessage(String decr, dynamic message) {
    socket.emit(decr, message);
  }

  void listenForMessages(Function(dynamic) callback) {
    socket.on('message', callback);
    socket.on('userAdded', (data) {
      // Handle the 'userAdded' event data
      callback(data);
    });
/*

    socket.on('itemAdded', (data) {
      print("Items add");
      // Handle the 'itemAdded' event data
      callback(data);
    });
*/
    socket.on('allItems', (items) {
      // Handle the received items
      callback(items);
    });
  }
}
