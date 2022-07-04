import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_check_box.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';
import 'package:vms/custom_widgets/custom_error_label.dart';
import 'package:vms/custom_widgets/custom_input_label.dart';
import 'package:vms/data/rooms.dart';
import 'package:vms/models/room.dart';
import 'package:vms/models/appointment.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/notifiers/asset_present_bool_notifier.dart';
import 'package:vms/notifiers/assets_notifier.dart';
import 'package:vms/notifiers/rooms_notifier.dart';

class AssetInformation extends StatelessWidget {
  const AssetInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context);
    AssetsNotifier _assetsNotifier = Provider.of<AssetsNotifier>(context);
    AssetPresentBoolNotifier _assetPresentBoolNotifier =
        Provider.of<AssetPresentBoolNotifier>(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Visibility(
        visible: _assetPresentBoolNotifier.currentlySelectedAssetPresentBool,
        replacement: Container(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInputLabel(
              labelText: "Select Assets",
            ),
            CustomErrorLabel(
                errorText:
                    _appointmentNotifier.allVisitorInformationErrors["assets"]),
            Container(
              child: Column(
                children: _assetsNotifier.allassets
                    .map(
                      (asset) => CustomCheckBox(
                        id: asset.id,
                        isClicked: (id) {
                          _appointmentNotifier.addAsset(asset);
                          _appointmentNotifier.removeError("assets");
                        },
                        checkList: _appointmentNotifier.appointments[0].assets,
                        labelText: asset.name.toString(),
                        checked: true,
                        isAvailable: true,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
