import 'command.dart';

class Invoker {
  final List<Command> _history = [];

  void executeCommand(Command command) {
    _history.add(command);
    command.execute();
  }

  void undo() {
    if (_history.isNotEmpty) {
      final Command lastCommand = _history.removeLast();
      lastCommand.undo();
    } else {
      print('No command to undo');
    }
  }
}
