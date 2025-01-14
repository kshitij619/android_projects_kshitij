/*
  {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "رضا",
        "last": "یاسمی"
      },
      "location": {
        "street": {
          "number": 8816,
          "name": "شهید محمد منتظری"
        },
        "city": "گرگان",
        "state": "قم",
        "country": "Iran",
        "postcode": 86810,
        "coordinates": {
          "latitude": "20.4735",
          "longitude": "-114.0538"
        },
        "timezone": {
          "offset": "+2:00",
          "description": "Kaliningrad, South Africa"
        }
      },
      "email": "rd.ysmy@example.com",
      "login": {
        "uuid": "6f8e7f9d-3d69-4731-8701-b6562a29fb94",
        "username": "angrybutterfly740",
        "password": "jessica1",
        "salt": "oZxLDoes",
        "md5": "3e6f5fb06ffcc89e5bcd03b515b3068b",
        "sha1": "3c0f08a3f67da8e5e2dfb3c38eecd5a53ed7b6e7",
        "sha256": "e91eddf986707c8454591173ac0c9ed3cbbd72278797874a6545944d38b7f339"
      },
      "dob": {
        "date": "1968-03-16T18:09:05.025Z",
        "age": 56
      },
      "registered": {
        "date": "2008-09-05T02:40:46.147Z",
        "age": 16
      },
      "phone": "016-15975342",
      "cell": "0992-169-0284",
      "id": {
        "name": "",
        "value": null
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/43.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/43.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/43.jpg"
      },
      "nat": "IR"
    },
*/

class User {
  final String name;
  final String email;
  final String phone;
  final String pictureSmall;
  final String pictureLarge;
  final String gender;
  final String city;
  final String country;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.pictureSmall,
    required this.pictureLarge,
    required this.gender,
    required this.city,
    required this.country,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name:
          '${json['name']['title']} ${json['name']['first']}  ${json['name']['last']}',
      email: json['email'],
      phone: json['phone'],
      pictureSmall: json['picture']['thumbnail'],
      pictureLarge: json['picture']['large'],
      gender: json['gender'],
      city: json['location']['city'],
      country: json['location']['country'],
    );
  }
}
