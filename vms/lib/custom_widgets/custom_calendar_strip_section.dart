import 'package:flutter/material.dart';
import 'package:calendar_strip/calendar_strip.dart';
import 'package:vms/custom_classes/palette.dart';

class CustomCalendarStrip extends StatefulWidget {
  const CustomCalendarStrip({Key? key}) : super(key: key);

  @override
  State<CustomCalendarStrip> createState() => _CustomCalendarStripState();
}

class _CustomCalendarStripState extends State<CustomCalendarStrip> {
  DateTime startDate = DateTime.now().add(Duration(days: 0));
  DateTime endDate = DateTime.now().add(Duration(days: 7));
  DateTime selectedDate = DateTime.now();
  List<DateTime> markedDates = [
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().add(Duration(days: 4))
  ];

  onSelect(data) {
    print("Selected Date -> $data");
  }

  onWeekSelect(data) {
    print("Selected week starting at -> $data");
  }

  _monthNameWidget(monthName) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 40,
              decoration: BoxDecoration(
                color: Palette.CUSTOM_YELLOW,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_ios, size: 12),
                  Text(
                    "Exit",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Expanded(
            flex: 3,
            child: Text(
              monthName,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 8, bottom: 4),
    );
  }

  getMarkedIndicatorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(left: 1, right: 1),
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
      Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      )
    ]);
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.black26 : Colors.black87;
    TextStyle normalStyle =
        TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: 17, fontWeight: FontWeight.w800, color: Colors.black87);
    TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);
    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 12, bottom: 12),
          color: Palette.CUSTOM_WHITE,
          child: CalendarStrip(
            containerHeight: 120,
            startDate: startDate,
            endDate: endDate,
            onDateSelected: onSelect,
            onWeekSelected: onWeekSelect,
            dateTileBuilder: dateTileBuilder,
            iconColor: Palette.FBN_BLUE,
            monthNameWidget: _monthNameWidget,
            markedDates: markedDates,
            weekStartsOnSunday: true,
            containerDecoration: BoxDecoration(color: Palette.CUSTOM_WHITE),
          ),
        ),
      ],
    );
  }
}
