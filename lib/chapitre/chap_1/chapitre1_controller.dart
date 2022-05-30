import 'package:easy_learning/chapitre/chap_1/chapitre1_observer.dart';
import 'package:flutter/cupertino.dart';

import 'chapitre1_view_model.dart';

class Chapitre1Controller extends ChangeNotifier
    implements Chapitre1ViewModelObserver {
  final Chapitre1ViewModel _chapitre1ViewModel;

  Chapitre1Controller(this._chapitre1ViewModel) {
    _chapitre1ViewModel.addObserver(this);
  }

  /// Notifies the list when quantity change.
  @override
  void onChapitre1Changed() {
    notifyListeners();
  }

  @override
  void dispose() {
    _chapitre1ViewModel.removeObserver(this);
    super.dispose();
  }

  double get prerequisChapitre1 => _chapitre1ViewModel.prerequisChapitre1;

  void updatePrerequisValue(double value) {
    _chapitre1ViewModel.updatePrerequisValue(value);
  }
}
