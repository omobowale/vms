import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';
import 'package:vms/custom_widgets/custom_error_label.dart';
import 'package:vms/custom_widgets/custom_input_field.dart';
import 'package:vms/custom_widgets/custom_input_label.dart';
import 'package:vms/helperfunctions/enumerationExtraction.dart';
import 'package:vms/helperfunctions/modify_appointment.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/notifiers/login_logout_notifier.dart';

class CancelPurpose extends StatefulWidget {
  const CancelPurpose({Key? key}) : super(key: key);

  @override
  State<CancelPurpose> createState() => _CancelPurposeState();
}

class _CancelPurposeState extends State<CancelPurpose> {
  late List<Map<String, dynamic>> list;
  bool othersInputVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    list = getAndSetEnumeration(
        context.read<LoginLogoutNotifier>().allEnums, "cancellationReasonEnum");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context);
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          CustomErrorLabel(
            errorText:
                _appointmentNotifier.allNewAppointmentErrors["purposeOfCancel"],
          ),
          CustomDropDown(
            onTap: (value) {
              if (value.toString().toLowerCase() == "others") {
                _appointmentNotifier.addPurposeOfCancel("");
                setState(() {
                  othersInputVisible = true;
                });
                print("others selected");
              } else {
                _appointmentNotifier.removeError("purposeOfCancel");
                _appointmentNotifier.addPurposeOfCancel(value);
                setState(() {
                  othersInputVisible = false;
                });
              }
            },
            text: list[0]["name"],
            lists: extractReasons(list).toSet(),
          ),
          Visibility(
            visible: othersInputVisible,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(labelText: "Others? Please specify"),
                  CustomInputField(
                    bordered: false,
                    hintText: "Others",
                    labelText: "",
                    onComplete: (value) {
                      _appointmentNotifier.addPurposeOfCancel(value);
                    },
                  ),
                ],
              ),
            ),
            replacement: Container(),
          ),
        ],
      ),
    );
  }
}
