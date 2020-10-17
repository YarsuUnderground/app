import 'package:app/client/network.dart';

void main(List<String> args) async {
  NetworkClient client = new NetworkClient();
  String token = await client.register("adw", "awd", "awd", "awd", "awd");
  print(token);

  print(await client.getMyId(token));
}
