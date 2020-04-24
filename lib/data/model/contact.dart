import 'package:intl/intl.dart';
import 'package:startup_namer/data/model/location.dart';
import 'package:startup_namer/data/model/phone.dart';


class Contact {

  static final DateFormat _formatter = DateFormat('MMMM d, yyyy');

  final String fullName;
  final String gender;
  final String email;
  final String imageUrl;
  final String birthday;
  final Location location;
  final List<Phone> phones;

  const Contact({this.fullName, this.gender, this.email, this.imageUrl,
     this.birthday, this.location, this.phones});

  Contact.fromMap(Map<String, dynamic>  map) :
                    fullName = "${map['name']['first']} ${map['name']['last']}",
                    gender = map['gender'],
                    email = map['email'],
                    imageUrl = map['picture']['large'],
                    birthday = _formatter.format(DateTime.parse(map['dob']['date'])),
                    location = Location.fromMap(map['location']),
                    phones = <Phone>[
                      new Phone(type: 'Home',   number: map['phone']),
                      new Phone(type: 'Mobile', number: map['cell'])
                    ];
}