import 'package:easy_learning/chapitre/chap_1/chapitre1_observer.dart';

class Chapitre1ViewModel {
  double _prerequisChapitre1;
  final Set<Chapitre1ViewModelObserver> _observers = {};
  Chapitre1ViewModel(this._prerequisChapitre1);

  /// Adds an observer to the collection of observers
  /// to be notified.
  void addObserver(Chapitre1ViewModelObserver observer) {
    _observers.add(observer);
  }

  /// Removes an observer from the collection of observe
  /// to be notified.
  void removeObserver(Chapitre1ViewModelObserver observer) {
    _observers.remove(observer);
  }

  void _notifyPrerequisChanged() {
    for (var observer in _observers) {
      observer.onChapitre1Changed();
    }
  }

  double get prerequisChapitre1 => _prerequisChapitre1;

  void updatePrerequisValue(double value) {
    _prerequisChapitre1 = value;
    _notifyPrerequisChanged();
  }
}
