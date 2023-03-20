import 'Player.dart';

abstract class AbstractRound {
  int? _firstThrow;
  int? _secondThrow;
  int? _points;
  int _number;
  Player _player;

  AbstractRound? _previousRound;

  // Constructor
  AbstractRound(this._firstThrow, this._secondThrow, this._points, this._player, this._number);

  // Getters and setters
  int? get firstThrow => _firstThrow;

  set firstThrow(int? value) {
    _firstThrow = value;
  }

  int? get secondThrow => _secondThrow;

  set secondThrow(int? value) {
    _secondThrow = value;
  }

  int? get points => _points;

  set points(int? value) {
    _points = value;
  }


  int get number => _number;

  set number(int value) {
    _number = value;
  }

  Player get player => _player;

  set player(Player value) {
    _player = value;
  }

  AbstractRound? get previousRound => _previousRound;

  set previousRound(AbstractRound? value) {
    _previousRound = value;
  }

  bool computeNext(int val);
  void computePoints();
  bool shotIsStrike();

  bool isStrike() {
    return firstThrow==10;
  }

  bool isSpare(){
    return firstThrow!=10 && (firstThrow ?? 0)+(secondThrow ?? 0)==10;
  }

  bool isSpareOrStrike() {
    return (firstThrow ?? 0)+(secondThrow ?? 0)==10;
  }

  int getNbStrike();
  int getNbSpares();
  int getPinsKnockedDown();

  void subscribe(AbstractRound nextRound){
    nextRound.previousRound=this;
  }

  void update(int val){
    points = (points ?? 0) + val;
    previousRound?.update(val);
  }

  void unsubscribePreviousRound(){
    previousRound?.unsubscribePreviousRound();
    previousRound=null;
  }

}