class TypeWritter {
  late final List<String> _words;
  int _letterDelay = 50;
  int _wordIndex = 0;
  int _charIndex = 0;
  void Function(void Function())? _stateFunc;
  bool _isMounted = true;

  TypeWritter.fromMultiple(this._words);
  TypeWritter.fromSingle(String str) {
    _words = [str];
  }

  void setLetterDelay(int ms) {
    _letterDelay = ms;
  }

  void setStateFunc(void Function(void Function()) f) => _stateFunc = f;

  String get() => _words[_wordIndex].substring(0, _charIndex);

  void dispose() {
    _isMounted = false;
  }

  Future<void> removeWord() async {
    if (_charIndex == 0 || !_isMounted) {
      return;
    }
    _charIndex--;
    _stateFunc?.call(() {});
    await Future.delayed(Duration(milliseconds: _letterDelay));
    await removeWord();
  }

  void nextWord() {
    _wordIndex = (_wordIndex + 1) % _words.length;
    _charIndex = 0;
  }

  Future<void> putWord() async {
    if (_charIndex >= _words[_wordIndex].length || !_isMounted) {
      return;
    }
    _charIndex++;
    _stateFunc?.call(() {});
    await Future.delayed(Duration(milliseconds: _letterDelay));
    await putWord();
  }
}
