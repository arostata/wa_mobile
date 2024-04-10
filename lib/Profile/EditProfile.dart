import 'package:flutter/material.dart';
import 'package:wa_mobile/model/UserModel.dart';

class EditProfile extends StatefulWidget {
  final UserModel user;
  const EditProfile({super.key, required this.user});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool profile = true;
  bool address = false;
  bool contact = false;

  @override
  void initState() {
    List<UserModel> user = [
      UserModel(
          userid: widget.user.userid,
          username: widget.user.username,
          password: widget.user.password,
          firstName: widget.user.firstName,
          lastName: widget.user.lastName,
          email: widget.user.email,
          phone: widget.user.phone,
          fullAddress: widget.user.fullAddress,
          city: widget.user.city,
          province: widget.user.province,
          postalCode: widget.user.postalCode,
          country: widget.user.country)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF675DC2),
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('lib/assets/avatar_person.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton.outlined(
                                    onPressed: () {
                                      setState(() {
                                        profile = !profile;
                                        if (address == true) {
                                          address = !address;
                                        }
                                        if (contact == true) {
                                          contact = !contact;
                                        } else if (address == false &&
                                            profile == false &&
                                            contact == false) {
                                          profile = true;
                                        }
                                      });
                                    },
                                    icon: const Icon(Icons.person_rounded,
                                        color: Color(0xff675DC2))),
                                IconButton.outlined(
                                    onPressed: () {
                                      setState(() {
                                        address = !address;
                                        if (profile == true) {
                                          profile = !profile;
                                        }
                                        if (contact == true) {
                                          contact = !contact;
                                        } else if (address == false &&
                                            profile == false &&
                                            contact == false) {
                                          profile = true;
                                        }
                                      });
                                    },
                                    icon: const Icon(Icons.email,
                                        color: Color(0xff675DC2))),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          profile
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              initialValue:
                                                  widget.user.firstName,
                                              // controller: fname,
                                              decoration: const InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'First Name',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              // controller: lname,
                                              initialValue:
                                                  widget.user.lastName,
                                              decoration: const InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Last Name',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              initialValue:
                                                  widget.user.username,
                                              // controller: login,
                                              decoration: const InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Login/Username',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              initialValue: widget.user.email,
                                              // controller: email,
                                              decoration: const InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Email',
                                                hintText: 'johndoe@email.com',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              initialValue: widget.user.phone,
                                              // controller: phone,
                                              decoration: const InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Phone/Telephone',
                                                hintText: 'number123456',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          address
                              ? Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: DropdownMenu(
                                                expandedInsets: EdgeInsets.zero,
                                                label:
                                                    Text('Province or State'),
                                                enableFilter: true,
                                                initialSelection: 'AZ',
                                                dropdownMenuEntries: [
                                                  DropdownMenuEntry(
                                                      value: 'CA',
                                                      label: 'California'),
                                                  DropdownMenuEntry(
                                                      value: 'AZ',
                                                      label: 'Arizona ')
                                                ],
                                                inputDecorationTheme:
                                                    InputDecorationTheme(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 5.0,
                                                          horizontal: 8.0),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                ),
                                              )),
                                        ),
                                        Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: DropdownMenu(
                                                expandedInsets: EdgeInsets.zero,
                                                label: Text('City'),
                                                enableFilter: true,
                                                initialSelection: 'PHX',
                                                dropdownMenuEntries: [
                                                  DropdownMenuEntry(
                                                      value: 'PHX',
                                                      label: 'Phoenix'),
                                                  DropdownMenuEntry(
                                                      value: 'NY',
                                                      label: 'New York')
                                                ],
                                                inputDecorationTheme:
                                                    InputDecorationTheme(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 5.0,
                                                          horizontal: 8.0),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              initialValue:
                                                  widget.user.postalCode,
                                              decoration: const InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Postal',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                              ),
                                              style: TextStyle(height: 1),
                                            ),
                                          ),
                                        ),
                                        const Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: DropdownMenu(
                                                expandedInsets: EdgeInsets.zero,
                                                label: Text('Country'),
                                                enableFilter: true,
                                                initialSelection: 'US',
                                                dropdownMenuEntries: [
                                                  DropdownMenuEntry(
                                                    value: 'US',
                                                    label: 'United States',
                                                  ),
                                                  DropdownMenuEntry(
                                                    value: 'PH',
                                                    label: 'Philippines',
                                                  )
                                                ],
                                                inputDecorationTheme:
                                                    InputDecorationTheme(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 5.0,
                                                          horizontal: 8.0),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              initialValue:
                                                  widget.user.fullAddress,
                                              decoration: const InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Address',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              : const SizedBox()
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      /* bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF675DC2)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              minimumSize: MaterialStateProperty.all<Size>(
                  const Size(double.infinity, 50)),
            ),
            child: const Text(
              'Save Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ), */
      bottomNavigationBar: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Adjust the padding as needed
          child: ElevatedButton(
            onPressed: null,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF675DC2)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              minimumSize: MaterialStateProperty.all<Size>(
                  const Size(double.infinity, 50)),
            ),
            child: const Text(
              'Save Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
