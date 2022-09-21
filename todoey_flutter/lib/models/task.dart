///
///
/// Conteins all components of a task
///
class Task {
  ///
  /// Task name
  ///
  final String name;

  ///
  /// Default is false
  /// Verify if task is completed
  ///
  bool isDone;

  ///
  /// Main constructor
  ///
  Task(
    this.name, {
    this.isDone = false,
  });

  ///
  /// Used to change completeness of a task
  ///
  void toggleDone() {
    isDone = !isDone;
  }
}
