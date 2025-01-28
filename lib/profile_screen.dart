import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_assignment/profile_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = '';
  double _phone = 0;
  String _dob = '';
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    ProfileViewModel profile = Provider.of<ProfileViewModel>(context);
    final pref = await SharedPreferences.getInstance();

    setState(() {
      _name = pref.getString('name') ?? profile.name;
      _phone = pref.getDouble('phone') ?? profile.phone;
      _dob = pref.getString('dob') ?? profile.dob;
    });
  }

  Future<void> saveData() async {
    ProfileViewModel profile = Provider.of<ProfileViewModel>(context);
    final pref = await SharedPreferences.getInstance();
    pref.setString('name', profile.name);
    pref.setDouble('phone', profile.phone);
    pref.setString('dob', profile.dob);

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name: $_name',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Phone: ${_phone.toString()}',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'DOB: $_dob',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
