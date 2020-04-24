import 'package:startup_namer/data/model/contact.dart';
import 'package:startup_namer/data/repository/contact_repository.dart';
import 'package:startup_namer/data/repository/contact_repository_impl.dart';

abstract class ContactListViewContract {
  void onLoadContactsComplete(List<Contact> items);
  void onLoadContactsError();
}

class ContactListPresenter {
  ContactListViewContract _view;
  ContactRepository _repository;

  ContactListPresenter(this._view){
    _repository = new ContactRepositoryImpl();
  }

  void loadContacts(){
    assert(_view != null);

    _repository.fetch()
    .then((contacts) => _view.onLoadContactsComplete(contacts))
    .catchError((onError){
      print(onError);
      _view.onLoadContactsError();
    });
  }

}