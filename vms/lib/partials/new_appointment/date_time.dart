import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';

class DateTimeSection extends StatefulWidget {
  const DateTimeSection({Key? key}) : super(key: key);

  @override
  State<DateTimeSection> createState() => _DateTimeSectionState();
}

class _DateTimeSectionState extends State<DateTimeSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 20),
            child: Text(
              "Date & Time",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(2018, 3, 5),
                  maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                print('change $date');
              }, onConfirm: (date) {
                print('confirm $date');
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Container(
              padding: EdgeInsets.all(14),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Palette.LAVENDAR_GREY,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "12/07/22",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Icons.calendar_today,
                    color: Palette.FBN_BLUE,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: CustomDropDown(
                  lists: ['8:00AM', '9:00AM', '10:00AM', '11:00AM'],
                  text: "Start time",
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 5,
                child: CustomDropDown(
                  lists: ['8:00AM', '9:00AM', '10:00AM', '11:00AM'],
                  text: "End time",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
