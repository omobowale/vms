import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_error_label.dart';
import 'package:vms/custom_widgets/custom_input_label.dart';
import 'package:vms/custom_widgets/custom_radio_button.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/notifiers/asset_present_bool_notifier.dart';

class AssetCheckSection extends StatelessWidget {
  List<CustomRadioButton> radiolists = [];

  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context);
    AssetPresentBoolNotifier _assetPresentBoolNotifier =
        Provider.of<AssetPresentBoolNotifier>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputLabel(labelText: "Will asset be present?"),
          CustomErrorLabel(
              errorText: _appointmentNotifier
                  .allVisitorInformationErrors["isAssetPresent"]),
          ..._assetPresentBoolNotifier.allAssetPresentBools
              .map(
                (e) => CustomRadioButton(
                    isClicked: (value) {
                      _appointmentNotifier.addAssetPresentBool(value);
                      _assetPresentBoolNotifier
                          .addCurrentlySelectedAssetPresentBool(
                              e.isAssetPresentBool);
                      _appointmentNotifier.removeError("isAssetPresent");
                    },
                    checkText:
                        _appointmentNotifier.appointments[0].assetPresent,
                    labelText: e.isAssetPresent,
                    isAvailable: true),
              )
              .toList(),
        ],
      ),
    );
  }
}
