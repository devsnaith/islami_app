import 'package:flutter/material.dart';
import 'package:islami_app/fetching_data/model/user_model.dart';

class UserData extends StatelessWidget {
  const UserData(this.user, {super.key});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        leading: IconButton(onPressed: Navigator.of(context).pop, icon: const Icon(Icons.undo)),
        title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Card(child: Column(children: [
              ListTile(
                leading: const Icon(Icons.account_box),
                title: const Text("Username", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(user.username),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(user.name),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text("Email Address", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(user.email),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text("Phone Number", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(user.phone),
              ),
              ListTile(
                leading: const Icon(Icons.open_in_browser),
                title: const Text("Website URL", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(user.website),
              )])
            ),
            Card(child: Column(children: [
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text("Company BS", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(user.company.bs),
              ),
              ListTile(
                leading: const Icon(Icons.text_fields_outlined),
                title: const Text("Company Catch Phrase", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(user.company.catchPhrase),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text("Company Name", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(user.company.name),
              )])
            ),
            

            Card(child: Column(children: [
              ListTile(
                leading: const Icon(Icons.location_city),
                title: const Text("City", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(user.address.city),
              ),
              ListTile(
                leading: const Icon(Icons.streetview),
                title: const Text("Street", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(user.address.street),
              ),
              ListTile(
                leading: const Icon(Icons.location_history),
                title: const Text("Suite", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(user.address.suite),
              ),
              ListTile(
                leading: const Icon(Icons.code),
                title: const Text("Zipcode", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(user.address.zipcode),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text("Geo-LAT", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(user.address.geo.lat),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text("Geo-LNG", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(user.address.geo.lng),
              )])
            ),
          ]
        ),
      ),
    );
  }

}