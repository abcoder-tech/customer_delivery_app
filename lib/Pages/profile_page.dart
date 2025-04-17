import 'package:Ab_delivery/Pages/validators.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:Ab_delivery/Pages/responsive.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});


  void _showAdddisputeDialog(BuildContext context) {
    final TextEditingController _disputeTextController = TextEditingController();

    QuickAlert.show(
      context: context,
      type: QuickAlertType.custom,
      title: 'Edit Profile',
      confirmBtnText: 'Update',
      cancelBtnText: 'Cancel',
      widget: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8, // Limit height to 80% of screen
          maxWidth: MediaQuery.of(context).size.width * 0.9, // Limit width to 90% of screen
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(), // A text field for demonstration
              NameFieldValidation(), // Validates name
              PhoneFieldValidation(), // Validates phone
              EmailFieldValidation(), // Validates email
            ],
          ),
        ),
      ),
      onConfirmBtnTap: () {
        // Action when 'Update' is clicked
        print('Profile Updated');
      },
      onCancelBtnTap: () {
        Navigator.pop(context); // Closes the dialog
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Stack(
          children: [

            Container(
              color: Colors.red,
              height: 250.rh, // Instead of 250, using a responsive height
              width: double.infinity,
              child: ClipRRect(
                child: Image.asset(
                  'lib/assets/Images/ai-generated-beautuful-fast-food-background-with-copy-space-free-photo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            )
,

            // SizedBox(height: 100,),

            Padding(
              padding: EdgeInsets.only(top: 180.rh),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.rw),
                      topRight: Radius.circular(60.rw),
                    ),
                  ),
                  height: 600.rh,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 80.rh),
                    child: Column(
                      children: [
                        Text(
                          "View Profile",
                          style: TextStyle(
                            fontSize: 25.rw,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        SizedBox(height: 10.rh),
                        Padding(
                          padding: EdgeInsets.only(left: 60.rw),
                          child: Row(
                            children: [
                              Text(
                                "Name : ",
                                style: TextStyle(
                                  fontSize: 20.rw,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Abrham Getachew",
                                style: TextStyle(
                                  fontSize: 20.rw,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.rh),
                        Padding(
                          padding: EdgeInsets.only(left: 60.rw),
                          child: Row(
                            children: [
                              Text(
                                "Phone : ",
                                style: TextStyle(
                                  fontSize: 20.rw,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "0955172780",
                                style: TextStyle(
                                  fontSize: 20.rw,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.rh),
                        Padding(
                          padding: EdgeInsets.only(left: 60.rw),
                          child: Row(
                            children: [
                              Text(
                                "Email : ",
                                style: TextStyle(
                                  fontSize: 20.rw,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "abrhamgetachew@gmail.com",
                                  style: TextStyle(
                                    fontSize: 20.rw,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        )
                        ,
                        SizedBox(height: 10.rh),
                        Divider(),
                        SizedBox(height: 10.rh),
                        SizedBox(
                          width: double.infinity,
                          height: 60.rh,
                          child: TextButton(
                            onPressed: () {
                              print('Button clicked!');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Payment Details',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.rw,
                                  ),
                                ),
                                SizedBox(width: 8.rw),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 20.rw,
                                ),
                              ],
                            ),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.transparent,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 60.rh,
                          child: TextButton(
                            onPressed: () {
                              print('Button clicked!');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Order History',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.rw,
                                  ),
                                ),
                                SizedBox(width: 8.rw),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 20.rw,
                                ),
                              ],
                            ),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 90.rh, left: 120.rw),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30.rw)),
                ),
                height: 150.rh,
                width: 150.rw,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30.rw)),
                  child: Image.asset(
                    'lib/assets/Images/pp_picture.jpg', // Path to your image asset
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 650.rh),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Positioned(
                    width: 400.rw,
                    top: 700.rh,
                    child: Container(
                      width: 130.rw,
                      child: FloatingActionButton(
                        onPressed: () {
                          _showAdddisputeDialog(context);
                        },
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.rw),
                          side: BorderSide(color: Colors.greenAccent, width: 2.rw),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Edit Profile",
                              style: TextStyle(fontSize: 20.rw),
                            ),
                            Icon(
                              Icons.edit_note_outlined,
                              size: 20.rw,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    width: 400.rw,
                    top: 700.rh,
                    child: Container(
                      width: 130.rw,
                      child: FloatingActionButton(
                        onPressed: () {
                          print('Custom FAB Pressed!');
                        },
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.rw),
                          side: BorderSide(color: Colors.red, width: 2.rw),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Logout",
                              style: TextStyle(fontSize: 20.rw),
                            ),
                            Icon(
                              Icons.logout,
                              size: 20.rw,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],

        ),
      ),


    );

  }
}
