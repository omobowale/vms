import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_error_label.dart';
import 'package:vms/custom_widgets/custom_input_field.dart';
import 'package:vms/custom_widgets/custom_input_label.dart';
import 'package:vms/helperfunctions/custom_string_manipulations.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/partials/common/bottom_fixed_section.dart';
import 'package:vms/partials/visitor_information/visitor_address.dart';
import 'package:vms/partials/visitor_information/visitor_details.dart';
import 'package:vms/views/maker/appointment_location.dart';
import 'package:vms/views/maker/summary.dart';
import 'package:vms/views/view.dart';

class AddAnotherLink extends StatefulWidget {
  const AddAnotherLink({Key? key}) : super(key: key);

  @override
  State<AddAnotherLink> createState() => _AddAnotherLinkState();
}

class _AddAnotherLinkState extends State<AddAnotherLink> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String phoneNumber = "";

  void addEmail(AppointmentNotifier notifier, String email) {
    int noOfGuests = notifier.appointments[0].guests.length;
    var currentGuest = notifier.appointments[0].guests[noOfGuests - 1];
    notifier.addVisitorEmail(currentGuest, email);
  }

  void addPhoneNumber(AppointmentNotifier notifier, String phoneNumber) {
    int noOfGuests = notifier.appointments[0].guests.length;
    var currentGuest = notifier.appointments[0].guests[noOfGuests - 1];
    notifier.addVisitorPhoneNumber(currentGuest, phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context, listen: true);
    return GestureDetector(
      onTap: () async {
        _appointmentNotifier.addGuest();
        await showTopModalSheet<String>(
          context: context,
          child: Container(
            color: Palette.CUSTOM_WHITE,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                      vertical: 2,
                    ),
                    child: Text(
                      "Add new guest",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                  CustomInputLabel(labelText: "Email"),
                  CustomInputField(
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Please enter an email";
                        }
                        if (!CustomStringManipulation.validatEmail(value)) {
                          return "Please enter a valid email";
                        }
                        setState(() {
                          email = value;
                        });
                        return null;
                      },
                      hintText: "",
                      labelText: "",
                      bordered: false,
                      onComplete: (value) {}),
                  CustomInputLabel(labelText: "Phone Number"),
                  CustomInputField(
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please enter a phone number";
                      }
                      if (!CustomStringManipulation.validatPhoneNumber(value)) {
                        return "Please enter a valid phone number";
                      }
                      setState(() {
                        phoneNumber = value;
                      });

                      return null;
                    },
                    hintText: "",
                    labelText: "",
                    bordered: false,
                    onComplete: (value) {},
                  ),
                  BottomFixedSection(
                    leftText: "Cancel",
                    rightText: "Add",
                    fnOne: () {
                      context.read<AppointmentNotifier>().removeLastGuest();
                      Navigator.pop(context);
                    },
                    fnTwo: () {
                      if (_formKey.currentState!.validate()) {
                        addEmail(_appointmentNotifier, email);
                        addPhoneNumber(_appointmentNotifier, phoneNumber);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(
              Icons.add,
              color: Palette.FBN_BLUE,
            ),
            Text(
              "Add another guest",
              style: TextStyle(
                  color: Palette.FBN_BLUE, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
