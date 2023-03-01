import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'GameDetail.dart';
import 'Player.dart';

abstract class IGameManager {
  // Methods
  GameDetail getGameById(Uuid id);
  List<GameDetail> getGamesByPlayerId(Uuid id);
  List<GameDetail> getGamesByPlayer(Player user);
  List<GameDetail> getGamesByPlayers(List<Player> users);
}