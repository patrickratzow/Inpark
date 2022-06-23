import 'package:flutter/material.dart';

import '../elements/attribute.dart';
import 'attribute_resolver.dart';

class IconDataResolver extends AttributeResolver<IconData?> {
  @override
  bool shouldResolve(Attribute attribute) => attribute.name == "icon";

  @override
  resolve(Attribute attribute, BuildContext context) {
    final value = attribute.value;
    if (value == "ten_k") return Icons.ten_k;
    if (value == "ten_k_sharp") return Icons.ten_k_sharp;
    if (value == "ten_k_rounded") return Icons.ten_k_rounded;
    if (value == "ten_k_outlined") return Icons.ten_k_outlined;
    if (value == "ten_mp") return Icons.ten_mp;
    if (value == "ten_mp_sharp") return Icons.ten_mp_sharp;
    if (value == "ten_mp_rounded") return Icons.ten_mp_rounded;
    if (value == "ten_mp_outlined") return Icons.ten_mp_outlined;
    if (value == "eleven_mp") return Icons.eleven_mp;
    if (value == "eleven_mp_sharp") return Icons.eleven_mp_sharp;
    if (value == "eleven_mp_rounded") return Icons.eleven_mp_rounded;
    if (value == "eleven_mp_outlined") return Icons.eleven_mp_outlined;
    if (value == "onetwothree") return Icons.onetwothree;
    if (value == "onetwothree_sharp") return Icons.onetwothree_sharp;
    if (value == "onetwothree_rounded") return Icons.onetwothree_rounded;
    if (value == "onetwothree_outlined") return Icons.onetwothree_outlined;
    if (value == "twelve_mp") return Icons.twelve_mp;
    if (value == "twelve_mp_sharp") return Icons.twelve_mp_sharp;
    if (value == "twelve_mp_rounded") return Icons.twelve_mp_rounded;
    if (value == "twelve_mp_outlined") return Icons.twelve_mp_outlined;
    if (value == "thirteen_mp") return Icons.thirteen_mp;
    if (value == "thirteen_mp_sharp") return Icons.thirteen_mp_sharp;
    if (value == "thirteen_mp_rounded") return Icons.thirteen_mp_rounded;
    if (value == "thirteen_mp_outlined") return Icons.thirteen_mp_outlined;
    if (value == "fourteen_mp") return Icons.fourteen_mp;
    if (value == "fourteen_mp_sharp") return Icons.fourteen_mp_sharp;
    if (value == "fourteen_mp_rounded") return Icons.fourteen_mp_rounded;
    if (value == "fourteen_mp_outlined") return Icons.fourteen_mp_outlined;
    if (value == "fifteen_mp") return Icons.fifteen_mp;
    if (value == "fifteen_mp_sharp") return Icons.fifteen_mp_sharp;
    if (value == "fifteen_mp_rounded") return Icons.fifteen_mp_rounded;
    if (value == "fifteen_mp_outlined") return Icons.fifteen_mp_outlined;
    if (value == "sixteen_mp") return Icons.sixteen_mp;
    if (value == "sixteen_mp_sharp") return Icons.sixteen_mp_sharp;
    if (value == "sixteen_mp_rounded") return Icons.sixteen_mp_rounded;
    if (value == "sixteen_mp_outlined") return Icons.sixteen_mp_outlined;
    if (value == "seventeen_mp") return Icons.seventeen_mp;
    if (value == "seventeen_mp_sharp") return Icons.seventeen_mp_sharp;
    if (value == "seventeen_mp_rounded") return Icons.seventeen_mp_rounded;
    if (value == "seventeen_mp_outlined") return Icons.seventeen_mp_outlined;
    if (value == "eighteen_up_rating") return Icons.eighteen_up_rating;
    if (value == "eighteen_up_rating_sharp")
      return Icons.eighteen_up_rating_sharp;
    if (value == "eighteen_up_rating_rounded")
      return Icons.eighteen_up_rating_rounded;
    if (value == "eighteen_up_rating_outlined")
      return Icons.eighteen_up_rating_outlined;
    if (value == "eighteen_mp") return Icons.eighteen_mp;
    if (value == "eighteen_mp_sharp") return Icons.eighteen_mp_sharp;
    if (value == "eighteen_mp_rounded") return Icons.eighteen_mp_rounded;
    if (value == "eighteen_mp_outlined") return Icons.eighteen_mp_outlined;
    if (value == "nineteen_mp") return Icons.nineteen_mp;
    if (value == "nineteen_mp_sharp") return Icons.nineteen_mp_sharp;
    if (value == "nineteen_mp_rounded") return Icons.nineteen_mp_rounded;
    if (value == "nineteen_mp_outlined") return Icons.nineteen_mp_outlined;
    if (value == "one_k") return Icons.one_k;
    if (value == "one_k_sharp") return Icons.one_k_sharp;
    if (value == "one_k_rounded") return Icons.one_k_rounded;
    if (value == "one_k_outlined") return Icons.one_k_outlined;
    if (value == "one_k_plus") return Icons.one_k_plus;
    if (value == "one_k_plus_sharp") return Icons.one_k_plus_sharp;
    if (value == "one_k_plus_rounded") return Icons.one_k_plus_rounded;
    if (value == "one_k_plus_outlined") return Icons.one_k_plus_outlined;
    if (value == "one_x_mobiledata") return Icons.one_x_mobiledata;
    if (value == "one_x_mobiledata_sharp") return Icons.one_x_mobiledata_sharp;
    if (value == "one_x_mobiledata_rounded")
      return Icons.one_x_mobiledata_rounded;
    if (value == "one_x_mobiledata_outlined")
      return Icons.one_x_mobiledata_outlined;
    if (value == "twenty_mp") return Icons.twenty_mp;
    if (value == "twenty_mp_sharp") return Icons.twenty_mp_sharp;
    if (value == "twenty_mp_rounded") return Icons.twenty_mp_rounded;
    if (value == "twenty_mp_outlined") return Icons.twenty_mp_outlined;
    if (value == "twenty_one_mp") return Icons.twenty_one_mp;
    if (value == "twenty_one_mp_sharp") return Icons.twenty_one_mp_sharp;
    if (value == "twenty_one_mp_rounded") return Icons.twenty_one_mp_rounded;
    if (value == "twenty_one_mp_outlined") return Icons.twenty_one_mp_outlined;
    if (value == "twenty_two_mp") return Icons.twenty_two_mp;
    if (value == "twenty_two_mp_sharp") return Icons.twenty_two_mp_sharp;
    if (value == "twenty_two_mp_rounded") return Icons.twenty_two_mp_rounded;
    if (value == "twenty_two_mp_outlined") return Icons.twenty_two_mp_outlined;
    if (value == "twenty_three_mp") return Icons.twenty_three_mp;
    if (value == "twenty_three_mp_sharp") return Icons.twenty_three_mp_sharp;
    if (value == "twenty_three_mp_rounded")
      return Icons.twenty_three_mp_rounded;
    if (value == "twenty_three_mp_outlined")
      return Icons.twenty_three_mp_outlined;
    if (value == "twenty_four_mp") return Icons.twenty_four_mp;
    if (value == "twenty_four_mp_sharp") return Icons.twenty_four_mp_sharp;
    if (value == "twenty_four_mp_rounded") return Icons.twenty_four_mp_rounded;
    if (value == "twenty_four_mp_outlined")
      return Icons.twenty_four_mp_outlined;
    if (value == "two_k") return Icons.two_k;
    if (value == "two_k_sharp") return Icons.two_k_sharp;
    if (value == "two_k_rounded") return Icons.two_k_rounded;
    if (value == "two_k_outlined") return Icons.two_k_outlined;
    if (value == "two_k_plus") return Icons.two_k_plus;
    if (value == "two_k_plus_sharp") return Icons.two_k_plus_sharp;
    if (value == "two_k_plus_rounded") return Icons.two_k_plus_rounded;
    if (value == "two_k_plus_outlined") return Icons.two_k_plus_outlined;
    if (value == "two_mp") return Icons.two_mp;
    if (value == "two_mp_sharp") return Icons.two_mp_sharp;
    if (value == "two_mp_rounded") return Icons.two_mp_rounded;
    if (value == "two_mp_outlined") return Icons.two_mp_outlined;
    if (value == "thirty_fps") return Icons.thirty_fps;
    if (value == "thirty_fps_sharp") return Icons.thirty_fps_sharp;
    if (value == "thirty_fps_rounded") return Icons.thirty_fps_rounded;
    if (value == "thirty_fps_outlined") return Icons.thirty_fps_outlined;
    if (value == "thirty_fps_select") return Icons.thirty_fps_select;
    if (value == "thirty_fps_select_sharp")
      return Icons.thirty_fps_select_sharp;
    if (value == "thirty_fps_select_rounded")
      return Icons.thirty_fps_select_rounded;
    if (value == "thirty_fps_select_outlined")
      return Icons.thirty_fps_select_outlined;
    if (value == "threesixty") return Icons.threesixty;
    if (value == "threesixty_sharp") return Icons.threesixty_sharp;
    if (value == "threesixty_rounded") return Icons.threesixty_rounded;
    if (value == "threesixty_outlined") return Icons.threesixty_outlined;
    if (value == "threed_rotation") return Icons.threed_rotation;
    if (value == "threed_rotation_sharp") return Icons.threed_rotation_sharp;
    if (value == "threed_rotation_rounded")
      return Icons.threed_rotation_rounded;
    if (value == "threed_rotation_outlined")
      return Icons.threed_rotation_outlined;
    if (value == "three_g_mobiledata") return Icons.three_g_mobiledata;
    if (value == "three_g_mobiledata_sharp")
      return Icons.three_g_mobiledata_sharp;
    if (value == "three_g_mobiledata_rounded")
      return Icons.three_g_mobiledata_rounded;
    if (value == "three_g_mobiledata_outlined")
      return Icons.three_g_mobiledata_outlined;
    if (value == "three_k") return Icons.three_k;
    if (value == "three_k_sharp") return Icons.three_k_sharp;
    if (value == "three_k_rounded") return Icons.three_k_rounded;
    if (value == "three_k_outlined") return Icons.three_k_outlined;
    if (value == "three_k_plus") return Icons.three_k_plus;
    if (value == "three_k_plus_sharp") return Icons.three_k_plus_sharp;
    if (value == "three_k_plus_rounded") return Icons.three_k_plus_rounded;
    if (value == "three_k_plus_outlined") return Icons.three_k_plus_outlined;
    if (value == "three_mp") return Icons.three_mp;
    if (value == "three_mp_sharp") return Icons.three_mp_sharp;
    if (value == "three_mp_rounded") return Icons.three_mp_rounded;
    if (value == "three_mp_outlined") return Icons.three_mp_outlined;
    if (value == "three_p") return Icons.three_p;
    if (value == "three_p_sharp") return Icons.three_p_sharp;
    if (value == "three_p_rounded") return Icons.three_p_rounded;
    if (value == "three_p_outlined") return Icons.three_p_outlined;
    if (value == "four_g_mobiledata") return Icons.four_g_mobiledata;
    if (value == "four_g_mobiledata_sharp")
      return Icons.four_g_mobiledata_sharp;
    if (value == "four_g_mobiledata_rounded")
      return Icons.four_g_mobiledata_rounded;
    if (value == "four_g_mobiledata_outlined")
      return Icons.four_g_mobiledata_outlined;
    if (value == "four_g_plus_mobiledata") return Icons.four_g_plus_mobiledata;
    if (value == "four_g_plus_mobiledata_sharp")
      return Icons.four_g_plus_mobiledata_sharp;
    if (value == "four_g_plus_mobiledata_rounded")
      return Icons.four_g_plus_mobiledata_rounded;
    if (value == "four_g_plus_mobiledata_outlined")
      return Icons.four_g_plus_mobiledata_outlined;
    if (value == "four_k") return Icons.four_k;
    if (value == "four_k_sharp") return Icons.four_k_sharp;
    if (value == "four_k_rounded") return Icons.four_k_rounded;
    if (value == "four_k_outlined") return Icons.four_k_outlined;
    if (value == "four_k_plus") return Icons.four_k_plus;
    if (value == "four_k_plus_sharp") return Icons.four_k_plus_sharp;
    if (value == "four_k_plus_rounded") return Icons.four_k_plus_rounded;
    if (value == "four_k_plus_outlined") return Icons.four_k_plus_outlined;
    if (value == "four_mp") return Icons.four_mp;
    if (value == "four_mp_sharp") return Icons.four_mp_sharp;
    if (value == "four_mp_rounded") return Icons.four_mp_rounded;
    if (value == "four_mp_outlined") return Icons.four_mp_outlined;
    if (value == "five_g") return Icons.five_g;
    if (value == "five_g_sharp") return Icons.five_g_sharp;
    if (value == "five_g_rounded") return Icons.five_g_rounded;
    if (value == "five_g_outlined") return Icons.five_g_outlined;
    if (value == "five_k") return Icons.five_k;
    if (value == "five_k_sharp") return Icons.five_k_sharp;
    if (value == "five_k_rounded") return Icons.five_k_rounded;
    if (value == "five_k_outlined") return Icons.five_k_outlined;
    if (value == "five_k_plus") return Icons.five_k_plus;
    if (value == "five_k_plus_sharp") return Icons.five_k_plus_sharp;
    if (value == "five_k_plus_rounded") return Icons.five_k_plus_rounded;
    if (value == "five_k_plus_outlined") return Icons.five_k_plus_outlined;
    if (value == "five_mp") return Icons.five_mp;
    if (value == "five_mp_sharp") return Icons.five_mp_sharp;
    if (value == "five_mp_rounded") return Icons.five_mp_rounded;
    if (value == "five_mp_outlined") return Icons.five_mp_outlined;
    if (value == "sixty_fps") return Icons.sixty_fps;
    if (value == "sixty_fps_sharp") return Icons.sixty_fps_sharp;
    if (value == "sixty_fps_rounded") return Icons.sixty_fps_rounded;
    if (value == "sixty_fps_outlined") return Icons.sixty_fps_outlined;
    if (value == "sixty_fps_select") return Icons.sixty_fps_select;
    if (value == "sixty_fps_select_sharp") return Icons.sixty_fps_select_sharp;
    if (value == "sixty_fps_select_rounded")
      return Icons.sixty_fps_select_rounded;
    if (value == "sixty_fps_select_outlined")
      return Icons.sixty_fps_select_outlined;
    if (value == "six_ft_apart") return Icons.six_ft_apart;
    if (value == "six_ft_apart_sharp") return Icons.six_ft_apart_sharp;
    if (value == "six_ft_apart_rounded") return Icons.six_ft_apart_rounded;
    if (value == "six_ft_apart_outlined") return Icons.six_ft_apart_outlined;
    if (value == "six_k") return Icons.six_k;
    if (value == "six_k_sharp") return Icons.six_k_sharp;
    if (value == "six_k_rounded") return Icons.six_k_rounded;
    if (value == "six_k_outlined") return Icons.six_k_outlined;
    if (value == "six_k_plus") return Icons.six_k_plus;
    if (value == "six_k_plus_sharp") return Icons.six_k_plus_sharp;
    if (value == "six_k_plus_rounded") return Icons.six_k_plus_rounded;
    if (value == "six_k_plus_outlined") return Icons.six_k_plus_outlined;
    if (value == "six_mp") return Icons.six_mp;
    if (value == "six_mp_sharp") return Icons.six_mp_sharp;
    if (value == "six_mp_rounded") return Icons.six_mp_rounded;
    if (value == "six_mp_outlined") return Icons.six_mp_outlined;
    if (value == "seven_k") return Icons.seven_k;
    if (value == "seven_k_sharp") return Icons.seven_k_sharp;
    if (value == "seven_k_rounded") return Icons.seven_k_rounded;
    if (value == "seven_k_outlined") return Icons.seven_k_outlined;
    if (value == "seven_k_plus") return Icons.seven_k_plus;
    if (value == "seven_k_plus_sharp") return Icons.seven_k_plus_sharp;
    if (value == "seven_k_plus_rounded") return Icons.seven_k_plus_rounded;
    if (value == "seven_k_plus_outlined") return Icons.seven_k_plus_outlined;
    if (value == "seven_mp") return Icons.seven_mp;
    if (value == "seven_mp_sharp") return Icons.seven_mp_sharp;
    if (value == "seven_mp_rounded") return Icons.seven_mp_rounded;
    if (value == "seven_mp_outlined") return Icons.seven_mp_outlined;
    if (value == "eight_k") return Icons.eight_k;
    if (value == "eight_k_sharp") return Icons.eight_k_sharp;
    if (value == "eight_k_rounded") return Icons.eight_k_rounded;
    if (value == "eight_k_outlined") return Icons.eight_k_outlined;
    if (value == "eight_k_plus") return Icons.eight_k_plus;
    if (value == "eight_k_plus_sharp") return Icons.eight_k_plus_sharp;
    if (value == "eight_k_plus_rounded") return Icons.eight_k_plus_rounded;
    if (value == "eight_k_plus_outlined") return Icons.eight_k_plus_outlined;
    if (value == "eight_mp") return Icons.eight_mp;
    if (value == "eight_mp_sharp") return Icons.eight_mp_sharp;
    if (value == "eight_mp_rounded") return Icons.eight_mp_rounded;
    if (value == "eight_mp_outlined") return Icons.eight_mp_outlined;
    if (value == "nine_k") return Icons.nine_k;
    if (value == "nine_k_sharp") return Icons.nine_k_sharp;
    if (value == "nine_k_rounded") return Icons.nine_k_rounded;
    if (value == "nine_k_outlined") return Icons.nine_k_outlined;
    if (value == "nine_k_plus") return Icons.nine_k_plus;
    if (value == "nine_k_plus_sharp") return Icons.nine_k_plus_sharp;
    if (value == "nine_k_plus_rounded") return Icons.nine_k_plus_rounded;
    if (value == "nine_k_plus_outlined") return Icons.nine_k_plus_outlined;
    if (value == "nine_mp") return Icons.nine_mp;
    if (value == "nine_mp_sharp") return Icons.nine_mp_sharp;
    if (value == "nine_mp_rounded") return Icons.nine_mp_rounded;
    if (value == "nine_mp_outlined") return Icons.nine_mp_outlined;
    if (value == "abc") return Icons.abc;
    if (value == "abc_sharp") return Icons.abc_sharp;
    if (value == "abc_rounded") return Icons.abc_rounded;
    if (value == "abc_outlined") return Icons.abc_outlined;
    if (value == "ac_unit") return Icons.ac_unit;
    if (value == "ac_unit_sharp") return Icons.ac_unit_sharp;
    if (value == "ac_unit_rounded") return Icons.ac_unit_rounded;
    if (value == "ac_unit_outlined") return Icons.ac_unit_outlined;
    if (value == "access_alarm") return Icons.access_alarm;
    if (value == "access_alarm_sharp") return Icons.access_alarm_sharp;
    if (value == "access_alarm_rounded") return Icons.access_alarm_rounded;
    if (value == "access_alarm_outlined") return Icons.access_alarm_outlined;
    if (value == "access_alarms") return Icons.access_alarms;
    if (value == "access_alarms_sharp") return Icons.access_alarms_sharp;
    if (value == "access_alarms_rounded") return Icons.access_alarms_rounded;
    if (value == "access_alarms_outlined") return Icons.access_alarms_outlined;
    if (value == "access_time") return Icons.access_time;
    if (value == "access_time_sharp") return Icons.access_time_sharp;
    if (value == "access_time_rounded") return Icons.access_time_rounded;
    if (value == "access_time_outlined") return Icons.access_time_outlined;
    if (value == "access_time_filled") return Icons.access_time_filled;
    if (value == "access_time_filled_sharp")
      return Icons.access_time_filled_sharp;
    if (value == "access_time_filled_rounded")
      return Icons.access_time_filled_rounded;
    if (value == "access_time_filled_outlined")
      return Icons.access_time_filled_outlined;
    if (value == "accessibility") return Icons.accessibility;
    if (value == "accessibility_sharp") return Icons.accessibility_sharp;
    if (value == "accessibility_rounded") return Icons.accessibility_rounded;
    if (value == "accessibility_outlined") return Icons.accessibility_outlined;
    if (value == "accessibility_new") return Icons.accessibility_new;
    if (value == "accessibility_new_sharp")
      return Icons.accessibility_new_sharp;
    if (value == "accessibility_new_rounded")
      return Icons.accessibility_new_rounded;
    if (value == "accessibility_new_outlined")
      return Icons.accessibility_new_outlined;
    if (value == "accessible") return Icons.accessible;
    if (value == "accessible_sharp") return Icons.accessible_sharp;
    if (value == "accessible_rounded") return Icons.accessible_rounded;
    if (value == "accessible_outlined") return Icons.accessible_outlined;
    if (value == "accessible_forward") return Icons.accessible_forward;
    if (value == "accessible_forward_sharp")
      return Icons.accessible_forward_sharp;
    if (value == "accessible_forward_rounded")
      return Icons.accessible_forward_rounded;
    if (value == "accessible_forward_outlined")
      return Icons.accessible_forward_outlined;
    if (value == "account_balance") return Icons.account_balance;
    if (value == "account_balance_sharp") return Icons.account_balance_sharp;
    if (value == "account_balance_rounded")
      return Icons.account_balance_rounded;
    if (value == "account_balance_outlined")
      return Icons.account_balance_outlined;
    if (value == "account_balance_wallet") return Icons.account_balance_wallet;
    if (value == "account_balance_wallet_sharp")
      return Icons.account_balance_wallet_sharp;
    if (value == "account_balance_wallet_rounded")
      return Icons.account_balance_wallet_rounded;
    if (value == "account_balance_wallet_outlined")
      return Icons.account_balance_wallet_outlined;
    if (value == "account_box") return Icons.account_box;
    if (value == "account_box_sharp") return Icons.account_box_sharp;
    if (value == "account_box_rounded") return Icons.account_box_rounded;
    if (value == "account_box_outlined") return Icons.account_box_outlined;
    if (value == "account_circle") return Icons.account_circle;
    if (value == "account_circle_sharp") return Icons.account_circle_sharp;
    if (value == "account_circle_rounded") return Icons.account_circle_rounded;
    if (value == "account_circle_outlined")
      return Icons.account_circle_outlined;
    if (value == "account_tree") return Icons.account_tree;
    if (value == "account_tree_sharp") return Icons.account_tree_sharp;
    if (value == "account_tree_rounded") return Icons.account_tree_rounded;
    if (value == "account_tree_outlined") return Icons.account_tree_outlined;
    if (value == "ad_units") return Icons.ad_units;
    if (value == "ad_units_sharp") return Icons.ad_units_sharp;
    if (value == "ad_units_rounded") return Icons.ad_units_rounded;
    if (value == "ad_units_outlined") return Icons.ad_units_outlined;
    if (value == "adb") return Icons.adb;
    if (value == "adb_sharp") return Icons.adb_sharp;
    if (value == "adb_rounded") return Icons.adb_rounded;
    if (value == "adb_outlined") return Icons.adb_outlined;
    if (value == "add") return Icons.add;
    if (value == "add_sharp") return Icons.add_sharp;
    if (value == "add_rounded") return Icons.add_rounded;
    if (value == "add_outlined") return Icons.add_outlined;
    if (value == "add_a_photo") return Icons.add_a_photo;
    if (value == "add_a_photo_sharp") return Icons.add_a_photo_sharp;
    if (value == "add_a_photo_rounded") return Icons.add_a_photo_rounded;
    if (value == "add_a_photo_outlined") return Icons.add_a_photo_outlined;
    if (value == "add_alarm") return Icons.add_alarm;
    if (value == "add_alarm_sharp") return Icons.add_alarm_sharp;
    if (value == "add_alarm_rounded") return Icons.add_alarm_rounded;
    if (value == "add_alarm_outlined") return Icons.add_alarm_outlined;
    if (value == "add_alert") return Icons.add_alert;
    if (value == "add_alert_sharp") return Icons.add_alert_sharp;
    if (value == "add_alert_rounded") return Icons.add_alert_rounded;
    if (value == "add_alert_outlined") return Icons.add_alert_outlined;
    if (value == "add_box") return Icons.add_box;
    if (value == "add_box_sharp") return Icons.add_box_sharp;
    if (value == "add_box_rounded") return Icons.add_box_rounded;
    if (value == "add_box_outlined") return Icons.add_box_outlined;
    if (value == "add_business") return Icons.add_business;
    if (value == "add_business_sharp") return Icons.add_business_sharp;
    if (value == "add_business_rounded") return Icons.add_business_rounded;
    if (value == "add_business_outlined") return Icons.add_business_outlined;
    if (value == "add_call") return Icons.add_call;
    if (value == "add_card") return Icons.add_card;
    if (value == "add_card_sharp") return Icons.add_card_sharp;
    if (value == "add_card_rounded") return Icons.add_card_rounded;
    if (value == "add_card_outlined") return Icons.add_card_outlined;
    if (value == "add_chart") return Icons.add_chart;
    if (value == "add_chart_sharp") return Icons.add_chart_sharp;
    if (value == "add_chart_rounded") return Icons.add_chart_rounded;
    if (value == "add_chart_outlined") return Icons.add_chart_outlined;
    if (value == "add_circle") return Icons.add_circle;
    if (value == "add_circle_sharp") return Icons.add_circle_sharp;
    if (value == "add_circle_rounded") return Icons.add_circle_rounded;
    if (value == "add_circle_outlined") return Icons.add_circle_outlined;
    if (value == "add_circle_outline") return Icons.add_circle_outline;
    if (value == "add_circle_outline_sharp")
      return Icons.add_circle_outline_sharp;
    if (value == "add_circle_outline_rounded")
      return Icons.add_circle_outline_rounded;
    if (value == "add_circle_outline_outlined")
      return Icons.add_circle_outline_outlined;
    if (value == "add_comment") return Icons.add_comment;
    if (value == "add_comment_sharp") return Icons.add_comment_sharp;
    if (value == "add_comment_rounded") return Icons.add_comment_rounded;
    if (value == "add_comment_outlined") return Icons.add_comment_outlined;
    if (value == "add_home") return Icons.add_home;
    if (value == "add_home_sharp") return Icons.add_home_sharp;
    if (value == "add_home_rounded") return Icons.add_home_rounded;
    if (value == "add_home_outlined") return Icons.add_home_outlined;
    if (value == "add_home_work") return Icons.add_home_work;
    if (value == "add_home_work_sharp") return Icons.add_home_work_sharp;
    if (value == "add_home_work_rounded") return Icons.add_home_work_rounded;
    if (value == "add_home_work_outlined") return Icons.add_home_work_outlined;
    if (value == "add_ic_call") return Icons.add_ic_call;
    if (value == "add_ic_call_sharp") return Icons.add_ic_call_sharp;
    if (value == "add_ic_call_rounded") return Icons.add_ic_call_rounded;
    if (value == "add_ic_call_outlined") return Icons.add_ic_call_outlined;
    if (value == "add_link") return Icons.add_link;
    if (value == "add_link_sharp") return Icons.add_link_sharp;
    if (value == "add_link_rounded") return Icons.add_link_rounded;
    if (value == "add_link_outlined") return Icons.add_link_outlined;
    if (value == "add_location") return Icons.add_location;
    if (value == "add_location_sharp") return Icons.add_location_sharp;
    if (value == "add_location_rounded") return Icons.add_location_rounded;
    if (value == "add_location_outlined") return Icons.add_location_outlined;
    if (value == "add_location_alt") return Icons.add_location_alt;
    if (value == "add_location_alt_sharp") return Icons.add_location_alt_sharp;
    if (value == "add_location_alt_rounded")
      return Icons.add_location_alt_rounded;
    if (value == "add_location_alt_outlined")
      return Icons.add_location_alt_outlined;
    if (value == "add_moderator") return Icons.add_moderator;
    if (value == "add_moderator_sharp") return Icons.add_moderator_sharp;
    if (value == "add_moderator_rounded") return Icons.add_moderator_rounded;
    if (value == "add_moderator_outlined") return Icons.add_moderator_outlined;
    if (value == "add_photo_alternate") return Icons.add_photo_alternate;
    if (value == "add_photo_alternate_sharp")
      return Icons.add_photo_alternate_sharp;
    if (value == "add_photo_alternate_rounded")
      return Icons.add_photo_alternate_rounded;
    if (value == "add_photo_alternate_outlined")
      return Icons.add_photo_alternate_outlined;
    if (value == "add_reaction") return Icons.add_reaction;
    if (value == "add_reaction_sharp") return Icons.add_reaction_sharp;
    if (value == "add_reaction_rounded") return Icons.add_reaction_rounded;
    if (value == "add_reaction_outlined") return Icons.add_reaction_outlined;
    if (value == "add_road") return Icons.add_road;
    if (value == "add_road_sharp") return Icons.add_road_sharp;
    if (value == "add_road_rounded") return Icons.add_road_rounded;
    if (value == "add_road_outlined") return Icons.add_road_outlined;
    if (value == "add_shopping_cart") return Icons.add_shopping_cart;
    if (value == "add_shopping_cart_sharp")
      return Icons.add_shopping_cart_sharp;
    if (value == "add_shopping_cart_rounded")
      return Icons.add_shopping_cart_rounded;
    if (value == "add_shopping_cart_outlined")
      return Icons.add_shopping_cart_outlined;
    if (value == "add_task") return Icons.add_task;
    if (value == "add_task_sharp") return Icons.add_task_sharp;
    if (value == "add_task_rounded") return Icons.add_task_rounded;
    if (value == "add_task_outlined") return Icons.add_task_outlined;
    if (value == "add_to_drive") return Icons.add_to_drive;
    if (value == "add_to_drive_sharp") return Icons.add_to_drive_sharp;
    if (value == "add_to_drive_rounded") return Icons.add_to_drive_rounded;
    if (value == "add_to_drive_outlined") return Icons.add_to_drive_outlined;
    if (value == "add_to_home_screen") return Icons.add_to_home_screen;
    if (value == "add_to_home_screen_sharp")
      return Icons.add_to_home_screen_sharp;
    if (value == "add_to_home_screen_rounded")
      return Icons.add_to_home_screen_rounded;
    if (value == "add_to_home_screen_outlined")
      return Icons.add_to_home_screen_outlined;
    if (value == "add_to_photos") return Icons.add_to_photos;
    if (value == "add_to_photos_sharp") return Icons.add_to_photos_sharp;
    if (value == "add_to_photos_rounded") return Icons.add_to_photos_rounded;
    if (value == "add_to_photos_outlined") return Icons.add_to_photos_outlined;
    if (value == "add_to_queue") return Icons.add_to_queue;
    if (value == "add_to_queue_sharp") return Icons.add_to_queue_sharp;
    if (value == "add_to_queue_rounded") return Icons.add_to_queue_rounded;
    if (value == "add_to_queue_outlined") return Icons.add_to_queue_outlined;
    if (value == "addchart") return Icons.addchart;
    if (value == "addchart_sharp") return Icons.addchart_sharp;
    if (value == "addchart_rounded") return Icons.addchart_rounded;
    if (value == "addchart_outlined") return Icons.addchart_outlined;
    if (value == "adf_scanner") return Icons.adf_scanner;
    if (value == "adf_scanner_sharp") return Icons.adf_scanner_sharp;
    if (value == "adf_scanner_rounded") return Icons.adf_scanner_rounded;
    if (value == "adf_scanner_outlined") return Icons.adf_scanner_outlined;
    if (value == "adjust") return Icons.adjust;
    if (value == "adjust_sharp") return Icons.adjust_sharp;
    if (value == "adjust_rounded") return Icons.adjust_rounded;
    if (value == "adjust_outlined") return Icons.adjust_outlined;
    if (value == "admin_panel_settings") return Icons.admin_panel_settings;
    if (value == "admin_panel_settings_sharp")
      return Icons.admin_panel_settings_sharp;
    if (value == "admin_panel_settings_rounded")
      return Icons.admin_panel_settings_rounded;
    if (value == "admin_panel_settings_outlined")
      return Icons.admin_panel_settings_outlined;
    if (value == "adobe") return Icons.adobe;
    if (value == "adobe_sharp") return Icons.adobe_sharp;
    if (value == "adobe_rounded") return Icons.adobe_rounded;
    if (value == "adobe_outlined") return Icons.adobe_outlined;
    if (value == "ads_click") return Icons.ads_click;
    if (value == "ads_click_sharp") return Icons.ads_click_sharp;
    if (value == "ads_click_rounded") return Icons.ads_click_rounded;
    if (value == "ads_click_outlined") return Icons.ads_click_outlined;
    if (value == "agriculture") return Icons.agriculture;
    if (value == "agriculture_sharp") return Icons.agriculture_sharp;
    if (value == "agriculture_rounded") return Icons.agriculture_rounded;
    if (value == "agriculture_outlined") return Icons.agriculture_outlined;
    if (value == "air") return Icons.air;
    if (value == "air_sharp") return Icons.air_sharp;
    if (value == "air_rounded") return Icons.air_rounded;
    if (value == "air_outlined") return Icons.air_outlined;
    if (value == "airline_seat_flat") return Icons.airline_seat_flat;
    if (value == "airline_seat_flat_sharp")
      return Icons.airline_seat_flat_sharp;
    if (value == "airline_seat_flat_rounded")
      return Icons.airline_seat_flat_rounded;
    if (value == "airline_seat_flat_outlined")
      return Icons.airline_seat_flat_outlined;
    if (value == "airline_seat_flat_angled")
      return Icons.airline_seat_flat_angled;
    if (value == "airline_seat_flat_angled_sharp")
      return Icons.airline_seat_flat_angled_sharp;
    if (value == "airline_seat_flat_angled_rounded")
      return Icons.airline_seat_flat_angled_rounded;
    if (value == "airline_seat_flat_angled_outlined")
      return Icons.airline_seat_flat_angled_outlined;
    if (value == "airline_seat_individual_suite")
      return Icons.airline_seat_individual_suite;
    if (value == "airline_seat_individual_suite_sharp")
      return Icons.airline_seat_individual_suite_sharp;
    if (value == "airline_seat_individual_suite_rounded")
      return Icons.airline_seat_individual_suite_rounded;
    if (value == "airline_seat_individual_suite_outlined")
      return Icons.airline_seat_individual_suite_outlined;
    if (value == "airline_seat_legroom_extra")
      return Icons.airline_seat_legroom_extra;
    if (value == "airline_seat_legroom_extra_sharp")
      return Icons.airline_seat_legroom_extra_sharp;
    if (value == "airline_seat_legroom_extra_rounded")
      return Icons.airline_seat_legroom_extra_rounded;
    if (value == "airline_seat_legroom_extra_outlined")
      return Icons.airline_seat_legroom_extra_outlined;
    if (value == "airline_seat_legroom_normal")
      return Icons.airline_seat_legroom_normal;
    if (value == "airline_seat_legroom_normal_sharp")
      return Icons.airline_seat_legroom_normal_sharp;
    if (value == "airline_seat_legroom_normal_rounded")
      return Icons.airline_seat_legroom_normal_rounded;
    if (value == "airline_seat_legroom_normal_outlined")
      return Icons.airline_seat_legroom_normal_outlined;
    if (value == "airline_seat_legroom_reduced")
      return Icons.airline_seat_legroom_reduced;
    if (value == "airline_seat_legroom_reduced_sharp")
      return Icons.airline_seat_legroom_reduced_sharp;
    if (value == "airline_seat_legroom_reduced_rounded")
      return Icons.airline_seat_legroom_reduced_rounded;
    if (value == "airline_seat_legroom_reduced_outlined")
      return Icons.airline_seat_legroom_reduced_outlined;
    if (value == "airline_seat_recline_extra")
      return Icons.airline_seat_recline_extra;
    if (value == "airline_seat_recline_extra_sharp")
      return Icons.airline_seat_recline_extra_sharp;
    if (value == "airline_seat_recline_extra_rounded")
      return Icons.airline_seat_recline_extra_rounded;
    if (value == "airline_seat_recline_extra_outlined")
      return Icons.airline_seat_recline_extra_outlined;
    if (value == "airline_seat_recline_normal")
      return Icons.airline_seat_recline_normal;
    if (value == "airline_seat_recline_normal_sharp")
      return Icons.airline_seat_recline_normal_sharp;
    if (value == "airline_seat_recline_normal_rounded")
      return Icons.airline_seat_recline_normal_rounded;
    if (value == "airline_seat_recline_normal_outlined")
      return Icons.airline_seat_recline_normal_outlined;
    if (value == "airline_stops") return Icons.airline_stops;
    if (value == "airline_stops_sharp") return Icons.airline_stops_sharp;
    if (value == "airline_stops_rounded") return Icons.airline_stops_rounded;
    if (value == "airline_stops_outlined") return Icons.airline_stops_outlined;
    if (value == "airlines") return Icons.airlines;
    if (value == "airlines_sharp") return Icons.airlines_sharp;
    if (value == "airlines_rounded") return Icons.airlines_rounded;
    if (value == "airlines_outlined") return Icons.airlines_outlined;
    if (value == "airplane_ticket") return Icons.airplane_ticket;
    if (value == "airplane_ticket_sharp") return Icons.airplane_ticket_sharp;
    if (value == "airplane_ticket_rounded")
      return Icons.airplane_ticket_rounded;
    if (value == "airplane_ticket_outlined")
      return Icons.airplane_ticket_outlined;
    if (value == "airplanemode_active") return Icons.airplanemode_active;
    if (value == "airplanemode_active_sharp")
      return Icons.airplanemode_active_sharp;
    if (value == "airplanemode_active_rounded")
      return Icons.airplanemode_active_rounded;
    if (value == "airplanemode_active_outlined")
      return Icons.airplanemode_active_outlined;
    if (value == "airplanemode_inactive") return Icons.airplanemode_inactive;
    if (value == "airplanemode_inactive_sharp")
      return Icons.airplanemode_inactive_sharp;
    if (value == "airplanemode_inactive_rounded")
      return Icons.airplanemode_inactive_rounded;
    if (value == "airplanemode_inactive_outlined")
      return Icons.airplanemode_inactive_outlined;
    if (value == "airplanemode_off") return Icons.airplanemode_off;
    if (value == "airplanemode_off_sharp") return Icons.airplanemode_off_sharp;
    if (value == "airplanemode_off_rounded")
      return Icons.airplanemode_off_rounded;
    if (value == "airplanemode_off_outlined")
      return Icons.airplanemode_off_outlined;
    if (value == "airplanemode_on") return Icons.airplanemode_on;
    if (value == "airplanemode_on_sharp") return Icons.airplanemode_on_sharp;
    if (value == "airplanemode_on_rounded")
      return Icons.airplanemode_on_rounded;
    if (value == "airplanemode_on_outlined")
      return Icons.airplanemode_on_outlined;
    if (value == "airplay") return Icons.airplay;
    if (value == "airplay_sharp") return Icons.airplay_sharp;
    if (value == "airplay_rounded") return Icons.airplay_rounded;
    if (value == "airplay_outlined") return Icons.airplay_outlined;
    if (value == "airport_shuttle") return Icons.airport_shuttle;
    if (value == "airport_shuttle_sharp") return Icons.airport_shuttle_sharp;
    if (value == "airport_shuttle_rounded")
      return Icons.airport_shuttle_rounded;
    if (value == "airport_shuttle_outlined")
      return Icons.airport_shuttle_outlined;
    if (value == "alarm") return Icons.alarm;
    if (value == "alarm_sharp") return Icons.alarm_sharp;
    if (value == "alarm_rounded") return Icons.alarm_rounded;
    if (value == "alarm_outlined") return Icons.alarm_outlined;
    if (value == "alarm_add") return Icons.alarm_add;
    if (value == "alarm_add_sharp") return Icons.alarm_add_sharp;
    if (value == "alarm_add_rounded") return Icons.alarm_add_rounded;
    if (value == "alarm_add_outlined") return Icons.alarm_add_outlined;
    if (value == "alarm_off") return Icons.alarm_off;
    if (value == "alarm_off_sharp") return Icons.alarm_off_sharp;
    if (value == "alarm_off_rounded") return Icons.alarm_off_rounded;
    if (value == "alarm_off_outlined") return Icons.alarm_off_outlined;
    if (value == "alarm_on") return Icons.alarm_on;
    if (value == "alarm_on_sharp") return Icons.alarm_on_sharp;
    if (value == "alarm_on_rounded") return Icons.alarm_on_rounded;
    if (value == "alarm_on_outlined") return Icons.alarm_on_outlined;
    if (value == "album") return Icons.album;
    if (value == "album_sharp") return Icons.album_sharp;
    if (value == "album_rounded") return Icons.album_rounded;
    if (value == "album_outlined") return Icons.album_outlined;
    if (value == "align_horizontal_center")
      return Icons.align_horizontal_center;
    if (value == "align_horizontal_center_sharp")
      return Icons.align_horizontal_center_sharp;
    if (value == "align_horizontal_center_rounded")
      return Icons.align_horizontal_center_rounded;
    if (value == "align_horizontal_center_outlined")
      return Icons.align_horizontal_center_outlined;
    if (value == "align_horizontal_left") return Icons.align_horizontal_left;
    if (value == "align_horizontal_left_sharp")
      return Icons.align_horizontal_left_sharp;
    if (value == "align_horizontal_left_rounded")
      return Icons.align_horizontal_left_rounded;
    if (value == "align_horizontal_left_outlined")
      return Icons.align_horizontal_left_outlined;
    if (value == "align_horizontal_right") return Icons.align_horizontal_right;
    if (value == "align_horizontal_right_sharp")
      return Icons.align_horizontal_right_sharp;
    if (value == "align_horizontal_right_rounded")
      return Icons.align_horizontal_right_rounded;
    if (value == "align_horizontal_right_outlined")
      return Icons.align_horizontal_right_outlined;
    if (value == "align_vertical_bottom") return Icons.align_vertical_bottom;
    if (value == "align_vertical_bottom_sharp")
      return Icons.align_vertical_bottom_sharp;
    if (value == "align_vertical_bottom_rounded")
      return Icons.align_vertical_bottom_rounded;
    if (value == "align_vertical_bottom_outlined")
      return Icons.align_vertical_bottom_outlined;
    if (value == "align_vertical_center") return Icons.align_vertical_center;
    if (value == "align_vertical_center_sharp")
      return Icons.align_vertical_center_sharp;
    if (value == "align_vertical_center_rounded")
      return Icons.align_vertical_center_rounded;
    if (value == "align_vertical_center_outlined")
      return Icons.align_vertical_center_outlined;
    if (value == "align_vertical_top") return Icons.align_vertical_top;
    if (value == "align_vertical_top_sharp")
      return Icons.align_vertical_top_sharp;
    if (value == "align_vertical_top_rounded")
      return Icons.align_vertical_top_rounded;
    if (value == "align_vertical_top_outlined")
      return Icons.align_vertical_top_outlined;
    if (value == "all_inbox") return Icons.all_inbox;
    if (value == "all_inbox_sharp") return Icons.all_inbox_sharp;
    if (value == "all_inbox_rounded") return Icons.all_inbox_rounded;
    if (value == "all_inbox_outlined") return Icons.all_inbox_outlined;
    if (value == "all_inclusive") return Icons.all_inclusive;
    if (value == "all_inclusive_sharp") return Icons.all_inclusive_sharp;
    if (value == "all_inclusive_rounded") return Icons.all_inclusive_rounded;
    if (value == "all_inclusive_outlined") return Icons.all_inclusive_outlined;
    if (value == "all_out") return Icons.all_out;
    if (value == "all_out_sharp") return Icons.all_out_sharp;
    if (value == "all_out_rounded") return Icons.all_out_rounded;
    if (value == "all_out_outlined") return Icons.all_out_outlined;
    if (value == "alt_route") return Icons.alt_route;
    if (value == "alt_route_sharp") return Icons.alt_route_sharp;
    if (value == "alt_route_rounded") return Icons.alt_route_rounded;
    if (value == "alt_route_outlined") return Icons.alt_route_outlined;
    if (value == "alternate_email") return Icons.alternate_email;
    if (value == "alternate_email_sharp") return Icons.alternate_email_sharp;
    if (value == "alternate_email_rounded")
      return Icons.alternate_email_rounded;
    if (value == "alternate_email_outlined")
      return Icons.alternate_email_outlined;
    if (value == "amp_stories") return Icons.amp_stories;
    if (value == "amp_stories_sharp") return Icons.amp_stories_sharp;
    if (value == "amp_stories_rounded") return Icons.amp_stories_rounded;
    if (value == "amp_stories_outlined") return Icons.amp_stories_outlined;
    if (value == "analytics") return Icons.analytics;
    if (value == "analytics_sharp") return Icons.analytics_sharp;
    if (value == "analytics_rounded") return Icons.analytics_rounded;
    if (value == "analytics_outlined") return Icons.analytics_outlined;
    if (value == "anchor") return Icons.anchor;
    if (value == "anchor_sharp") return Icons.anchor_sharp;
    if (value == "anchor_rounded") return Icons.anchor_rounded;
    if (value == "anchor_outlined") return Icons.anchor_outlined;
    if (value == "android") return Icons.android;
    if (value == "android_sharp") return Icons.android_sharp;
    if (value == "android_rounded") return Icons.android_rounded;
    if (value == "android_outlined") return Icons.android_outlined;
    if (value == "animation") return Icons.animation;
    if (value == "animation_sharp") return Icons.animation_sharp;
    if (value == "animation_rounded") return Icons.animation_rounded;
    if (value == "animation_outlined") return Icons.animation_outlined;
    if (value == "announcement") return Icons.announcement;
    if (value == "announcement_sharp") return Icons.announcement_sharp;
    if (value == "announcement_rounded") return Icons.announcement_rounded;
    if (value == "announcement_outlined") return Icons.announcement_outlined;
    if (value == "aod") return Icons.aod;
    if (value == "aod_sharp") return Icons.aod_sharp;
    if (value == "aod_rounded") return Icons.aod_rounded;
    if (value == "aod_outlined") return Icons.aod_outlined;
    if (value == "apartment") return Icons.apartment;
    if (value == "apartment_sharp") return Icons.apartment_sharp;
    if (value == "apartment_rounded") return Icons.apartment_rounded;
    if (value == "apartment_outlined") return Icons.apartment_outlined;
    if (value == "api") return Icons.api;
    if (value == "api_sharp") return Icons.api_sharp;
    if (value == "api_rounded") return Icons.api_rounded;
    if (value == "api_outlined") return Icons.api_outlined;
    if (value == "app_blocking") return Icons.app_blocking;
    if (value == "app_blocking_sharp") return Icons.app_blocking_sharp;
    if (value == "app_blocking_rounded") return Icons.app_blocking_rounded;
    if (value == "app_blocking_outlined") return Icons.app_blocking_outlined;
    if (value == "app_registration") return Icons.app_registration;
    if (value == "app_registration_sharp") return Icons.app_registration_sharp;
    if (value == "app_registration_rounded")
      return Icons.app_registration_rounded;
    if (value == "app_registration_outlined")
      return Icons.app_registration_outlined;
    if (value == "app_settings_alt") return Icons.app_settings_alt;
    if (value == "app_settings_alt_sharp") return Icons.app_settings_alt_sharp;
    if (value == "app_settings_alt_rounded")
      return Icons.app_settings_alt_rounded;
    if (value == "app_settings_alt_outlined")
      return Icons.app_settings_alt_outlined;
    if (value == "app_shortcut") return Icons.app_shortcut;
    if (value == "app_shortcut_sharp") return Icons.app_shortcut_sharp;
    if (value == "app_shortcut_rounded") return Icons.app_shortcut_rounded;
    if (value == "app_shortcut_outlined") return Icons.app_shortcut_outlined;
    if (value == "apple") return Icons.apple;
    if (value == "apple_sharp") return Icons.apple_sharp;
    if (value == "apple_rounded") return Icons.apple_rounded;
    if (value == "apple_outlined") return Icons.apple_outlined;
    if (value == "approval") return Icons.approval;
    if (value == "approval_sharp") return Icons.approval_sharp;
    if (value == "approval_rounded") return Icons.approval_rounded;
    if (value == "approval_outlined") return Icons.approval_outlined;
    if (value == "apps") return Icons.apps;
    if (value == "apps_sharp") return Icons.apps_sharp;
    if (value == "apps_rounded") return Icons.apps_rounded;
    if (value == "apps_outlined") return Icons.apps_outlined;
    if (value == "apps_outage") return Icons.apps_outage;
    if (value == "apps_outage_sharp") return Icons.apps_outage_sharp;
    if (value == "apps_outage_rounded") return Icons.apps_outage_rounded;
    if (value == "apps_outage_outlined") return Icons.apps_outage_outlined;
    if (value == "architecture") return Icons.architecture;
    if (value == "architecture_sharp") return Icons.architecture_sharp;
    if (value == "architecture_rounded") return Icons.architecture_rounded;
    if (value == "architecture_outlined") return Icons.architecture_outlined;
    if (value == "archive") return Icons.archive;
    if (value == "archive_sharp") return Icons.archive_sharp;
    if (value == "archive_rounded") return Icons.archive_rounded;
    if (value == "archive_outlined") return Icons.archive_outlined;
    if (value == "area_chart") return Icons.area_chart;
    if (value == "area_chart_sharp") return Icons.area_chart_sharp;
    if (value == "area_chart_rounded") return Icons.area_chart_rounded;
    if (value == "area_chart_outlined") return Icons.area_chart_outlined;
    if (value == "arrow_back") return Icons.arrow_back;
    if (value == "arrow_back_sharp") return Icons.arrow_back_sharp;
    if (value == "arrow_back_rounded") return Icons.arrow_back_rounded;
    if (value == "arrow_back_outlined") return Icons.arrow_back_outlined;
    if (value == "arrow_back_ios") return Icons.arrow_back_ios;
    if (value == "arrow_back_ios_sharp") return Icons.arrow_back_ios_sharp;
    if (value == "arrow_back_ios_rounded") return Icons.arrow_back_ios_rounded;
    if (value == "arrow_back_ios_outlined")
      return Icons.arrow_back_ios_outlined;
    if (value == "arrow_back_ios_new") return Icons.arrow_back_ios_new;
    if (value == "arrow_back_ios_new_sharp")
      return Icons.arrow_back_ios_new_sharp;
    if (value == "arrow_back_ios_new_rounded")
      return Icons.arrow_back_ios_new_rounded;
    if (value == "arrow_back_ios_new_outlined")
      return Icons.arrow_back_ios_new_outlined;
    if (value == "arrow_circle_down") return Icons.arrow_circle_down;
    if (value == "arrow_circle_down_sharp")
      return Icons.arrow_circle_down_sharp;
    if (value == "arrow_circle_down_rounded")
      return Icons.arrow_circle_down_rounded;
    if (value == "arrow_circle_down_outlined")
      return Icons.arrow_circle_down_outlined;
    if (value == "arrow_circle_left") return Icons.arrow_circle_left;
    if (value == "arrow_circle_left_sharp")
      return Icons.arrow_circle_left_sharp;
    if (value == "arrow_circle_left_rounded")
      return Icons.arrow_circle_left_rounded;
    if (value == "arrow_circle_left_outlined")
      return Icons.arrow_circle_left_outlined;
    if (value == "arrow_circle_right") return Icons.arrow_circle_right;
    if (value == "arrow_circle_right_sharp")
      return Icons.arrow_circle_right_sharp;
    if (value == "arrow_circle_right_rounded")
      return Icons.arrow_circle_right_rounded;
    if (value == "arrow_circle_right_outlined")
      return Icons.arrow_circle_right_outlined;
    if (value == "arrow_circle_up") return Icons.arrow_circle_up;
    if (value == "arrow_circle_up_sharp") return Icons.arrow_circle_up_sharp;
    if (value == "arrow_circle_up_rounded")
      return Icons.arrow_circle_up_rounded;
    if (value == "arrow_circle_up_outlined")
      return Icons.arrow_circle_up_outlined;
    if (value == "arrow_downward") return Icons.arrow_downward;
    if (value == "arrow_downward_sharp") return Icons.arrow_downward_sharp;
    if (value == "arrow_downward_rounded") return Icons.arrow_downward_rounded;
    if (value == "arrow_downward_outlined")
      return Icons.arrow_downward_outlined;
    if (value == "arrow_drop_down") return Icons.arrow_drop_down;
    if (value == "arrow_drop_down_sharp") return Icons.arrow_drop_down_sharp;
    if (value == "arrow_drop_down_rounded")
      return Icons.arrow_drop_down_rounded;
    if (value == "arrow_drop_down_outlined")
      return Icons.arrow_drop_down_outlined;
    if (value == "arrow_drop_down_circle") return Icons.arrow_drop_down_circle;
    if (value == "arrow_drop_down_circle_sharp")
      return Icons.arrow_drop_down_circle_sharp;
    if (value == "arrow_drop_down_circle_rounded")
      return Icons.arrow_drop_down_circle_rounded;
    if (value == "arrow_drop_down_circle_outlined")
      return Icons.arrow_drop_down_circle_outlined;
    if (value == "arrow_drop_up") return Icons.arrow_drop_up;
    if (value == "arrow_drop_up_sharp") return Icons.arrow_drop_up_sharp;
    if (value == "arrow_drop_up_rounded") return Icons.arrow_drop_up_rounded;
    if (value == "arrow_drop_up_outlined") return Icons.arrow_drop_up_outlined;
    if (value == "arrow_forward") return Icons.arrow_forward;
    if (value == "arrow_forward_sharp") return Icons.arrow_forward_sharp;
    if (value == "arrow_forward_rounded") return Icons.arrow_forward_rounded;
    if (value == "arrow_forward_outlined") return Icons.arrow_forward_outlined;
    if (value == "arrow_forward_ios") return Icons.arrow_forward_ios;
    if (value == "arrow_forward_ios_sharp")
      return Icons.arrow_forward_ios_sharp;
    if (value == "arrow_forward_ios_rounded")
      return Icons.arrow_forward_ios_rounded;
    if (value == "arrow_forward_ios_outlined")
      return Icons.arrow_forward_ios_outlined;
    if (value == "arrow_left") return Icons.arrow_left;
    if (value == "arrow_left_sharp") return Icons.arrow_left_sharp;
    if (value == "arrow_left_rounded") return Icons.arrow_left_rounded;
    if (value == "arrow_left_outlined") return Icons.arrow_left_outlined;
    if (value == "arrow_right") return Icons.arrow_right;
    if (value == "arrow_right_sharp") return Icons.arrow_right_sharp;
    if (value == "arrow_right_rounded") return Icons.arrow_right_rounded;
    if (value == "arrow_right_outlined") return Icons.arrow_right_outlined;
    if (value == "arrow_right_alt") return Icons.arrow_right_alt;
    if (value == "arrow_right_alt_sharp") return Icons.arrow_right_alt_sharp;
    if (value == "arrow_right_alt_rounded")
      return Icons.arrow_right_alt_rounded;
    if (value == "arrow_right_alt_outlined")
      return Icons.arrow_right_alt_outlined;
    if (value == "arrow_upward") return Icons.arrow_upward;
    if (value == "arrow_upward_sharp") return Icons.arrow_upward_sharp;
    if (value == "arrow_upward_rounded") return Icons.arrow_upward_rounded;
    if (value == "arrow_upward_outlined") return Icons.arrow_upward_outlined;
    if (value == "art_track") return Icons.art_track;
    if (value == "art_track_sharp") return Icons.art_track_sharp;
    if (value == "art_track_rounded") return Icons.art_track_rounded;
    if (value == "art_track_outlined") return Icons.art_track_outlined;
    if (value == "article") return Icons.article;
    if (value == "article_sharp") return Icons.article_sharp;
    if (value == "article_rounded") return Icons.article_rounded;
    if (value == "article_outlined") return Icons.article_outlined;
    if (value == "aspect_ratio") return Icons.aspect_ratio;
    if (value == "aspect_ratio_sharp") return Icons.aspect_ratio_sharp;
    if (value == "aspect_ratio_rounded") return Icons.aspect_ratio_rounded;
    if (value == "aspect_ratio_outlined") return Icons.aspect_ratio_outlined;
    if (value == "assessment") return Icons.assessment;
    if (value == "assessment_sharp") return Icons.assessment_sharp;
    if (value == "assessment_rounded") return Icons.assessment_rounded;
    if (value == "assessment_outlined") return Icons.assessment_outlined;
    if (value == "assignment") return Icons.assignment;
    if (value == "assignment_sharp") return Icons.assignment_sharp;
    if (value == "assignment_rounded") return Icons.assignment_rounded;
    if (value == "assignment_outlined") return Icons.assignment_outlined;
    if (value == "assignment_ind") return Icons.assignment_ind;
    if (value == "assignment_ind_sharp") return Icons.assignment_ind_sharp;
    if (value == "assignment_ind_rounded") return Icons.assignment_ind_rounded;
    if (value == "assignment_ind_outlined")
      return Icons.assignment_ind_outlined;
    if (value == "assignment_late") return Icons.assignment_late;
    if (value == "assignment_late_sharp") return Icons.assignment_late_sharp;
    if (value == "assignment_late_rounded")
      return Icons.assignment_late_rounded;
    if (value == "assignment_late_outlined")
      return Icons.assignment_late_outlined;
    if (value == "assignment_return") return Icons.assignment_return;
    if (value == "assignment_return_sharp")
      return Icons.assignment_return_sharp;
    if (value == "assignment_return_rounded")
      return Icons.assignment_return_rounded;
    if (value == "assignment_return_outlined")
      return Icons.assignment_return_outlined;
    if (value == "assignment_returned") return Icons.assignment_returned;
    if (value == "assignment_returned_sharp")
      return Icons.assignment_returned_sharp;
    if (value == "assignment_returned_rounded")
      return Icons.assignment_returned_rounded;
    if (value == "assignment_returned_outlined")
      return Icons.assignment_returned_outlined;
    if (value == "assignment_turned_in") return Icons.assignment_turned_in;
    if (value == "assignment_turned_in_sharp")
      return Icons.assignment_turned_in_sharp;
    if (value == "assignment_turned_in_rounded")
      return Icons.assignment_turned_in_rounded;
    if (value == "assignment_turned_in_outlined")
      return Icons.assignment_turned_in_outlined;
    if (value == "assistant") return Icons.assistant;
    if (value == "assistant_sharp") return Icons.assistant_sharp;
    if (value == "assistant_rounded") return Icons.assistant_rounded;
    if (value == "assistant_outlined") return Icons.assistant_outlined;
    if (value == "assistant_direction") return Icons.assistant_direction;
    if (value == "assistant_direction_sharp")
      return Icons.assistant_direction_sharp;
    if (value == "assistant_direction_rounded")
      return Icons.assistant_direction_rounded;
    if (value == "assistant_direction_outlined")
      return Icons.assistant_direction_outlined;
    if (value == "assistant_navigation") return Icons.assistant_navigation;
    if (value == "assistant_photo") return Icons.assistant_photo;
    if (value == "assistant_photo_sharp") return Icons.assistant_photo_sharp;
    if (value == "assistant_photo_rounded")
      return Icons.assistant_photo_rounded;
    if (value == "assistant_photo_outlined")
      return Icons.assistant_photo_outlined;
    if (value == "assured_workload") return Icons.assured_workload;
    if (value == "assured_workload_sharp") return Icons.assured_workload_sharp;
    if (value == "assured_workload_rounded")
      return Icons.assured_workload_rounded;
    if (value == "assured_workload_outlined")
      return Icons.assured_workload_outlined;
    if (value == "atm") return Icons.atm;
    if (value == "atm_sharp") return Icons.atm_sharp;
    if (value == "atm_rounded") return Icons.atm_rounded;
    if (value == "atm_outlined") return Icons.atm_outlined;
    if (value == "attach_email") return Icons.attach_email;
    if (value == "attach_email_sharp") return Icons.attach_email_sharp;
    if (value == "attach_email_rounded") return Icons.attach_email_rounded;
    if (value == "attach_email_outlined") return Icons.attach_email_outlined;
    if (value == "attach_file") return Icons.attach_file;
    if (value == "attach_file_sharp") return Icons.attach_file_sharp;
    if (value == "attach_file_rounded") return Icons.attach_file_rounded;
    if (value == "attach_file_outlined") return Icons.attach_file_outlined;
    if (value == "attach_money") return Icons.attach_money;
    if (value == "attach_money_sharp") return Icons.attach_money_sharp;
    if (value == "attach_money_rounded") return Icons.attach_money_rounded;
    if (value == "attach_money_outlined") return Icons.attach_money_outlined;
    if (value == "attachment") return Icons.attachment;
    if (value == "attachment_sharp") return Icons.attachment_sharp;
    if (value == "attachment_rounded") return Icons.attachment_rounded;
    if (value == "attachment_outlined") return Icons.attachment_outlined;
    if (value == "attractions") return Icons.attractions;
    if (value == "attractions_sharp") return Icons.attractions_sharp;
    if (value == "attractions_rounded") return Icons.attractions_rounded;
    if (value == "attractions_outlined") return Icons.attractions_outlined;
    if (value == "attribution") return Icons.attribution;
    if (value == "attribution_sharp") return Icons.attribution_sharp;
    if (value == "attribution_rounded") return Icons.attribution_rounded;
    if (value == "attribution_outlined") return Icons.attribution_outlined;
    if (value == "audio_file") return Icons.audio_file;
    if (value == "audio_file_sharp") return Icons.audio_file_sharp;
    if (value == "audio_file_rounded") return Icons.audio_file_rounded;
    if (value == "audio_file_outlined") return Icons.audio_file_outlined;
    if (value == "audiotrack") return Icons.audiotrack;
    if (value == "audiotrack_sharp") return Icons.audiotrack_sharp;
    if (value == "audiotrack_rounded") return Icons.audiotrack_rounded;
    if (value == "audiotrack_outlined") return Icons.audiotrack_outlined;
    if (value == "auto_awesome") return Icons.auto_awesome;
    if (value == "auto_awesome_sharp") return Icons.auto_awesome_sharp;
    if (value == "auto_awesome_rounded") return Icons.auto_awesome_rounded;
    if (value == "auto_awesome_outlined") return Icons.auto_awesome_outlined;
    if (value == "auto_awesome_mosaic") return Icons.auto_awesome_mosaic;
    if (value == "auto_awesome_mosaic_sharp")
      return Icons.auto_awesome_mosaic_sharp;
    if (value == "auto_awesome_mosaic_rounded")
      return Icons.auto_awesome_mosaic_rounded;
    if (value == "auto_awesome_mosaic_outlined")
      return Icons.auto_awesome_mosaic_outlined;
    if (value == "auto_awesome_motion") return Icons.auto_awesome_motion;
    if (value == "auto_awesome_motion_sharp")
      return Icons.auto_awesome_motion_sharp;
    if (value == "auto_awesome_motion_rounded")
      return Icons.auto_awesome_motion_rounded;
    if (value == "auto_awesome_motion_outlined")
      return Icons.auto_awesome_motion_outlined;
    if (value == "auto_delete") return Icons.auto_delete;
    if (value == "auto_delete_sharp") return Icons.auto_delete_sharp;
    if (value == "auto_delete_rounded") return Icons.auto_delete_rounded;
    if (value == "auto_delete_outlined") return Icons.auto_delete_outlined;
    if (value == "auto_fix_high") return Icons.auto_fix_high;
    if (value == "auto_fix_high_sharp") return Icons.auto_fix_high_sharp;
    if (value == "auto_fix_high_rounded") return Icons.auto_fix_high_rounded;
    if (value == "auto_fix_high_outlined") return Icons.auto_fix_high_outlined;
    if (value == "auto_fix_normal") return Icons.auto_fix_normal;
    if (value == "auto_fix_normal_sharp") return Icons.auto_fix_normal_sharp;
    if (value == "auto_fix_normal_rounded")
      return Icons.auto_fix_normal_rounded;
    if (value == "auto_fix_normal_outlined")
      return Icons.auto_fix_normal_outlined;
    if (value == "auto_fix_off") return Icons.auto_fix_off;
    if (value == "auto_fix_off_sharp") return Icons.auto_fix_off_sharp;
    if (value == "auto_fix_off_rounded") return Icons.auto_fix_off_rounded;
    if (value == "auto_fix_off_outlined") return Icons.auto_fix_off_outlined;
    if (value == "auto_graph") return Icons.auto_graph;
    if (value == "auto_graph_sharp") return Icons.auto_graph_sharp;
    if (value == "auto_graph_rounded") return Icons.auto_graph_rounded;
    if (value == "auto_graph_outlined") return Icons.auto_graph_outlined;
    if (value == "auto_mode") return Icons.auto_mode;
    if (value == "auto_mode_sharp") return Icons.auto_mode_sharp;
    if (value == "auto_mode_rounded") return Icons.auto_mode_rounded;
    if (value == "auto_mode_outlined") return Icons.auto_mode_outlined;
    if (value == "auto_stories") return Icons.auto_stories;
    if (value == "auto_stories_sharp") return Icons.auto_stories_sharp;
    if (value == "auto_stories_rounded") return Icons.auto_stories_rounded;
    if (value == "auto_stories_outlined") return Icons.auto_stories_outlined;
    if (value == "autofps_select") return Icons.autofps_select;
    if (value == "autofps_select_sharp") return Icons.autofps_select_sharp;
    if (value == "autofps_select_rounded") return Icons.autofps_select_rounded;
    if (value == "autofps_select_outlined")
      return Icons.autofps_select_outlined;
    if (value == "autorenew") return Icons.autorenew;
    if (value == "autorenew_sharp") return Icons.autorenew_sharp;
    if (value == "autorenew_rounded") return Icons.autorenew_rounded;
    if (value == "autorenew_outlined") return Icons.autorenew_outlined;
    if (value == "av_timer") return Icons.av_timer;
    if (value == "av_timer_sharp") return Icons.av_timer_sharp;
    if (value == "av_timer_rounded") return Icons.av_timer_rounded;
    if (value == "av_timer_outlined") return Icons.av_timer_outlined;
    if (value == "baby_changing_station") return Icons.baby_changing_station;
    if (value == "baby_changing_station_sharp")
      return Icons.baby_changing_station_sharp;
    if (value == "baby_changing_station_rounded")
      return Icons.baby_changing_station_rounded;
    if (value == "baby_changing_station_outlined")
      return Icons.baby_changing_station_outlined;
    if (value == "back_hand") return Icons.back_hand;
    if (value == "back_hand_sharp") return Icons.back_hand_sharp;
    if (value == "back_hand_rounded") return Icons.back_hand_rounded;
    if (value == "back_hand_outlined") return Icons.back_hand_outlined;
    if (value == "backpack") return Icons.backpack;
    if (value == "backpack_sharp") return Icons.backpack_sharp;
    if (value == "backpack_rounded") return Icons.backpack_rounded;
    if (value == "backpack_outlined") return Icons.backpack_outlined;
    if (value == "backspace") return Icons.backspace;
    if (value == "backspace_sharp") return Icons.backspace_sharp;
    if (value == "backspace_rounded") return Icons.backspace_rounded;
    if (value == "backspace_outlined") return Icons.backspace_outlined;
    if (value == "backup") return Icons.backup;
    if (value == "backup_sharp") return Icons.backup_sharp;
    if (value == "backup_rounded") return Icons.backup_rounded;
    if (value == "backup_outlined") return Icons.backup_outlined;
    if (value == "backup_table") return Icons.backup_table;
    if (value == "backup_table_sharp") return Icons.backup_table_sharp;
    if (value == "backup_table_rounded") return Icons.backup_table_rounded;
    if (value == "backup_table_outlined") return Icons.backup_table_outlined;
    if (value == "badge") return Icons.badge;
    if (value == "badge_sharp") return Icons.badge_sharp;
    if (value == "badge_rounded") return Icons.badge_rounded;
    if (value == "badge_outlined") return Icons.badge_outlined;
    if (value == "bakery_dining") return Icons.bakery_dining;
    if (value == "bakery_dining_sharp") return Icons.bakery_dining_sharp;
    if (value == "bakery_dining_rounded") return Icons.bakery_dining_rounded;
    if (value == "bakery_dining_outlined") return Icons.bakery_dining_outlined;
    if (value == "balance") return Icons.balance;
    if (value == "balance_sharp") return Icons.balance_sharp;
    if (value == "balance_rounded") return Icons.balance_rounded;
    if (value == "balance_outlined") return Icons.balance_outlined;
    if (value == "balcony") return Icons.balcony;
    if (value == "balcony_sharp") return Icons.balcony_sharp;
    if (value == "balcony_rounded") return Icons.balcony_rounded;
    if (value == "balcony_outlined") return Icons.balcony_outlined;
    if (value == "ballot") return Icons.ballot;
    if (value == "ballot_sharp") return Icons.ballot_sharp;
    if (value == "ballot_rounded") return Icons.ballot_rounded;
    if (value == "ballot_outlined") return Icons.ballot_outlined;
    if (value == "bar_chart") return Icons.bar_chart;
    if (value == "bar_chart_sharp") return Icons.bar_chart_sharp;
    if (value == "bar_chart_rounded") return Icons.bar_chart_rounded;
    if (value == "bar_chart_outlined") return Icons.bar_chart_outlined;
    if (value == "batch_prediction") return Icons.batch_prediction;
    if (value == "batch_prediction_sharp") return Icons.batch_prediction_sharp;
    if (value == "batch_prediction_rounded")
      return Icons.batch_prediction_rounded;
    if (value == "batch_prediction_outlined")
      return Icons.batch_prediction_outlined;
    if (value == "bathroom") return Icons.bathroom;
    if (value == "bathroom_sharp") return Icons.bathroom_sharp;
    if (value == "bathroom_rounded") return Icons.bathroom_rounded;
    if (value == "bathroom_outlined") return Icons.bathroom_outlined;
    if (value == "bathtub") return Icons.bathtub;
    if (value == "bathtub_sharp") return Icons.bathtub_sharp;
    if (value == "bathtub_rounded") return Icons.bathtub_rounded;
    if (value == "bathtub_outlined") return Icons.bathtub_outlined;
    if (value == "battery_0_bar") return Icons.battery_0_bar;
    if (value == "battery_0_bar_sharp") return Icons.battery_0_bar_sharp;
    if (value == "battery_0_bar_rounded") return Icons.battery_0_bar_rounded;
    if (value == "battery_0_bar_outlined") return Icons.battery_0_bar_outlined;
    if (value == "battery_1_bar") return Icons.battery_1_bar;
    if (value == "battery_1_bar_sharp") return Icons.battery_1_bar_sharp;
    if (value == "battery_1_bar_rounded") return Icons.battery_1_bar_rounded;
    if (value == "battery_1_bar_outlined") return Icons.battery_1_bar_outlined;
    if (value == "battery_2_bar") return Icons.battery_2_bar;
    if (value == "battery_2_bar_sharp") return Icons.battery_2_bar_sharp;
    if (value == "battery_2_bar_rounded") return Icons.battery_2_bar_rounded;
    if (value == "battery_2_bar_outlined") return Icons.battery_2_bar_outlined;
    if (value == "battery_3_bar") return Icons.battery_3_bar;
    if (value == "battery_3_bar_sharp") return Icons.battery_3_bar_sharp;
    if (value == "battery_3_bar_rounded") return Icons.battery_3_bar_rounded;
    if (value == "battery_3_bar_outlined") return Icons.battery_3_bar_outlined;
    if (value == "battery_4_bar") return Icons.battery_4_bar;
    if (value == "battery_4_bar_sharp") return Icons.battery_4_bar_sharp;
    if (value == "battery_4_bar_rounded") return Icons.battery_4_bar_rounded;
    if (value == "battery_4_bar_outlined") return Icons.battery_4_bar_outlined;
    if (value == "battery_5_bar") return Icons.battery_5_bar;
    if (value == "battery_5_bar_sharp") return Icons.battery_5_bar_sharp;
    if (value == "battery_5_bar_rounded") return Icons.battery_5_bar_rounded;
    if (value == "battery_5_bar_outlined") return Icons.battery_5_bar_outlined;
    if (value == "battery_6_bar") return Icons.battery_6_bar;
    if (value == "battery_6_bar_sharp") return Icons.battery_6_bar_sharp;
    if (value == "battery_6_bar_rounded") return Icons.battery_6_bar_rounded;
    if (value == "battery_6_bar_outlined") return Icons.battery_6_bar_outlined;
    if (value == "battery_alert") return Icons.battery_alert;
    if (value == "battery_alert_sharp") return Icons.battery_alert_sharp;
    if (value == "battery_alert_rounded") return Icons.battery_alert_rounded;
    if (value == "battery_alert_outlined") return Icons.battery_alert_outlined;
    if (value == "battery_charging_full") return Icons.battery_charging_full;
    if (value == "battery_charging_full_sharp")
      return Icons.battery_charging_full_sharp;
    if (value == "battery_charging_full_rounded")
      return Icons.battery_charging_full_rounded;
    if (value == "battery_charging_full_outlined")
      return Icons.battery_charging_full_outlined;
    if (value == "battery_full") return Icons.battery_full;
    if (value == "battery_full_sharp") return Icons.battery_full_sharp;
    if (value == "battery_full_rounded") return Icons.battery_full_rounded;
    if (value == "battery_full_outlined") return Icons.battery_full_outlined;
    if (value == "battery_saver") return Icons.battery_saver;
    if (value == "battery_saver_sharp") return Icons.battery_saver_sharp;
    if (value == "battery_saver_rounded") return Icons.battery_saver_rounded;
    if (value == "battery_saver_outlined") return Icons.battery_saver_outlined;
    if (value == "battery_std") return Icons.battery_std;
    if (value == "battery_std_sharp") return Icons.battery_std_sharp;
    if (value == "battery_std_rounded") return Icons.battery_std_rounded;
    if (value == "battery_std_outlined") return Icons.battery_std_outlined;
    if (value == "battery_unknown") return Icons.battery_unknown;
    if (value == "battery_unknown_sharp") return Icons.battery_unknown_sharp;
    if (value == "battery_unknown_rounded")
      return Icons.battery_unknown_rounded;
    if (value == "battery_unknown_outlined")
      return Icons.battery_unknown_outlined;
    if (value == "beach_access") return Icons.beach_access;
    if (value == "beach_access_sharp") return Icons.beach_access_sharp;
    if (value == "beach_access_rounded") return Icons.beach_access_rounded;
    if (value == "beach_access_outlined") return Icons.beach_access_outlined;
    if (value == "bed") return Icons.bed;
    if (value == "bed_sharp") return Icons.bed_sharp;
    if (value == "bed_rounded") return Icons.bed_rounded;
    if (value == "bed_outlined") return Icons.bed_outlined;
    if (value == "bedroom_baby") return Icons.bedroom_baby;
    if (value == "bedroom_baby_sharp") return Icons.bedroom_baby_sharp;
    if (value == "bedroom_baby_rounded") return Icons.bedroom_baby_rounded;
    if (value == "bedroom_baby_outlined") return Icons.bedroom_baby_outlined;
    if (value == "bedroom_child") return Icons.bedroom_child;
    if (value == "bedroom_child_sharp") return Icons.bedroom_child_sharp;
    if (value == "bedroom_child_rounded") return Icons.bedroom_child_rounded;
    if (value == "bedroom_child_outlined") return Icons.bedroom_child_outlined;
    if (value == "bedroom_parent") return Icons.bedroom_parent;
    if (value == "bedroom_parent_sharp") return Icons.bedroom_parent_sharp;
    if (value == "bedroom_parent_rounded") return Icons.bedroom_parent_rounded;
    if (value == "bedroom_parent_outlined")
      return Icons.bedroom_parent_outlined;
    if (value == "bedtime") return Icons.bedtime;
    if (value == "bedtime_sharp") return Icons.bedtime_sharp;
    if (value == "bedtime_rounded") return Icons.bedtime_rounded;
    if (value == "bedtime_outlined") return Icons.bedtime_outlined;
    if (value == "bedtime_off") return Icons.bedtime_off;
    if (value == "bedtime_off_sharp") return Icons.bedtime_off_sharp;
    if (value == "bedtime_off_rounded") return Icons.bedtime_off_rounded;
    if (value == "bedtime_off_outlined") return Icons.bedtime_off_outlined;
    if (value == "beenhere") return Icons.beenhere;
    if (value == "beenhere_sharp") return Icons.beenhere_sharp;
    if (value == "beenhere_rounded") return Icons.beenhere_rounded;
    if (value == "beenhere_outlined") return Icons.beenhere_outlined;
    if (value == "bento") return Icons.bento;
    if (value == "bento_sharp") return Icons.bento_sharp;
    if (value == "bento_rounded") return Icons.bento_rounded;
    if (value == "bento_outlined") return Icons.bento_outlined;
    if (value == "bike_scooter") return Icons.bike_scooter;
    if (value == "bike_scooter_sharp") return Icons.bike_scooter_sharp;
    if (value == "bike_scooter_rounded") return Icons.bike_scooter_rounded;
    if (value == "bike_scooter_outlined") return Icons.bike_scooter_outlined;
    if (value == "biotech") return Icons.biotech;
    if (value == "biotech_sharp") return Icons.biotech_sharp;
    if (value == "biotech_rounded") return Icons.biotech_rounded;
    if (value == "biotech_outlined") return Icons.biotech_outlined;
    if (value == "blender") return Icons.blender;
    if (value == "blender_sharp") return Icons.blender_sharp;
    if (value == "blender_rounded") return Icons.blender_rounded;
    if (value == "blender_outlined") return Icons.blender_outlined;
    if (value == "blinds") return Icons.blinds;
    if (value == "blinds_sharp") return Icons.blinds_sharp;
    if (value == "blinds_rounded") return Icons.blinds_rounded;
    if (value == "blinds_outlined") return Icons.blinds_outlined;
    if (value == "blinds_closed") return Icons.blinds_closed;
    if (value == "blinds_closed_sharp") return Icons.blinds_closed_sharp;
    if (value == "blinds_closed_rounded") return Icons.blinds_closed_rounded;
    if (value == "blinds_closed_outlined") return Icons.blinds_closed_outlined;
    if (value == "block") return Icons.block;
    if (value == "block_sharp") return Icons.block_sharp;
    if (value == "block_rounded") return Icons.block_rounded;
    if (value == "block_outlined") return Icons.block_outlined;
    if (value == "block_flipped") return Icons.block_flipped;
    if (value == "bloodtype") return Icons.bloodtype;
    if (value == "bloodtype_sharp") return Icons.bloodtype_sharp;
    if (value == "bloodtype_rounded") return Icons.bloodtype_rounded;
    if (value == "bloodtype_outlined") return Icons.bloodtype_outlined;
    if (value == "bluetooth") return Icons.bluetooth;
    if (value == "bluetooth_sharp") return Icons.bluetooth_sharp;
    if (value == "bluetooth_rounded") return Icons.bluetooth_rounded;
    if (value == "bluetooth_outlined") return Icons.bluetooth_outlined;
    if (value == "bluetooth_audio") return Icons.bluetooth_audio;
    if (value == "bluetooth_audio_sharp") return Icons.bluetooth_audio_sharp;
    if (value == "bluetooth_audio_rounded")
      return Icons.bluetooth_audio_rounded;
    if (value == "bluetooth_audio_outlined")
      return Icons.bluetooth_audio_outlined;
    if (value == "bluetooth_connected") return Icons.bluetooth_connected;
    if (value == "bluetooth_connected_sharp")
      return Icons.bluetooth_connected_sharp;
    if (value == "bluetooth_connected_rounded")
      return Icons.bluetooth_connected_rounded;
    if (value == "bluetooth_connected_outlined")
      return Icons.bluetooth_connected_outlined;
    if (value == "bluetooth_disabled") return Icons.bluetooth_disabled;
    if (value == "bluetooth_disabled_sharp")
      return Icons.bluetooth_disabled_sharp;
    if (value == "bluetooth_disabled_rounded")
      return Icons.bluetooth_disabled_rounded;
    if (value == "bluetooth_disabled_outlined")
      return Icons.bluetooth_disabled_outlined;
    if (value == "bluetooth_drive") return Icons.bluetooth_drive;
    if (value == "bluetooth_drive_sharp") return Icons.bluetooth_drive_sharp;
    if (value == "bluetooth_drive_rounded")
      return Icons.bluetooth_drive_rounded;
    if (value == "bluetooth_drive_outlined")
      return Icons.bluetooth_drive_outlined;
    if (value == "bluetooth_searching") return Icons.bluetooth_searching;
    if (value == "bluetooth_searching_sharp")
      return Icons.bluetooth_searching_sharp;
    if (value == "bluetooth_searching_rounded")
      return Icons.bluetooth_searching_rounded;
    if (value == "bluetooth_searching_outlined")
      return Icons.bluetooth_searching_outlined;
    if (value == "blur_circular") return Icons.blur_circular;
    if (value == "blur_circular_sharp") return Icons.blur_circular_sharp;
    if (value == "blur_circular_rounded") return Icons.blur_circular_rounded;
    if (value == "blur_circular_outlined") return Icons.blur_circular_outlined;
    if (value == "blur_linear") return Icons.blur_linear;
    if (value == "blur_linear_sharp") return Icons.blur_linear_sharp;
    if (value == "blur_linear_rounded") return Icons.blur_linear_rounded;
    if (value == "blur_linear_outlined") return Icons.blur_linear_outlined;
    if (value == "blur_off") return Icons.blur_off;
    if (value == "blur_off_sharp") return Icons.blur_off_sharp;
    if (value == "blur_off_rounded") return Icons.blur_off_rounded;
    if (value == "blur_off_outlined") return Icons.blur_off_outlined;
    if (value == "blur_on") return Icons.blur_on;
    if (value == "blur_on_sharp") return Icons.blur_on_sharp;
    if (value == "blur_on_rounded") return Icons.blur_on_rounded;
    if (value == "blur_on_outlined") return Icons.blur_on_outlined;
    if (value == "bolt") return Icons.bolt;
    if (value == "bolt_sharp") return Icons.bolt_sharp;
    if (value == "bolt_rounded") return Icons.bolt_rounded;
    if (value == "bolt_outlined") return Icons.bolt_outlined;
    if (value == "book") return Icons.book;
    if (value == "book_sharp") return Icons.book_sharp;
    if (value == "book_rounded") return Icons.book_rounded;
    if (value == "book_outlined") return Icons.book_outlined;
    if (value == "book_online") return Icons.book_online;
    if (value == "book_online_sharp") return Icons.book_online_sharp;
    if (value == "book_online_rounded") return Icons.book_online_rounded;
    if (value == "book_online_outlined") return Icons.book_online_outlined;
    if (value == "bookmark") return Icons.bookmark;
    if (value == "bookmark_sharp") return Icons.bookmark_sharp;
    if (value == "bookmark_rounded") return Icons.bookmark_rounded;
    if (value == "bookmark_outlined") return Icons.bookmark_outlined;
    if (value == "bookmark_add") return Icons.bookmark_add;
    if (value == "bookmark_add_sharp") return Icons.bookmark_add_sharp;
    if (value == "bookmark_add_rounded") return Icons.bookmark_add_rounded;
    if (value == "bookmark_add_outlined") return Icons.bookmark_add_outlined;
    if (value == "bookmark_added") return Icons.bookmark_added;
    if (value == "bookmark_added_sharp") return Icons.bookmark_added_sharp;
    if (value == "bookmark_added_rounded") return Icons.bookmark_added_rounded;
    if (value == "bookmark_added_outlined")
      return Icons.bookmark_added_outlined;
    if (value == "bookmark_border") return Icons.bookmark_border;
    if (value == "bookmark_border_sharp") return Icons.bookmark_border_sharp;
    if (value == "bookmark_border_rounded")
      return Icons.bookmark_border_rounded;
    if (value == "bookmark_border_outlined")
      return Icons.bookmark_border_outlined;
    if (value == "bookmark_outline") return Icons.bookmark_outline;
    if (value == "bookmark_outline_sharp") return Icons.bookmark_outline_sharp;
    if (value == "bookmark_outline_rounded")
      return Icons.bookmark_outline_rounded;
    if (value == "bookmark_outline_outlined")
      return Icons.bookmark_outline_outlined;
    if (value == "bookmark_remove") return Icons.bookmark_remove;
    if (value == "bookmark_remove_sharp") return Icons.bookmark_remove_sharp;
    if (value == "bookmark_remove_rounded")
      return Icons.bookmark_remove_rounded;
    if (value == "bookmark_remove_outlined")
      return Icons.bookmark_remove_outlined;
    if (value == "bookmarks") return Icons.bookmarks;
    if (value == "bookmarks_sharp") return Icons.bookmarks_sharp;
    if (value == "bookmarks_rounded") return Icons.bookmarks_rounded;
    if (value == "bookmarks_outlined") return Icons.bookmarks_outlined;
    if (value == "border_all") return Icons.border_all;
    if (value == "border_all_sharp") return Icons.border_all_sharp;
    if (value == "border_all_rounded") return Icons.border_all_rounded;
    if (value == "border_all_outlined") return Icons.border_all_outlined;
    if (value == "border_bottom") return Icons.border_bottom;
    if (value == "border_bottom_sharp") return Icons.border_bottom_sharp;
    if (value == "border_bottom_rounded") return Icons.border_bottom_rounded;
    if (value == "border_bottom_outlined") return Icons.border_bottom_outlined;
    if (value == "border_clear") return Icons.border_clear;
    if (value == "border_clear_sharp") return Icons.border_clear_sharp;
    if (value == "border_clear_rounded") return Icons.border_clear_rounded;
    if (value == "border_clear_outlined") return Icons.border_clear_outlined;
    if (value == "border_color") return Icons.border_color;
    if (value == "border_color_sharp") return Icons.border_color_sharp;
    if (value == "border_color_rounded") return Icons.border_color_rounded;
    if (value == "border_color_outlined") return Icons.border_color_outlined;
    if (value == "border_horizontal") return Icons.border_horizontal;
    if (value == "border_horizontal_sharp")
      return Icons.border_horizontal_sharp;
    if (value == "border_horizontal_rounded")
      return Icons.border_horizontal_rounded;
    if (value == "border_horizontal_outlined")
      return Icons.border_horizontal_outlined;
    if (value == "border_inner") return Icons.border_inner;
    if (value == "border_inner_sharp") return Icons.border_inner_sharp;
    if (value == "border_inner_rounded") return Icons.border_inner_rounded;
    if (value == "border_inner_outlined") return Icons.border_inner_outlined;
    if (value == "border_left") return Icons.border_left;
    if (value == "border_left_sharp") return Icons.border_left_sharp;
    if (value == "border_left_rounded") return Icons.border_left_rounded;
    if (value == "border_left_outlined") return Icons.border_left_outlined;
    if (value == "border_outer") return Icons.border_outer;
    if (value == "border_outer_sharp") return Icons.border_outer_sharp;
    if (value == "border_outer_rounded") return Icons.border_outer_rounded;
    if (value == "border_outer_outlined") return Icons.border_outer_outlined;
    if (value == "border_right") return Icons.border_right;
    if (value == "border_right_sharp") return Icons.border_right_sharp;
    if (value == "border_right_rounded") return Icons.border_right_rounded;
    if (value == "border_right_outlined") return Icons.border_right_outlined;
    if (value == "border_style") return Icons.border_style;
    if (value == "border_style_sharp") return Icons.border_style_sharp;
    if (value == "border_style_rounded") return Icons.border_style_rounded;
    if (value == "border_style_outlined") return Icons.border_style_outlined;
    if (value == "border_top") return Icons.border_top;
    if (value == "border_top_sharp") return Icons.border_top_sharp;
    if (value == "border_top_rounded") return Icons.border_top_rounded;
    if (value == "border_top_outlined") return Icons.border_top_outlined;
    if (value == "border_vertical") return Icons.border_vertical;
    if (value == "border_vertical_sharp") return Icons.border_vertical_sharp;
    if (value == "border_vertical_rounded")
      return Icons.border_vertical_rounded;
    if (value == "border_vertical_outlined")
      return Icons.border_vertical_outlined;
    if (value == "boy") return Icons.boy;
    if (value == "boy_sharp") return Icons.boy_sharp;
    if (value == "boy_rounded") return Icons.boy_rounded;
    if (value == "boy_outlined") return Icons.boy_outlined;
    if (value == "branding_watermark") return Icons.branding_watermark;
    if (value == "branding_watermark_sharp")
      return Icons.branding_watermark_sharp;
    if (value == "branding_watermark_rounded")
      return Icons.branding_watermark_rounded;
    if (value == "branding_watermark_outlined")
      return Icons.branding_watermark_outlined;
    if (value == "breakfast_dining") return Icons.breakfast_dining;
    if (value == "breakfast_dining_sharp") return Icons.breakfast_dining_sharp;
    if (value == "breakfast_dining_rounded")
      return Icons.breakfast_dining_rounded;
    if (value == "breakfast_dining_outlined")
      return Icons.breakfast_dining_outlined;
    if (value == "brightness_1") return Icons.brightness_1;
    if (value == "brightness_1_sharp") return Icons.brightness_1_sharp;
    if (value == "brightness_1_rounded") return Icons.brightness_1_rounded;
    if (value == "brightness_1_outlined") return Icons.brightness_1_outlined;
    if (value == "brightness_2") return Icons.brightness_2;
    if (value == "brightness_2_sharp") return Icons.brightness_2_sharp;
    if (value == "brightness_2_rounded") return Icons.brightness_2_rounded;
    if (value == "brightness_2_outlined") return Icons.brightness_2_outlined;
    if (value == "brightness_3") return Icons.brightness_3;
    if (value == "brightness_3_sharp") return Icons.brightness_3_sharp;
    if (value == "brightness_3_rounded") return Icons.brightness_3_rounded;
    if (value == "brightness_3_outlined") return Icons.brightness_3_outlined;
    if (value == "brightness_4") return Icons.brightness_4;
    if (value == "brightness_4_sharp") return Icons.brightness_4_sharp;
    if (value == "brightness_4_rounded") return Icons.brightness_4_rounded;
    if (value == "brightness_4_outlined") return Icons.brightness_4_outlined;
    if (value == "brightness_5") return Icons.brightness_5;
    if (value == "brightness_5_sharp") return Icons.brightness_5_sharp;
    if (value == "brightness_5_rounded") return Icons.brightness_5_rounded;
    if (value == "brightness_5_outlined") return Icons.brightness_5_outlined;
    if (value == "brightness_6") return Icons.brightness_6;
    if (value == "brightness_6_sharp") return Icons.brightness_6_sharp;
    if (value == "brightness_6_rounded") return Icons.brightness_6_rounded;
    if (value == "brightness_6_outlined") return Icons.brightness_6_outlined;
    if (value == "brightness_7") return Icons.brightness_7;
    if (value == "brightness_7_sharp") return Icons.brightness_7_sharp;
    if (value == "brightness_7_rounded") return Icons.brightness_7_rounded;
    if (value == "brightness_7_outlined") return Icons.brightness_7_outlined;
    if (value == "brightness_auto") return Icons.brightness_auto;
    if (value == "brightness_auto_sharp") return Icons.brightness_auto_sharp;
    if (value == "brightness_auto_rounded")
      return Icons.brightness_auto_rounded;
    if (value == "brightness_auto_outlined")
      return Icons.brightness_auto_outlined;
    if (value == "brightness_high") return Icons.brightness_high;
    if (value == "brightness_high_sharp") return Icons.brightness_high_sharp;
    if (value == "brightness_high_rounded")
      return Icons.brightness_high_rounded;
    if (value == "brightness_high_outlined")
      return Icons.brightness_high_outlined;
    if (value == "brightness_low") return Icons.brightness_low;
    if (value == "brightness_low_sharp") return Icons.brightness_low_sharp;
    if (value == "brightness_low_rounded") return Icons.brightness_low_rounded;
    if (value == "brightness_low_outlined")
      return Icons.brightness_low_outlined;
    if (value == "brightness_medium") return Icons.brightness_medium;
    if (value == "brightness_medium_sharp")
      return Icons.brightness_medium_sharp;
    if (value == "brightness_medium_rounded")
      return Icons.brightness_medium_rounded;
    if (value == "brightness_medium_outlined")
      return Icons.brightness_medium_outlined;
    if (value == "broadcast_on_home") return Icons.broadcast_on_home;
    if (value == "broadcast_on_home_sharp")
      return Icons.broadcast_on_home_sharp;
    if (value == "broadcast_on_home_rounded")
      return Icons.broadcast_on_home_rounded;
    if (value == "broadcast_on_home_outlined")
      return Icons.broadcast_on_home_outlined;
    if (value == "broadcast_on_personal") return Icons.broadcast_on_personal;
    if (value == "broadcast_on_personal_sharp")
      return Icons.broadcast_on_personal_sharp;
    if (value == "broadcast_on_personal_rounded")
      return Icons.broadcast_on_personal_rounded;
    if (value == "broadcast_on_personal_outlined")
      return Icons.broadcast_on_personal_outlined;
    if (value == "broken_image") return Icons.broken_image;
    if (value == "broken_image_sharp") return Icons.broken_image_sharp;
    if (value == "broken_image_rounded") return Icons.broken_image_rounded;
    if (value == "broken_image_outlined") return Icons.broken_image_outlined;
    if (value == "browse_gallery") return Icons.browse_gallery;
    if (value == "browse_gallery_sharp") return Icons.browse_gallery_sharp;
    if (value == "browse_gallery_rounded") return Icons.browse_gallery_rounded;
    if (value == "browse_gallery_outlined")
      return Icons.browse_gallery_outlined;
    if (value == "browser_not_supported") return Icons.browser_not_supported;
    if (value == "browser_not_supported_sharp")
      return Icons.browser_not_supported_sharp;
    if (value == "browser_not_supported_rounded")
      return Icons.browser_not_supported_rounded;
    if (value == "browser_not_supported_outlined")
      return Icons.browser_not_supported_outlined;
    if (value == "browser_updated") return Icons.browser_updated;
    if (value == "browser_updated_sharp") return Icons.browser_updated_sharp;
    if (value == "browser_updated_rounded")
      return Icons.browser_updated_rounded;
    if (value == "browser_updated_outlined")
      return Icons.browser_updated_outlined;
    if (value == "brunch_dining") return Icons.brunch_dining;
    if (value == "brunch_dining_sharp") return Icons.brunch_dining_sharp;
    if (value == "brunch_dining_rounded") return Icons.brunch_dining_rounded;
    if (value == "brunch_dining_outlined") return Icons.brunch_dining_outlined;
    if (value == "brush") return Icons.brush;
    if (value == "brush_sharp") return Icons.brush_sharp;
    if (value == "brush_rounded") return Icons.brush_rounded;
    if (value == "brush_outlined") return Icons.brush_outlined;
    if (value == "bubble_chart") return Icons.bubble_chart;
    if (value == "bubble_chart_sharp") return Icons.bubble_chart_sharp;
    if (value == "bubble_chart_rounded") return Icons.bubble_chart_rounded;
    if (value == "bubble_chart_outlined") return Icons.bubble_chart_outlined;
    if (value == "bug_report") return Icons.bug_report;
    if (value == "bug_report_sharp") return Icons.bug_report_sharp;
    if (value == "bug_report_rounded") return Icons.bug_report_rounded;
    if (value == "bug_report_outlined") return Icons.bug_report_outlined;
    if (value == "build") return Icons.build;
    if (value == "build_sharp") return Icons.build_sharp;
    if (value == "build_rounded") return Icons.build_rounded;
    if (value == "build_outlined") return Icons.build_outlined;
    if (value == "build_circle") return Icons.build_circle;
    if (value == "build_circle_sharp") return Icons.build_circle_sharp;
    if (value == "build_circle_rounded") return Icons.build_circle_rounded;
    if (value == "build_circle_outlined") return Icons.build_circle_outlined;
    if (value == "bungalow") return Icons.bungalow;
    if (value == "bungalow_sharp") return Icons.bungalow_sharp;
    if (value == "bungalow_rounded") return Icons.bungalow_rounded;
    if (value == "bungalow_outlined") return Icons.bungalow_outlined;
    if (value == "burst_mode") return Icons.burst_mode;
    if (value == "burst_mode_sharp") return Icons.burst_mode_sharp;
    if (value == "burst_mode_rounded") return Icons.burst_mode_rounded;
    if (value == "burst_mode_outlined") return Icons.burst_mode_outlined;
    if (value == "bus_alert") return Icons.bus_alert;
    if (value == "bus_alert_sharp") return Icons.bus_alert_sharp;
    if (value == "bus_alert_rounded") return Icons.bus_alert_rounded;
    if (value == "bus_alert_outlined") return Icons.bus_alert_outlined;
    if (value == "business") return Icons.business;
    if (value == "business_sharp") return Icons.business_sharp;
    if (value == "business_rounded") return Icons.business_rounded;
    if (value == "business_outlined") return Icons.business_outlined;
    if (value == "business_center") return Icons.business_center;
    if (value == "business_center_sharp") return Icons.business_center_sharp;
    if (value == "business_center_rounded")
      return Icons.business_center_rounded;
    if (value == "business_center_outlined")
      return Icons.business_center_outlined;
    if (value == "cabin") return Icons.cabin;
    if (value == "cabin_sharp") return Icons.cabin_sharp;
    if (value == "cabin_rounded") return Icons.cabin_rounded;
    if (value == "cabin_outlined") return Icons.cabin_outlined;
    if (value == "cable") return Icons.cable;
    if (value == "cable_sharp") return Icons.cable_sharp;
    if (value == "cable_rounded") return Icons.cable_rounded;
    if (value == "cable_outlined") return Icons.cable_outlined;
    if (value == "cached") return Icons.cached;
    if (value == "cached_sharp") return Icons.cached_sharp;
    if (value == "cached_rounded") return Icons.cached_rounded;
    if (value == "cached_outlined") return Icons.cached_outlined;
    if (value == "cake") return Icons.cake;
    if (value == "cake_sharp") return Icons.cake_sharp;
    if (value == "cake_rounded") return Icons.cake_rounded;
    if (value == "cake_outlined") return Icons.cake_outlined;
    if (value == "calculate") return Icons.calculate;
    if (value == "calculate_sharp") return Icons.calculate_sharp;
    if (value == "calculate_rounded") return Icons.calculate_rounded;
    if (value == "calculate_outlined") return Icons.calculate_outlined;
    if (value == "calendar_month") return Icons.calendar_month;
    if (value == "calendar_month_sharp") return Icons.calendar_month_sharp;
    if (value == "calendar_month_rounded") return Icons.calendar_month_rounded;
    if (value == "calendar_month_outlined")
      return Icons.calendar_month_outlined;
    if (value == "calendar_today") return Icons.calendar_today;
    if (value == "calendar_today_sharp") return Icons.calendar_today_sharp;
    if (value == "calendar_today_rounded") return Icons.calendar_today_rounded;
    if (value == "calendar_today_outlined")
      return Icons.calendar_today_outlined;
    if (value == "calendar_view_day") return Icons.calendar_view_day;
    if (value == "calendar_view_day_sharp")
      return Icons.calendar_view_day_sharp;
    if (value == "calendar_view_day_rounded")
      return Icons.calendar_view_day_rounded;
    if (value == "calendar_view_day_outlined")
      return Icons.calendar_view_day_outlined;
    if (value == "calendar_view_month") return Icons.calendar_view_month;
    if (value == "calendar_view_month_sharp")
      return Icons.calendar_view_month_sharp;
    if (value == "calendar_view_month_rounded")
      return Icons.calendar_view_month_rounded;
    if (value == "calendar_view_month_outlined")
      return Icons.calendar_view_month_outlined;
    if (value == "calendar_view_week") return Icons.calendar_view_week;
    if (value == "calendar_view_week_sharp")
      return Icons.calendar_view_week_sharp;
    if (value == "calendar_view_week_rounded")
      return Icons.calendar_view_week_rounded;
    if (value == "calendar_view_week_outlined")
      return Icons.calendar_view_week_outlined;
    if (value == "call") return Icons.call;
    if (value == "call_sharp") return Icons.call_sharp;
    if (value == "call_rounded") return Icons.call_rounded;
    if (value == "call_outlined") return Icons.call_outlined;
    if (value == "call_end") return Icons.call_end;
    if (value == "call_end_sharp") return Icons.call_end_sharp;
    if (value == "call_end_rounded") return Icons.call_end_rounded;
    if (value == "call_end_outlined") return Icons.call_end_outlined;
    if (value == "call_made") return Icons.call_made;
    if (value == "call_made_sharp") return Icons.call_made_sharp;
    if (value == "call_made_rounded") return Icons.call_made_rounded;
    if (value == "call_made_outlined") return Icons.call_made_outlined;
    if (value == "call_merge") return Icons.call_merge;
    if (value == "call_merge_sharp") return Icons.call_merge_sharp;
    if (value == "call_merge_rounded") return Icons.call_merge_rounded;
    if (value == "call_merge_outlined") return Icons.call_merge_outlined;
    if (value == "call_missed") return Icons.call_missed;
    if (value == "call_missed_sharp") return Icons.call_missed_sharp;
    if (value == "call_missed_rounded") return Icons.call_missed_rounded;
    if (value == "call_missed_outlined") return Icons.call_missed_outlined;
    if (value == "call_missed_outgoing") return Icons.call_missed_outgoing;
    if (value == "call_missed_outgoing_sharp")
      return Icons.call_missed_outgoing_sharp;
    if (value == "call_missed_outgoing_rounded")
      return Icons.call_missed_outgoing_rounded;
    if (value == "call_missed_outgoing_outlined")
      return Icons.call_missed_outgoing_outlined;
    if (value == "call_received") return Icons.call_received;
    if (value == "call_received_sharp") return Icons.call_received_sharp;
    if (value == "call_received_rounded") return Icons.call_received_rounded;
    if (value == "call_received_outlined") return Icons.call_received_outlined;
    if (value == "call_split") return Icons.call_split;
    if (value == "call_split_sharp") return Icons.call_split_sharp;
    if (value == "call_split_rounded") return Icons.call_split_rounded;
    if (value == "call_split_outlined") return Icons.call_split_outlined;
    if (value == "call_to_action") return Icons.call_to_action;
    if (value == "call_to_action_sharp") return Icons.call_to_action_sharp;
    if (value == "call_to_action_rounded") return Icons.call_to_action_rounded;
    if (value == "call_to_action_outlined")
      return Icons.call_to_action_outlined;
    if (value == "camera") return Icons.camera;
    if (value == "camera_sharp") return Icons.camera_sharp;
    if (value == "camera_rounded") return Icons.camera_rounded;
    if (value == "camera_outlined") return Icons.camera_outlined;
    if (value == "camera_alt") return Icons.camera_alt;
    if (value == "camera_alt_sharp") return Icons.camera_alt_sharp;
    if (value == "camera_alt_rounded") return Icons.camera_alt_rounded;
    if (value == "camera_alt_outlined") return Icons.camera_alt_outlined;
    if (value == "camera_enhance") return Icons.camera_enhance;
    if (value == "camera_enhance_sharp") return Icons.camera_enhance_sharp;
    if (value == "camera_enhance_rounded") return Icons.camera_enhance_rounded;
    if (value == "camera_enhance_outlined")
      return Icons.camera_enhance_outlined;
    if (value == "camera_front") return Icons.camera_front;
    if (value == "camera_front_sharp") return Icons.camera_front_sharp;
    if (value == "camera_front_rounded") return Icons.camera_front_rounded;
    if (value == "camera_front_outlined") return Icons.camera_front_outlined;
    if (value == "camera_indoor") return Icons.camera_indoor;
    if (value == "camera_indoor_sharp") return Icons.camera_indoor_sharp;
    if (value == "camera_indoor_rounded") return Icons.camera_indoor_rounded;
    if (value == "camera_indoor_outlined") return Icons.camera_indoor_outlined;
    if (value == "camera_outdoor") return Icons.camera_outdoor;
    if (value == "camera_outdoor_sharp") return Icons.camera_outdoor_sharp;
    if (value == "camera_outdoor_rounded") return Icons.camera_outdoor_rounded;
    if (value == "camera_outdoor_outlined")
      return Icons.camera_outdoor_outlined;
    if (value == "camera_rear") return Icons.camera_rear;
    if (value == "camera_rear_sharp") return Icons.camera_rear_sharp;
    if (value == "camera_rear_rounded") return Icons.camera_rear_rounded;
    if (value == "camera_rear_outlined") return Icons.camera_rear_outlined;
    if (value == "camera_roll") return Icons.camera_roll;
    if (value == "camera_roll_sharp") return Icons.camera_roll_sharp;
    if (value == "camera_roll_rounded") return Icons.camera_roll_rounded;
    if (value == "camera_roll_outlined") return Icons.camera_roll_outlined;
    if (value == "cameraswitch") return Icons.cameraswitch;
    if (value == "cameraswitch_sharp") return Icons.cameraswitch_sharp;
    if (value == "cameraswitch_rounded") return Icons.cameraswitch_rounded;
    if (value == "cameraswitch_outlined") return Icons.cameraswitch_outlined;
    if (value == "campaign") return Icons.campaign;
    if (value == "campaign_sharp") return Icons.campaign_sharp;
    if (value == "campaign_rounded") return Icons.campaign_rounded;
    if (value == "campaign_outlined") return Icons.campaign_outlined;
    if (value == "cancel") return Icons.cancel;
    if (value == "cancel_sharp") return Icons.cancel_sharp;
    if (value == "cancel_rounded") return Icons.cancel_rounded;
    if (value == "cancel_outlined") return Icons.cancel_outlined;
    if (value == "cancel_presentation") return Icons.cancel_presentation;
    if (value == "cancel_presentation_sharp")
      return Icons.cancel_presentation_sharp;
    if (value == "cancel_presentation_rounded")
      return Icons.cancel_presentation_rounded;
    if (value == "cancel_presentation_outlined")
      return Icons.cancel_presentation_outlined;
    if (value == "cancel_schedule_send") return Icons.cancel_schedule_send;
    if (value == "cancel_schedule_send_sharp")
      return Icons.cancel_schedule_send_sharp;
    if (value == "cancel_schedule_send_rounded")
      return Icons.cancel_schedule_send_rounded;
    if (value == "cancel_schedule_send_outlined")
      return Icons.cancel_schedule_send_outlined;
    if (value == "candlestick_chart") return Icons.candlestick_chart;
    if (value == "candlestick_chart_sharp")
      return Icons.candlestick_chart_sharp;
    if (value == "candlestick_chart_rounded")
      return Icons.candlestick_chart_rounded;
    if (value == "candlestick_chart_outlined")
      return Icons.candlestick_chart_outlined;
    if (value == "car_crash") return Icons.car_crash;
    if (value == "car_crash_sharp") return Icons.car_crash_sharp;
    if (value == "car_crash_rounded") return Icons.car_crash_rounded;
    if (value == "car_crash_outlined") return Icons.car_crash_outlined;
    if (value == "car_rental") return Icons.car_rental;
    if (value == "car_rental_sharp") return Icons.car_rental_sharp;
    if (value == "car_rental_rounded") return Icons.car_rental_rounded;
    if (value == "car_rental_outlined") return Icons.car_rental_outlined;
    if (value == "car_repair") return Icons.car_repair;
    if (value == "car_repair_sharp") return Icons.car_repair_sharp;
    if (value == "car_repair_rounded") return Icons.car_repair_rounded;
    if (value == "car_repair_outlined") return Icons.car_repair_outlined;
    if (value == "card_giftcard") return Icons.card_giftcard;
    if (value == "card_giftcard_sharp") return Icons.card_giftcard_sharp;
    if (value == "card_giftcard_rounded") return Icons.card_giftcard_rounded;
    if (value == "card_giftcard_outlined") return Icons.card_giftcard_outlined;
    if (value == "card_membership") return Icons.card_membership;
    if (value == "card_membership_sharp") return Icons.card_membership_sharp;
    if (value == "card_membership_rounded")
      return Icons.card_membership_rounded;
    if (value == "card_membership_outlined")
      return Icons.card_membership_outlined;
    if (value == "card_travel") return Icons.card_travel;
    if (value == "card_travel_sharp") return Icons.card_travel_sharp;
    if (value == "card_travel_rounded") return Icons.card_travel_rounded;
    if (value == "card_travel_outlined") return Icons.card_travel_outlined;
    if (value == "carpenter") return Icons.carpenter;
    if (value == "carpenter_sharp") return Icons.carpenter_sharp;
    if (value == "carpenter_rounded") return Icons.carpenter_rounded;
    if (value == "carpenter_outlined") return Icons.carpenter_outlined;
    if (value == "cases") return Icons.cases;
    if (value == "cases_sharp") return Icons.cases_sharp;
    if (value == "cases_rounded") return Icons.cases_rounded;
    if (value == "cases_outlined") return Icons.cases_outlined;
    if (value == "casino") return Icons.casino;
    if (value == "casino_sharp") return Icons.casino_sharp;
    if (value == "casino_rounded") return Icons.casino_rounded;
    if (value == "casino_outlined") return Icons.casino_outlined;
    if (value == "cast") return Icons.cast;
    if (value == "cast_sharp") return Icons.cast_sharp;
    if (value == "cast_rounded") return Icons.cast_rounded;
    if (value == "cast_outlined") return Icons.cast_outlined;
    if (value == "cast_connected") return Icons.cast_connected;
    if (value == "cast_connected_sharp") return Icons.cast_connected_sharp;
    if (value == "cast_connected_rounded") return Icons.cast_connected_rounded;
    if (value == "cast_connected_outlined")
      return Icons.cast_connected_outlined;
    if (value == "cast_for_education") return Icons.cast_for_education;
    if (value == "cast_for_education_sharp")
      return Icons.cast_for_education_sharp;
    if (value == "cast_for_education_rounded")
      return Icons.cast_for_education_rounded;
    if (value == "cast_for_education_outlined")
      return Icons.cast_for_education_outlined;
    if (value == "castle") return Icons.castle;
    if (value == "castle_sharp") return Icons.castle_sharp;
    if (value == "castle_rounded") return Icons.castle_rounded;
    if (value == "castle_outlined") return Icons.castle_outlined;
    if (value == "catching_pokemon") return Icons.catching_pokemon;
    if (value == "catching_pokemon_sharp") return Icons.catching_pokemon_sharp;
    if (value == "catching_pokemon_rounded")
      return Icons.catching_pokemon_rounded;
    if (value == "catching_pokemon_outlined")
      return Icons.catching_pokemon_outlined;
    if (value == "category") return Icons.category;
    if (value == "category_sharp") return Icons.category_sharp;
    if (value == "category_rounded") return Icons.category_rounded;
    if (value == "category_outlined") return Icons.category_outlined;
    if (value == "celebration") return Icons.celebration;
    if (value == "celebration_sharp") return Icons.celebration_sharp;
    if (value == "celebration_rounded") return Icons.celebration_rounded;
    if (value == "celebration_outlined") return Icons.celebration_outlined;
    if (value == "cell_tower") return Icons.cell_tower;
    if (value == "cell_tower_sharp") return Icons.cell_tower_sharp;
    if (value == "cell_tower_rounded") return Icons.cell_tower_rounded;
    if (value == "cell_tower_outlined") return Icons.cell_tower_outlined;
    if (value == "cell_wifi") return Icons.cell_wifi;
    if (value == "cell_wifi_sharp") return Icons.cell_wifi_sharp;
    if (value == "cell_wifi_rounded") return Icons.cell_wifi_rounded;
    if (value == "cell_wifi_outlined") return Icons.cell_wifi_outlined;
    if (value == "center_focus_strong") return Icons.center_focus_strong;
    if (value == "center_focus_strong_sharp")
      return Icons.center_focus_strong_sharp;
    if (value == "center_focus_strong_rounded")
      return Icons.center_focus_strong_rounded;
    if (value == "center_focus_strong_outlined")
      return Icons.center_focus_strong_outlined;
    if (value == "center_focus_weak") return Icons.center_focus_weak;
    if (value == "center_focus_weak_sharp")
      return Icons.center_focus_weak_sharp;
    if (value == "center_focus_weak_rounded")
      return Icons.center_focus_weak_rounded;
    if (value == "center_focus_weak_outlined")
      return Icons.center_focus_weak_outlined;
    if (value == "chair") return Icons.chair;
    if (value == "chair_sharp") return Icons.chair_sharp;
    if (value == "chair_rounded") return Icons.chair_rounded;
    if (value == "chair_outlined") return Icons.chair_outlined;
    if (value == "chair_alt") return Icons.chair_alt;
    if (value == "chair_alt_sharp") return Icons.chair_alt_sharp;
    if (value == "chair_alt_rounded") return Icons.chair_alt_rounded;
    if (value == "chair_alt_outlined") return Icons.chair_alt_outlined;
    if (value == "chalet") return Icons.chalet;
    if (value == "chalet_sharp") return Icons.chalet_sharp;
    if (value == "chalet_rounded") return Icons.chalet_rounded;
    if (value == "chalet_outlined") return Icons.chalet_outlined;
    if (value == "change_circle") return Icons.change_circle;
    if (value == "change_circle_sharp") return Icons.change_circle_sharp;
    if (value == "change_circle_rounded") return Icons.change_circle_rounded;
    if (value == "change_circle_outlined") return Icons.change_circle_outlined;
    if (value == "change_history") return Icons.change_history;
    if (value == "change_history_sharp") return Icons.change_history_sharp;
    if (value == "change_history_rounded") return Icons.change_history_rounded;
    if (value == "change_history_outlined")
      return Icons.change_history_outlined;
    if (value == "charging_station") return Icons.charging_station;
    if (value == "charging_station_sharp") return Icons.charging_station_sharp;
    if (value == "charging_station_rounded")
      return Icons.charging_station_rounded;
    if (value == "charging_station_outlined")
      return Icons.charging_station_outlined;
    if (value == "chat") return Icons.chat;
    if (value == "chat_sharp") return Icons.chat_sharp;
    if (value == "chat_rounded") return Icons.chat_rounded;
    if (value == "chat_outlined") return Icons.chat_outlined;
    if (value == "chat_bubble") return Icons.chat_bubble;
    if (value == "chat_bubble_sharp") return Icons.chat_bubble_sharp;
    if (value == "chat_bubble_rounded") return Icons.chat_bubble_rounded;
    if (value == "chat_bubble_outlined") return Icons.chat_bubble_outlined;
    if (value == "chat_bubble_outline") return Icons.chat_bubble_outline;
    if (value == "chat_bubble_outline_sharp")
      return Icons.chat_bubble_outline_sharp;
    if (value == "chat_bubble_outline_rounded")
      return Icons.chat_bubble_outline_rounded;
    if (value == "chat_bubble_outline_outlined")
      return Icons.chat_bubble_outline_outlined;
    if (value == "check") return Icons.check;
    if (value == "check_sharp") return Icons.check_sharp;
    if (value == "check_rounded") return Icons.check_rounded;
    if (value == "check_outlined") return Icons.check_outlined;
    if (value == "check_box") return Icons.check_box;
    if (value == "check_box_sharp") return Icons.check_box_sharp;
    if (value == "check_box_rounded") return Icons.check_box_rounded;
    if (value == "check_box_outlined") return Icons.check_box_outlined;
    if (value == "check_box_outline_blank")
      return Icons.check_box_outline_blank;
    if (value == "check_box_outline_blank_sharp")
      return Icons.check_box_outline_blank_sharp;
    if (value == "check_box_outline_blank_rounded")
      return Icons.check_box_outline_blank_rounded;
    if (value == "check_box_outline_blank_outlined")
      return Icons.check_box_outline_blank_outlined;
    if (value == "check_circle") return Icons.check_circle;
    if (value == "check_circle_sharp") return Icons.check_circle_sharp;
    if (value == "check_circle_rounded") return Icons.check_circle_rounded;
    if (value == "check_circle_outlined") return Icons.check_circle_outlined;
    if (value == "check_circle_outline") return Icons.check_circle_outline;
    if (value == "check_circle_outline_sharp")
      return Icons.check_circle_outline_sharp;
    if (value == "check_circle_outline_rounded")
      return Icons.check_circle_outline_rounded;
    if (value == "check_circle_outline_outlined")
      return Icons.check_circle_outline_outlined;
    if (value == "checklist") return Icons.checklist;
    if (value == "checklist_sharp") return Icons.checklist_sharp;
    if (value == "checklist_rounded") return Icons.checklist_rounded;
    if (value == "checklist_outlined") return Icons.checklist_outlined;
    if (value == "checklist_rtl") return Icons.checklist_rtl;
    if (value == "checklist_rtl_sharp") return Icons.checklist_rtl_sharp;
    if (value == "checklist_rtl_rounded") return Icons.checklist_rtl_rounded;
    if (value == "checklist_rtl_outlined") return Icons.checklist_rtl_outlined;
    if (value == "checkroom") return Icons.checkroom;
    if (value == "checkroom_sharp") return Icons.checkroom_sharp;
    if (value == "checkroom_rounded") return Icons.checkroom_rounded;
    if (value == "checkroom_outlined") return Icons.checkroom_outlined;
    if (value == "chevron_left") return Icons.chevron_left;
    if (value == "chevron_left_sharp") return Icons.chevron_left_sharp;
    if (value == "chevron_left_rounded") return Icons.chevron_left_rounded;
    if (value == "chevron_left_outlined") return Icons.chevron_left_outlined;
    if (value == "chevron_right") return Icons.chevron_right;
    if (value == "chevron_right_sharp") return Icons.chevron_right_sharp;
    if (value == "chevron_right_rounded") return Icons.chevron_right_rounded;
    if (value == "chevron_right_outlined") return Icons.chevron_right_outlined;
    if (value == "child_care") return Icons.child_care;
    if (value == "child_care_sharp") return Icons.child_care_sharp;
    if (value == "child_care_rounded") return Icons.child_care_rounded;
    if (value == "child_care_outlined") return Icons.child_care_outlined;
    if (value == "child_friendly") return Icons.child_friendly;
    if (value == "child_friendly_sharp") return Icons.child_friendly_sharp;
    if (value == "child_friendly_rounded") return Icons.child_friendly_rounded;
    if (value == "child_friendly_outlined")
      return Icons.child_friendly_outlined;
    if (value == "chrome_reader_mode") return Icons.chrome_reader_mode;
    if (value == "chrome_reader_mode_sharp")
      return Icons.chrome_reader_mode_sharp;
    if (value == "chrome_reader_mode_rounded")
      return Icons.chrome_reader_mode_rounded;
    if (value == "chrome_reader_mode_outlined")
      return Icons.chrome_reader_mode_outlined;
    if (value == "church") return Icons.church;
    if (value == "church_sharp") return Icons.church_sharp;
    if (value == "church_rounded") return Icons.church_rounded;
    if (value == "church_outlined") return Icons.church_outlined;
    if (value == "circle") return Icons.circle;
    if (value == "circle_sharp") return Icons.circle_sharp;
    if (value == "circle_rounded") return Icons.circle_rounded;
    if (value == "circle_outlined") return Icons.circle_outlined;
    if (value == "circle_notifications") return Icons.circle_notifications;
    if (value == "circle_notifications_sharp")
      return Icons.circle_notifications_sharp;
    if (value == "circle_notifications_rounded")
      return Icons.circle_notifications_rounded;
    if (value == "circle_notifications_outlined")
      return Icons.circle_notifications_outlined;
    if (value == "class_") return Icons.class_;
    if (value == "class_sharp") return Icons.class_sharp;
    if (value == "class_rounded") return Icons.class_rounded;
    if (value == "class_outlined") return Icons.class_outlined;
    if (value == "clean_hands") return Icons.clean_hands;
    if (value == "clean_hands_sharp") return Icons.clean_hands_sharp;
    if (value == "clean_hands_rounded") return Icons.clean_hands_rounded;
    if (value == "clean_hands_outlined") return Icons.clean_hands_outlined;
    if (value == "cleaning_services") return Icons.cleaning_services;
    if (value == "cleaning_services_sharp")
      return Icons.cleaning_services_sharp;
    if (value == "cleaning_services_rounded")
      return Icons.cleaning_services_rounded;
    if (value == "cleaning_services_outlined")
      return Icons.cleaning_services_outlined;
    if (value == "clear") return Icons.clear;
    if (value == "clear_sharp") return Icons.clear_sharp;
    if (value == "clear_rounded") return Icons.clear_rounded;
    if (value == "clear_outlined") return Icons.clear_outlined;
    if (value == "clear_all") return Icons.clear_all;
    if (value == "clear_all_sharp") return Icons.clear_all_sharp;
    if (value == "clear_all_rounded") return Icons.clear_all_rounded;
    if (value == "clear_all_outlined") return Icons.clear_all_outlined;
    if (value == "close") return Icons.close;
    if (value == "close_sharp") return Icons.close_sharp;
    if (value == "close_rounded") return Icons.close_rounded;
    if (value == "close_outlined") return Icons.close_outlined;
    if (value == "close_fullscreen") return Icons.close_fullscreen;
    if (value == "close_fullscreen_sharp") return Icons.close_fullscreen_sharp;
    if (value == "close_fullscreen_rounded")
      return Icons.close_fullscreen_rounded;
    if (value == "close_fullscreen_outlined")
      return Icons.close_fullscreen_outlined;
    if (value == "closed_caption") return Icons.closed_caption;
    if (value == "closed_caption_sharp") return Icons.closed_caption_sharp;
    if (value == "closed_caption_rounded") return Icons.closed_caption_rounded;
    if (value == "closed_caption_outlined")
      return Icons.closed_caption_outlined;
    if (value == "closed_caption_disabled")
      return Icons.closed_caption_disabled;
    if (value == "closed_caption_disabled_sharp")
      return Icons.closed_caption_disabled_sharp;
    if (value == "closed_caption_disabled_rounded")
      return Icons.closed_caption_disabled_rounded;
    if (value == "closed_caption_disabled_outlined")
      return Icons.closed_caption_disabled_outlined;
    if (value == "closed_caption_off") return Icons.closed_caption_off;
    if (value == "closed_caption_off_sharp")
      return Icons.closed_caption_off_sharp;
    if (value == "closed_caption_off_rounded")
      return Icons.closed_caption_off_rounded;
    if (value == "closed_caption_off_outlined")
      return Icons.closed_caption_off_outlined;
    if (value == "cloud") return Icons.cloud;
    if (value == "cloud_sharp") return Icons.cloud_sharp;
    if (value == "cloud_rounded") return Icons.cloud_rounded;
    if (value == "cloud_outlined") return Icons.cloud_outlined;
    if (value == "cloud_circle") return Icons.cloud_circle;
    if (value == "cloud_circle_sharp") return Icons.cloud_circle_sharp;
    if (value == "cloud_circle_rounded") return Icons.cloud_circle_rounded;
    if (value == "cloud_circle_outlined") return Icons.cloud_circle_outlined;
    if (value == "cloud_done") return Icons.cloud_done;
    if (value == "cloud_done_sharp") return Icons.cloud_done_sharp;
    if (value == "cloud_done_rounded") return Icons.cloud_done_rounded;
    if (value == "cloud_done_outlined") return Icons.cloud_done_outlined;
    if (value == "cloud_download") return Icons.cloud_download;
    if (value == "cloud_download_sharp") return Icons.cloud_download_sharp;
    if (value == "cloud_download_rounded") return Icons.cloud_download_rounded;
    if (value == "cloud_download_outlined")
      return Icons.cloud_download_outlined;
    if (value == "cloud_off") return Icons.cloud_off;
    if (value == "cloud_off_sharp") return Icons.cloud_off_sharp;
    if (value == "cloud_off_rounded") return Icons.cloud_off_rounded;
    if (value == "cloud_off_outlined") return Icons.cloud_off_outlined;
    if (value == "cloud_queue") return Icons.cloud_queue;
    if (value == "cloud_queue_sharp") return Icons.cloud_queue_sharp;
    if (value == "cloud_queue_rounded") return Icons.cloud_queue_rounded;
    if (value == "cloud_queue_outlined") return Icons.cloud_queue_outlined;
    if (value == "cloud_sync") return Icons.cloud_sync;
    if (value == "cloud_sync_sharp") return Icons.cloud_sync_sharp;
    if (value == "cloud_sync_rounded") return Icons.cloud_sync_rounded;
    if (value == "cloud_sync_outlined") return Icons.cloud_sync_outlined;
    if (value == "cloud_upload") return Icons.cloud_upload;
    if (value == "cloud_upload_sharp") return Icons.cloud_upload_sharp;
    if (value == "cloud_upload_rounded") return Icons.cloud_upload_rounded;
    if (value == "cloud_upload_outlined") return Icons.cloud_upload_outlined;
    if (value == "cloudy_snowing") return Icons.cloudy_snowing;
    if (value == "co2") return Icons.co2;
    if (value == "co2_sharp") return Icons.co2_sharp;
    if (value == "co2_rounded") return Icons.co2_rounded;
    if (value == "co2_outlined") return Icons.co2_outlined;
    if (value == "co_present") return Icons.co_present;
    if (value == "co_present_sharp") return Icons.co_present_sharp;
    if (value == "co_present_rounded") return Icons.co_present_rounded;
    if (value == "co_present_outlined") return Icons.co_present_outlined;
    if (value == "code") return Icons.code;
    if (value == "code_sharp") return Icons.code_sharp;
    if (value == "code_rounded") return Icons.code_rounded;
    if (value == "code_outlined") return Icons.code_outlined;
    if (value == "code_off") return Icons.code_off;
    if (value == "code_off_sharp") return Icons.code_off_sharp;
    if (value == "code_off_rounded") return Icons.code_off_rounded;
    if (value == "code_off_outlined") return Icons.code_off_outlined;
    if (value == "coffee") return Icons.coffee;
    if (value == "coffee_sharp") return Icons.coffee_sharp;
    if (value == "coffee_rounded") return Icons.coffee_rounded;
    if (value == "coffee_outlined") return Icons.coffee_outlined;
    if (value == "coffee_maker") return Icons.coffee_maker;
    if (value == "coffee_maker_sharp") return Icons.coffee_maker_sharp;
    if (value == "coffee_maker_rounded") return Icons.coffee_maker_rounded;
    if (value == "coffee_maker_outlined") return Icons.coffee_maker_outlined;
    if (value == "collections") return Icons.collections;
    if (value == "collections_sharp") return Icons.collections_sharp;
    if (value == "collections_rounded") return Icons.collections_rounded;
    if (value == "collections_outlined") return Icons.collections_outlined;
    if (value == "collections_bookmark") return Icons.collections_bookmark;
    if (value == "collections_bookmark_sharp")
      return Icons.collections_bookmark_sharp;
    if (value == "collections_bookmark_rounded")
      return Icons.collections_bookmark_rounded;
    if (value == "collections_bookmark_outlined")
      return Icons.collections_bookmark_outlined;
    if (value == "color_lens") return Icons.color_lens;
    if (value == "color_lens_sharp") return Icons.color_lens_sharp;
    if (value == "color_lens_rounded") return Icons.color_lens_rounded;
    if (value == "color_lens_outlined") return Icons.color_lens_outlined;
    if (value == "colorize") return Icons.colorize;
    if (value == "colorize_sharp") return Icons.colorize_sharp;
    if (value == "colorize_rounded") return Icons.colorize_rounded;
    if (value == "colorize_outlined") return Icons.colorize_outlined;
    if (value == "comment") return Icons.comment;
    if (value == "comment_sharp") return Icons.comment_sharp;
    if (value == "comment_rounded") return Icons.comment_rounded;
    if (value == "comment_outlined") return Icons.comment_outlined;
    if (value == "comment_bank") return Icons.comment_bank;
    if (value == "comment_bank_sharp") return Icons.comment_bank_sharp;
    if (value == "comment_bank_rounded") return Icons.comment_bank_rounded;
    if (value == "comment_bank_outlined") return Icons.comment_bank_outlined;
    if (value == "comments_disabled") return Icons.comments_disabled;
    if (value == "comments_disabled_sharp")
      return Icons.comments_disabled_sharp;
    if (value == "comments_disabled_rounded")
      return Icons.comments_disabled_rounded;
    if (value == "comments_disabled_outlined")
      return Icons.comments_disabled_outlined;
    if (value == "commit") return Icons.commit;
    if (value == "commit_sharp") return Icons.commit_sharp;
    if (value == "commit_rounded") return Icons.commit_rounded;
    if (value == "commit_outlined") return Icons.commit_outlined;
    if (value == "commute") return Icons.commute;
    if (value == "commute_sharp") return Icons.commute_sharp;
    if (value == "commute_rounded") return Icons.commute_rounded;
    if (value == "commute_outlined") return Icons.commute_outlined;
    if (value == "compare") return Icons.compare;
    if (value == "compare_sharp") return Icons.compare_sharp;
    if (value == "compare_rounded") return Icons.compare_rounded;
    if (value == "compare_outlined") return Icons.compare_outlined;
    if (value == "compare_arrows") return Icons.compare_arrows;
    if (value == "compare_arrows_sharp") return Icons.compare_arrows_sharp;
    if (value == "compare_arrows_rounded") return Icons.compare_arrows_rounded;
    if (value == "compare_arrows_outlined")
      return Icons.compare_arrows_outlined;
    if (value == "compass_calibration") return Icons.compass_calibration;
    if (value == "compass_calibration_sharp")
      return Icons.compass_calibration_sharp;
    if (value == "compass_calibration_rounded")
      return Icons.compass_calibration_rounded;
    if (value == "compass_calibration_outlined")
      return Icons.compass_calibration_outlined;
    if (value == "compost") return Icons.compost;
    if (value == "compost_sharp") return Icons.compost_sharp;
    if (value == "compost_rounded") return Icons.compost_rounded;
    if (value == "compost_outlined") return Icons.compost_outlined;
    if (value == "compress") return Icons.compress;
    if (value == "compress_sharp") return Icons.compress_sharp;
    if (value == "compress_rounded") return Icons.compress_rounded;
    if (value == "compress_outlined") return Icons.compress_outlined;
    if (value == "computer") return Icons.computer;
    if (value == "computer_sharp") return Icons.computer_sharp;
    if (value == "computer_rounded") return Icons.computer_rounded;
    if (value == "computer_outlined") return Icons.computer_outlined;
    if (value == "confirmation_num") return Icons.confirmation_num;
    if (value == "confirmation_num_sharp") return Icons.confirmation_num_sharp;
    if (value == "confirmation_num_rounded")
      return Icons.confirmation_num_rounded;
    if (value == "confirmation_num_outlined")
      return Icons.confirmation_num_outlined;
    if (value == "confirmation_number") return Icons.confirmation_number;
    if (value == "confirmation_number_sharp")
      return Icons.confirmation_number_sharp;
    if (value == "confirmation_number_rounded")
      return Icons.confirmation_number_rounded;
    if (value == "confirmation_number_outlined")
      return Icons.confirmation_number_outlined;
    if (value == "connect_without_contact")
      return Icons.connect_without_contact;
    if (value == "connect_without_contact_sharp")
      return Icons.connect_without_contact_sharp;
    if (value == "connect_without_contact_rounded")
      return Icons.connect_without_contact_rounded;
    if (value == "connect_without_contact_outlined")
      return Icons.connect_without_contact_outlined;
    if (value == "connected_tv") return Icons.connected_tv;
    if (value == "connected_tv_sharp") return Icons.connected_tv_sharp;
    if (value == "connected_tv_rounded") return Icons.connected_tv_rounded;
    if (value == "connected_tv_outlined") return Icons.connected_tv_outlined;
    if (value == "connecting_airports") return Icons.connecting_airports;
    if (value == "connecting_airports_sharp")
      return Icons.connecting_airports_sharp;
    if (value == "connecting_airports_rounded")
      return Icons.connecting_airports_rounded;
    if (value == "connecting_airports_outlined")
      return Icons.connecting_airports_outlined;
    if (value == "construction") return Icons.construction;
    if (value == "construction_sharp") return Icons.construction_sharp;
    if (value == "construction_rounded") return Icons.construction_rounded;
    if (value == "construction_outlined") return Icons.construction_outlined;
    if (value == "contact_mail") return Icons.contact_mail;
    if (value == "contact_mail_sharp") return Icons.contact_mail_sharp;
    if (value == "contact_mail_rounded") return Icons.contact_mail_rounded;
    if (value == "contact_mail_outlined") return Icons.contact_mail_outlined;
    if (value == "contact_page") return Icons.contact_page;
    if (value == "contact_page_sharp") return Icons.contact_page_sharp;
    if (value == "contact_page_rounded") return Icons.contact_page_rounded;
    if (value == "contact_page_outlined") return Icons.contact_page_outlined;
    if (value == "contact_phone") return Icons.contact_phone;
    if (value == "contact_phone_sharp") return Icons.contact_phone_sharp;
    if (value == "contact_phone_rounded") return Icons.contact_phone_rounded;
    if (value == "contact_phone_outlined") return Icons.contact_phone_outlined;
    if (value == "contact_support") return Icons.contact_support;
    if (value == "contact_support_sharp") return Icons.contact_support_sharp;
    if (value == "contact_support_rounded")
      return Icons.contact_support_rounded;
    if (value == "contact_support_outlined")
      return Icons.contact_support_outlined;
    if (value == "contactless") return Icons.contactless;
    if (value == "contactless_sharp") return Icons.contactless_sharp;
    if (value == "contactless_rounded") return Icons.contactless_rounded;
    if (value == "contactless_outlined") return Icons.contactless_outlined;
    if (value == "contacts") return Icons.contacts;
    if (value == "contacts_sharp") return Icons.contacts_sharp;
    if (value == "contacts_rounded") return Icons.contacts_rounded;
    if (value == "contacts_outlined") return Icons.contacts_outlined;
    if (value == "content_copy") return Icons.content_copy;
    if (value == "content_copy_sharp") return Icons.content_copy_sharp;
    if (value == "content_copy_rounded") return Icons.content_copy_rounded;
    if (value == "content_copy_outlined") return Icons.content_copy_outlined;
    if (value == "content_cut") return Icons.content_cut;
    if (value == "content_cut_sharp") return Icons.content_cut_sharp;
    if (value == "content_cut_rounded") return Icons.content_cut_rounded;
    if (value == "content_cut_outlined") return Icons.content_cut_outlined;
    if (value == "content_paste") return Icons.content_paste;
    if (value == "content_paste_sharp") return Icons.content_paste_sharp;
    if (value == "content_paste_rounded") return Icons.content_paste_rounded;
    if (value == "content_paste_outlined") return Icons.content_paste_outlined;
    if (value == "content_paste_go") return Icons.content_paste_go;
    if (value == "content_paste_go_sharp") return Icons.content_paste_go_sharp;
    if (value == "content_paste_go_rounded")
      return Icons.content_paste_go_rounded;
    if (value == "content_paste_go_outlined")
      return Icons.content_paste_go_outlined;
    if (value == "content_paste_off") return Icons.content_paste_off;
    if (value == "content_paste_off_sharp")
      return Icons.content_paste_off_sharp;
    if (value == "content_paste_off_rounded")
      return Icons.content_paste_off_rounded;
    if (value == "content_paste_off_outlined")
      return Icons.content_paste_off_outlined;
    if (value == "content_paste_search") return Icons.content_paste_search;
    if (value == "content_paste_search_sharp")
      return Icons.content_paste_search_sharp;
    if (value == "content_paste_search_rounded")
      return Icons.content_paste_search_rounded;
    if (value == "content_paste_search_outlined")
      return Icons.content_paste_search_outlined;
    if (value == "contrast") return Icons.contrast;
    if (value == "contrast_sharp") return Icons.contrast_sharp;
    if (value == "contrast_rounded") return Icons.contrast_rounded;
    if (value == "contrast_outlined") return Icons.contrast_outlined;
    if (value == "control_camera") return Icons.control_camera;
    if (value == "control_camera_sharp") return Icons.control_camera_sharp;
    if (value == "control_camera_rounded") return Icons.control_camera_rounded;
    if (value == "control_camera_outlined")
      return Icons.control_camera_outlined;
    if (value == "control_point") return Icons.control_point;
    if (value == "control_point_sharp") return Icons.control_point_sharp;
    if (value == "control_point_rounded") return Icons.control_point_rounded;
    if (value == "control_point_outlined") return Icons.control_point_outlined;
    if (value == "control_point_duplicate")
      return Icons.control_point_duplicate;
    if (value == "control_point_duplicate_sharp")
      return Icons.control_point_duplicate_sharp;
    if (value == "control_point_duplicate_rounded")
      return Icons.control_point_duplicate_rounded;
    if (value == "control_point_duplicate_outlined")
      return Icons.control_point_duplicate_outlined;
    if (value == "cookie") return Icons.cookie;
    if (value == "cookie_sharp") return Icons.cookie_sharp;
    if (value == "cookie_rounded") return Icons.cookie_rounded;
    if (value == "cookie_outlined") return Icons.cookie_outlined;
    if (value == "copy") return Icons.copy;
    if (value == "copy_sharp") return Icons.copy_sharp;
    if (value == "copy_rounded") return Icons.copy_rounded;
    if (value == "copy_outlined") return Icons.copy_outlined;
    if (value == "copy_all") return Icons.copy_all;
    if (value == "copy_all_sharp") return Icons.copy_all_sharp;
    if (value == "copy_all_rounded") return Icons.copy_all_rounded;
    if (value == "copy_all_outlined") return Icons.copy_all_outlined;
    if (value == "copyright") return Icons.copyright;
    if (value == "copyright_sharp") return Icons.copyright_sharp;
    if (value == "copyright_rounded") return Icons.copyright_rounded;
    if (value == "copyright_outlined") return Icons.copyright_outlined;
    if (value == "coronavirus") return Icons.coronavirus;
    if (value == "coronavirus_sharp") return Icons.coronavirus_sharp;
    if (value == "coronavirus_rounded") return Icons.coronavirus_rounded;
    if (value == "coronavirus_outlined") return Icons.coronavirus_outlined;
    if (value == "corporate_fare") return Icons.corporate_fare;
    if (value == "corporate_fare_sharp") return Icons.corporate_fare_sharp;
    if (value == "corporate_fare_rounded") return Icons.corporate_fare_rounded;
    if (value == "corporate_fare_outlined")
      return Icons.corporate_fare_outlined;
    if (value == "cottage") return Icons.cottage;
    if (value == "cottage_sharp") return Icons.cottage_sharp;
    if (value == "cottage_rounded") return Icons.cottage_rounded;
    if (value == "cottage_outlined") return Icons.cottage_outlined;
    if (value == "countertops") return Icons.countertops;
    if (value == "countertops_sharp") return Icons.countertops_sharp;
    if (value == "countertops_rounded") return Icons.countertops_rounded;
    if (value == "countertops_outlined") return Icons.countertops_outlined;
    if (value == "create") return Icons.create;
    if (value == "create_sharp") return Icons.create_sharp;
    if (value == "create_rounded") return Icons.create_rounded;
    if (value == "create_outlined") return Icons.create_outlined;
    if (value == "create_new_folder") return Icons.create_new_folder;
    if (value == "create_new_folder_sharp")
      return Icons.create_new_folder_sharp;
    if (value == "create_new_folder_rounded")
      return Icons.create_new_folder_rounded;
    if (value == "create_new_folder_outlined")
      return Icons.create_new_folder_outlined;
    if (value == "credit_card") return Icons.credit_card;
    if (value == "credit_card_sharp") return Icons.credit_card_sharp;
    if (value == "credit_card_rounded") return Icons.credit_card_rounded;
    if (value == "credit_card_outlined") return Icons.credit_card_outlined;
    if (value == "credit_card_off") return Icons.credit_card_off;
    if (value == "credit_card_off_sharp") return Icons.credit_card_off_sharp;
    if (value == "credit_card_off_rounded")
      return Icons.credit_card_off_rounded;
    if (value == "credit_card_off_outlined")
      return Icons.credit_card_off_outlined;
    if (value == "credit_score") return Icons.credit_score;
    if (value == "credit_score_sharp") return Icons.credit_score_sharp;
    if (value == "credit_score_rounded") return Icons.credit_score_rounded;
    if (value == "credit_score_outlined") return Icons.credit_score_outlined;
    if (value == "crib") return Icons.crib;
    if (value == "crib_sharp") return Icons.crib_sharp;
    if (value == "crib_rounded") return Icons.crib_rounded;
    if (value == "crib_outlined") return Icons.crib_outlined;
    if (value == "crisis_alert") return Icons.crisis_alert;
    if (value == "crisis_alert_sharp") return Icons.crisis_alert_sharp;
    if (value == "crisis_alert_rounded") return Icons.crisis_alert_rounded;
    if (value == "crisis_alert_outlined") return Icons.crisis_alert_outlined;
    if (value == "crop") return Icons.crop;
    if (value == "crop_sharp") return Icons.crop_sharp;
    if (value == "crop_rounded") return Icons.crop_rounded;
    if (value == "crop_outlined") return Icons.crop_outlined;
    if (value == "crop_16_9") return Icons.crop_16_9;
    if (value == "crop_16_9_sharp") return Icons.crop_16_9_sharp;
    if (value == "crop_16_9_rounded") return Icons.crop_16_9_rounded;
    if (value == "crop_16_9_outlined") return Icons.crop_16_9_outlined;
    if (value == "crop_3_2") return Icons.crop_3_2;
    if (value == "crop_3_2_sharp") return Icons.crop_3_2_sharp;
    if (value == "crop_3_2_rounded") return Icons.crop_3_2_rounded;
    if (value == "crop_3_2_outlined") return Icons.crop_3_2_outlined;
    if (value == "crop_5_4") return Icons.crop_5_4;
    if (value == "crop_5_4_sharp") return Icons.crop_5_4_sharp;
    if (value == "crop_5_4_rounded") return Icons.crop_5_4_rounded;
    if (value == "crop_5_4_outlined") return Icons.crop_5_4_outlined;
    if (value == "crop_7_5") return Icons.crop_7_5;
    if (value == "crop_7_5_sharp") return Icons.crop_7_5_sharp;
    if (value == "crop_7_5_rounded") return Icons.crop_7_5_rounded;
    if (value == "crop_7_5_outlined") return Icons.crop_7_5_outlined;
    if (value == "crop_din") return Icons.crop_din;
    if (value == "crop_din_sharp") return Icons.crop_din_sharp;
    if (value == "crop_din_rounded") return Icons.crop_din_rounded;
    if (value == "crop_din_outlined") return Icons.crop_din_outlined;
    if (value == "crop_free") return Icons.crop_free;
    if (value == "crop_free_sharp") return Icons.crop_free_sharp;
    if (value == "crop_free_rounded") return Icons.crop_free_rounded;
    if (value == "crop_free_outlined") return Icons.crop_free_outlined;
    if (value == "crop_landscape") return Icons.crop_landscape;
    if (value == "crop_landscape_sharp") return Icons.crop_landscape_sharp;
    if (value == "crop_landscape_rounded") return Icons.crop_landscape_rounded;
    if (value == "crop_landscape_outlined")
      return Icons.crop_landscape_outlined;
    if (value == "crop_original") return Icons.crop_original;
    if (value == "crop_original_sharp") return Icons.crop_original_sharp;
    if (value == "crop_original_rounded") return Icons.crop_original_rounded;
    if (value == "crop_original_outlined") return Icons.crop_original_outlined;
    if (value == "crop_portrait") return Icons.crop_portrait;
    if (value == "crop_portrait_sharp") return Icons.crop_portrait_sharp;
    if (value == "crop_portrait_rounded") return Icons.crop_portrait_rounded;
    if (value == "crop_portrait_outlined") return Icons.crop_portrait_outlined;
    if (value == "crop_rotate") return Icons.crop_rotate;
    if (value == "crop_rotate_sharp") return Icons.crop_rotate_sharp;
    if (value == "crop_rotate_rounded") return Icons.crop_rotate_rounded;
    if (value == "crop_rotate_outlined") return Icons.crop_rotate_outlined;
    if (value == "crop_square") return Icons.crop_square;
    if (value == "crop_square_sharp") return Icons.crop_square_sharp;
    if (value == "crop_square_rounded") return Icons.crop_square_rounded;
    if (value == "crop_square_outlined") return Icons.crop_square_outlined;
    if (value == "cruelty_free") return Icons.cruelty_free;
    if (value == "cruelty_free_sharp") return Icons.cruelty_free_sharp;
    if (value == "cruelty_free_rounded") return Icons.cruelty_free_rounded;
    if (value == "cruelty_free_outlined") return Icons.cruelty_free_outlined;
    if (value == "css") return Icons.css;
    if (value == "css_sharp") return Icons.css_sharp;
    if (value == "css_rounded") return Icons.css_rounded;
    if (value == "css_outlined") return Icons.css_outlined;
    if (value == "currency_bitcoin") return Icons.currency_bitcoin;
    if (value == "currency_bitcoin_sharp") return Icons.currency_bitcoin_sharp;
    if (value == "currency_bitcoin_rounded")
      return Icons.currency_bitcoin_rounded;
    if (value == "currency_bitcoin_outlined")
      return Icons.currency_bitcoin_outlined;
    if (value == "currency_exchange") return Icons.currency_exchange;
    if (value == "currency_exchange_sharp")
      return Icons.currency_exchange_sharp;
    if (value == "currency_exchange_rounded")
      return Icons.currency_exchange_rounded;
    if (value == "currency_exchange_outlined")
      return Icons.currency_exchange_outlined;
    if (value == "currency_franc") return Icons.currency_franc;
    if (value == "currency_franc_sharp") return Icons.currency_franc_sharp;
    if (value == "currency_franc_rounded") return Icons.currency_franc_rounded;
    if (value == "currency_franc_outlined")
      return Icons.currency_franc_outlined;
    if (value == "currency_lira") return Icons.currency_lira;
    if (value == "currency_lira_sharp") return Icons.currency_lira_sharp;
    if (value == "currency_lira_rounded") return Icons.currency_lira_rounded;
    if (value == "currency_lira_outlined") return Icons.currency_lira_outlined;
    if (value == "currency_pound") return Icons.currency_pound;
    if (value == "currency_pound_sharp") return Icons.currency_pound_sharp;
    if (value == "currency_pound_rounded") return Icons.currency_pound_rounded;
    if (value == "currency_pound_outlined")
      return Icons.currency_pound_outlined;
    if (value == "currency_ruble") return Icons.currency_ruble;
    if (value == "currency_ruble_sharp") return Icons.currency_ruble_sharp;
    if (value == "currency_ruble_rounded") return Icons.currency_ruble_rounded;
    if (value == "currency_ruble_outlined")
      return Icons.currency_ruble_outlined;
    if (value == "currency_rupee") return Icons.currency_rupee;
    if (value == "currency_rupee_sharp") return Icons.currency_rupee_sharp;
    if (value == "currency_rupee_rounded") return Icons.currency_rupee_rounded;
    if (value == "currency_rupee_outlined")
      return Icons.currency_rupee_outlined;
    if (value == "currency_yen") return Icons.currency_yen;
    if (value == "currency_yen_sharp") return Icons.currency_yen_sharp;
    if (value == "currency_yen_rounded") return Icons.currency_yen_rounded;
    if (value == "currency_yen_outlined") return Icons.currency_yen_outlined;
    if (value == "currency_yuan") return Icons.currency_yuan;
    if (value == "currency_yuan_sharp") return Icons.currency_yuan_sharp;
    if (value == "currency_yuan_rounded") return Icons.currency_yuan_rounded;
    if (value == "currency_yuan_outlined") return Icons.currency_yuan_outlined;
    if (value == "curtains") return Icons.curtains;
    if (value == "curtains_sharp") return Icons.curtains_sharp;
    if (value == "curtains_rounded") return Icons.curtains_rounded;
    if (value == "curtains_outlined") return Icons.curtains_outlined;
    if (value == "curtains_closed") return Icons.curtains_closed;
    if (value == "curtains_closed_sharp") return Icons.curtains_closed_sharp;
    if (value == "curtains_closed_rounded")
      return Icons.curtains_closed_rounded;
    if (value == "curtains_closed_outlined")
      return Icons.curtains_closed_outlined;
    if (value == "cut") return Icons.cut;
    if (value == "cut_sharp") return Icons.cut_sharp;
    if (value == "cut_rounded") return Icons.cut_rounded;
    if (value == "cut_outlined") return Icons.cut_outlined;
    if (value == "cyclone") return Icons.cyclone;
    if (value == "cyclone_sharp") return Icons.cyclone_sharp;
    if (value == "cyclone_rounded") return Icons.cyclone_rounded;
    if (value == "cyclone_outlined") return Icons.cyclone_outlined;
    if (value == "dangerous") return Icons.dangerous;
    if (value == "dangerous_sharp") return Icons.dangerous_sharp;
    if (value == "dangerous_rounded") return Icons.dangerous_rounded;
    if (value == "dangerous_outlined") return Icons.dangerous_outlined;
    if (value == "dark_mode") return Icons.dark_mode;
    if (value == "dark_mode_sharp") return Icons.dark_mode_sharp;
    if (value == "dark_mode_rounded") return Icons.dark_mode_rounded;
    if (value == "dark_mode_outlined") return Icons.dark_mode_outlined;
    if (value == "dashboard") return Icons.dashboard;
    if (value == "dashboard_sharp") return Icons.dashboard_sharp;
    if (value == "dashboard_rounded") return Icons.dashboard_rounded;
    if (value == "dashboard_outlined") return Icons.dashboard_outlined;
    if (value == "dashboard_customize") return Icons.dashboard_customize;
    if (value == "dashboard_customize_sharp")
      return Icons.dashboard_customize_sharp;
    if (value == "dashboard_customize_rounded")
      return Icons.dashboard_customize_rounded;
    if (value == "dashboard_customize_outlined")
      return Icons.dashboard_customize_outlined;
    if (value == "data_array") return Icons.data_array;
    if (value == "data_array_sharp") return Icons.data_array_sharp;
    if (value == "data_array_rounded") return Icons.data_array_rounded;
    if (value == "data_array_outlined") return Icons.data_array_outlined;
    if (value == "data_exploration") return Icons.data_exploration;
    if (value == "data_exploration_sharp") return Icons.data_exploration_sharp;
    if (value == "data_exploration_rounded")
      return Icons.data_exploration_rounded;
    if (value == "data_exploration_outlined")
      return Icons.data_exploration_outlined;
    if (value == "data_object") return Icons.data_object;
    if (value == "data_object_sharp") return Icons.data_object_sharp;
    if (value == "data_object_rounded") return Icons.data_object_rounded;
    if (value == "data_object_outlined") return Icons.data_object_outlined;
    if (value == "data_saver_off") return Icons.data_saver_off;
    if (value == "data_saver_off_sharp") return Icons.data_saver_off_sharp;
    if (value == "data_saver_off_rounded") return Icons.data_saver_off_rounded;
    if (value == "data_saver_off_outlined")
      return Icons.data_saver_off_outlined;
    if (value == "data_saver_on") return Icons.data_saver_on;
    if (value == "data_saver_on_sharp") return Icons.data_saver_on_sharp;
    if (value == "data_saver_on_rounded") return Icons.data_saver_on_rounded;
    if (value == "data_saver_on_outlined") return Icons.data_saver_on_outlined;
    if (value == "data_thresholding") return Icons.data_thresholding;
    if (value == "data_thresholding_sharp")
      return Icons.data_thresholding_sharp;
    if (value == "data_thresholding_rounded")
      return Icons.data_thresholding_rounded;
    if (value == "data_thresholding_outlined")
      return Icons.data_thresholding_outlined;
    if (value == "data_usage") return Icons.data_usage;
    if (value == "data_usage_sharp") return Icons.data_usage_sharp;
    if (value == "data_usage_rounded") return Icons.data_usage_rounded;
    if (value == "data_usage_outlined") return Icons.data_usage_outlined;
    if (value == "dataset") return Icons.dataset;
    if (value == "dataset_sharp") return Icons.dataset_sharp;
    if (value == "dataset_rounded") return Icons.dataset_rounded;
    if (value == "dataset_outlined") return Icons.dataset_outlined;
    if (value == "dataset_linked") return Icons.dataset_linked;
    if (value == "dataset_linked_sharp") return Icons.dataset_linked_sharp;
    if (value == "dataset_linked_rounded") return Icons.dataset_linked_rounded;
    if (value == "dataset_linked_outlined")
      return Icons.dataset_linked_outlined;
    if (value == "date_range") return Icons.date_range;
    if (value == "date_range_sharp") return Icons.date_range_sharp;
    if (value == "date_range_rounded") return Icons.date_range_rounded;
    if (value == "date_range_outlined") return Icons.date_range_outlined;
    if (value == "deblur") return Icons.deblur;
    if (value == "deblur_sharp") return Icons.deblur_sharp;
    if (value == "deblur_rounded") return Icons.deblur_rounded;
    if (value == "deblur_outlined") return Icons.deblur_outlined;
    if (value == "deck") return Icons.deck;
    if (value == "deck_sharp") return Icons.deck_sharp;
    if (value == "deck_rounded") return Icons.deck_rounded;
    if (value == "deck_outlined") return Icons.deck_outlined;
    if (value == "dehaze") return Icons.dehaze;
    if (value == "dehaze_sharp") return Icons.dehaze_sharp;
    if (value == "dehaze_rounded") return Icons.dehaze_rounded;
    if (value == "dehaze_outlined") return Icons.dehaze_outlined;
    if (value == "delete") return Icons.delete;
    if (value == "delete_sharp") return Icons.delete_sharp;
    if (value == "delete_rounded") return Icons.delete_rounded;
    if (value == "delete_outlined") return Icons.delete_outlined;
    if (value == "delete_forever") return Icons.delete_forever;
    if (value == "delete_forever_sharp") return Icons.delete_forever_sharp;
    if (value == "delete_forever_rounded") return Icons.delete_forever_rounded;
    if (value == "delete_forever_outlined")
      return Icons.delete_forever_outlined;
    if (value == "delete_outline") return Icons.delete_outline;
    if (value == "delete_outline_sharp") return Icons.delete_outline_sharp;
    if (value == "delete_outline_rounded") return Icons.delete_outline_rounded;
    if (value == "delete_outline_outlined")
      return Icons.delete_outline_outlined;
    if (value == "delete_sweep") return Icons.delete_sweep;
    if (value == "delete_sweep_sharp") return Icons.delete_sweep_sharp;
    if (value == "delete_sweep_rounded") return Icons.delete_sweep_rounded;
    if (value == "delete_sweep_outlined") return Icons.delete_sweep_outlined;
    if (value == "delivery_dining") return Icons.delivery_dining;
    if (value == "delivery_dining_sharp") return Icons.delivery_dining_sharp;
    if (value == "delivery_dining_rounded")
      return Icons.delivery_dining_rounded;
    if (value == "delivery_dining_outlined")
      return Icons.delivery_dining_outlined;
    if (value == "density_large") return Icons.density_large;
    if (value == "density_large_sharp") return Icons.density_large_sharp;
    if (value == "density_large_rounded") return Icons.density_large_rounded;
    if (value == "density_large_outlined") return Icons.density_large_outlined;
    if (value == "density_medium") return Icons.density_medium;
    if (value == "density_medium_sharp") return Icons.density_medium_sharp;
    if (value == "density_medium_rounded") return Icons.density_medium_rounded;
    if (value == "density_medium_outlined")
      return Icons.density_medium_outlined;
    if (value == "density_small") return Icons.density_small;
    if (value == "density_small_sharp") return Icons.density_small_sharp;
    if (value == "density_small_rounded") return Icons.density_small_rounded;
    if (value == "density_small_outlined") return Icons.density_small_outlined;
    if (value == "departure_board") return Icons.departure_board;
    if (value == "departure_board_sharp") return Icons.departure_board_sharp;
    if (value == "departure_board_rounded")
      return Icons.departure_board_rounded;
    if (value == "departure_board_outlined")
      return Icons.departure_board_outlined;
    if (value == "description") return Icons.description;
    if (value == "description_sharp") return Icons.description_sharp;
    if (value == "description_rounded") return Icons.description_rounded;
    if (value == "description_outlined") return Icons.description_outlined;
    if (value == "deselect") return Icons.deselect;
    if (value == "deselect_sharp") return Icons.deselect_sharp;
    if (value == "deselect_rounded") return Icons.deselect_rounded;
    if (value == "deselect_outlined") return Icons.deselect_outlined;
    if (value == "design_services") return Icons.design_services;
    if (value == "design_services_sharp") return Icons.design_services_sharp;
    if (value == "design_services_rounded")
      return Icons.design_services_rounded;
    if (value == "design_services_outlined")
      return Icons.design_services_outlined;
    if (value == "desk") return Icons.desk;
    if (value == "desk_sharp") return Icons.desk_sharp;
    if (value == "desk_rounded") return Icons.desk_rounded;
    if (value == "desk_outlined") return Icons.desk_outlined;
    if (value == "desktop_access_disabled")
      return Icons.desktop_access_disabled;
    if (value == "desktop_access_disabled_sharp")
      return Icons.desktop_access_disabled_sharp;
    if (value == "desktop_access_disabled_rounded")
      return Icons.desktop_access_disabled_rounded;
    if (value == "desktop_access_disabled_outlined")
      return Icons.desktop_access_disabled_outlined;
    if (value == "desktop_mac") return Icons.desktop_mac;
    if (value == "desktop_mac_sharp") return Icons.desktop_mac_sharp;
    if (value == "desktop_mac_rounded") return Icons.desktop_mac_rounded;
    if (value == "desktop_mac_outlined") return Icons.desktop_mac_outlined;
    if (value == "desktop_windows") return Icons.desktop_windows;
    if (value == "desktop_windows_sharp") return Icons.desktop_windows_sharp;
    if (value == "desktop_windows_rounded")
      return Icons.desktop_windows_rounded;
    if (value == "desktop_windows_outlined")
      return Icons.desktop_windows_outlined;
    if (value == "details") return Icons.details;
    if (value == "details_sharp") return Icons.details_sharp;
    if (value == "details_rounded") return Icons.details_rounded;
    if (value == "details_outlined") return Icons.details_outlined;
    if (value == "developer_board") return Icons.developer_board;
    if (value == "developer_board_sharp") return Icons.developer_board_sharp;
    if (value == "developer_board_rounded")
      return Icons.developer_board_rounded;
    if (value == "developer_board_outlined")
      return Icons.developer_board_outlined;
    if (value == "developer_board_off") return Icons.developer_board_off;
    if (value == "developer_board_off_sharp")
      return Icons.developer_board_off_sharp;
    if (value == "developer_board_off_rounded")
      return Icons.developer_board_off_rounded;
    if (value == "developer_board_off_outlined")
      return Icons.developer_board_off_outlined;
    if (value == "developer_mode") return Icons.developer_mode;
    if (value == "developer_mode_sharp") return Icons.developer_mode_sharp;
    if (value == "developer_mode_rounded") return Icons.developer_mode_rounded;
    if (value == "developer_mode_outlined")
      return Icons.developer_mode_outlined;
    if (value == "device_hub") return Icons.device_hub;
    if (value == "device_hub_sharp") return Icons.device_hub_sharp;
    if (value == "device_hub_rounded") return Icons.device_hub_rounded;
    if (value == "device_hub_outlined") return Icons.device_hub_outlined;
    if (value == "device_thermostat") return Icons.device_thermostat;
    if (value == "device_thermostat_sharp")
      return Icons.device_thermostat_sharp;
    if (value == "device_thermostat_rounded")
      return Icons.device_thermostat_rounded;
    if (value == "device_thermostat_outlined")
      return Icons.device_thermostat_outlined;
    if (value == "device_unknown") return Icons.device_unknown;
    if (value == "device_unknown_sharp") return Icons.device_unknown_sharp;
    if (value == "device_unknown_rounded") return Icons.device_unknown_rounded;
    if (value == "device_unknown_outlined")
      return Icons.device_unknown_outlined;
    if (value == "devices") return Icons.devices;
    if (value == "devices_sharp") return Icons.devices_sharp;
    if (value == "devices_rounded") return Icons.devices_rounded;
    if (value == "devices_outlined") return Icons.devices_outlined;
    if (value == "devices_fold") return Icons.devices_fold;
    if (value == "devices_fold_sharp") return Icons.devices_fold_sharp;
    if (value == "devices_fold_rounded") return Icons.devices_fold_rounded;
    if (value == "devices_fold_outlined") return Icons.devices_fold_outlined;
    if (value == "devices_other") return Icons.devices_other;
    if (value == "devices_other_sharp") return Icons.devices_other_sharp;
    if (value == "devices_other_rounded") return Icons.devices_other_rounded;
    if (value == "devices_other_outlined") return Icons.devices_other_outlined;
    if (value == "dialer_sip") return Icons.dialer_sip;
    if (value == "dialer_sip_sharp") return Icons.dialer_sip_sharp;
    if (value == "dialer_sip_rounded") return Icons.dialer_sip_rounded;
    if (value == "dialer_sip_outlined") return Icons.dialer_sip_outlined;
    if (value == "dialpad") return Icons.dialpad;
    if (value == "dialpad_sharp") return Icons.dialpad_sharp;
    if (value == "dialpad_rounded") return Icons.dialpad_rounded;
    if (value == "dialpad_outlined") return Icons.dialpad_outlined;
    if (value == "diamond") return Icons.diamond;
    if (value == "diamond_sharp") return Icons.diamond_sharp;
    if (value == "diamond_rounded") return Icons.diamond_rounded;
    if (value == "diamond_outlined") return Icons.diamond_outlined;
    if (value == "difference") return Icons.difference;
    if (value == "difference_sharp") return Icons.difference_sharp;
    if (value == "difference_rounded") return Icons.difference_rounded;
    if (value == "difference_outlined") return Icons.difference_outlined;
    if (value == "dining") return Icons.dining;
    if (value == "dining_sharp") return Icons.dining_sharp;
    if (value == "dining_rounded") return Icons.dining_rounded;
    if (value == "dining_outlined") return Icons.dining_outlined;
    if (value == "dinner_dining") return Icons.dinner_dining;
    if (value == "dinner_dining_sharp") return Icons.dinner_dining_sharp;
    if (value == "dinner_dining_rounded") return Icons.dinner_dining_rounded;
    if (value == "dinner_dining_outlined") return Icons.dinner_dining_outlined;
    if (value == "directions") return Icons.directions;
    if (value == "directions_sharp") return Icons.directions_sharp;
    if (value == "directions_rounded") return Icons.directions_rounded;
    if (value == "directions_outlined") return Icons.directions_outlined;
    if (value == "directions_bike") return Icons.directions_bike;
    if (value == "directions_bike_sharp") return Icons.directions_bike_sharp;
    if (value == "directions_bike_rounded")
      return Icons.directions_bike_rounded;
    if (value == "directions_bike_outlined")
      return Icons.directions_bike_outlined;
    if (value == "directions_boat") return Icons.directions_boat;
    if (value == "directions_boat_sharp") return Icons.directions_boat_sharp;
    if (value == "directions_boat_rounded")
      return Icons.directions_boat_rounded;
    if (value == "directions_boat_outlined")
      return Icons.directions_boat_outlined;
    if (value == "directions_boat_filled") return Icons.directions_boat_filled;
    if (value == "directions_boat_filled_sharp")
      return Icons.directions_boat_filled_sharp;
    if (value == "directions_boat_filled_rounded")
      return Icons.directions_boat_filled_rounded;
    if (value == "directions_boat_filled_outlined")
      return Icons.directions_boat_filled_outlined;
    if (value == "directions_bus") return Icons.directions_bus;
    if (value == "directions_bus_sharp") return Icons.directions_bus_sharp;
    if (value == "directions_bus_rounded") return Icons.directions_bus_rounded;
    if (value == "directions_bus_outlined")
      return Icons.directions_bus_outlined;
    if (value == "directions_bus_filled") return Icons.directions_bus_filled;
    if (value == "directions_bus_filled_sharp")
      return Icons.directions_bus_filled_sharp;
    if (value == "directions_bus_filled_rounded")
      return Icons.directions_bus_filled_rounded;
    if (value == "directions_bus_filled_outlined")
      return Icons.directions_bus_filled_outlined;
    if (value == "directions_car") return Icons.directions_car;
    if (value == "directions_car_sharp") return Icons.directions_car_sharp;
    if (value == "directions_car_rounded") return Icons.directions_car_rounded;
    if (value == "directions_car_outlined")
      return Icons.directions_car_outlined;
    if (value == "directions_car_filled") return Icons.directions_car_filled;
    if (value == "directions_car_filled_sharp")
      return Icons.directions_car_filled_sharp;
    if (value == "directions_car_filled_rounded")
      return Icons.directions_car_filled_rounded;
    if (value == "directions_car_filled_outlined")
      return Icons.directions_car_filled_outlined;
    if (value == "directions_ferry") return Icons.directions_ferry;
    if (value == "directions_ferry_sharp") return Icons.directions_ferry_sharp;
    if (value == "directions_ferry_rounded")
      return Icons.directions_ferry_rounded;
    if (value == "directions_ferry_outlined")
      return Icons.directions_ferry_outlined;
    if (value == "directions_off") return Icons.directions_off;
    if (value == "directions_off_sharp") return Icons.directions_off_sharp;
    if (value == "directions_off_rounded") return Icons.directions_off_rounded;
    if (value == "directions_off_outlined")
      return Icons.directions_off_outlined;
    if (value == "directions_railway") return Icons.directions_railway;
    if (value == "directions_railway_sharp")
      return Icons.directions_railway_sharp;
    if (value == "directions_railway_rounded")
      return Icons.directions_railway_rounded;
    if (value == "directions_railway_outlined")
      return Icons.directions_railway_outlined;
    if (value == "directions_railway_filled")
      return Icons.directions_railway_filled;
    if (value == "directions_railway_filled_sharp")
      return Icons.directions_railway_filled_sharp;
    if (value == "directions_railway_filled_rounded")
      return Icons.directions_railway_filled_rounded;
    if (value == "directions_railway_filled_outlined")
      return Icons.directions_railway_filled_outlined;
    if (value == "directions_run") return Icons.directions_run;
    if (value == "directions_run_sharp") return Icons.directions_run_sharp;
    if (value == "directions_run_rounded") return Icons.directions_run_rounded;
    if (value == "directions_run_outlined")
      return Icons.directions_run_outlined;
    if (value == "directions_subway") return Icons.directions_subway;
    if (value == "directions_subway_sharp")
      return Icons.directions_subway_sharp;
    if (value == "directions_subway_rounded")
      return Icons.directions_subway_rounded;
    if (value == "directions_subway_outlined")
      return Icons.directions_subway_outlined;
    if (value == "directions_subway_filled")
      return Icons.directions_subway_filled;
    if (value == "directions_subway_filled_sharp")
      return Icons.directions_subway_filled_sharp;
    if (value == "directions_subway_filled_rounded")
      return Icons.directions_subway_filled_rounded;
    if (value == "directions_subway_filled_outlined")
      return Icons.directions_subway_filled_outlined;
    if (value == "directions_train") return Icons.directions_train;
    if (value == "directions_train_sharp") return Icons.directions_train_sharp;
    if (value == "directions_train_rounded")
      return Icons.directions_train_rounded;
    if (value == "directions_train_outlined")
      return Icons.directions_train_outlined;
    if (value == "directions_transit") return Icons.directions_transit;
    if (value == "directions_transit_sharp")
      return Icons.directions_transit_sharp;
    if (value == "directions_transit_rounded")
      return Icons.directions_transit_rounded;
    if (value == "directions_transit_outlined")
      return Icons.directions_transit_outlined;
    if (value == "directions_transit_filled")
      return Icons.directions_transit_filled;
    if (value == "directions_transit_filled_sharp")
      return Icons.directions_transit_filled_sharp;
    if (value == "directions_transit_filled_rounded")
      return Icons.directions_transit_filled_rounded;
    if (value == "directions_transit_filled_outlined")
      return Icons.directions_transit_filled_outlined;
    if (value == "directions_walk") return Icons.directions_walk;
    if (value == "directions_walk_sharp") return Icons.directions_walk_sharp;
    if (value == "directions_walk_rounded")
      return Icons.directions_walk_rounded;
    if (value == "directions_walk_outlined")
      return Icons.directions_walk_outlined;
    if (value == "dirty_lens") return Icons.dirty_lens;
    if (value == "dirty_lens_sharp") return Icons.dirty_lens_sharp;
    if (value == "dirty_lens_rounded") return Icons.dirty_lens_rounded;
    if (value == "dirty_lens_outlined") return Icons.dirty_lens_outlined;
    if (value == "disabled_by_default") return Icons.disabled_by_default;
    if (value == "disabled_by_default_sharp")
      return Icons.disabled_by_default_sharp;
    if (value == "disabled_by_default_rounded")
      return Icons.disabled_by_default_rounded;
    if (value == "disabled_by_default_outlined")
      return Icons.disabled_by_default_outlined;
    if (value == "disabled_visible") return Icons.disabled_visible;
    if (value == "disabled_visible_sharp") return Icons.disabled_visible_sharp;
    if (value == "disabled_visible_rounded")
      return Icons.disabled_visible_rounded;
    if (value == "disabled_visible_outlined")
      return Icons.disabled_visible_outlined;
    if (value == "disc_full") return Icons.disc_full;
    if (value == "disc_full_sharp") return Icons.disc_full_sharp;
    if (value == "disc_full_rounded") return Icons.disc_full_rounded;
    if (value == "disc_full_outlined") return Icons.disc_full_outlined;
    if (value == "discord") return Icons.discord;
    if (value == "discord_sharp") return Icons.discord_sharp;
    if (value == "discord_rounded") return Icons.discord_rounded;
    if (value == "discord_outlined") return Icons.discord_outlined;
    if (value == "discount") return Icons.discount;
    if (value == "discount_sharp") return Icons.discount_sharp;
    if (value == "discount_rounded") return Icons.discount_rounded;
    if (value == "discount_outlined") return Icons.discount_outlined;
    if (value == "display_settings") return Icons.display_settings;
    if (value == "display_settings_sharp") return Icons.display_settings_sharp;
    if (value == "display_settings_rounded")
      return Icons.display_settings_rounded;
    if (value == "display_settings_outlined")
      return Icons.display_settings_outlined;
    if (value == "dnd_forwardslash") return Icons.dnd_forwardslash;
    if (value == "dnd_forwardslash_sharp") return Icons.dnd_forwardslash_sharp;
    if (value == "dnd_forwardslash_rounded")
      return Icons.dnd_forwardslash_rounded;
    if (value == "dnd_forwardslash_outlined")
      return Icons.dnd_forwardslash_outlined;
    if (value == "dns") return Icons.dns;
    if (value == "dns_sharp") return Icons.dns_sharp;
    if (value == "dns_rounded") return Icons.dns_rounded;
    if (value == "dns_outlined") return Icons.dns_outlined;
    if (value == "do_disturb") return Icons.do_disturb;
    if (value == "do_disturb_sharp") return Icons.do_disturb_sharp;
    if (value == "do_disturb_rounded") return Icons.do_disturb_rounded;
    if (value == "do_disturb_outlined") return Icons.do_disturb_outlined;
    if (value == "do_disturb_alt") return Icons.do_disturb_alt;
    if (value == "do_disturb_alt_sharp") return Icons.do_disturb_alt_sharp;
    if (value == "do_disturb_alt_rounded") return Icons.do_disturb_alt_rounded;
    if (value == "do_disturb_alt_outlined")
      return Icons.do_disturb_alt_outlined;
    if (value == "do_disturb_off") return Icons.do_disturb_off;
    if (value == "do_disturb_off_sharp") return Icons.do_disturb_off_sharp;
    if (value == "do_disturb_off_rounded") return Icons.do_disturb_off_rounded;
    if (value == "do_disturb_off_outlined")
      return Icons.do_disturb_off_outlined;
    if (value == "do_disturb_on") return Icons.do_disturb_on;
    if (value == "do_disturb_on_sharp") return Icons.do_disturb_on_sharp;
    if (value == "do_disturb_on_rounded") return Icons.do_disturb_on_rounded;
    if (value == "do_disturb_on_outlined") return Icons.do_disturb_on_outlined;
    if (value == "do_not_disturb") return Icons.do_not_disturb;
    if (value == "do_not_disturb_sharp") return Icons.do_not_disturb_sharp;
    if (value == "do_not_disturb_rounded") return Icons.do_not_disturb_rounded;
    if (value == "do_not_disturb_outlined")
      return Icons.do_not_disturb_outlined;
    if (value == "do_not_disturb_alt") return Icons.do_not_disturb_alt;
    if (value == "do_not_disturb_alt_sharp")
      return Icons.do_not_disturb_alt_sharp;
    if (value == "do_not_disturb_alt_rounded")
      return Icons.do_not_disturb_alt_rounded;
    if (value == "do_not_disturb_alt_outlined")
      return Icons.do_not_disturb_alt_outlined;
    if (value == "do_not_disturb_off") return Icons.do_not_disturb_off;
    if (value == "do_not_disturb_off_sharp")
      return Icons.do_not_disturb_off_sharp;
    if (value == "do_not_disturb_off_rounded")
      return Icons.do_not_disturb_off_rounded;
    if (value == "do_not_disturb_off_outlined")
      return Icons.do_not_disturb_off_outlined;
    if (value == "do_not_disturb_on") return Icons.do_not_disturb_on;
    if (value == "do_not_disturb_on_sharp")
      return Icons.do_not_disturb_on_sharp;
    if (value == "do_not_disturb_on_rounded")
      return Icons.do_not_disturb_on_rounded;
    if (value == "do_not_disturb_on_outlined")
      return Icons.do_not_disturb_on_outlined;
    if (value == "do_not_disturb_on_total_silence")
      return Icons.do_not_disturb_on_total_silence;
    if (value == "do_not_disturb_on_total_silence_sharp")
      return Icons.do_not_disturb_on_total_silence_sharp;
    if (value == "do_not_disturb_on_total_silence_rounded")
      return Icons.do_not_disturb_on_total_silence_rounded;
    if (value == "do_not_disturb_on_total_silence_outlined")
      return Icons.do_not_disturb_on_total_silence_outlined;
    if (value == "do_not_step") return Icons.do_not_step;
    if (value == "do_not_step_sharp") return Icons.do_not_step_sharp;
    if (value == "do_not_step_rounded") return Icons.do_not_step_rounded;
    if (value == "do_not_step_outlined") return Icons.do_not_step_outlined;
    if (value == "do_not_touch") return Icons.do_not_touch;
    if (value == "do_not_touch_sharp") return Icons.do_not_touch_sharp;
    if (value == "do_not_touch_rounded") return Icons.do_not_touch_rounded;
    if (value == "do_not_touch_outlined") return Icons.do_not_touch_outlined;
    if (value == "dock") return Icons.dock;
    if (value == "dock_sharp") return Icons.dock_sharp;
    if (value == "dock_rounded") return Icons.dock_rounded;
    if (value == "dock_outlined") return Icons.dock_outlined;
    if (value == "document_scanner") return Icons.document_scanner;
    if (value == "document_scanner_sharp") return Icons.document_scanner_sharp;
    if (value == "document_scanner_rounded")
      return Icons.document_scanner_rounded;
    if (value == "document_scanner_outlined")
      return Icons.document_scanner_outlined;
    if (value == "domain") return Icons.domain;
    if (value == "domain_sharp") return Icons.domain_sharp;
    if (value == "domain_rounded") return Icons.domain_rounded;
    if (value == "domain_outlined") return Icons.domain_outlined;
    if (value == "domain_add") return Icons.domain_add;
    if (value == "domain_add_sharp") return Icons.domain_add_sharp;
    if (value == "domain_add_rounded") return Icons.domain_add_rounded;
    if (value == "domain_add_outlined") return Icons.domain_add_outlined;
    if (value == "domain_disabled") return Icons.domain_disabled;
    if (value == "domain_disabled_sharp") return Icons.domain_disabled_sharp;
    if (value == "domain_disabled_rounded")
      return Icons.domain_disabled_rounded;
    if (value == "domain_disabled_outlined")
      return Icons.domain_disabled_outlined;
    if (value == "domain_verification") return Icons.domain_verification;
    if (value == "domain_verification_sharp")
      return Icons.domain_verification_sharp;
    if (value == "domain_verification_rounded")
      return Icons.domain_verification_rounded;
    if (value == "domain_verification_outlined")
      return Icons.domain_verification_outlined;
    if (value == "done") return Icons.done;
    if (value == "done_sharp") return Icons.done_sharp;
    if (value == "done_rounded") return Icons.done_rounded;
    if (value == "done_outlined") return Icons.done_outlined;
    if (value == "done_all") return Icons.done_all;
    if (value == "done_all_sharp") return Icons.done_all_sharp;
    if (value == "done_all_rounded") return Icons.done_all_rounded;
    if (value == "done_all_outlined") return Icons.done_all_outlined;
    if (value == "done_outline") return Icons.done_outline;
    if (value == "done_outline_sharp") return Icons.done_outline_sharp;
    if (value == "done_outline_rounded") return Icons.done_outline_rounded;
    if (value == "done_outline_outlined") return Icons.done_outline_outlined;
    if (value == "donut_large") return Icons.donut_large;
    if (value == "donut_large_sharp") return Icons.donut_large_sharp;
    if (value == "donut_large_rounded") return Icons.donut_large_rounded;
    if (value == "donut_large_outlined") return Icons.donut_large_outlined;
    if (value == "donut_small") return Icons.donut_small;
    if (value == "donut_small_sharp") return Icons.donut_small_sharp;
    if (value == "donut_small_rounded") return Icons.donut_small_rounded;
    if (value == "donut_small_outlined") return Icons.donut_small_outlined;
    if (value == "door_back_door") return Icons.door_back_door;
    if (value == "door_back_door_sharp") return Icons.door_back_door_sharp;
    if (value == "door_back_door_rounded") return Icons.door_back_door_rounded;
    if (value == "door_back_door_outlined")
      return Icons.door_back_door_outlined;
    if (value == "door_front_door") return Icons.door_front_door;
    if (value == "door_front_door_sharp") return Icons.door_front_door_sharp;
    if (value == "door_front_door_rounded")
      return Icons.door_front_door_rounded;
    if (value == "door_front_door_outlined")
      return Icons.door_front_door_outlined;
    if (value == "door_sliding") return Icons.door_sliding;
    if (value == "door_sliding_sharp") return Icons.door_sliding_sharp;
    if (value == "door_sliding_rounded") return Icons.door_sliding_rounded;
    if (value == "door_sliding_outlined") return Icons.door_sliding_outlined;
    if (value == "doorbell") return Icons.doorbell;
    if (value == "doorbell_sharp") return Icons.doorbell_sharp;
    if (value == "doorbell_rounded") return Icons.doorbell_rounded;
    if (value == "doorbell_outlined") return Icons.doorbell_outlined;
    if (value == "double_arrow") return Icons.double_arrow;
    if (value == "double_arrow_sharp") return Icons.double_arrow_sharp;
    if (value == "double_arrow_rounded") return Icons.double_arrow_rounded;
    if (value == "double_arrow_outlined") return Icons.double_arrow_outlined;
    if (value == "downhill_skiing") return Icons.downhill_skiing;
    if (value == "downhill_skiing_sharp") return Icons.downhill_skiing_sharp;
    if (value == "downhill_skiing_rounded")
      return Icons.downhill_skiing_rounded;
    if (value == "downhill_skiing_outlined")
      return Icons.downhill_skiing_outlined;
    if (value == "download") return Icons.download;
    if (value == "download_sharp") return Icons.download_sharp;
    if (value == "download_rounded") return Icons.download_rounded;
    if (value == "download_outlined") return Icons.download_outlined;
    if (value == "download_done") return Icons.download_done;
    if (value == "download_done_sharp") return Icons.download_done_sharp;
    if (value == "download_done_rounded") return Icons.download_done_rounded;
    if (value == "download_done_outlined") return Icons.download_done_outlined;
    if (value == "download_for_offline") return Icons.download_for_offline;
    if (value == "download_for_offline_sharp")
      return Icons.download_for_offline_sharp;
    if (value == "download_for_offline_rounded")
      return Icons.download_for_offline_rounded;
    if (value == "download_for_offline_outlined")
      return Icons.download_for_offline_outlined;
    if (value == "downloading") return Icons.downloading;
    if (value == "downloading_sharp") return Icons.downloading_sharp;
    if (value == "downloading_rounded") return Icons.downloading_rounded;
    if (value == "downloading_outlined") return Icons.downloading_outlined;
    if (value == "drafts") return Icons.drafts;
    if (value == "drafts_sharp") return Icons.drafts_sharp;
    if (value == "drafts_rounded") return Icons.drafts_rounded;
    if (value == "drafts_outlined") return Icons.drafts_outlined;
    if (value == "drag_handle") return Icons.drag_handle;
    if (value == "drag_handle_sharp") return Icons.drag_handle_sharp;
    if (value == "drag_handle_rounded") return Icons.drag_handle_rounded;
    if (value == "drag_handle_outlined") return Icons.drag_handle_outlined;
    if (value == "drag_indicator") return Icons.drag_indicator;
    if (value == "drag_indicator_sharp") return Icons.drag_indicator_sharp;
    if (value == "drag_indicator_rounded") return Icons.drag_indicator_rounded;
    if (value == "drag_indicator_outlined")
      return Icons.drag_indicator_outlined;
    if (value == "draw") return Icons.draw;
    if (value == "draw_sharp") return Icons.draw_sharp;
    if (value == "draw_rounded") return Icons.draw_rounded;
    if (value == "draw_outlined") return Icons.draw_outlined;
    if (value == "drive_eta") return Icons.drive_eta;
    if (value == "drive_eta_sharp") return Icons.drive_eta_sharp;
    if (value == "drive_eta_rounded") return Icons.drive_eta_rounded;
    if (value == "drive_eta_outlined") return Icons.drive_eta_outlined;
    if (value == "drive_file_move") return Icons.drive_file_move;
    if (value == "drive_file_move_sharp") return Icons.drive_file_move_sharp;
    if (value == "drive_file_move_rounded")
      return Icons.drive_file_move_rounded;
    if (value == "drive_file_move_outlined")
      return Icons.drive_file_move_outlined;
    if (value == "drive_file_move_outline")
      return Icons.drive_file_move_outline;
    if (value == "drive_file_move_rtl") return Icons.drive_file_move_rtl;
    if (value == "drive_file_move_rtl_sharp")
      return Icons.drive_file_move_rtl_sharp;
    if (value == "drive_file_move_rtl_rounded")
      return Icons.drive_file_move_rtl_rounded;
    if (value == "drive_file_move_rtl_outlined")
      return Icons.drive_file_move_rtl_outlined;
    if (value == "drive_file_rename_outline")
      return Icons.drive_file_rename_outline;
    if (value == "drive_file_rename_outline_sharp")
      return Icons.drive_file_rename_outline_sharp;
    if (value == "drive_file_rename_outline_rounded")
      return Icons.drive_file_rename_outline_rounded;
    if (value == "drive_file_rename_outline_outlined")
      return Icons.drive_file_rename_outline_outlined;
    if (value == "drive_folder_upload") return Icons.drive_folder_upload;
    if (value == "drive_folder_upload_sharp")
      return Icons.drive_folder_upload_sharp;
    if (value == "drive_folder_upload_rounded")
      return Icons.drive_folder_upload_rounded;
    if (value == "drive_folder_upload_outlined")
      return Icons.drive_folder_upload_outlined;
    if (value == "dry") return Icons.dry;
    if (value == "dry_sharp") return Icons.dry_sharp;
    if (value == "dry_rounded") return Icons.dry_rounded;
    if (value == "dry_outlined") return Icons.dry_outlined;
    if (value == "dry_cleaning") return Icons.dry_cleaning;
    if (value == "dry_cleaning_sharp") return Icons.dry_cleaning_sharp;
    if (value == "dry_cleaning_rounded") return Icons.dry_cleaning_rounded;
    if (value == "dry_cleaning_outlined") return Icons.dry_cleaning_outlined;
    if (value == "duo") return Icons.duo;
    if (value == "duo_sharp") return Icons.duo_sharp;
    if (value == "duo_rounded") return Icons.duo_rounded;
    if (value == "duo_outlined") return Icons.duo_outlined;
    if (value == "dvr") return Icons.dvr;
    if (value == "dvr_sharp") return Icons.dvr_sharp;
    if (value == "dvr_rounded") return Icons.dvr_rounded;
    if (value == "dvr_outlined") return Icons.dvr_outlined;
    if (value == "dynamic_feed") return Icons.dynamic_feed;
    if (value == "dynamic_feed_sharp") return Icons.dynamic_feed_sharp;
    if (value == "dynamic_feed_rounded") return Icons.dynamic_feed_rounded;
    if (value == "dynamic_feed_outlined") return Icons.dynamic_feed_outlined;
    if (value == "dynamic_form") return Icons.dynamic_form;
    if (value == "dynamic_form_sharp") return Icons.dynamic_form_sharp;
    if (value == "dynamic_form_rounded") return Icons.dynamic_form_rounded;
    if (value == "dynamic_form_outlined") return Icons.dynamic_form_outlined;
    if (value == "e_mobiledata") return Icons.e_mobiledata;
    if (value == "e_mobiledata_sharp") return Icons.e_mobiledata_sharp;
    if (value == "e_mobiledata_rounded") return Icons.e_mobiledata_rounded;
    if (value == "e_mobiledata_outlined") return Icons.e_mobiledata_outlined;
    if (value == "earbuds") return Icons.earbuds;
    if (value == "earbuds_sharp") return Icons.earbuds_sharp;
    if (value == "earbuds_rounded") return Icons.earbuds_rounded;
    if (value == "earbuds_outlined") return Icons.earbuds_outlined;
    if (value == "earbuds_battery") return Icons.earbuds_battery;
    if (value == "earbuds_battery_sharp") return Icons.earbuds_battery_sharp;
    if (value == "earbuds_battery_rounded")
      return Icons.earbuds_battery_rounded;
    if (value == "earbuds_battery_outlined")
      return Icons.earbuds_battery_outlined;
    if (value == "east") return Icons.east;
    if (value == "east_sharp") return Icons.east_sharp;
    if (value == "east_rounded") return Icons.east_rounded;
    if (value == "east_outlined") return Icons.east_outlined;
    if (value == "eco") return Icons.eco;
    if (value == "eco_sharp") return Icons.eco_sharp;
    if (value == "eco_rounded") return Icons.eco_rounded;
    if (value == "eco_outlined") return Icons.eco_outlined;
    if (value == "edgesensor_high") return Icons.edgesensor_high;
    if (value == "edgesensor_high_sharp") return Icons.edgesensor_high_sharp;
    if (value == "edgesensor_high_rounded")
      return Icons.edgesensor_high_rounded;
    if (value == "edgesensor_high_outlined")
      return Icons.edgesensor_high_outlined;
    if (value == "edgesensor_low") return Icons.edgesensor_low;
    if (value == "edgesensor_low_sharp") return Icons.edgesensor_low_sharp;
    if (value == "edgesensor_low_rounded") return Icons.edgesensor_low_rounded;
    if (value == "edgesensor_low_outlined")
      return Icons.edgesensor_low_outlined;
    if (value == "edit") return Icons.edit;
    if (value == "edit_sharp") return Icons.edit_sharp;
    if (value == "edit_rounded") return Icons.edit_rounded;
    if (value == "edit_outlined") return Icons.edit_outlined;
    if (value == "edit_attributes") return Icons.edit_attributes;
    if (value == "edit_attributes_sharp") return Icons.edit_attributes_sharp;
    if (value == "edit_attributes_rounded")
      return Icons.edit_attributes_rounded;
    if (value == "edit_attributes_outlined")
      return Icons.edit_attributes_outlined;
    if (value == "edit_calendar") return Icons.edit_calendar;
    if (value == "edit_calendar_sharp") return Icons.edit_calendar_sharp;
    if (value == "edit_calendar_rounded") return Icons.edit_calendar_rounded;
    if (value == "edit_calendar_outlined") return Icons.edit_calendar_outlined;
    if (value == "edit_location") return Icons.edit_location;
    if (value == "edit_location_sharp") return Icons.edit_location_sharp;
    if (value == "edit_location_rounded") return Icons.edit_location_rounded;
    if (value == "edit_location_outlined") return Icons.edit_location_outlined;
    if (value == "edit_location_alt") return Icons.edit_location_alt;
    if (value == "edit_location_alt_sharp")
      return Icons.edit_location_alt_sharp;
    if (value == "edit_location_alt_rounded")
      return Icons.edit_location_alt_rounded;
    if (value == "edit_location_alt_outlined")
      return Icons.edit_location_alt_outlined;
    if (value == "edit_note") return Icons.edit_note;
    if (value == "edit_note_sharp") return Icons.edit_note_sharp;
    if (value == "edit_note_rounded") return Icons.edit_note_rounded;
    if (value == "edit_note_outlined") return Icons.edit_note_outlined;
    if (value == "edit_notifications") return Icons.edit_notifications;
    if (value == "edit_notifications_sharp")
      return Icons.edit_notifications_sharp;
    if (value == "edit_notifications_rounded")
      return Icons.edit_notifications_rounded;
    if (value == "edit_notifications_outlined")
      return Icons.edit_notifications_outlined;
    if (value == "edit_off") return Icons.edit_off;
    if (value == "edit_off_sharp") return Icons.edit_off_sharp;
    if (value == "edit_off_rounded") return Icons.edit_off_rounded;
    if (value == "edit_off_outlined") return Icons.edit_off_outlined;
    if (value == "edit_road") return Icons.edit_road;
    if (value == "edit_road_sharp") return Icons.edit_road_sharp;
    if (value == "edit_road_rounded") return Icons.edit_road_rounded;
    if (value == "edit_road_outlined") return Icons.edit_road_outlined;
    if (value == "egg") return Icons.egg;
    if (value == "egg_sharp") return Icons.egg_sharp;
    if (value == "egg_rounded") return Icons.egg_rounded;
    if (value == "egg_outlined") return Icons.egg_outlined;
    if (value == "egg_alt") return Icons.egg_alt;
    if (value == "egg_alt_sharp") return Icons.egg_alt_sharp;
    if (value == "egg_alt_rounded") return Icons.egg_alt_rounded;
    if (value == "egg_alt_outlined") return Icons.egg_alt_outlined;
    if (value == "eject") return Icons.eject;
    if (value == "eject_sharp") return Icons.eject_sharp;
    if (value == "eject_rounded") return Icons.eject_rounded;
    if (value == "eject_outlined") return Icons.eject_outlined;
    if (value == "elderly") return Icons.elderly;
    if (value == "elderly_sharp") return Icons.elderly_sharp;
    if (value == "elderly_rounded") return Icons.elderly_rounded;
    if (value == "elderly_outlined") return Icons.elderly_outlined;
    if (value == "elderly_woman") return Icons.elderly_woman;
    if (value == "elderly_woman_sharp") return Icons.elderly_woman_sharp;
    if (value == "elderly_woman_rounded") return Icons.elderly_woman_rounded;
    if (value == "elderly_woman_outlined") return Icons.elderly_woman_outlined;
    if (value == "electric_bike") return Icons.electric_bike;
    if (value == "electric_bike_sharp") return Icons.electric_bike_sharp;
    if (value == "electric_bike_rounded") return Icons.electric_bike_rounded;
    if (value == "electric_bike_outlined") return Icons.electric_bike_outlined;
    if (value == "electric_bolt") return Icons.electric_bolt;
    if (value == "electric_bolt_sharp") return Icons.electric_bolt_sharp;
    if (value == "electric_bolt_rounded") return Icons.electric_bolt_rounded;
    if (value == "electric_bolt_outlined") return Icons.electric_bolt_outlined;
    if (value == "electric_car") return Icons.electric_car;
    if (value == "electric_car_sharp") return Icons.electric_car_sharp;
    if (value == "electric_car_rounded") return Icons.electric_car_rounded;
    if (value == "electric_car_outlined") return Icons.electric_car_outlined;
    if (value == "electric_meter") return Icons.electric_meter;
    if (value == "electric_meter_sharp") return Icons.electric_meter_sharp;
    if (value == "electric_meter_rounded") return Icons.electric_meter_rounded;
    if (value == "electric_meter_outlined")
      return Icons.electric_meter_outlined;
    if (value == "electric_moped") return Icons.electric_moped;
    if (value == "electric_moped_sharp") return Icons.electric_moped_sharp;
    if (value == "electric_moped_rounded") return Icons.electric_moped_rounded;
    if (value == "electric_moped_outlined")
      return Icons.electric_moped_outlined;
    if (value == "electric_rickshaw") return Icons.electric_rickshaw;
    if (value == "electric_rickshaw_sharp")
      return Icons.electric_rickshaw_sharp;
    if (value == "electric_rickshaw_rounded")
      return Icons.electric_rickshaw_rounded;
    if (value == "electric_rickshaw_outlined")
      return Icons.electric_rickshaw_outlined;
    if (value == "electric_scooter") return Icons.electric_scooter;
    if (value == "electric_scooter_sharp") return Icons.electric_scooter_sharp;
    if (value == "electric_scooter_rounded")
      return Icons.electric_scooter_rounded;
    if (value == "electric_scooter_outlined")
      return Icons.electric_scooter_outlined;
    if (value == "electrical_services") return Icons.electrical_services;
    if (value == "electrical_services_sharp")
      return Icons.electrical_services_sharp;
    if (value == "electrical_services_rounded")
      return Icons.electrical_services_rounded;
    if (value == "electrical_services_outlined")
      return Icons.electrical_services_outlined;
    if (value == "elevator") return Icons.elevator;
    if (value == "elevator_sharp") return Icons.elevator_sharp;
    if (value == "elevator_rounded") return Icons.elevator_rounded;
    if (value == "elevator_outlined") return Icons.elevator_outlined;
    if (value == "email") return Icons.email;
    if (value == "email_sharp") return Icons.email_sharp;
    if (value == "email_rounded") return Icons.email_rounded;
    if (value == "email_outlined") return Icons.email_outlined;
    if (value == "emergency") return Icons.emergency;
    if (value == "emergency_sharp") return Icons.emergency_sharp;
    if (value == "emergency_rounded") return Icons.emergency_rounded;
    if (value == "emergency_outlined") return Icons.emergency_outlined;
    if (value == "emergency_recording") return Icons.emergency_recording;
    if (value == "emergency_recording_sharp")
      return Icons.emergency_recording_sharp;
    if (value == "emergency_recording_rounded")
      return Icons.emergency_recording_rounded;
    if (value == "emergency_recording_outlined")
      return Icons.emergency_recording_outlined;
    if (value == "emergency_share") return Icons.emergency_share;
    if (value == "emergency_share_sharp") return Icons.emergency_share_sharp;
    if (value == "emergency_share_rounded")
      return Icons.emergency_share_rounded;
    if (value == "emergency_share_outlined")
      return Icons.emergency_share_outlined;
    if (value == "emoji_emotions") return Icons.emoji_emotions;
    if (value == "emoji_emotions_sharp") return Icons.emoji_emotions_sharp;
    if (value == "emoji_emotions_rounded") return Icons.emoji_emotions_rounded;
    if (value == "emoji_emotions_outlined")
      return Icons.emoji_emotions_outlined;
    if (value == "emoji_events") return Icons.emoji_events;
    if (value == "emoji_events_sharp") return Icons.emoji_events_sharp;
    if (value == "emoji_events_rounded") return Icons.emoji_events_rounded;
    if (value == "emoji_events_outlined") return Icons.emoji_events_outlined;
    if (value == "emoji_flags") return Icons.emoji_flags;
    if (value == "emoji_flags_sharp") return Icons.emoji_flags_sharp;
    if (value == "emoji_flags_rounded") return Icons.emoji_flags_rounded;
    if (value == "emoji_flags_outlined") return Icons.emoji_flags_outlined;
    if (value == "emoji_food_beverage") return Icons.emoji_food_beverage;
    if (value == "emoji_food_beverage_sharp")
      return Icons.emoji_food_beverage_sharp;
    if (value == "emoji_food_beverage_rounded")
      return Icons.emoji_food_beverage_rounded;
    if (value == "emoji_food_beverage_outlined")
      return Icons.emoji_food_beverage_outlined;
    if (value == "emoji_nature") return Icons.emoji_nature;
    if (value == "emoji_nature_sharp") return Icons.emoji_nature_sharp;
    if (value == "emoji_nature_rounded") return Icons.emoji_nature_rounded;
    if (value == "emoji_nature_outlined") return Icons.emoji_nature_outlined;
    if (value == "emoji_objects") return Icons.emoji_objects;
    if (value == "emoji_objects_sharp") return Icons.emoji_objects_sharp;
    if (value == "emoji_objects_rounded") return Icons.emoji_objects_rounded;
    if (value == "emoji_objects_outlined") return Icons.emoji_objects_outlined;
    if (value == "emoji_people") return Icons.emoji_people;
    if (value == "emoji_people_sharp") return Icons.emoji_people_sharp;
    if (value == "emoji_people_rounded") return Icons.emoji_people_rounded;
    if (value == "emoji_people_outlined") return Icons.emoji_people_outlined;
    if (value == "emoji_symbols") return Icons.emoji_symbols;
    if (value == "emoji_symbols_sharp") return Icons.emoji_symbols_sharp;
    if (value == "emoji_symbols_rounded") return Icons.emoji_symbols_rounded;
    if (value == "emoji_symbols_outlined") return Icons.emoji_symbols_outlined;
    if (value == "emoji_transportation") return Icons.emoji_transportation;
    if (value == "emoji_transportation_sharp")
      return Icons.emoji_transportation_sharp;
    if (value == "emoji_transportation_rounded")
      return Icons.emoji_transportation_rounded;
    if (value == "emoji_transportation_outlined")
      return Icons.emoji_transportation_outlined;
    if (value == "energy_savings_leaf") return Icons.energy_savings_leaf;
    if (value == "energy_savings_leaf_sharp")
      return Icons.energy_savings_leaf_sharp;
    if (value == "energy_savings_leaf_rounded")
      return Icons.energy_savings_leaf_rounded;
    if (value == "energy_savings_leaf_outlined")
      return Icons.energy_savings_leaf_outlined;
    if (value == "engineering") return Icons.engineering;
    if (value == "engineering_sharp") return Icons.engineering_sharp;
    if (value == "engineering_rounded") return Icons.engineering_rounded;
    if (value == "engineering_outlined") return Icons.engineering_outlined;
    if (value == "enhance_photo_translate")
      return Icons.enhance_photo_translate;
    if (value == "enhance_photo_translate_sharp")
      return Icons.enhance_photo_translate_sharp;
    if (value == "enhance_photo_translate_rounded")
      return Icons.enhance_photo_translate_rounded;
    if (value == "enhance_photo_translate_outlined")
      return Icons.enhance_photo_translate_outlined;
    if (value == "enhanced_encryption") return Icons.enhanced_encryption;
    if (value == "enhanced_encryption_sharp")
      return Icons.enhanced_encryption_sharp;
    if (value == "enhanced_encryption_rounded")
      return Icons.enhanced_encryption_rounded;
    if (value == "enhanced_encryption_outlined")
      return Icons.enhanced_encryption_outlined;
    if (value == "equalizer") return Icons.equalizer;
    if (value == "equalizer_sharp") return Icons.equalizer_sharp;
    if (value == "equalizer_rounded") return Icons.equalizer_rounded;
    if (value == "equalizer_outlined") return Icons.equalizer_outlined;
    if (value == "error") return Icons.error;
    if (value == "error_sharp") return Icons.error_sharp;
    if (value == "error_rounded") return Icons.error_rounded;
    if (value == "error_outlined") return Icons.error_outlined;
    if (value == "error_outline") return Icons.error_outline;
    if (value == "error_outline_sharp") return Icons.error_outline_sharp;
    if (value == "error_outline_rounded") return Icons.error_outline_rounded;
    if (value == "error_outline_outlined") return Icons.error_outline_outlined;
    if (value == "escalator") return Icons.escalator;
    if (value == "escalator_sharp") return Icons.escalator_sharp;
    if (value == "escalator_rounded") return Icons.escalator_rounded;
    if (value == "escalator_outlined") return Icons.escalator_outlined;
    if (value == "escalator_warning") return Icons.escalator_warning;
    if (value == "escalator_warning_sharp")
      return Icons.escalator_warning_sharp;
    if (value == "escalator_warning_rounded")
      return Icons.escalator_warning_rounded;
    if (value == "escalator_warning_outlined")
      return Icons.escalator_warning_outlined;
    if (value == "euro") return Icons.euro;
    if (value == "euro_sharp") return Icons.euro_sharp;
    if (value == "euro_rounded") return Icons.euro_rounded;
    if (value == "euro_outlined") return Icons.euro_outlined;
    if (value == "euro_symbol") return Icons.euro_symbol;
    if (value == "euro_symbol_sharp") return Icons.euro_symbol_sharp;
    if (value == "euro_symbol_rounded") return Icons.euro_symbol_rounded;
    if (value == "euro_symbol_outlined") return Icons.euro_symbol_outlined;
    if (value == "ev_station") return Icons.ev_station;
    if (value == "ev_station_sharp") return Icons.ev_station_sharp;
    if (value == "ev_station_rounded") return Icons.ev_station_rounded;
    if (value == "ev_station_outlined") return Icons.ev_station_outlined;
    if (value == "event") return Icons.event;
    if (value == "event_sharp") return Icons.event_sharp;
    if (value == "event_rounded") return Icons.event_rounded;
    if (value == "event_outlined") return Icons.event_outlined;
    if (value == "event_available") return Icons.event_available;
    if (value == "event_available_sharp") return Icons.event_available_sharp;
    if (value == "event_available_rounded")
      return Icons.event_available_rounded;
    if (value == "event_available_outlined")
      return Icons.event_available_outlined;
    if (value == "event_busy") return Icons.event_busy;
    if (value == "event_busy_sharp") return Icons.event_busy_sharp;
    if (value == "event_busy_rounded") return Icons.event_busy_rounded;
    if (value == "event_busy_outlined") return Icons.event_busy_outlined;
    if (value == "event_note") return Icons.event_note;
    if (value == "event_note_sharp") return Icons.event_note_sharp;
    if (value == "event_note_rounded") return Icons.event_note_rounded;
    if (value == "event_note_outlined") return Icons.event_note_outlined;
    if (value == "event_repeat") return Icons.event_repeat;
    if (value == "event_repeat_sharp") return Icons.event_repeat_sharp;
    if (value == "event_repeat_rounded") return Icons.event_repeat_rounded;
    if (value == "event_repeat_outlined") return Icons.event_repeat_outlined;
    if (value == "event_seat") return Icons.event_seat;
    if (value == "event_seat_sharp") return Icons.event_seat_sharp;
    if (value == "event_seat_rounded") return Icons.event_seat_rounded;
    if (value == "event_seat_outlined") return Icons.event_seat_outlined;
    if (value == "exit_to_app") return Icons.exit_to_app;
    if (value == "exit_to_app_sharp") return Icons.exit_to_app_sharp;
    if (value == "exit_to_app_rounded") return Icons.exit_to_app_rounded;
    if (value == "exit_to_app_outlined") return Icons.exit_to_app_outlined;
    if (value == "expand") return Icons.expand;
    if (value == "expand_sharp") return Icons.expand_sharp;
    if (value == "expand_rounded") return Icons.expand_rounded;
    if (value == "expand_outlined") return Icons.expand_outlined;
    if (value == "expand_circle_down") return Icons.expand_circle_down;
    if (value == "expand_circle_down_sharp")
      return Icons.expand_circle_down_sharp;
    if (value == "expand_circle_down_rounded")
      return Icons.expand_circle_down_rounded;
    if (value == "expand_circle_down_outlined")
      return Icons.expand_circle_down_outlined;
    if (value == "expand_less") return Icons.expand_less;
    if (value == "expand_less_sharp") return Icons.expand_less_sharp;
    if (value == "expand_less_rounded") return Icons.expand_less_rounded;
    if (value == "expand_less_outlined") return Icons.expand_less_outlined;
    if (value == "expand_more") return Icons.expand_more;
    if (value == "expand_more_sharp") return Icons.expand_more_sharp;
    if (value == "expand_more_rounded") return Icons.expand_more_rounded;
    if (value == "expand_more_outlined") return Icons.expand_more_outlined;
    if (value == "explicit") return Icons.explicit;
    if (value == "explicit_sharp") return Icons.explicit_sharp;
    if (value == "explicit_rounded") return Icons.explicit_rounded;
    if (value == "explicit_outlined") return Icons.explicit_outlined;
    if (value == "explore") return Icons.explore;
    if (value == "explore_sharp") return Icons.explore_sharp;
    if (value == "explore_rounded") return Icons.explore_rounded;
    if (value == "explore_outlined") return Icons.explore_outlined;
    if (value == "explore_off") return Icons.explore_off;
    if (value == "explore_off_sharp") return Icons.explore_off_sharp;
    if (value == "explore_off_rounded") return Icons.explore_off_rounded;
    if (value == "explore_off_outlined") return Icons.explore_off_outlined;
    if (value == "exposure") return Icons.exposure;
    if (value == "exposure_sharp") return Icons.exposure_sharp;
    if (value == "exposure_rounded") return Icons.exposure_rounded;
    if (value == "exposure_outlined") return Icons.exposure_outlined;
    if (value == "exposure_minus_1") return Icons.exposure_minus_1;
    if (value == "exposure_minus_1_sharp") return Icons.exposure_minus_1_sharp;
    if (value == "exposure_minus_1_rounded")
      return Icons.exposure_minus_1_rounded;
    if (value == "exposure_minus_1_outlined")
      return Icons.exposure_minus_1_outlined;
    if (value == "exposure_minus_2") return Icons.exposure_minus_2;
    if (value == "exposure_minus_2_sharp") return Icons.exposure_minus_2_sharp;
    if (value == "exposure_minus_2_rounded")
      return Icons.exposure_minus_2_rounded;
    if (value == "exposure_minus_2_outlined")
      return Icons.exposure_minus_2_outlined;
    if (value == "exposure_neg_1") return Icons.exposure_neg_1;
    if (value == "exposure_neg_1_sharp") return Icons.exposure_neg_1_sharp;
    if (value == "exposure_neg_1_rounded") return Icons.exposure_neg_1_rounded;
    if (value == "exposure_neg_1_outlined")
      return Icons.exposure_neg_1_outlined;
    if (value == "exposure_neg_2") return Icons.exposure_neg_2;
    if (value == "exposure_neg_2_sharp") return Icons.exposure_neg_2_sharp;
    if (value == "exposure_neg_2_rounded") return Icons.exposure_neg_2_rounded;
    if (value == "exposure_neg_2_outlined")
      return Icons.exposure_neg_2_outlined;
    if (value == "exposure_plus_1") return Icons.exposure_plus_1;
    if (value == "exposure_plus_1_sharp") return Icons.exposure_plus_1_sharp;
    if (value == "exposure_plus_1_rounded")
      return Icons.exposure_plus_1_rounded;
    if (value == "exposure_plus_1_outlined")
      return Icons.exposure_plus_1_outlined;
    if (value == "exposure_plus_2") return Icons.exposure_plus_2;
    if (value == "exposure_plus_2_sharp") return Icons.exposure_plus_2_sharp;
    if (value == "exposure_plus_2_rounded")
      return Icons.exposure_plus_2_rounded;
    if (value == "exposure_plus_2_outlined")
      return Icons.exposure_plus_2_outlined;
    if (value == "exposure_zero") return Icons.exposure_zero;
    if (value == "exposure_zero_sharp") return Icons.exposure_zero_sharp;
    if (value == "exposure_zero_rounded") return Icons.exposure_zero_rounded;
    if (value == "exposure_zero_outlined") return Icons.exposure_zero_outlined;
    if (value == "extension") return Icons.extension;
    if (value == "extension_sharp") return Icons.extension_sharp;
    if (value == "extension_rounded") return Icons.extension_rounded;
    if (value == "extension_outlined") return Icons.extension_outlined;
    if (value == "extension_off") return Icons.extension_off;
    if (value == "extension_off_sharp") return Icons.extension_off_sharp;
    if (value == "extension_off_rounded") return Icons.extension_off_rounded;
    if (value == "extension_off_outlined") return Icons.extension_off_outlined;
    if (value == "face") return Icons.face;
    if (value == "face_sharp") return Icons.face_sharp;
    if (value == "face_rounded") return Icons.face_rounded;
    if (value == "face_outlined") return Icons.face_outlined;
    if (value == "face_retouching_natural")
      return Icons.face_retouching_natural;
    if (value == "face_retouching_natural_sharp")
      return Icons.face_retouching_natural_sharp;
    if (value == "face_retouching_natural_rounded")
      return Icons.face_retouching_natural_rounded;
    if (value == "face_retouching_natural_outlined")
      return Icons.face_retouching_natural_outlined;
    if (value == "face_retouching_off") return Icons.face_retouching_off;
    if (value == "face_retouching_off_sharp")
      return Icons.face_retouching_off_sharp;
    if (value == "face_retouching_off_rounded")
      return Icons.face_retouching_off_rounded;
    if (value == "face_retouching_off_outlined")
      return Icons.face_retouching_off_outlined;
    if (value == "face_unlock_sharp") return Icons.face_unlock_sharp;
    if (value == "face_unlock_rounded") return Icons.face_unlock_rounded;
    if (value == "face_unlock_outlined") return Icons.face_unlock_outlined;
    if (value == "facebook") return Icons.facebook;
    if (value == "facebook_sharp") return Icons.facebook_sharp;
    if (value == "facebook_rounded") return Icons.facebook_rounded;
    if (value == "facebook_outlined") return Icons.facebook_outlined;
    if (value == "fact_check") return Icons.fact_check;
    if (value == "fact_check_sharp") return Icons.fact_check_sharp;
    if (value == "fact_check_rounded") return Icons.fact_check_rounded;
    if (value == "fact_check_outlined") return Icons.fact_check_outlined;
    if (value == "factory") return Icons.factory;
    if (value == "factory_sharp") return Icons.factory_sharp;
    if (value == "factory_rounded") return Icons.factory_rounded;
    if (value == "factory_outlined") return Icons.factory_outlined;
    if (value == "family_restroom") return Icons.family_restroom;
    if (value == "family_restroom_sharp") return Icons.family_restroom_sharp;
    if (value == "family_restroom_rounded")
      return Icons.family_restroom_rounded;
    if (value == "family_restroom_outlined")
      return Icons.family_restroom_outlined;
    if (value == "fast_forward") return Icons.fast_forward;
    if (value == "fast_forward_sharp") return Icons.fast_forward_sharp;
    if (value == "fast_forward_rounded") return Icons.fast_forward_rounded;
    if (value == "fast_forward_outlined") return Icons.fast_forward_outlined;
    if (value == "fast_rewind") return Icons.fast_rewind;
    if (value == "fast_rewind_sharp") return Icons.fast_rewind_sharp;
    if (value == "fast_rewind_rounded") return Icons.fast_rewind_rounded;
    if (value == "fast_rewind_outlined") return Icons.fast_rewind_outlined;
    if (value == "fastfood") return Icons.fastfood;
    if (value == "fastfood_sharp") return Icons.fastfood_sharp;
    if (value == "fastfood_rounded") return Icons.fastfood_rounded;
    if (value == "fastfood_outlined") return Icons.fastfood_outlined;
    if (value == "favorite") return Icons.favorite;
    if (value == "favorite_sharp") return Icons.favorite_sharp;
    if (value == "favorite_rounded") return Icons.favorite_rounded;
    if (value == "favorite_outlined") return Icons.favorite_outlined;
    if (value == "favorite_border") return Icons.favorite_border;
    if (value == "favorite_border_sharp") return Icons.favorite_border_sharp;
    if (value == "favorite_border_rounded")
      return Icons.favorite_border_rounded;
    if (value == "favorite_border_outlined")
      return Icons.favorite_border_outlined;
    if (value == "favorite_outline") return Icons.favorite_outline;
    if (value == "favorite_outline_sharp") return Icons.favorite_outline_sharp;
    if (value == "favorite_outline_rounded")
      return Icons.favorite_outline_rounded;
    if (value == "favorite_outline_outlined")
      return Icons.favorite_outline_outlined;
    if (value == "fax") return Icons.fax;
    if (value == "fax_sharp") return Icons.fax_sharp;
    if (value == "fax_rounded") return Icons.fax_rounded;
    if (value == "fax_outlined") return Icons.fax_outlined;
    if (value == "featured_play_list") return Icons.featured_play_list;
    if (value == "featured_play_list_sharp")
      return Icons.featured_play_list_sharp;
    if (value == "featured_play_list_rounded")
      return Icons.featured_play_list_rounded;
    if (value == "featured_play_list_outlined")
      return Icons.featured_play_list_outlined;
    if (value == "featured_video") return Icons.featured_video;
    if (value == "featured_video_sharp") return Icons.featured_video_sharp;
    if (value == "featured_video_rounded") return Icons.featured_video_rounded;
    if (value == "featured_video_outlined")
      return Icons.featured_video_outlined;
    if (value == "feed") return Icons.feed;
    if (value == "feed_sharp") return Icons.feed_sharp;
    if (value == "feed_rounded") return Icons.feed_rounded;
    if (value == "feed_outlined") return Icons.feed_outlined;
    if (value == "feedback") return Icons.feedback;
    if (value == "feedback_sharp") return Icons.feedback_sharp;
    if (value == "feedback_rounded") return Icons.feedback_rounded;
    if (value == "feedback_outlined") return Icons.feedback_outlined;
    if (value == "female") return Icons.female;
    if (value == "female_sharp") return Icons.female_sharp;
    if (value == "female_rounded") return Icons.female_rounded;
    if (value == "female_outlined") return Icons.female_outlined;
    if (value == "fence") return Icons.fence;
    if (value == "fence_sharp") return Icons.fence_sharp;
    if (value == "fence_rounded") return Icons.fence_rounded;
    if (value == "fence_outlined") return Icons.fence_outlined;
    if (value == "festival") return Icons.festival;
    if (value == "festival_sharp") return Icons.festival_sharp;
    if (value == "festival_rounded") return Icons.festival_rounded;
    if (value == "festival_outlined") return Icons.festival_outlined;
    if (value == "fiber_dvr") return Icons.fiber_dvr;
    if (value == "fiber_dvr_sharp") return Icons.fiber_dvr_sharp;
    if (value == "fiber_dvr_rounded") return Icons.fiber_dvr_rounded;
    if (value == "fiber_dvr_outlined") return Icons.fiber_dvr_outlined;
    if (value == "fiber_manual_record") return Icons.fiber_manual_record;
    if (value == "fiber_manual_record_sharp")
      return Icons.fiber_manual_record_sharp;
    if (value == "fiber_manual_record_rounded")
      return Icons.fiber_manual_record_rounded;
    if (value == "fiber_manual_record_outlined")
      return Icons.fiber_manual_record_outlined;
    if (value == "fiber_new") return Icons.fiber_new;
    if (value == "fiber_new_sharp") return Icons.fiber_new_sharp;
    if (value == "fiber_new_rounded") return Icons.fiber_new_rounded;
    if (value == "fiber_new_outlined") return Icons.fiber_new_outlined;
    if (value == "fiber_pin") return Icons.fiber_pin;
    if (value == "fiber_pin_sharp") return Icons.fiber_pin_sharp;
    if (value == "fiber_pin_rounded") return Icons.fiber_pin_rounded;
    if (value == "fiber_pin_outlined") return Icons.fiber_pin_outlined;
    if (value == "fiber_smart_record") return Icons.fiber_smart_record;
    if (value == "fiber_smart_record_sharp")
      return Icons.fiber_smart_record_sharp;
    if (value == "fiber_smart_record_rounded")
      return Icons.fiber_smart_record_rounded;
    if (value == "fiber_smart_record_outlined")
      return Icons.fiber_smart_record_outlined;
    if (value == "file_copy") return Icons.file_copy;
    if (value == "file_copy_sharp") return Icons.file_copy_sharp;
    if (value == "file_copy_rounded") return Icons.file_copy_rounded;
    if (value == "file_copy_outlined") return Icons.file_copy_outlined;
    if (value == "file_download") return Icons.file_download;
    if (value == "file_download_sharp") return Icons.file_download_sharp;
    if (value == "file_download_rounded") return Icons.file_download_rounded;
    if (value == "file_download_outlined") return Icons.file_download_outlined;
    if (value == "file_download_done") return Icons.file_download_done;
    if (value == "file_download_done_sharp")
      return Icons.file_download_done_sharp;
    if (value == "file_download_done_rounded")
      return Icons.file_download_done_rounded;
    if (value == "file_download_done_outlined")
      return Icons.file_download_done_outlined;
    if (value == "file_download_off") return Icons.file_download_off;
    if (value == "file_download_off_sharp")
      return Icons.file_download_off_sharp;
    if (value == "file_download_off_rounded")
      return Icons.file_download_off_rounded;
    if (value == "file_download_off_outlined")
      return Icons.file_download_off_outlined;
    if (value == "file_open") return Icons.file_open;
    if (value == "file_open_sharp") return Icons.file_open_sharp;
    if (value == "file_open_rounded") return Icons.file_open_rounded;
    if (value == "file_open_outlined") return Icons.file_open_outlined;
    if (value == "file_present") return Icons.file_present;
    if (value == "file_present_sharp") return Icons.file_present_sharp;
    if (value == "file_present_rounded") return Icons.file_present_rounded;
    if (value == "file_present_outlined") return Icons.file_present_outlined;
    if (value == "file_upload") return Icons.file_upload;
    if (value == "file_upload_sharp") return Icons.file_upload_sharp;
    if (value == "file_upload_rounded") return Icons.file_upload_rounded;
    if (value == "file_upload_outlined") return Icons.file_upload_outlined;
    if (value == "filter") return Icons.filter;
    if (value == "filter_sharp") return Icons.filter_sharp;
    if (value == "filter_rounded") return Icons.filter_rounded;
    if (value == "filter_outlined") return Icons.filter_outlined;
    if (value == "filter_1") return Icons.filter_1;
    if (value == "filter_1_sharp") return Icons.filter_1_sharp;
    if (value == "filter_1_rounded") return Icons.filter_1_rounded;
    if (value == "filter_1_outlined") return Icons.filter_1_outlined;
    if (value == "filter_2") return Icons.filter_2;
    if (value == "filter_2_sharp") return Icons.filter_2_sharp;
    if (value == "filter_2_rounded") return Icons.filter_2_rounded;
    if (value == "filter_2_outlined") return Icons.filter_2_outlined;
    if (value == "filter_3") return Icons.filter_3;
    if (value == "filter_3_sharp") return Icons.filter_3_sharp;
    if (value == "filter_3_rounded") return Icons.filter_3_rounded;
    if (value == "filter_3_outlined") return Icons.filter_3_outlined;
    if (value == "filter_4") return Icons.filter_4;
    if (value == "filter_4_sharp") return Icons.filter_4_sharp;
    if (value == "filter_4_rounded") return Icons.filter_4_rounded;
    if (value == "filter_4_outlined") return Icons.filter_4_outlined;
    if (value == "filter_5") return Icons.filter_5;
    if (value == "filter_5_sharp") return Icons.filter_5_sharp;
    if (value == "filter_5_rounded") return Icons.filter_5_rounded;
    if (value == "filter_5_outlined") return Icons.filter_5_outlined;
    if (value == "filter_6") return Icons.filter_6;
    if (value == "filter_6_sharp") return Icons.filter_6_sharp;
    if (value == "filter_6_rounded") return Icons.filter_6_rounded;
    if (value == "filter_6_outlined") return Icons.filter_6_outlined;
    if (value == "filter_7") return Icons.filter_7;
    if (value == "filter_7_sharp") return Icons.filter_7_sharp;
    if (value == "filter_7_rounded") return Icons.filter_7_rounded;
    if (value == "filter_7_outlined") return Icons.filter_7_outlined;
    if (value == "filter_8") return Icons.filter_8;
    if (value == "filter_8_sharp") return Icons.filter_8_sharp;
    if (value == "filter_8_rounded") return Icons.filter_8_rounded;
    if (value == "filter_8_outlined") return Icons.filter_8_outlined;
    if (value == "filter_9") return Icons.filter_9;
    if (value == "filter_9_sharp") return Icons.filter_9_sharp;
    if (value == "filter_9_rounded") return Icons.filter_9_rounded;
    if (value == "filter_9_outlined") return Icons.filter_9_outlined;
    if (value == "filter_9_plus") return Icons.filter_9_plus;
    if (value == "filter_9_plus_sharp") return Icons.filter_9_plus_sharp;
    if (value == "filter_9_plus_rounded") return Icons.filter_9_plus_rounded;
    if (value == "filter_9_plus_outlined") return Icons.filter_9_plus_outlined;
    if (value == "filter_alt") return Icons.filter_alt;
    if (value == "filter_alt_sharp") return Icons.filter_alt_sharp;
    if (value == "filter_alt_rounded") return Icons.filter_alt_rounded;
    if (value == "filter_alt_outlined") return Icons.filter_alt_outlined;
    if (value == "filter_alt_off") return Icons.filter_alt_off;
    if (value == "filter_alt_off_sharp") return Icons.filter_alt_off_sharp;
    if (value == "filter_alt_off_rounded") return Icons.filter_alt_off_rounded;
    if (value == "filter_alt_off_outlined")
      return Icons.filter_alt_off_outlined;
    if (value == "filter_b_and_w") return Icons.filter_b_and_w;
    if (value == "filter_b_and_w_sharp") return Icons.filter_b_and_w_sharp;
    if (value == "filter_b_and_w_rounded") return Icons.filter_b_and_w_rounded;
    if (value == "filter_b_and_w_outlined")
      return Icons.filter_b_and_w_outlined;
    if (value == "filter_center_focus") return Icons.filter_center_focus;
    if (value == "filter_center_focus_sharp")
      return Icons.filter_center_focus_sharp;
    if (value == "filter_center_focus_rounded")
      return Icons.filter_center_focus_rounded;
    if (value == "filter_center_focus_outlined")
      return Icons.filter_center_focus_outlined;
    if (value == "filter_drama") return Icons.filter_drama;
    if (value == "filter_drama_sharp") return Icons.filter_drama_sharp;
    if (value == "filter_drama_rounded") return Icons.filter_drama_rounded;
    if (value == "filter_drama_outlined") return Icons.filter_drama_outlined;
    if (value == "filter_frames") return Icons.filter_frames;
    if (value == "filter_frames_sharp") return Icons.filter_frames_sharp;
    if (value == "filter_frames_rounded") return Icons.filter_frames_rounded;
    if (value == "filter_frames_outlined") return Icons.filter_frames_outlined;
    if (value == "filter_hdr") return Icons.filter_hdr;
    if (value == "filter_hdr_sharp") return Icons.filter_hdr_sharp;
    if (value == "filter_hdr_rounded") return Icons.filter_hdr_rounded;
    if (value == "filter_hdr_outlined") return Icons.filter_hdr_outlined;
    if (value == "filter_list") return Icons.filter_list;
    if (value == "filter_list_sharp") return Icons.filter_list_sharp;
    if (value == "filter_list_rounded") return Icons.filter_list_rounded;
    if (value == "filter_list_outlined") return Icons.filter_list_outlined;
    if (value == "filter_list_alt") return Icons.filter_list_alt;
    if (value == "filter_list_off") return Icons.filter_list_off;
    if (value == "filter_list_off_sharp") return Icons.filter_list_off_sharp;
    if (value == "filter_list_off_rounded")
      return Icons.filter_list_off_rounded;
    if (value == "filter_list_off_outlined")
      return Icons.filter_list_off_outlined;
    if (value == "filter_none") return Icons.filter_none;
    if (value == "filter_none_sharp") return Icons.filter_none_sharp;
    if (value == "filter_none_rounded") return Icons.filter_none_rounded;
    if (value == "filter_none_outlined") return Icons.filter_none_outlined;
    if (value == "filter_tilt_shift") return Icons.filter_tilt_shift;
    if (value == "filter_tilt_shift_sharp")
      return Icons.filter_tilt_shift_sharp;
    if (value == "filter_tilt_shift_rounded")
      return Icons.filter_tilt_shift_rounded;
    if (value == "filter_tilt_shift_outlined")
      return Icons.filter_tilt_shift_outlined;
    if (value == "filter_vintage") return Icons.filter_vintage;
    if (value == "filter_vintage_sharp") return Icons.filter_vintage_sharp;
    if (value == "filter_vintage_rounded") return Icons.filter_vintage_rounded;
    if (value == "filter_vintage_outlined")
      return Icons.filter_vintage_outlined;
    if (value == "find_in_page") return Icons.find_in_page;
    if (value == "find_in_page_sharp") return Icons.find_in_page_sharp;
    if (value == "find_in_page_rounded") return Icons.find_in_page_rounded;
    if (value == "find_in_page_outlined") return Icons.find_in_page_outlined;
    if (value == "find_replace") return Icons.find_replace;
    if (value == "find_replace_sharp") return Icons.find_replace_sharp;
    if (value == "find_replace_rounded") return Icons.find_replace_rounded;
    if (value == "find_replace_outlined") return Icons.find_replace_outlined;
    if (value == "fingerprint") return Icons.fingerprint;
    if (value == "fingerprint_sharp") return Icons.fingerprint_sharp;
    if (value == "fingerprint_rounded") return Icons.fingerprint_rounded;
    if (value == "fingerprint_outlined") return Icons.fingerprint_outlined;
    if (value == "fire_extinguisher") return Icons.fire_extinguisher;
    if (value == "fire_extinguisher_sharp")
      return Icons.fire_extinguisher_sharp;
    if (value == "fire_extinguisher_rounded")
      return Icons.fire_extinguisher_rounded;
    if (value == "fire_extinguisher_outlined")
      return Icons.fire_extinguisher_outlined;
    if (value == "fire_hydrant") return Icons.fire_hydrant;
    if (value == "fire_hydrant_alt") return Icons.fire_hydrant_alt;
    if (value == "fire_hydrant_alt_sharp") return Icons.fire_hydrant_alt_sharp;
    if (value == "fire_hydrant_alt_rounded")
      return Icons.fire_hydrant_alt_rounded;
    if (value == "fire_hydrant_alt_outlined")
      return Icons.fire_hydrant_alt_outlined;
    if (value == "fire_truck") return Icons.fire_truck;
    if (value == "fire_truck_sharp") return Icons.fire_truck_sharp;
    if (value == "fire_truck_rounded") return Icons.fire_truck_rounded;
    if (value == "fire_truck_outlined") return Icons.fire_truck_outlined;
    if (value == "fireplace") return Icons.fireplace;
    if (value == "fireplace_sharp") return Icons.fireplace_sharp;
    if (value == "fireplace_rounded") return Icons.fireplace_rounded;
    if (value == "fireplace_outlined") return Icons.fireplace_outlined;
    if (value == "first_page") return Icons.first_page;
    if (value == "first_page_sharp") return Icons.first_page_sharp;
    if (value == "first_page_rounded") return Icons.first_page_rounded;
    if (value == "first_page_outlined") return Icons.first_page_outlined;
    if (value == "fit_screen") return Icons.fit_screen;
    if (value == "fit_screen_sharp") return Icons.fit_screen_sharp;
    if (value == "fit_screen_rounded") return Icons.fit_screen_rounded;
    if (value == "fit_screen_outlined") return Icons.fit_screen_outlined;
    if (value == "fitbit") return Icons.fitbit;
    if (value == "fitbit_sharp") return Icons.fitbit_sharp;
    if (value == "fitbit_rounded") return Icons.fitbit_rounded;
    if (value == "fitbit_outlined") return Icons.fitbit_outlined;
    if (value == "fitness_center") return Icons.fitness_center;
    if (value == "fitness_center_sharp") return Icons.fitness_center_sharp;
    if (value == "fitness_center_rounded") return Icons.fitness_center_rounded;
    if (value == "fitness_center_outlined")
      return Icons.fitness_center_outlined;
    if (value == "flag") return Icons.flag;
    if (value == "flag_sharp") return Icons.flag_sharp;
    if (value == "flag_rounded") return Icons.flag_rounded;
    if (value == "flag_outlined") return Icons.flag_outlined;
    if (value == "flag_circle") return Icons.flag_circle;
    if (value == "flag_circle_sharp") return Icons.flag_circle_sharp;
    if (value == "flag_circle_rounded") return Icons.flag_circle_rounded;
    if (value == "flag_circle_outlined") return Icons.flag_circle_outlined;
    if (value == "flaky") return Icons.flaky;
    if (value == "flaky_sharp") return Icons.flaky_sharp;
    if (value == "flaky_rounded") return Icons.flaky_rounded;
    if (value == "flaky_outlined") return Icons.flaky_outlined;
    if (value == "flare") return Icons.flare;
    if (value == "flare_sharp") return Icons.flare_sharp;
    if (value == "flare_rounded") return Icons.flare_rounded;
    if (value == "flare_outlined") return Icons.flare_outlined;
    if (value == "flash_auto") return Icons.flash_auto;
    if (value == "flash_auto_sharp") return Icons.flash_auto_sharp;
    if (value == "flash_auto_rounded") return Icons.flash_auto_rounded;
    if (value == "flash_auto_outlined") return Icons.flash_auto_outlined;
    if (value == "flash_off") return Icons.flash_off;
    if (value == "flash_off_sharp") return Icons.flash_off_sharp;
    if (value == "flash_off_rounded") return Icons.flash_off_rounded;
    if (value == "flash_off_outlined") return Icons.flash_off_outlined;
    if (value == "flash_on") return Icons.flash_on;
    if (value == "flash_on_sharp") return Icons.flash_on_sharp;
    if (value == "flash_on_rounded") return Icons.flash_on_rounded;
    if (value == "flash_on_outlined") return Icons.flash_on_outlined;
    if (value == "flashlight_off") return Icons.flashlight_off;
    if (value == "flashlight_off_sharp") return Icons.flashlight_off_sharp;
    if (value == "flashlight_off_rounded") return Icons.flashlight_off_rounded;
    if (value == "flashlight_off_outlined")
      return Icons.flashlight_off_outlined;
    if (value == "flashlight_on") return Icons.flashlight_on;
    if (value == "flashlight_on_sharp") return Icons.flashlight_on_sharp;
    if (value == "flashlight_on_rounded") return Icons.flashlight_on_rounded;
    if (value == "flashlight_on_outlined") return Icons.flashlight_on_outlined;
    if (value == "flatware") return Icons.flatware;
    if (value == "flatware_sharp") return Icons.flatware_sharp;
    if (value == "flatware_rounded") return Icons.flatware_rounded;
    if (value == "flatware_outlined") return Icons.flatware_outlined;
    if (value == "flight") return Icons.flight;
    if (value == "flight_sharp") return Icons.flight_sharp;
    if (value == "flight_rounded") return Icons.flight_rounded;
    if (value == "flight_outlined") return Icons.flight_outlined;
    if (value == "flight_class") return Icons.flight_class;
    if (value == "flight_class_sharp") return Icons.flight_class_sharp;
    if (value == "flight_class_rounded") return Icons.flight_class_rounded;
    if (value == "flight_class_outlined") return Icons.flight_class_outlined;
    if (value == "flight_land") return Icons.flight_land;
    if (value == "flight_land_sharp") return Icons.flight_land_sharp;
    if (value == "flight_land_rounded") return Icons.flight_land_rounded;
    if (value == "flight_land_outlined") return Icons.flight_land_outlined;
    if (value == "flight_takeoff") return Icons.flight_takeoff;
    if (value == "flight_takeoff_sharp") return Icons.flight_takeoff_sharp;
    if (value == "flight_takeoff_rounded") return Icons.flight_takeoff_rounded;
    if (value == "flight_takeoff_outlined")
      return Icons.flight_takeoff_outlined;
    if (value == "flip") return Icons.flip;
    if (value == "flip_sharp") return Icons.flip_sharp;
    if (value == "flip_rounded") return Icons.flip_rounded;
    if (value == "flip_outlined") return Icons.flip_outlined;
    if (value == "flip_camera_android") return Icons.flip_camera_android;
    if (value == "flip_camera_android_sharp")
      return Icons.flip_camera_android_sharp;
    if (value == "flip_camera_android_rounded")
      return Icons.flip_camera_android_rounded;
    if (value == "flip_camera_android_outlined")
      return Icons.flip_camera_android_outlined;
    if (value == "flip_camera_ios") return Icons.flip_camera_ios;
    if (value == "flip_camera_ios_sharp") return Icons.flip_camera_ios_sharp;
    if (value == "flip_camera_ios_rounded")
      return Icons.flip_camera_ios_rounded;
    if (value == "flip_camera_ios_outlined")
      return Icons.flip_camera_ios_outlined;
    if (value == "flip_to_back") return Icons.flip_to_back;
    if (value == "flip_to_back_sharp") return Icons.flip_to_back_sharp;
    if (value == "flip_to_back_rounded") return Icons.flip_to_back_rounded;
    if (value == "flip_to_back_outlined") return Icons.flip_to_back_outlined;
    if (value == "flip_to_front") return Icons.flip_to_front;
    if (value == "flip_to_front_sharp") return Icons.flip_to_front_sharp;
    if (value == "flip_to_front_rounded") return Icons.flip_to_front_rounded;
    if (value == "flip_to_front_outlined") return Icons.flip_to_front_outlined;
    if (value == "flood") return Icons.flood;
    if (value == "flood_sharp") return Icons.flood_sharp;
    if (value == "flood_rounded") return Icons.flood_rounded;
    if (value == "flood_outlined") return Icons.flood_outlined;
    if (value == "flourescent") return Icons.flourescent;
    if (value == "flourescent_sharp") return Icons.flourescent_sharp;
    if (value == "flourescent_rounded") return Icons.flourescent_rounded;
    if (value == "flourescent_outlined") return Icons.flourescent_outlined;
    if (value == "flutter_dash") return Icons.flutter_dash;
    if (value == "flutter_dash_sharp") return Icons.flutter_dash_sharp;
    if (value == "flutter_dash_rounded") return Icons.flutter_dash_rounded;
    if (value == "flutter_dash_outlined") return Icons.flutter_dash_outlined;
    if (value == "fmd_bad") return Icons.fmd_bad;
    if (value == "fmd_bad_sharp") return Icons.fmd_bad_sharp;
    if (value == "fmd_bad_rounded") return Icons.fmd_bad_rounded;
    if (value == "fmd_bad_outlined") return Icons.fmd_bad_outlined;
    if (value == "fmd_good") return Icons.fmd_good;
    if (value == "fmd_good_sharp") return Icons.fmd_good_sharp;
    if (value == "fmd_good_rounded") return Icons.fmd_good_rounded;
    if (value == "fmd_good_outlined") return Icons.fmd_good_outlined;
    if (value == "foggy") return Icons.foggy;
    if (value == "folder") return Icons.folder;
    if (value == "folder_sharp") return Icons.folder_sharp;
    if (value == "folder_rounded") return Icons.folder_rounded;
    if (value == "folder_outlined") return Icons.folder_outlined;
    if (value == "folder_copy") return Icons.folder_copy;
    if (value == "folder_copy_sharp") return Icons.folder_copy_sharp;
    if (value == "folder_copy_rounded") return Icons.folder_copy_rounded;
    if (value == "folder_copy_outlined") return Icons.folder_copy_outlined;
    if (value == "folder_delete") return Icons.folder_delete;
    if (value == "folder_delete_sharp") return Icons.folder_delete_sharp;
    if (value == "folder_delete_rounded") return Icons.folder_delete_rounded;
    if (value == "folder_delete_outlined") return Icons.folder_delete_outlined;
    if (value == "folder_off") return Icons.folder_off;
    if (value == "folder_off_sharp") return Icons.folder_off_sharp;
    if (value == "folder_off_rounded") return Icons.folder_off_rounded;
    if (value == "folder_off_outlined") return Icons.folder_off_outlined;
    if (value == "folder_open") return Icons.folder_open;
    if (value == "folder_open_sharp") return Icons.folder_open_sharp;
    if (value == "folder_open_rounded") return Icons.folder_open_rounded;
    if (value == "folder_open_outlined") return Icons.folder_open_outlined;
    if (value == "folder_shared") return Icons.folder_shared;
    if (value == "folder_shared_sharp") return Icons.folder_shared_sharp;
    if (value == "folder_shared_rounded") return Icons.folder_shared_rounded;
    if (value == "folder_shared_outlined") return Icons.folder_shared_outlined;
    if (value == "folder_special") return Icons.folder_special;
    if (value == "folder_special_sharp") return Icons.folder_special_sharp;
    if (value == "folder_special_rounded") return Icons.folder_special_rounded;
    if (value == "folder_special_outlined")
      return Icons.folder_special_outlined;
    if (value == "folder_zip") return Icons.folder_zip;
    if (value == "folder_zip_sharp") return Icons.folder_zip_sharp;
    if (value == "folder_zip_rounded") return Icons.folder_zip_rounded;
    if (value == "folder_zip_outlined") return Icons.folder_zip_outlined;
    if (value == "follow_the_signs") return Icons.follow_the_signs;
    if (value == "follow_the_signs_sharp") return Icons.follow_the_signs_sharp;
    if (value == "follow_the_signs_rounded")
      return Icons.follow_the_signs_rounded;
    if (value == "follow_the_signs_outlined")
      return Icons.follow_the_signs_outlined;
    if (value == "font_download") return Icons.font_download;
    if (value == "font_download_sharp") return Icons.font_download_sharp;
    if (value == "font_download_rounded") return Icons.font_download_rounded;
    if (value == "font_download_outlined") return Icons.font_download_outlined;
    if (value == "font_download_off") return Icons.font_download_off;
    if (value == "font_download_off_sharp")
      return Icons.font_download_off_sharp;
    if (value == "font_download_off_rounded")
      return Icons.font_download_off_rounded;
    if (value == "font_download_off_outlined")
      return Icons.font_download_off_outlined;
    if (value == "food_bank") return Icons.food_bank;
    if (value == "food_bank_sharp") return Icons.food_bank_sharp;
    if (value == "food_bank_rounded") return Icons.food_bank_rounded;
    if (value == "food_bank_outlined") return Icons.food_bank_outlined;
    if (value == "forest") return Icons.forest;
    if (value == "forest_sharp") return Icons.forest_sharp;
    if (value == "forest_rounded") return Icons.forest_rounded;
    if (value == "forest_outlined") return Icons.forest_outlined;
    if (value == "fork_left") return Icons.fork_left;
    if (value == "fork_left_sharp") return Icons.fork_left_sharp;
    if (value == "fork_left_rounded") return Icons.fork_left_rounded;
    if (value == "fork_left_outlined") return Icons.fork_left_outlined;
    if (value == "fork_right") return Icons.fork_right;
    if (value == "fork_right_sharp") return Icons.fork_right_sharp;
    if (value == "fork_right_rounded") return Icons.fork_right_rounded;
    if (value == "fork_right_outlined") return Icons.fork_right_outlined;
    if (value == "format_align_center") return Icons.format_align_center;
    if (value == "format_align_center_sharp")
      return Icons.format_align_center_sharp;
    if (value == "format_align_center_rounded")
      return Icons.format_align_center_rounded;
    if (value == "format_align_center_outlined")
      return Icons.format_align_center_outlined;
    if (value == "format_align_justify") return Icons.format_align_justify;
    if (value == "format_align_justify_sharp")
      return Icons.format_align_justify_sharp;
    if (value == "format_align_justify_rounded")
      return Icons.format_align_justify_rounded;
    if (value == "format_align_justify_outlined")
      return Icons.format_align_justify_outlined;
    if (value == "format_align_left") return Icons.format_align_left;
    if (value == "format_align_left_sharp")
      return Icons.format_align_left_sharp;
    if (value == "format_align_left_rounded")
      return Icons.format_align_left_rounded;
    if (value == "format_align_left_outlined")
      return Icons.format_align_left_outlined;
    if (value == "format_align_right") return Icons.format_align_right;
    if (value == "format_align_right_sharp")
      return Icons.format_align_right_sharp;
    if (value == "format_align_right_rounded")
      return Icons.format_align_right_rounded;
    if (value == "format_align_right_outlined")
      return Icons.format_align_right_outlined;
    if (value == "format_bold") return Icons.format_bold;
    if (value == "format_bold_sharp") return Icons.format_bold_sharp;
    if (value == "format_bold_rounded") return Icons.format_bold_rounded;
    if (value == "format_bold_outlined") return Icons.format_bold_outlined;
    if (value == "format_clear") return Icons.format_clear;
    if (value == "format_clear_sharp") return Icons.format_clear_sharp;
    if (value == "format_clear_rounded") return Icons.format_clear_rounded;
    if (value == "format_clear_outlined") return Icons.format_clear_outlined;
    if (value == "format_color_fill") return Icons.format_color_fill;
    if (value == "format_color_fill_sharp")
      return Icons.format_color_fill_sharp;
    if (value == "format_color_fill_rounded")
      return Icons.format_color_fill_rounded;
    if (value == "format_color_fill_outlined")
      return Icons.format_color_fill_outlined;
    if (value == "format_color_reset") return Icons.format_color_reset;
    if (value == "format_color_reset_sharp")
      return Icons.format_color_reset_sharp;
    if (value == "format_color_reset_rounded")
      return Icons.format_color_reset_rounded;
    if (value == "format_color_reset_outlined")
      return Icons.format_color_reset_outlined;
    if (value == "format_color_text") return Icons.format_color_text;
    if (value == "format_color_text_sharp")
      return Icons.format_color_text_sharp;
    if (value == "format_color_text_rounded")
      return Icons.format_color_text_rounded;
    if (value == "format_color_text_outlined")
      return Icons.format_color_text_outlined;
    if (value == "format_indent_decrease") return Icons.format_indent_decrease;
    if (value == "format_indent_decrease_sharp")
      return Icons.format_indent_decrease_sharp;
    if (value == "format_indent_decrease_rounded")
      return Icons.format_indent_decrease_rounded;
    if (value == "format_indent_decrease_outlined")
      return Icons.format_indent_decrease_outlined;
    if (value == "format_indent_increase") return Icons.format_indent_increase;
    if (value == "format_indent_increase_sharp")
      return Icons.format_indent_increase_sharp;
    if (value == "format_indent_increase_rounded")
      return Icons.format_indent_increase_rounded;
    if (value == "format_indent_increase_outlined")
      return Icons.format_indent_increase_outlined;
    if (value == "format_italic") return Icons.format_italic;
    if (value == "format_italic_sharp") return Icons.format_italic_sharp;
    if (value == "format_italic_rounded") return Icons.format_italic_rounded;
    if (value == "format_italic_outlined") return Icons.format_italic_outlined;
    if (value == "format_line_spacing") return Icons.format_line_spacing;
    if (value == "format_line_spacing_sharp")
      return Icons.format_line_spacing_sharp;
    if (value == "format_line_spacing_rounded")
      return Icons.format_line_spacing_rounded;
    if (value == "format_line_spacing_outlined")
      return Icons.format_line_spacing_outlined;
    if (value == "format_list_bulleted") return Icons.format_list_bulleted;
    if (value == "format_list_bulleted_sharp")
      return Icons.format_list_bulleted_sharp;
    if (value == "format_list_bulleted_rounded")
      return Icons.format_list_bulleted_rounded;
    if (value == "format_list_bulleted_outlined")
      return Icons.format_list_bulleted_outlined;
    if (value == "format_list_numbered") return Icons.format_list_numbered;
    if (value == "format_list_numbered_sharp")
      return Icons.format_list_numbered_sharp;
    if (value == "format_list_numbered_rounded")
      return Icons.format_list_numbered_rounded;
    if (value == "format_list_numbered_outlined")
      return Icons.format_list_numbered_outlined;
    if (value == "format_list_numbered_rtl")
      return Icons.format_list_numbered_rtl;
    if (value == "format_list_numbered_rtl_sharp")
      return Icons.format_list_numbered_rtl_sharp;
    if (value == "format_list_numbered_rtl_rounded")
      return Icons.format_list_numbered_rtl_rounded;
    if (value == "format_list_numbered_rtl_outlined")
      return Icons.format_list_numbered_rtl_outlined;
    if (value == "format_overline") return Icons.format_overline;
    if (value == "format_overline_sharp") return Icons.format_overline_sharp;
    if (value == "format_overline_rounded")
      return Icons.format_overline_rounded;
    if (value == "format_overline_outlined")
      return Icons.format_overline_outlined;
    if (value == "format_paint") return Icons.format_paint;
    if (value == "format_paint_sharp") return Icons.format_paint_sharp;
    if (value == "format_paint_rounded") return Icons.format_paint_rounded;
    if (value == "format_paint_outlined") return Icons.format_paint_outlined;
    if (value == "format_quote") return Icons.format_quote;
    if (value == "format_quote_sharp") return Icons.format_quote_sharp;
    if (value == "format_quote_rounded") return Icons.format_quote_rounded;
    if (value == "format_quote_outlined") return Icons.format_quote_outlined;
    if (value == "format_shapes") return Icons.format_shapes;
    if (value == "format_shapes_sharp") return Icons.format_shapes_sharp;
    if (value == "format_shapes_rounded") return Icons.format_shapes_rounded;
    if (value == "format_shapes_outlined") return Icons.format_shapes_outlined;
    if (value == "format_size") return Icons.format_size;
    if (value == "format_size_sharp") return Icons.format_size_sharp;
    if (value == "format_size_rounded") return Icons.format_size_rounded;
    if (value == "format_size_outlined") return Icons.format_size_outlined;
    if (value == "format_strikethrough") return Icons.format_strikethrough;
    if (value == "format_strikethrough_sharp")
      return Icons.format_strikethrough_sharp;
    if (value == "format_strikethrough_rounded")
      return Icons.format_strikethrough_rounded;
    if (value == "format_strikethrough_outlined")
      return Icons.format_strikethrough_outlined;
    if (value == "format_textdirection_l_to_r")
      return Icons.format_textdirection_l_to_r;
    if (value == "format_textdirection_l_to_r_sharp")
      return Icons.format_textdirection_l_to_r_sharp;
    if (value == "format_textdirection_l_to_r_rounded")
      return Icons.format_textdirection_l_to_r_rounded;
    if (value == "format_textdirection_l_to_r_outlined")
      return Icons.format_textdirection_l_to_r_outlined;
    if (value == "format_textdirection_r_to_l")
      return Icons.format_textdirection_r_to_l;
    if (value == "format_textdirection_r_to_l_sharp")
      return Icons.format_textdirection_r_to_l_sharp;
    if (value == "format_textdirection_r_to_l_rounded")
      return Icons.format_textdirection_r_to_l_rounded;
    if (value == "format_textdirection_r_to_l_outlined")
      return Icons.format_textdirection_r_to_l_outlined;
    if (value == "format_underline") return Icons.format_underline;
    if (value == "format_underline_sharp") return Icons.format_underline_sharp;
    if (value == "format_underline_rounded")
      return Icons.format_underline_rounded;
    if (value == "format_underline_outlined")
      return Icons.format_underline_outlined;
    if (value == "format_underlined") return Icons.format_underlined;
    if (value == "format_underlined_sharp")
      return Icons.format_underlined_sharp;
    if (value == "format_underlined_rounded")
      return Icons.format_underlined_rounded;
    if (value == "format_underlined_outlined")
      return Icons.format_underlined_outlined;
    if (value == "fort") return Icons.fort;
    if (value == "fort_sharp") return Icons.fort_sharp;
    if (value == "fort_rounded") return Icons.fort_rounded;
    if (value == "fort_outlined") return Icons.fort_outlined;
    if (value == "forum") return Icons.forum;
    if (value == "forum_sharp") return Icons.forum_sharp;
    if (value == "forum_rounded") return Icons.forum_rounded;
    if (value == "forum_outlined") return Icons.forum_outlined;
    if (value == "forward") return Icons.forward;
    if (value == "forward_sharp") return Icons.forward_sharp;
    if (value == "forward_rounded") return Icons.forward_rounded;
    if (value == "forward_outlined") return Icons.forward_outlined;
    if (value == "forward_10") return Icons.forward_10;
    if (value == "forward_10_sharp") return Icons.forward_10_sharp;
    if (value == "forward_10_rounded") return Icons.forward_10_rounded;
    if (value == "forward_10_outlined") return Icons.forward_10_outlined;
    if (value == "forward_30") return Icons.forward_30;
    if (value == "forward_30_sharp") return Icons.forward_30_sharp;
    if (value == "forward_30_rounded") return Icons.forward_30_rounded;
    if (value == "forward_30_outlined") return Icons.forward_30_outlined;
    if (value == "forward_5") return Icons.forward_5;
    if (value == "forward_5_sharp") return Icons.forward_5_sharp;
    if (value == "forward_5_rounded") return Icons.forward_5_rounded;
    if (value == "forward_5_outlined") return Icons.forward_5_outlined;
    if (value == "forward_to_inbox") return Icons.forward_to_inbox;
    if (value == "forward_to_inbox_sharp") return Icons.forward_to_inbox_sharp;
    if (value == "forward_to_inbox_rounded")
      return Icons.forward_to_inbox_rounded;
    if (value == "forward_to_inbox_outlined")
      return Icons.forward_to_inbox_outlined;
    if (value == "foundation") return Icons.foundation;
    if (value == "foundation_sharp") return Icons.foundation_sharp;
    if (value == "foundation_rounded") return Icons.foundation_rounded;
    if (value == "foundation_outlined") return Icons.foundation_outlined;
    if (value == "free_breakfast") return Icons.free_breakfast;
    if (value == "free_breakfast_sharp") return Icons.free_breakfast_sharp;
    if (value == "free_breakfast_rounded") return Icons.free_breakfast_rounded;
    if (value == "free_breakfast_outlined")
      return Icons.free_breakfast_outlined;
    if (value == "free_cancellation") return Icons.free_cancellation;
    if (value == "free_cancellation_sharp")
      return Icons.free_cancellation_sharp;
    if (value == "free_cancellation_rounded")
      return Icons.free_cancellation_rounded;
    if (value == "free_cancellation_outlined")
      return Icons.free_cancellation_outlined;
    if (value == "front_hand") return Icons.front_hand;
    if (value == "front_hand_sharp") return Icons.front_hand_sharp;
    if (value == "front_hand_rounded") return Icons.front_hand_rounded;
    if (value == "front_hand_outlined") return Icons.front_hand_outlined;
    if (value == "fullscreen") return Icons.fullscreen;
    if (value == "fullscreen_sharp") return Icons.fullscreen_sharp;
    if (value == "fullscreen_rounded") return Icons.fullscreen_rounded;
    if (value == "fullscreen_outlined") return Icons.fullscreen_outlined;
    if (value == "fullscreen_exit") return Icons.fullscreen_exit;
    if (value == "fullscreen_exit_sharp") return Icons.fullscreen_exit_sharp;
    if (value == "fullscreen_exit_rounded")
      return Icons.fullscreen_exit_rounded;
    if (value == "fullscreen_exit_outlined")
      return Icons.fullscreen_exit_outlined;
    if (value == "functions") return Icons.functions;
    if (value == "functions_sharp") return Icons.functions_sharp;
    if (value == "functions_rounded") return Icons.functions_rounded;
    if (value == "functions_outlined") return Icons.functions_outlined;
    if (value == "g_mobiledata") return Icons.g_mobiledata;
    if (value == "g_mobiledata_sharp") return Icons.g_mobiledata_sharp;
    if (value == "g_mobiledata_rounded") return Icons.g_mobiledata_rounded;
    if (value == "g_mobiledata_outlined") return Icons.g_mobiledata_outlined;
    if (value == "g_translate") return Icons.g_translate;
    if (value == "g_translate_sharp") return Icons.g_translate_sharp;
    if (value == "g_translate_rounded") return Icons.g_translate_rounded;
    if (value == "g_translate_outlined") return Icons.g_translate_outlined;
    if (value == "gamepad") return Icons.gamepad;
    if (value == "gamepad_sharp") return Icons.gamepad_sharp;
    if (value == "gamepad_rounded") return Icons.gamepad_rounded;
    if (value == "gamepad_outlined") return Icons.gamepad_outlined;
    if (value == "games") return Icons.games;
    if (value == "games_sharp") return Icons.games_sharp;
    if (value == "games_rounded") return Icons.games_rounded;
    if (value == "games_outlined") return Icons.games_outlined;
    if (value == "garage") return Icons.garage;
    if (value == "garage_sharp") return Icons.garage_sharp;
    if (value == "garage_rounded") return Icons.garage_rounded;
    if (value == "garage_outlined") return Icons.garage_outlined;
    if (value == "gas_meter") return Icons.gas_meter;
    if (value == "gas_meter_sharp") return Icons.gas_meter_sharp;
    if (value == "gas_meter_rounded") return Icons.gas_meter_rounded;
    if (value == "gas_meter_outlined") return Icons.gas_meter_outlined;
    if (value == "gavel") return Icons.gavel;
    if (value == "gavel_sharp") return Icons.gavel_sharp;
    if (value == "gavel_rounded") return Icons.gavel_rounded;
    if (value == "gavel_outlined") return Icons.gavel_outlined;
    if (value == "generating_tokens") return Icons.generating_tokens;
    if (value == "generating_tokens_sharp")
      return Icons.generating_tokens_sharp;
    if (value == "generating_tokens_rounded")
      return Icons.generating_tokens_rounded;
    if (value == "generating_tokens_outlined")
      return Icons.generating_tokens_outlined;
    if (value == "gesture") return Icons.gesture;
    if (value == "gesture_sharp") return Icons.gesture_sharp;
    if (value == "gesture_rounded") return Icons.gesture_rounded;
    if (value == "gesture_outlined") return Icons.gesture_outlined;
    if (value == "get_app") return Icons.get_app;
    if (value == "get_app_sharp") return Icons.get_app_sharp;
    if (value == "get_app_rounded") return Icons.get_app_rounded;
    if (value == "get_app_outlined") return Icons.get_app_outlined;
    if (value == "gif") return Icons.gif;
    if (value == "gif_sharp") return Icons.gif_sharp;
    if (value == "gif_rounded") return Icons.gif_rounded;
    if (value == "gif_outlined") return Icons.gif_outlined;
    if (value == "gif_box") return Icons.gif_box;
    if (value == "gif_box_sharp") return Icons.gif_box_sharp;
    if (value == "gif_box_rounded") return Icons.gif_box_rounded;
    if (value == "gif_box_outlined") return Icons.gif_box_outlined;
    if (value == "girl") return Icons.girl;
    if (value == "girl_sharp") return Icons.girl_sharp;
    if (value == "girl_rounded") return Icons.girl_rounded;
    if (value == "girl_outlined") return Icons.girl_outlined;
    if (value == "gite") return Icons.gite;
    if (value == "gite_sharp") return Icons.gite_sharp;
    if (value == "gite_rounded") return Icons.gite_rounded;
    if (value == "gite_outlined") return Icons.gite_outlined;
    if (value == "golf_course") return Icons.golf_course;
    if (value == "golf_course_sharp") return Icons.golf_course_sharp;
    if (value == "golf_course_rounded") return Icons.golf_course_rounded;
    if (value == "golf_course_outlined") return Icons.golf_course_outlined;
    if (value == "gpp_bad") return Icons.gpp_bad;
    if (value == "gpp_bad_sharp") return Icons.gpp_bad_sharp;
    if (value == "gpp_bad_rounded") return Icons.gpp_bad_rounded;
    if (value == "gpp_bad_outlined") return Icons.gpp_bad_outlined;
    if (value == "gpp_good") return Icons.gpp_good;
    if (value == "gpp_good_sharp") return Icons.gpp_good_sharp;
    if (value == "gpp_good_rounded") return Icons.gpp_good_rounded;
    if (value == "gpp_good_outlined") return Icons.gpp_good_outlined;
    if (value == "gpp_maybe") return Icons.gpp_maybe;
    if (value == "gpp_maybe_sharp") return Icons.gpp_maybe_sharp;
    if (value == "gpp_maybe_rounded") return Icons.gpp_maybe_rounded;
    if (value == "gpp_maybe_outlined") return Icons.gpp_maybe_outlined;
    if (value == "gps_fixed") return Icons.gps_fixed;
    if (value == "gps_fixed_sharp") return Icons.gps_fixed_sharp;
    if (value == "gps_fixed_rounded") return Icons.gps_fixed_rounded;
    if (value == "gps_fixed_outlined") return Icons.gps_fixed_outlined;
    if (value == "gps_not_fixed") return Icons.gps_not_fixed;
    if (value == "gps_not_fixed_sharp") return Icons.gps_not_fixed_sharp;
    if (value == "gps_not_fixed_rounded") return Icons.gps_not_fixed_rounded;
    if (value == "gps_not_fixed_outlined") return Icons.gps_not_fixed_outlined;
    if (value == "gps_off") return Icons.gps_off;
    if (value == "gps_off_sharp") return Icons.gps_off_sharp;
    if (value == "gps_off_rounded") return Icons.gps_off_rounded;
    if (value == "gps_off_outlined") return Icons.gps_off_outlined;
    if (value == "grade") return Icons.grade;
    if (value == "grade_sharp") return Icons.grade_sharp;
    if (value == "grade_rounded") return Icons.grade_rounded;
    if (value == "grade_outlined") return Icons.grade_outlined;
    if (value == "gradient") return Icons.gradient;
    if (value == "gradient_sharp") return Icons.gradient_sharp;
    if (value == "gradient_rounded") return Icons.gradient_rounded;
    if (value == "gradient_outlined") return Icons.gradient_outlined;
    if (value == "grading") return Icons.grading;
    if (value == "grading_sharp") return Icons.grading_sharp;
    if (value == "grading_rounded") return Icons.grading_rounded;
    if (value == "grading_outlined") return Icons.grading_outlined;
    if (value == "grain") return Icons.grain;
    if (value == "grain_sharp") return Icons.grain_sharp;
    if (value == "grain_rounded") return Icons.grain_rounded;
    if (value == "grain_outlined") return Icons.grain_outlined;
    if (value == "graphic_eq") return Icons.graphic_eq;
    if (value == "graphic_eq_sharp") return Icons.graphic_eq_sharp;
    if (value == "graphic_eq_rounded") return Icons.graphic_eq_rounded;
    if (value == "graphic_eq_outlined") return Icons.graphic_eq_outlined;
    if (value == "grass") return Icons.grass;
    if (value == "grass_sharp") return Icons.grass_sharp;
    if (value == "grass_rounded") return Icons.grass_rounded;
    if (value == "grass_outlined") return Icons.grass_outlined;
    if (value == "grid_3x3") return Icons.grid_3x3;
    if (value == "grid_3x3_sharp") return Icons.grid_3x3_sharp;
    if (value == "grid_3x3_rounded") return Icons.grid_3x3_rounded;
    if (value == "grid_3x3_outlined") return Icons.grid_3x3_outlined;
    if (value == "grid_4x4") return Icons.grid_4x4;
    if (value == "grid_4x4_sharp") return Icons.grid_4x4_sharp;
    if (value == "grid_4x4_rounded") return Icons.grid_4x4_rounded;
    if (value == "grid_4x4_outlined") return Icons.grid_4x4_outlined;
    if (value == "grid_goldenratio") return Icons.grid_goldenratio;
    if (value == "grid_goldenratio_sharp") return Icons.grid_goldenratio_sharp;
    if (value == "grid_goldenratio_rounded")
      return Icons.grid_goldenratio_rounded;
    if (value == "grid_goldenratio_outlined")
      return Icons.grid_goldenratio_outlined;
    if (value == "grid_off") return Icons.grid_off;
    if (value == "grid_off_sharp") return Icons.grid_off_sharp;
    if (value == "grid_off_rounded") return Icons.grid_off_rounded;
    if (value == "grid_off_outlined") return Icons.grid_off_outlined;
    if (value == "grid_on") return Icons.grid_on;
    if (value == "grid_on_sharp") return Icons.grid_on_sharp;
    if (value == "grid_on_rounded") return Icons.grid_on_rounded;
    if (value == "grid_on_outlined") return Icons.grid_on_outlined;
    if (value == "grid_view") return Icons.grid_view;
    if (value == "grid_view_sharp") return Icons.grid_view_sharp;
    if (value == "grid_view_rounded") return Icons.grid_view_rounded;
    if (value == "grid_view_outlined") return Icons.grid_view_outlined;
    if (value == "group") return Icons.group;
    if (value == "group_sharp") return Icons.group_sharp;
    if (value == "group_rounded") return Icons.group_rounded;
    if (value == "group_outlined") return Icons.group_outlined;
    if (value == "group_add") return Icons.group_add;
    if (value == "group_add_sharp") return Icons.group_add_sharp;
    if (value == "group_add_rounded") return Icons.group_add_rounded;
    if (value == "group_add_outlined") return Icons.group_add_outlined;
    if (value == "group_off") return Icons.group_off;
    if (value == "group_off_sharp") return Icons.group_off_sharp;
    if (value == "group_off_rounded") return Icons.group_off_rounded;
    if (value == "group_off_outlined") return Icons.group_off_outlined;
    if (value == "group_remove") return Icons.group_remove;
    if (value == "group_remove_sharp") return Icons.group_remove_sharp;
    if (value == "group_remove_rounded") return Icons.group_remove_rounded;
    if (value == "group_remove_outlined") return Icons.group_remove_outlined;
    if (value == "group_work") return Icons.group_work;
    if (value == "group_work_sharp") return Icons.group_work_sharp;
    if (value == "group_work_rounded") return Icons.group_work_rounded;
    if (value == "group_work_outlined") return Icons.group_work_outlined;
    if (value == "groups") return Icons.groups;
    if (value == "groups_sharp") return Icons.groups_sharp;
    if (value == "groups_rounded") return Icons.groups_rounded;
    if (value == "groups_outlined") return Icons.groups_outlined;
    if (value == "h_mobiledata") return Icons.h_mobiledata;
    if (value == "h_mobiledata_sharp") return Icons.h_mobiledata_sharp;
    if (value == "h_mobiledata_rounded") return Icons.h_mobiledata_rounded;
    if (value == "h_mobiledata_outlined") return Icons.h_mobiledata_outlined;
    if (value == "h_plus_mobiledata") return Icons.h_plus_mobiledata;
    if (value == "h_plus_mobiledata_sharp")
      return Icons.h_plus_mobiledata_sharp;
    if (value == "h_plus_mobiledata_rounded")
      return Icons.h_plus_mobiledata_rounded;
    if (value == "h_plus_mobiledata_outlined")
      return Icons.h_plus_mobiledata_outlined;
    if (value == "hail") return Icons.hail;
    if (value == "hail_sharp") return Icons.hail_sharp;
    if (value == "hail_rounded") return Icons.hail_rounded;
    if (value == "hail_outlined") return Icons.hail_outlined;
    if (value == "handshake") return Icons.handshake;
    if (value == "handshake_sharp") return Icons.handshake_sharp;
    if (value == "handshake_rounded") return Icons.handshake_rounded;
    if (value == "handshake_outlined") return Icons.handshake_outlined;
    if (value == "handyman") return Icons.handyman;
    if (value == "handyman_sharp") return Icons.handyman_sharp;
    if (value == "handyman_rounded") return Icons.handyman_rounded;
    if (value == "handyman_outlined") return Icons.handyman_outlined;
    if (value == "hardware") return Icons.hardware;
    if (value == "hardware_sharp") return Icons.hardware_sharp;
    if (value == "hardware_rounded") return Icons.hardware_rounded;
    if (value == "hardware_outlined") return Icons.hardware_outlined;
    if (value == "hd") return Icons.hd;
    if (value == "hd_sharp") return Icons.hd_sharp;
    if (value == "hd_rounded") return Icons.hd_rounded;
    if (value == "hd_outlined") return Icons.hd_outlined;
    if (value == "hdr_auto") return Icons.hdr_auto;
    if (value == "hdr_auto_sharp") return Icons.hdr_auto_sharp;
    if (value == "hdr_auto_rounded") return Icons.hdr_auto_rounded;
    if (value == "hdr_auto_outlined") return Icons.hdr_auto_outlined;
    if (value == "hdr_auto_select") return Icons.hdr_auto_select;
    if (value == "hdr_auto_select_sharp") return Icons.hdr_auto_select_sharp;
    if (value == "hdr_auto_select_rounded")
      return Icons.hdr_auto_select_rounded;
    if (value == "hdr_auto_select_outlined")
      return Icons.hdr_auto_select_outlined;
    if (value == "hdr_enhanced_select") return Icons.hdr_enhanced_select;
    if (value == "hdr_enhanced_select_sharp")
      return Icons.hdr_enhanced_select_sharp;
    if (value == "hdr_enhanced_select_rounded")
      return Icons.hdr_enhanced_select_rounded;
    if (value == "hdr_enhanced_select_outlined")
      return Icons.hdr_enhanced_select_outlined;
    if (value == "hdr_off") return Icons.hdr_off;
    if (value == "hdr_off_sharp") return Icons.hdr_off_sharp;
    if (value == "hdr_off_rounded") return Icons.hdr_off_rounded;
    if (value == "hdr_off_outlined") return Icons.hdr_off_outlined;
    if (value == "hdr_off_select") return Icons.hdr_off_select;
    if (value == "hdr_off_select_sharp") return Icons.hdr_off_select_sharp;
    if (value == "hdr_off_select_rounded") return Icons.hdr_off_select_rounded;
    if (value == "hdr_off_select_outlined")
      return Icons.hdr_off_select_outlined;
    if (value == "hdr_on") return Icons.hdr_on;
    if (value == "hdr_on_sharp") return Icons.hdr_on_sharp;
    if (value == "hdr_on_rounded") return Icons.hdr_on_rounded;
    if (value == "hdr_on_outlined") return Icons.hdr_on_outlined;
    if (value == "hdr_on_select") return Icons.hdr_on_select;
    if (value == "hdr_on_select_sharp") return Icons.hdr_on_select_sharp;
    if (value == "hdr_on_select_rounded") return Icons.hdr_on_select_rounded;
    if (value == "hdr_on_select_outlined") return Icons.hdr_on_select_outlined;
    if (value == "hdr_plus") return Icons.hdr_plus;
    if (value == "hdr_plus_sharp") return Icons.hdr_plus_sharp;
    if (value == "hdr_plus_rounded") return Icons.hdr_plus_rounded;
    if (value == "hdr_plus_outlined") return Icons.hdr_plus_outlined;
    if (value == "hdr_strong") return Icons.hdr_strong;
    if (value == "hdr_strong_sharp") return Icons.hdr_strong_sharp;
    if (value == "hdr_strong_rounded") return Icons.hdr_strong_rounded;
    if (value == "hdr_strong_outlined") return Icons.hdr_strong_outlined;
    if (value == "hdr_weak") return Icons.hdr_weak;
    if (value == "hdr_weak_sharp") return Icons.hdr_weak_sharp;
    if (value == "hdr_weak_rounded") return Icons.hdr_weak_rounded;
    if (value == "hdr_weak_outlined") return Icons.hdr_weak_outlined;
    if (value == "headphones") return Icons.headphones;
    if (value == "headphones_sharp") return Icons.headphones_sharp;
    if (value == "headphones_rounded") return Icons.headphones_rounded;
    if (value == "headphones_outlined") return Icons.headphones_outlined;
    if (value == "headphones_battery") return Icons.headphones_battery;
    if (value == "headphones_battery_sharp")
      return Icons.headphones_battery_sharp;
    if (value == "headphones_battery_rounded")
      return Icons.headphones_battery_rounded;
    if (value == "headphones_battery_outlined")
      return Icons.headphones_battery_outlined;
    if (value == "headset") return Icons.headset;
    if (value == "headset_sharp") return Icons.headset_sharp;
    if (value == "headset_rounded") return Icons.headset_rounded;
    if (value == "headset_outlined") return Icons.headset_outlined;
    if (value == "headset_mic") return Icons.headset_mic;
    if (value == "headset_mic_sharp") return Icons.headset_mic_sharp;
    if (value == "headset_mic_rounded") return Icons.headset_mic_rounded;
    if (value == "headset_mic_outlined") return Icons.headset_mic_outlined;
    if (value == "headset_off") return Icons.headset_off;
    if (value == "headset_off_sharp") return Icons.headset_off_sharp;
    if (value == "headset_off_rounded") return Icons.headset_off_rounded;
    if (value == "headset_off_outlined") return Icons.headset_off_outlined;
    if (value == "healing") return Icons.healing;
    if (value == "healing_sharp") return Icons.healing_sharp;
    if (value == "healing_rounded") return Icons.healing_rounded;
    if (value == "healing_outlined") return Icons.healing_outlined;
    if (value == "health_and_safety") return Icons.health_and_safety;
    if (value == "health_and_safety_sharp")
      return Icons.health_and_safety_sharp;
    if (value == "health_and_safety_rounded")
      return Icons.health_and_safety_rounded;
    if (value == "health_and_safety_outlined")
      return Icons.health_and_safety_outlined;
    if (value == "hearing") return Icons.hearing;
    if (value == "hearing_sharp") return Icons.hearing_sharp;
    if (value == "hearing_rounded") return Icons.hearing_rounded;
    if (value == "hearing_outlined") return Icons.hearing_outlined;
    if (value == "hearing_disabled") return Icons.hearing_disabled;
    if (value == "hearing_disabled_sharp") return Icons.hearing_disabled_sharp;
    if (value == "hearing_disabled_rounded")
      return Icons.hearing_disabled_rounded;
    if (value == "hearing_disabled_outlined")
      return Icons.hearing_disabled_outlined;
    if (value == "heart_broken") return Icons.heart_broken;
    if (value == "heart_broken_sharp") return Icons.heart_broken_sharp;
    if (value == "heart_broken_rounded") return Icons.heart_broken_rounded;
    if (value == "heart_broken_outlined") return Icons.heart_broken_outlined;
    if (value == "heat_pump") return Icons.heat_pump;
    if (value == "heat_pump_sharp") return Icons.heat_pump_sharp;
    if (value == "heat_pump_rounded") return Icons.heat_pump_rounded;
    if (value == "heat_pump_outlined") return Icons.heat_pump_outlined;
    if (value == "height") return Icons.height;
    if (value == "height_sharp") return Icons.height_sharp;
    if (value == "height_rounded") return Icons.height_rounded;
    if (value == "height_outlined") return Icons.height_outlined;
    if (value == "help") return Icons.help;
    if (value == "help_sharp") return Icons.help_sharp;
    if (value == "help_rounded") return Icons.help_rounded;
    if (value == "help_outlined") return Icons.help_outlined;
    if (value == "help_center") return Icons.help_center;
    if (value == "help_center_sharp") return Icons.help_center_sharp;
    if (value == "help_center_rounded") return Icons.help_center_rounded;
    if (value == "help_center_outlined") return Icons.help_center_outlined;
    if (value == "help_outline") return Icons.help_outline;
    if (value == "help_outline_sharp") return Icons.help_outline_sharp;
    if (value == "help_outline_rounded") return Icons.help_outline_rounded;
    if (value == "help_outline_outlined") return Icons.help_outline_outlined;
    if (value == "hevc") return Icons.hevc;
    if (value == "hevc_sharp") return Icons.hevc_sharp;
    if (value == "hevc_rounded") return Icons.hevc_rounded;
    if (value == "hevc_outlined") return Icons.hevc_outlined;
    if (value == "hexagon") return Icons.hexagon;
    if (value == "hexagon_sharp") return Icons.hexagon_sharp;
    if (value == "hexagon_rounded") return Icons.hexagon_rounded;
    if (value == "hexagon_outlined") return Icons.hexagon_outlined;
    if (value == "hide_image") return Icons.hide_image;
    if (value == "hide_image_sharp") return Icons.hide_image_sharp;
    if (value == "hide_image_rounded") return Icons.hide_image_rounded;
    if (value == "hide_image_outlined") return Icons.hide_image_outlined;
    if (value == "hide_source") return Icons.hide_source;
    if (value == "hide_source_sharp") return Icons.hide_source_sharp;
    if (value == "hide_source_rounded") return Icons.hide_source_rounded;
    if (value == "hide_source_outlined") return Icons.hide_source_outlined;
    if (value == "high_quality") return Icons.high_quality;
    if (value == "high_quality_sharp") return Icons.high_quality_sharp;
    if (value == "high_quality_rounded") return Icons.high_quality_rounded;
    if (value == "high_quality_outlined") return Icons.high_quality_outlined;
    if (value == "highlight") return Icons.highlight;
    if (value == "highlight_sharp") return Icons.highlight_sharp;
    if (value == "highlight_rounded") return Icons.highlight_rounded;
    if (value == "highlight_outlined") return Icons.highlight_outlined;
    if (value == "highlight_alt") return Icons.highlight_alt;
    if (value == "highlight_alt_sharp") return Icons.highlight_alt_sharp;
    if (value == "highlight_alt_rounded") return Icons.highlight_alt_rounded;
    if (value == "highlight_alt_outlined") return Icons.highlight_alt_outlined;
    if (value == "highlight_off") return Icons.highlight_off;
    if (value == "highlight_off_sharp") return Icons.highlight_off_sharp;
    if (value == "highlight_off_rounded") return Icons.highlight_off_rounded;
    if (value == "highlight_off_outlined") return Icons.highlight_off_outlined;
    if (value == "highlight_remove") return Icons.highlight_remove;
    if (value == "highlight_remove_sharp") return Icons.highlight_remove_sharp;
    if (value == "highlight_remove_rounded")
      return Icons.highlight_remove_rounded;
    if (value == "highlight_remove_outlined")
      return Icons.highlight_remove_outlined;
    if (value == "hiking") return Icons.hiking;
    if (value == "hiking_sharp") return Icons.hiking_sharp;
    if (value == "hiking_rounded") return Icons.hiking_rounded;
    if (value == "hiking_outlined") return Icons.hiking_outlined;
    if (value == "history") return Icons.history;
    if (value == "history_sharp") return Icons.history_sharp;
    if (value == "history_rounded") return Icons.history_rounded;
    if (value == "history_outlined") return Icons.history_outlined;
    if (value == "history_edu") return Icons.history_edu;
    if (value == "history_edu_sharp") return Icons.history_edu_sharp;
    if (value == "history_edu_rounded") return Icons.history_edu_rounded;
    if (value == "history_edu_outlined") return Icons.history_edu_outlined;
    if (value == "history_toggle_off") return Icons.history_toggle_off;
    if (value == "history_toggle_off_sharp")
      return Icons.history_toggle_off_sharp;
    if (value == "history_toggle_off_rounded")
      return Icons.history_toggle_off_rounded;
    if (value == "history_toggle_off_outlined")
      return Icons.history_toggle_off_outlined;
    if (value == "hive") return Icons.hive;
    if (value == "hive_sharp") return Icons.hive_sharp;
    if (value == "hive_rounded") return Icons.hive_rounded;
    if (value == "hive_outlined") return Icons.hive_outlined;
    if (value == "hls") return Icons.hls;
    if (value == "hls_sharp") return Icons.hls_sharp;
    if (value == "hls_rounded") return Icons.hls_rounded;
    if (value == "hls_outlined") return Icons.hls_outlined;
    if (value == "hls_off") return Icons.hls_off;
    if (value == "hls_off_sharp") return Icons.hls_off_sharp;
    if (value == "hls_off_rounded") return Icons.hls_off_rounded;
    if (value == "hls_off_outlined") return Icons.hls_off_outlined;
    if (value == "holiday_village") return Icons.holiday_village;
    if (value == "holiday_village_sharp") return Icons.holiday_village_sharp;
    if (value == "holiday_village_rounded")
      return Icons.holiday_village_rounded;
    if (value == "holiday_village_outlined")
      return Icons.holiday_village_outlined;
    if (value == "home") return Icons.home;
    if (value == "home_sharp") return Icons.home_sharp;
    if (value == "home_rounded") return Icons.home_rounded;
    if (value == "home_outlined") return Icons.home_outlined;
    if (value == "home_filled") return Icons.home_filled;
    if (value == "home_max") return Icons.home_max;
    if (value == "home_max_sharp") return Icons.home_max_sharp;
    if (value == "home_max_rounded") return Icons.home_max_rounded;
    if (value == "home_max_outlined") return Icons.home_max_outlined;
    if (value == "home_mini") return Icons.home_mini;
    if (value == "home_mini_sharp") return Icons.home_mini_sharp;
    if (value == "home_mini_rounded") return Icons.home_mini_rounded;
    if (value == "home_mini_outlined") return Icons.home_mini_outlined;
    if (value == "home_repair_service") return Icons.home_repair_service;
    if (value == "home_repair_service_sharp")
      return Icons.home_repair_service_sharp;
    if (value == "home_repair_service_rounded")
      return Icons.home_repair_service_rounded;
    if (value == "home_repair_service_outlined")
      return Icons.home_repair_service_outlined;
    if (value == "home_work") return Icons.home_work;
    if (value == "home_work_sharp") return Icons.home_work_sharp;
    if (value == "home_work_rounded") return Icons.home_work_rounded;
    if (value == "home_work_outlined") return Icons.home_work_outlined;
    if (value == "horizontal_distribute") return Icons.horizontal_distribute;
    if (value == "horizontal_distribute_sharp")
      return Icons.horizontal_distribute_sharp;
    if (value == "horizontal_distribute_rounded")
      return Icons.horizontal_distribute_rounded;
    if (value == "horizontal_distribute_outlined")
      return Icons.horizontal_distribute_outlined;
    if (value == "horizontal_rule") return Icons.horizontal_rule;
    if (value == "horizontal_rule_sharp") return Icons.horizontal_rule_sharp;
    if (value == "horizontal_rule_rounded")
      return Icons.horizontal_rule_rounded;
    if (value == "horizontal_rule_outlined")
      return Icons.horizontal_rule_outlined;
    if (value == "horizontal_split") return Icons.horizontal_split;
    if (value == "horizontal_split_sharp") return Icons.horizontal_split_sharp;
    if (value == "horizontal_split_rounded")
      return Icons.horizontal_split_rounded;
    if (value == "horizontal_split_outlined")
      return Icons.horizontal_split_outlined;
    if (value == "hot_tub") return Icons.hot_tub;
    if (value == "hot_tub_sharp") return Icons.hot_tub_sharp;
    if (value == "hot_tub_rounded") return Icons.hot_tub_rounded;
    if (value == "hot_tub_outlined") return Icons.hot_tub_outlined;
    if (value == "hotel") return Icons.hotel;
    if (value == "hotel_sharp") return Icons.hotel_sharp;
    if (value == "hotel_rounded") return Icons.hotel_rounded;
    if (value == "hotel_outlined") return Icons.hotel_outlined;
    if (value == "hotel_class") return Icons.hotel_class;
    if (value == "hotel_class_sharp") return Icons.hotel_class_sharp;
    if (value == "hotel_class_rounded") return Icons.hotel_class_rounded;
    if (value == "hotel_class_outlined") return Icons.hotel_class_outlined;
    if (value == "hourglass_bottom") return Icons.hourglass_bottom;
    if (value == "hourglass_bottom_sharp") return Icons.hourglass_bottom_sharp;
    if (value == "hourglass_bottom_rounded")
      return Icons.hourglass_bottom_rounded;
    if (value == "hourglass_bottom_outlined")
      return Icons.hourglass_bottom_outlined;
    if (value == "hourglass_disabled") return Icons.hourglass_disabled;
    if (value == "hourglass_disabled_sharp")
      return Icons.hourglass_disabled_sharp;
    if (value == "hourglass_disabled_rounded")
      return Icons.hourglass_disabled_rounded;
    if (value == "hourglass_disabled_outlined")
      return Icons.hourglass_disabled_outlined;
    if (value == "hourglass_empty") return Icons.hourglass_empty;
    if (value == "hourglass_empty_sharp") return Icons.hourglass_empty_sharp;
    if (value == "hourglass_empty_rounded")
      return Icons.hourglass_empty_rounded;
    if (value == "hourglass_empty_outlined")
      return Icons.hourglass_empty_outlined;
    if (value == "hourglass_full") return Icons.hourglass_full;
    if (value == "hourglass_full_sharp") return Icons.hourglass_full_sharp;
    if (value == "hourglass_full_rounded") return Icons.hourglass_full_rounded;
    if (value == "hourglass_full_outlined")
      return Icons.hourglass_full_outlined;
    if (value == "hourglass_top") return Icons.hourglass_top;
    if (value == "hourglass_top_sharp") return Icons.hourglass_top_sharp;
    if (value == "hourglass_top_rounded") return Icons.hourglass_top_rounded;
    if (value == "hourglass_top_outlined") return Icons.hourglass_top_outlined;
    if (value == "house") return Icons.house;
    if (value == "house_sharp") return Icons.house_sharp;
    if (value == "house_rounded") return Icons.house_rounded;
    if (value == "house_outlined") return Icons.house_outlined;
    if (value == "house_siding") return Icons.house_siding;
    if (value == "house_siding_sharp") return Icons.house_siding_sharp;
    if (value == "house_siding_rounded") return Icons.house_siding_rounded;
    if (value == "house_siding_outlined") return Icons.house_siding_outlined;
    if (value == "houseboat") return Icons.houseboat;
    if (value == "houseboat_sharp") return Icons.houseboat_sharp;
    if (value == "houseboat_rounded") return Icons.houseboat_rounded;
    if (value == "houseboat_outlined") return Icons.houseboat_outlined;
    if (value == "how_to_reg") return Icons.how_to_reg;
    if (value == "how_to_reg_sharp") return Icons.how_to_reg_sharp;
    if (value == "how_to_reg_rounded") return Icons.how_to_reg_rounded;
    if (value == "how_to_reg_outlined") return Icons.how_to_reg_outlined;
    if (value == "how_to_vote") return Icons.how_to_vote;
    if (value == "how_to_vote_sharp") return Icons.how_to_vote_sharp;
    if (value == "how_to_vote_rounded") return Icons.how_to_vote_rounded;
    if (value == "how_to_vote_outlined") return Icons.how_to_vote_outlined;
    if (value == "html") return Icons.html;
    if (value == "html_sharp") return Icons.html_sharp;
    if (value == "html_rounded") return Icons.html_rounded;
    if (value == "html_outlined") return Icons.html_outlined;
    if (value == "http") return Icons.http;
    if (value == "http_sharp") return Icons.http_sharp;
    if (value == "http_rounded") return Icons.http_rounded;
    if (value == "http_outlined") return Icons.http_outlined;
    if (value == "https") return Icons.https;
    if (value == "https_sharp") return Icons.https_sharp;
    if (value == "https_rounded") return Icons.https_rounded;
    if (value == "https_outlined") return Icons.https_outlined;
    if (value == "hub") return Icons.hub;
    if (value == "hub_sharp") return Icons.hub_sharp;
    if (value == "hub_rounded") return Icons.hub_rounded;
    if (value == "hub_outlined") return Icons.hub_outlined;
    if (value == "hvac") return Icons.hvac;
    if (value == "hvac_sharp") return Icons.hvac_sharp;
    if (value == "hvac_rounded") return Icons.hvac_rounded;
    if (value == "hvac_outlined") return Icons.hvac_outlined;
    if (value == "ice_skating") return Icons.ice_skating;
    if (value == "ice_skating_sharp") return Icons.ice_skating_sharp;
    if (value == "ice_skating_rounded") return Icons.ice_skating_rounded;
    if (value == "ice_skating_outlined") return Icons.ice_skating_outlined;
    if (value == "icecream") return Icons.icecream;
    if (value == "icecream_sharp") return Icons.icecream_sharp;
    if (value == "icecream_rounded") return Icons.icecream_rounded;
    if (value == "icecream_outlined") return Icons.icecream_outlined;
    if (value == "image") return Icons.image;
    if (value == "image_sharp") return Icons.image_sharp;
    if (value == "image_rounded") return Icons.image_rounded;
    if (value == "image_outlined") return Icons.image_outlined;
    if (value == "image_aspect_ratio") return Icons.image_aspect_ratio;
    if (value == "image_aspect_ratio_sharp")
      return Icons.image_aspect_ratio_sharp;
    if (value == "image_aspect_ratio_rounded")
      return Icons.image_aspect_ratio_rounded;
    if (value == "image_aspect_ratio_outlined")
      return Icons.image_aspect_ratio_outlined;
    if (value == "image_not_supported") return Icons.image_not_supported;
    if (value == "image_not_supported_sharp")
      return Icons.image_not_supported_sharp;
    if (value == "image_not_supported_rounded")
      return Icons.image_not_supported_rounded;
    if (value == "image_not_supported_outlined")
      return Icons.image_not_supported_outlined;
    if (value == "image_search") return Icons.image_search;
    if (value == "image_search_sharp") return Icons.image_search_sharp;
    if (value == "image_search_rounded") return Icons.image_search_rounded;
    if (value == "image_search_outlined") return Icons.image_search_outlined;
    if (value == "imagesearch_roller") return Icons.imagesearch_roller;
    if (value == "imagesearch_roller_sharp")
      return Icons.imagesearch_roller_sharp;
    if (value == "imagesearch_roller_rounded")
      return Icons.imagesearch_roller_rounded;
    if (value == "imagesearch_roller_outlined")
      return Icons.imagesearch_roller_outlined;
    if (value == "import_contacts") return Icons.import_contacts;
    if (value == "import_contacts_sharp") return Icons.import_contacts_sharp;
    if (value == "import_contacts_rounded")
      return Icons.import_contacts_rounded;
    if (value == "import_contacts_outlined")
      return Icons.import_contacts_outlined;
    if (value == "import_export") return Icons.import_export;
    if (value == "import_export_sharp") return Icons.import_export_sharp;
    if (value == "import_export_rounded") return Icons.import_export_rounded;
    if (value == "import_export_outlined") return Icons.import_export_outlined;
    if (value == "important_devices") return Icons.important_devices;
    if (value == "important_devices_sharp")
      return Icons.important_devices_sharp;
    if (value == "important_devices_rounded")
      return Icons.important_devices_rounded;
    if (value == "important_devices_outlined")
      return Icons.important_devices_outlined;
    if (value == "inbox") return Icons.inbox;
    if (value == "inbox_sharp") return Icons.inbox_sharp;
    if (value == "inbox_rounded") return Icons.inbox_rounded;
    if (value == "inbox_outlined") return Icons.inbox_outlined;
    if (value == "incomplete_circle") return Icons.incomplete_circle;
    if (value == "incomplete_circle_sharp")
      return Icons.incomplete_circle_sharp;
    if (value == "incomplete_circle_rounded")
      return Icons.incomplete_circle_rounded;
    if (value == "incomplete_circle_outlined")
      return Icons.incomplete_circle_outlined;
    if (value == "indeterminate_check_box")
      return Icons.indeterminate_check_box;
    if (value == "indeterminate_check_box_sharp")
      return Icons.indeterminate_check_box_sharp;
    if (value == "indeterminate_check_box_rounded")
      return Icons.indeterminate_check_box_rounded;
    if (value == "indeterminate_check_box_outlined")
      return Icons.indeterminate_check_box_outlined;
    if (value == "info") return Icons.info;
    if (value == "info_sharp") return Icons.info_sharp;
    if (value == "info_rounded") return Icons.info_rounded;
    if (value == "info_outlined") return Icons.info_outlined;
    if (value == "info_outline") return Icons.info_outline;
    if (value == "info_outline_sharp") return Icons.info_outline_sharp;
    if (value == "info_outline_rounded") return Icons.info_outline_rounded;
    if (value == "input") return Icons.input;
    if (value == "input_sharp") return Icons.input_sharp;
    if (value == "input_rounded") return Icons.input_rounded;
    if (value == "input_outlined") return Icons.input_outlined;
    if (value == "insert_chart") return Icons.insert_chart;
    if (value == "insert_chart_sharp") return Icons.insert_chart_sharp;
    if (value == "insert_chart_rounded") return Icons.insert_chart_rounded;
    if (value == "insert_chart_outlined") return Icons.insert_chart_outlined;
    if (value == "insert_chart_outlined_sharp")
      return Icons.insert_chart_outlined_sharp;
    if (value == "insert_chart_outlined_rounded")
      return Icons.insert_chart_outlined_rounded;
    if (value == "insert_chart_outlined_outlined")
      return Icons.insert_chart_outlined_outlined;
    if (value == "insert_comment") return Icons.insert_comment;
    if (value == "insert_comment_sharp") return Icons.insert_comment_sharp;
    if (value == "insert_comment_rounded") return Icons.insert_comment_rounded;
    if (value == "insert_comment_outlined")
      return Icons.insert_comment_outlined;
    if (value == "insert_drive_file") return Icons.insert_drive_file;
    if (value == "insert_drive_file_sharp")
      return Icons.insert_drive_file_sharp;
    if (value == "insert_drive_file_rounded")
      return Icons.insert_drive_file_rounded;
    if (value == "insert_drive_file_outlined")
      return Icons.insert_drive_file_outlined;
    if (value == "insert_emoticon") return Icons.insert_emoticon;
    if (value == "insert_emoticon_sharp") return Icons.insert_emoticon_sharp;
    if (value == "insert_emoticon_rounded")
      return Icons.insert_emoticon_rounded;
    if (value == "insert_emoticon_outlined")
      return Icons.insert_emoticon_outlined;
    if (value == "insert_invitation") return Icons.insert_invitation;
    if (value == "insert_invitation_sharp")
      return Icons.insert_invitation_sharp;
    if (value == "insert_invitation_rounded")
      return Icons.insert_invitation_rounded;
    if (value == "insert_invitation_outlined")
      return Icons.insert_invitation_outlined;
    if (value == "insert_link") return Icons.insert_link;
    if (value == "insert_link_sharp") return Icons.insert_link_sharp;
    if (value == "insert_link_rounded") return Icons.insert_link_rounded;
    if (value == "insert_link_outlined") return Icons.insert_link_outlined;
    if (value == "insert_page_break") return Icons.insert_page_break;
    if (value == "insert_page_break_sharp")
      return Icons.insert_page_break_sharp;
    if (value == "insert_page_break_rounded")
      return Icons.insert_page_break_rounded;
    if (value == "insert_page_break_outlined")
      return Icons.insert_page_break_outlined;
    if (value == "insert_photo") return Icons.insert_photo;
    if (value == "insert_photo_sharp") return Icons.insert_photo_sharp;
    if (value == "insert_photo_rounded") return Icons.insert_photo_rounded;
    if (value == "insert_photo_outlined") return Icons.insert_photo_outlined;
    if (value == "insights") return Icons.insights;
    if (value == "insights_sharp") return Icons.insights_sharp;
    if (value == "insights_rounded") return Icons.insights_rounded;
    if (value == "insights_outlined") return Icons.insights_outlined;
    if (value == "install_desktop") return Icons.install_desktop;
    if (value == "install_desktop_sharp") return Icons.install_desktop_sharp;
    if (value == "install_desktop_rounded")
      return Icons.install_desktop_rounded;
    if (value == "install_desktop_outlined")
      return Icons.install_desktop_outlined;
    if (value == "install_mobile") return Icons.install_mobile;
    if (value == "install_mobile_sharp") return Icons.install_mobile_sharp;
    if (value == "install_mobile_rounded") return Icons.install_mobile_rounded;
    if (value == "install_mobile_outlined")
      return Icons.install_mobile_outlined;
    if (value == "integration_instructions")
      return Icons.integration_instructions;
    if (value == "integration_instructions_sharp")
      return Icons.integration_instructions_sharp;
    if (value == "integration_instructions_rounded")
      return Icons.integration_instructions_rounded;
    if (value == "integration_instructions_outlined")
      return Icons.integration_instructions_outlined;
    if (value == "interests") return Icons.interests;
    if (value == "interests_sharp") return Icons.interests_sharp;
    if (value == "interests_rounded") return Icons.interests_rounded;
    if (value == "interests_outlined") return Icons.interests_outlined;
    if (value == "interpreter_mode") return Icons.interpreter_mode;
    if (value == "interpreter_mode_sharp") return Icons.interpreter_mode_sharp;
    if (value == "interpreter_mode_rounded")
      return Icons.interpreter_mode_rounded;
    if (value == "interpreter_mode_outlined")
      return Icons.interpreter_mode_outlined;
    if (value == "inventory") return Icons.inventory;
    if (value == "inventory_sharp") return Icons.inventory_sharp;
    if (value == "inventory_rounded") return Icons.inventory_rounded;
    if (value == "inventory_outlined") return Icons.inventory_outlined;
    if (value == "inventory_2") return Icons.inventory_2;
    if (value == "inventory_2_sharp") return Icons.inventory_2_sharp;
    if (value == "inventory_2_rounded") return Icons.inventory_2_rounded;
    if (value == "inventory_2_outlined") return Icons.inventory_2_outlined;
    if (value == "invert_colors") return Icons.invert_colors;
    if (value == "invert_colors_sharp") return Icons.invert_colors_sharp;
    if (value == "invert_colors_rounded") return Icons.invert_colors_rounded;
    if (value == "invert_colors_outlined") return Icons.invert_colors_outlined;
    if (value == "invert_colors_off") return Icons.invert_colors_off;
    if (value == "invert_colors_off_sharp")
      return Icons.invert_colors_off_sharp;
    if (value == "invert_colors_off_rounded")
      return Icons.invert_colors_off_rounded;
    if (value == "invert_colors_off_outlined")
      return Icons.invert_colors_off_outlined;
    if (value == "invert_colors_on") return Icons.invert_colors_on;
    if (value == "invert_colors_on_sharp") return Icons.invert_colors_on_sharp;
    if (value == "invert_colors_on_rounded")
      return Icons.invert_colors_on_rounded;
    if (value == "invert_colors_on_outlined")
      return Icons.invert_colors_on_outlined;
    if (value == "ios_share") return Icons.ios_share;
    if (value == "ios_share_sharp") return Icons.ios_share_sharp;
    if (value == "ios_share_rounded") return Icons.ios_share_rounded;
    if (value == "ios_share_outlined") return Icons.ios_share_outlined;
    if (value == "iron") return Icons.iron;
    if (value == "iron_sharp") return Icons.iron_sharp;
    if (value == "iron_rounded") return Icons.iron_rounded;
    if (value == "iron_outlined") return Icons.iron_outlined;
    if (value == "iso") return Icons.iso;
    if (value == "iso_sharp") return Icons.iso_sharp;
    if (value == "iso_rounded") return Icons.iso_rounded;
    if (value == "iso_outlined") return Icons.iso_outlined;
    if (value == "javascript") return Icons.javascript;
    if (value == "javascript_sharp") return Icons.javascript_sharp;
    if (value == "javascript_rounded") return Icons.javascript_rounded;
    if (value == "javascript_outlined") return Icons.javascript_outlined;
    if (value == "join_full") return Icons.join_full;
    if (value == "join_full_sharp") return Icons.join_full_sharp;
    if (value == "join_full_rounded") return Icons.join_full_rounded;
    if (value == "join_full_outlined") return Icons.join_full_outlined;
    if (value == "join_inner") return Icons.join_inner;
    if (value == "join_inner_sharp") return Icons.join_inner_sharp;
    if (value == "join_inner_rounded") return Icons.join_inner_rounded;
    if (value == "join_inner_outlined") return Icons.join_inner_outlined;
    if (value == "join_left") return Icons.join_left;
    if (value == "join_left_sharp") return Icons.join_left_sharp;
    if (value == "join_left_rounded") return Icons.join_left_rounded;
    if (value == "join_left_outlined") return Icons.join_left_outlined;
    if (value == "join_right") return Icons.join_right;
    if (value == "join_right_sharp") return Icons.join_right_sharp;
    if (value == "join_right_rounded") return Icons.join_right_rounded;
    if (value == "join_right_outlined") return Icons.join_right_outlined;
    if (value == "kayaking") return Icons.kayaking;
    if (value == "kayaking_sharp") return Icons.kayaking_sharp;
    if (value == "kayaking_rounded") return Icons.kayaking_rounded;
    if (value == "kayaking_outlined") return Icons.kayaking_outlined;
    if (value == "kebab_dining") return Icons.kebab_dining;
    if (value == "kebab_dining_sharp") return Icons.kebab_dining_sharp;
    if (value == "kebab_dining_rounded") return Icons.kebab_dining_rounded;
    if (value == "kebab_dining_outlined") return Icons.kebab_dining_outlined;
    if (value == "key") return Icons.key;
    if (value == "key_sharp") return Icons.key_sharp;
    if (value == "key_rounded") return Icons.key_rounded;
    if (value == "key_outlined") return Icons.key_outlined;
    if (value == "key_off") return Icons.key_off;
    if (value == "key_off_sharp") return Icons.key_off_sharp;
    if (value == "key_off_rounded") return Icons.key_off_rounded;
    if (value == "key_off_outlined") return Icons.key_off_outlined;
    if (value == "keyboard") return Icons.keyboard;
    if (value == "keyboard_sharp") return Icons.keyboard_sharp;
    if (value == "keyboard_rounded") return Icons.keyboard_rounded;
    if (value == "keyboard_outlined") return Icons.keyboard_outlined;
    if (value == "keyboard_alt") return Icons.keyboard_alt;
    if (value == "keyboard_alt_sharp") return Icons.keyboard_alt_sharp;
    if (value == "keyboard_alt_rounded") return Icons.keyboard_alt_rounded;
    if (value == "keyboard_alt_outlined") return Icons.keyboard_alt_outlined;
    if (value == "keyboard_arrow_down") return Icons.keyboard_arrow_down;
    if (value == "keyboard_arrow_down_sharp")
      return Icons.keyboard_arrow_down_sharp;
    if (value == "keyboard_arrow_down_rounded")
      return Icons.keyboard_arrow_down_rounded;
    if (value == "keyboard_arrow_down_outlined")
      return Icons.keyboard_arrow_down_outlined;
    if (value == "keyboard_arrow_left") return Icons.keyboard_arrow_left;
    if (value == "keyboard_arrow_left_sharp")
      return Icons.keyboard_arrow_left_sharp;
    if (value == "keyboard_arrow_left_rounded")
      return Icons.keyboard_arrow_left_rounded;
    if (value == "keyboard_arrow_left_outlined")
      return Icons.keyboard_arrow_left_outlined;
    if (value == "keyboard_arrow_right") return Icons.keyboard_arrow_right;
    if (value == "keyboard_arrow_right_sharp")
      return Icons.keyboard_arrow_right_sharp;
    if (value == "keyboard_arrow_right_rounded")
      return Icons.keyboard_arrow_right_rounded;
    if (value == "keyboard_arrow_right_outlined")
      return Icons.keyboard_arrow_right_outlined;
    if (value == "keyboard_arrow_up") return Icons.keyboard_arrow_up;
    if (value == "keyboard_arrow_up_sharp")
      return Icons.keyboard_arrow_up_sharp;
    if (value == "keyboard_arrow_up_rounded")
      return Icons.keyboard_arrow_up_rounded;
    if (value == "keyboard_arrow_up_outlined")
      return Icons.keyboard_arrow_up_outlined;
    if (value == "keyboard_backspace") return Icons.keyboard_backspace;
    if (value == "keyboard_backspace_sharp")
      return Icons.keyboard_backspace_sharp;
    if (value == "keyboard_backspace_rounded")
      return Icons.keyboard_backspace_rounded;
    if (value == "keyboard_backspace_outlined")
      return Icons.keyboard_backspace_outlined;
    if (value == "keyboard_capslock") return Icons.keyboard_capslock;
    if (value == "keyboard_capslock_sharp")
      return Icons.keyboard_capslock_sharp;
    if (value == "keyboard_capslock_rounded")
      return Icons.keyboard_capslock_rounded;
    if (value == "keyboard_capslock_outlined")
      return Icons.keyboard_capslock_outlined;
    if (value == "keyboard_command_key") return Icons.keyboard_command_key;
    if (value == "keyboard_command_key_sharp")
      return Icons.keyboard_command_key_sharp;
    if (value == "keyboard_command_key_rounded")
      return Icons.keyboard_command_key_rounded;
    if (value == "keyboard_command_key_outlined")
      return Icons.keyboard_command_key_outlined;
    if (value == "keyboard_control") return Icons.keyboard_control;
    if (value == "keyboard_control_sharp") return Icons.keyboard_control_sharp;
    if (value == "keyboard_control_rounded")
      return Icons.keyboard_control_rounded;
    if (value == "keyboard_control_outlined")
      return Icons.keyboard_control_outlined;
    if (value == "keyboard_control_key") return Icons.keyboard_control_key;
    if (value == "keyboard_control_key_sharp")
      return Icons.keyboard_control_key_sharp;
    if (value == "keyboard_control_key_rounded")
      return Icons.keyboard_control_key_rounded;
    if (value == "keyboard_control_key_outlined")
      return Icons.keyboard_control_key_outlined;
    if (value == "keyboard_double_arrow_down")
      return Icons.keyboard_double_arrow_down;
    if (value == "keyboard_double_arrow_down_sharp")
      return Icons.keyboard_double_arrow_down_sharp;
    if (value == "keyboard_double_arrow_down_rounded")
      return Icons.keyboard_double_arrow_down_rounded;
    if (value == "keyboard_double_arrow_down_outlined")
      return Icons.keyboard_double_arrow_down_outlined;
    if (value == "keyboard_double_arrow_left")
      return Icons.keyboard_double_arrow_left;
    if (value == "keyboard_double_arrow_left_sharp")
      return Icons.keyboard_double_arrow_left_sharp;
    if (value == "keyboard_double_arrow_left_rounded")
      return Icons.keyboard_double_arrow_left_rounded;
    if (value == "keyboard_double_arrow_left_outlined")
      return Icons.keyboard_double_arrow_left_outlined;
    if (value == "keyboard_double_arrow_right")
      return Icons.keyboard_double_arrow_right;
    if (value == "keyboard_double_arrow_right_sharp")
      return Icons.keyboard_double_arrow_right_sharp;
    if (value == "keyboard_double_arrow_right_rounded")
      return Icons.keyboard_double_arrow_right_rounded;
    if (value == "keyboard_double_arrow_right_outlined")
      return Icons.keyboard_double_arrow_right_outlined;
    if (value == "keyboard_double_arrow_up")
      return Icons.keyboard_double_arrow_up;
    if (value == "keyboard_double_arrow_up_sharp")
      return Icons.keyboard_double_arrow_up_sharp;
    if (value == "keyboard_double_arrow_up_rounded")
      return Icons.keyboard_double_arrow_up_rounded;
    if (value == "keyboard_double_arrow_up_outlined")
      return Icons.keyboard_double_arrow_up_outlined;
    if (value == "keyboard_hide") return Icons.keyboard_hide;
    if (value == "keyboard_hide_sharp") return Icons.keyboard_hide_sharp;
    if (value == "keyboard_hide_rounded") return Icons.keyboard_hide_rounded;
    if (value == "keyboard_hide_outlined") return Icons.keyboard_hide_outlined;
    if (value == "keyboard_option_key") return Icons.keyboard_option_key;
    if (value == "keyboard_option_key_sharp")
      return Icons.keyboard_option_key_sharp;
    if (value == "keyboard_option_key_rounded")
      return Icons.keyboard_option_key_rounded;
    if (value == "keyboard_option_key_outlined")
      return Icons.keyboard_option_key_outlined;
    if (value == "keyboard_return") return Icons.keyboard_return;
    if (value == "keyboard_return_sharp") return Icons.keyboard_return_sharp;
    if (value == "keyboard_return_rounded")
      return Icons.keyboard_return_rounded;
    if (value == "keyboard_return_outlined")
      return Icons.keyboard_return_outlined;
    if (value == "keyboard_tab") return Icons.keyboard_tab;
    if (value == "keyboard_tab_sharp") return Icons.keyboard_tab_sharp;
    if (value == "keyboard_tab_rounded") return Icons.keyboard_tab_rounded;
    if (value == "keyboard_tab_outlined") return Icons.keyboard_tab_outlined;
    if (value == "keyboard_voice") return Icons.keyboard_voice;
    if (value == "keyboard_voice_sharp") return Icons.keyboard_voice_sharp;
    if (value == "keyboard_voice_rounded") return Icons.keyboard_voice_rounded;
    if (value == "keyboard_voice_outlined")
      return Icons.keyboard_voice_outlined;
    if (value == "king_bed") return Icons.king_bed;
    if (value == "king_bed_sharp") return Icons.king_bed_sharp;
    if (value == "king_bed_rounded") return Icons.king_bed_rounded;
    if (value == "king_bed_outlined") return Icons.king_bed_outlined;
    if (value == "kitchen") return Icons.kitchen;
    if (value == "kitchen_sharp") return Icons.kitchen_sharp;
    if (value == "kitchen_rounded") return Icons.kitchen_rounded;
    if (value == "kitchen_outlined") return Icons.kitchen_outlined;
    if (value == "kitesurfing") return Icons.kitesurfing;
    if (value == "kitesurfing_sharp") return Icons.kitesurfing_sharp;
    if (value == "kitesurfing_rounded") return Icons.kitesurfing_rounded;
    if (value == "kitesurfing_outlined") return Icons.kitesurfing_outlined;
    if (value == "label") return Icons.label;
    if (value == "label_sharp") return Icons.label_sharp;
    if (value == "label_rounded") return Icons.label_rounded;
    if (value == "label_outlined") return Icons.label_outlined;
    if (value == "label_important") return Icons.label_important;
    if (value == "label_important_sharp") return Icons.label_important_sharp;
    if (value == "label_important_rounded")
      return Icons.label_important_rounded;
    if (value == "label_important_outlined")
      return Icons.label_important_outlined;
    if (value == "label_important_outline")
      return Icons.label_important_outline;
    if (value == "label_important_outline_sharp")
      return Icons.label_important_outline_sharp;
    if (value == "label_important_outline_rounded")
      return Icons.label_important_outline_rounded;
    if (value == "label_off") return Icons.label_off;
    if (value == "label_off_sharp") return Icons.label_off_sharp;
    if (value == "label_off_rounded") return Icons.label_off_rounded;
    if (value == "label_off_outlined") return Icons.label_off_outlined;
    if (value == "label_outline") return Icons.label_outline;
    if (value == "label_outline_sharp") return Icons.label_outline_sharp;
    if (value == "label_outline_rounded") return Icons.label_outline_rounded;
    if (value == "lan") return Icons.lan;
    if (value == "lan_sharp") return Icons.lan_sharp;
    if (value == "lan_rounded") return Icons.lan_rounded;
    if (value == "lan_outlined") return Icons.lan_outlined;
    if (value == "landscape") return Icons.landscape;
    if (value == "landscape_sharp") return Icons.landscape_sharp;
    if (value == "landscape_rounded") return Icons.landscape_rounded;
    if (value == "landscape_outlined") return Icons.landscape_outlined;
    if (value == "landslide") return Icons.landslide;
    if (value == "landslide_sharp") return Icons.landslide_sharp;
    if (value == "landslide_rounded") return Icons.landslide_rounded;
    if (value == "landslide_outlined") return Icons.landslide_outlined;
    if (value == "language") return Icons.language;
    if (value == "language_sharp") return Icons.language_sharp;
    if (value == "language_rounded") return Icons.language_rounded;
    if (value == "language_outlined") return Icons.language_outlined;
    if (value == "laptop") return Icons.laptop;
    if (value == "laptop_sharp") return Icons.laptop_sharp;
    if (value == "laptop_rounded") return Icons.laptop_rounded;
    if (value == "laptop_outlined") return Icons.laptop_outlined;
    if (value == "laptop_chromebook") return Icons.laptop_chromebook;
    if (value == "laptop_chromebook_sharp")
      return Icons.laptop_chromebook_sharp;
    if (value == "laptop_chromebook_rounded")
      return Icons.laptop_chromebook_rounded;
    if (value == "laptop_chromebook_outlined")
      return Icons.laptop_chromebook_outlined;
    if (value == "laptop_mac") return Icons.laptop_mac;
    if (value == "laptop_mac_sharp") return Icons.laptop_mac_sharp;
    if (value == "laptop_mac_rounded") return Icons.laptop_mac_rounded;
    if (value == "laptop_mac_outlined") return Icons.laptop_mac_outlined;
    if (value == "laptop_windows") return Icons.laptop_windows;
    if (value == "laptop_windows_sharp") return Icons.laptop_windows_sharp;
    if (value == "laptop_windows_rounded") return Icons.laptop_windows_rounded;
    if (value == "laptop_windows_outlined")
      return Icons.laptop_windows_outlined;
    if (value == "last_page") return Icons.last_page;
    if (value == "last_page_sharp") return Icons.last_page_sharp;
    if (value == "last_page_rounded") return Icons.last_page_rounded;
    if (value == "last_page_outlined") return Icons.last_page_outlined;
    if (value == "launch") return Icons.launch;
    if (value == "launch_sharp") return Icons.launch_sharp;
    if (value == "launch_rounded") return Icons.launch_rounded;
    if (value == "launch_outlined") return Icons.launch_outlined;
    if (value == "layers") return Icons.layers;
    if (value == "layers_sharp") return Icons.layers_sharp;
    if (value == "layers_rounded") return Icons.layers_rounded;
    if (value == "layers_outlined") return Icons.layers_outlined;
    if (value == "layers_clear") return Icons.layers_clear;
    if (value == "layers_clear_sharp") return Icons.layers_clear_sharp;
    if (value == "layers_clear_rounded") return Icons.layers_clear_rounded;
    if (value == "layers_clear_outlined") return Icons.layers_clear_outlined;
    if (value == "leaderboard") return Icons.leaderboard;
    if (value == "leaderboard_sharp") return Icons.leaderboard_sharp;
    if (value == "leaderboard_rounded") return Icons.leaderboard_rounded;
    if (value == "leaderboard_outlined") return Icons.leaderboard_outlined;
    if (value == "leak_add") return Icons.leak_add;
    if (value == "leak_add_sharp") return Icons.leak_add_sharp;
    if (value == "leak_add_rounded") return Icons.leak_add_rounded;
    if (value == "leak_add_outlined") return Icons.leak_add_outlined;
    if (value == "leak_remove") return Icons.leak_remove;
    if (value == "leak_remove_sharp") return Icons.leak_remove_sharp;
    if (value == "leak_remove_rounded") return Icons.leak_remove_rounded;
    if (value == "leak_remove_outlined") return Icons.leak_remove_outlined;
    if (value == "leave_bags_at_home") return Icons.leave_bags_at_home;
    if (value == "leave_bags_at_home_sharp")
      return Icons.leave_bags_at_home_sharp;
    if (value == "leave_bags_at_home_rounded")
      return Icons.leave_bags_at_home_rounded;
    if (value == "leave_bags_at_home_outlined")
      return Icons.leave_bags_at_home_outlined;
    if (value == "legend_toggle") return Icons.legend_toggle;
    if (value == "legend_toggle_sharp") return Icons.legend_toggle_sharp;
    if (value == "legend_toggle_rounded") return Icons.legend_toggle_rounded;
    if (value == "legend_toggle_outlined") return Icons.legend_toggle_outlined;
    if (value == "lens") return Icons.lens;
    if (value == "lens_sharp") return Icons.lens_sharp;
    if (value == "lens_rounded") return Icons.lens_rounded;
    if (value == "lens_outlined") return Icons.lens_outlined;
    if (value == "lens_blur") return Icons.lens_blur;
    if (value == "lens_blur_sharp") return Icons.lens_blur_sharp;
    if (value == "lens_blur_rounded") return Icons.lens_blur_rounded;
    if (value == "lens_blur_outlined") return Icons.lens_blur_outlined;
    if (value == "library_add") return Icons.library_add;
    if (value == "library_add_sharp") return Icons.library_add_sharp;
    if (value == "library_add_rounded") return Icons.library_add_rounded;
    if (value == "library_add_outlined") return Icons.library_add_outlined;
    if (value == "library_add_check") return Icons.library_add_check;
    if (value == "library_add_check_sharp")
      return Icons.library_add_check_sharp;
    if (value == "library_add_check_rounded")
      return Icons.library_add_check_rounded;
    if (value == "library_add_check_outlined")
      return Icons.library_add_check_outlined;
    if (value == "library_books") return Icons.library_books;
    if (value == "library_books_sharp") return Icons.library_books_sharp;
    if (value == "library_books_rounded") return Icons.library_books_rounded;
    if (value == "library_books_outlined") return Icons.library_books_outlined;
    if (value == "library_music") return Icons.library_music;
    if (value == "library_music_sharp") return Icons.library_music_sharp;
    if (value == "library_music_rounded") return Icons.library_music_rounded;
    if (value == "library_music_outlined") return Icons.library_music_outlined;
    if (value == "light") return Icons.light;
    if (value == "light_sharp") return Icons.light_sharp;
    if (value == "light_rounded") return Icons.light_rounded;
    if (value == "light_outlined") return Icons.light_outlined;
    if (value == "light_mode") return Icons.light_mode;
    if (value == "light_mode_sharp") return Icons.light_mode_sharp;
    if (value == "light_mode_rounded") return Icons.light_mode_rounded;
    if (value == "light_mode_outlined") return Icons.light_mode_outlined;
    if (value == "lightbulb") return Icons.lightbulb;
    if (value == "lightbulb_sharp") return Icons.lightbulb_sharp;
    if (value == "lightbulb_rounded") return Icons.lightbulb_rounded;
    if (value == "lightbulb_outlined") return Icons.lightbulb_outlined;
    if (value == "lightbulb_circle") return Icons.lightbulb_circle;
    if (value == "lightbulb_circle_sharp") return Icons.lightbulb_circle_sharp;
    if (value == "lightbulb_circle_rounded")
      return Icons.lightbulb_circle_rounded;
    if (value == "lightbulb_circle_outlined")
      return Icons.lightbulb_circle_outlined;
    if (value == "lightbulb_outline") return Icons.lightbulb_outline;
    if (value == "lightbulb_outline_sharp")
      return Icons.lightbulb_outline_sharp;
    if (value == "lightbulb_outline_rounded")
      return Icons.lightbulb_outline_rounded;
    if (value == "line_axis") return Icons.line_axis;
    if (value == "line_axis_sharp") return Icons.line_axis_sharp;
    if (value == "line_axis_rounded") return Icons.line_axis_rounded;
    if (value == "line_axis_outlined") return Icons.line_axis_outlined;
    if (value == "line_style") return Icons.line_style;
    if (value == "line_style_sharp") return Icons.line_style_sharp;
    if (value == "line_style_rounded") return Icons.line_style_rounded;
    if (value == "line_style_outlined") return Icons.line_style_outlined;
    if (value == "line_weight") return Icons.line_weight;
    if (value == "line_weight_sharp") return Icons.line_weight_sharp;
    if (value == "line_weight_rounded") return Icons.line_weight_rounded;
    if (value == "line_weight_outlined") return Icons.line_weight_outlined;
    if (value == "linear_scale") return Icons.linear_scale;
    if (value == "linear_scale_sharp") return Icons.linear_scale_sharp;
    if (value == "linear_scale_rounded") return Icons.linear_scale_rounded;
    if (value == "linear_scale_outlined") return Icons.linear_scale_outlined;
    if (value == "link") return Icons.link;
    if (value == "link_sharp") return Icons.link_sharp;
    if (value == "link_rounded") return Icons.link_rounded;
    if (value == "link_outlined") return Icons.link_outlined;
    if (value == "link_off") return Icons.link_off;
    if (value == "link_off_sharp") return Icons.link_off_sharp;
    if (value == "link_off_rounded") return Icons.link_off_rounded;
    if (value == "link_off_outlined") return Icons.link_off_outlined;
    if (value == "linked_camera") return Icons.linked_camera;
    if (value == "linked_camera_sharp") return Icons.linked_camera_sharp;
    if (value == "linked_camera_rounded") return Icons.linked_camera_rounded;
    if (value == "linked_camera_outlined") return Icons.linked_camera_outlined;
    if (value == "liquor") return Icons.liquor;
    if (value == "liquor_sharp") return Icons.liquor_sharp;
    if (value == "liquor_rounded") return Icons.liquor_rounded;
    if (value == "liquor_outlined") return Icons.liquor_outlined;
    if (value == "list") return Icons.list;
    if (value == "list_sharp") return Icons.list_sharp;
    if (value == "list_rounded") return Icons.list_rounded;
    if (value == "list_outlined") return Icons.list_outlined;
    if (value == "list_alt") return Icons.list_alt;
    if (value == "list_alt_sharp") return Icons.list_alt_sharp;
    if (value == "list_alt_rounded") return Icons.list_alt_rounded;
    if (value == "list_alt_outlined") return Icons.list_alt_outlined;
    if (value == "live_help") return Icons.live_help;
    if (value == "live_help_sharp") return Icons.live_help_sharp;
    if (value == "live_help_rounded") return Icons.live_help_rounded;
    if (value == "live_help_outlined") return Icons.live_help_outlined;
    if (value == "live_tv") return Icons.live_tv;
    if (value == "live_tv_sharp") return Icons.live_tv_sharp;
    if (value == "live_tv_rounded") return Icons.live_tv_rounded;
    if (value == "live_tv_outlined") return Icons.live_tv_outlined;
    if (value == "living") return Icons.living;
    if (value == "living_sharp") return Icons.living_sharp;
    if (value == "living_rounded") return Icons.living_rounded;
    if (value == "living_outlined") return Icons.living_outlined;
    if (value == "local_activity") return Icons.local_activity;
    if (value == "local_activity_sharp") return Icons.local_activity_sharp;
    if (value == "local_activity_rounded") return Icons.local_activity_rounded;
    if (value == "local_activity_outlined")
      return Icons.local_activity_outlined;
    if (value == "local_airport") return Icons.local_airport;
    if (value == "local_airport_sharp") return Icons.local_airport_sharp;
    if (value == "local_airport_rounded") return Icons.local_airport_rounded;
    if (value == "local_airport_outlined") return Icons.local_airport_outlined;
    if (value == "local_atm") return Icons.local_atm;
    if (value == "local_atm_sharp") return Icons.local_atm_sharp;
    if (value == "local_atm_rounded") return Icons.local_atm_rounded;
    if (value == "local_atm_outlined") return Icons.local_atm_outlined;
    if (value == "local_attraction") return Icons.local_attraction;
    if (value == "local_attraction_sharp") return Icons.local_attraction_sharp;
    if (value == "local_attraction_rounded")
      return Icons.local_attraction_rounded;
    if (value == "local_attraction_outlined")
      return Icons.local_attraction_outlined;
    if (value == "local_bar") return Icons.local_bar;
    if (value == "local_bar_sharp") return Icons.local_bar_sharp;
    if (value == "local_bar_rounded") return Icons.local_bar_rounded;
    if (value == "local_bar_outlined") return Icons.local_bar_outlined;
    if (value == "local_cafe") return Icons.local_cafe;
    if (value == "local_cafe_sharp") return Icons.local_cafe_sharp;
    if (value == "local_cafe_rounded") return Icons.local_cafe_rounded;
    if (value == "local_cafe_outlined") return Icons.local_cafe_outlined;
    if (value == "local_car_wash") return Icons.local_car_wash;
    if (value == "local_car_wash_sharp") return Icons.local_car_wash_sharp;
    if (value == "local_car_wash_rounded") return Icons.local_car_wash_rounded;
    if (value == "local_car_wash_outlined")
      return Icons.local_car_wash_outlined;
    if (value == "local_convenience_store")
      return Icons.local_convenience_store;
    if (value == "local_convenience_store_sharp")
      return Icons.local_convenience_store_sharp;
    if (value == "local_convenience_store_rounded")
      return Icons.local_convenience_store_rounded;
    if (value == "local_convenience_store_outlined")
      return Icons.local_convenience_store_outlined;
    if (value == "local_dining") return Icons.local_dining;
    if (value == "local_dining_sharp") return Icons.local_dining_sharp;
    if (value == "local_dining_rounded") return Icons.local_dining_rounded;
    if (value == "local_dining_outlined") return Icons.local_dining_outlined;
    if (value == "local_drink") return Icons.local_drink;
    if (value == "local_drink_sharp") return Icons.local_drink_sharp;
    if (value == "local_drink_rounded") return Icons.local_drink_rounded;
    if (value == "local_drink_outlined") return Icons.local_drink_outlined;
    if (value == "local_fire_department") return Icons.local_fire_department;
    if (value == "local_fire_department_sharp")
      return Icons.local_fire_department_sharp;
    if (value == "local_fire_department_rounded")
      return Icons.local_fire_department_rounded;
    if (value == "local_fire_department_outlined")
      return Icons.local_fire_department_outlined;
    if (value == "local_florist") return Icons.local_florist;
    if (value == "local_florist_sharp") return Icons.local_florist_sharp;
    if (value == "local_florist_rounded") return Icons.local_florist_rounded;
    if (value == "local_florist_outlined") return Icons.local_florist_outlined;
    if (value == "local_gas_station") return Icons.local_gas_station;
    if (value == "local_gas_station_sharp")
      return Icons.local_gas_station_sharp;
    if (value == "local_gas_station_rounded")
      return Icons.local_gas_station_rounded;
    if (value == "local_gas_station_outlined")
      return Icons.local_gas_station_outlined;
    if (value == "local_grocery_store") return Icons.local_grocery_store;
    if (value == "local_grocery_store_sharp")
      return Icons.local_grocery_store_sharp;
    if (value == "local_grocery_store_rounded")
      return Icons.local_grocery_store_rounded;
    if (value == "local_grocery_store_outlined")
      return Icons.local_grocery_store_outlined;
    if (value == "local_hospital") return Icons.local_hospital;
    if (value == "local_hospital_sharp") return Icons.local_hospital_sharp;
    if (value == "local_hospital_rounded") return Icons.local_hospital_rounded;
    if (value == "local_hospital_outlined")
      return Icons.local_hospital_outlined;
    if (value == "local_hotel") return Icons.local_hotel;
    if (value == "local_hotel_sharp") return Icons.local_hotel_sharp;
    if (value == "local_hotel_rounded") return Icons.local_hotel_rounded;
    if (value == "local_hotel_outlined") return Icons.local_hotel_outlined;
    if (value == "local_laundry_service") return Icons.local_laundry_service;
    if (value == "local_laundry_service_sharp")
      return Icons.local_laundry_service_sharp;
    if (value == "local_laundry_service_rounded")
      return Icons.local_laundry_service_rounded;
    if (value == "local_laundry_service_outlined")
      return Icons.local_laundry_service_outlined;
    if (value == "local_library") return Icons.local_library;
    if (value == "local_library_sharp") return Icons.local_library_sharp;
    if (value == "local_library_rounded") return Icons.local_library_rounded;
    if (value == "local_library_outlined") return Icons.local_library_outlined;
    if (value == "local_mall") return Icons.local_mall;
    if (value == "local_mall_sharp") return Icons.local_mall_sharp;
    if (value == "local_mall_rounded") return Icons.local_mall_rounded;
    if (value == "local_mall_outlined") return Icons.local_mall_outlined;
    if (value == "local_movies") return Icons.local_movies;
    if (value == "local_movies_sharp") return Icons.local_movies_sharp;
    if (value == "local_movies_rounded") return Icons.local_movies_rounded;
    if (value == "local_movies_outlined") return Icons.local_movies_outlined;
    if (value == "local_offer") return Icons.local_offer;
    if (value == "local_offer_sharp") return Icons.local_offer_sharp;
    if (value == "local_offer_rounded") return Icons.local_offer_rounded;
    if (value == "local_offer_outlined") return Icons.local_offer_outlined;
    if (value == "local_parking") return Icons.local_parking;
    if (value == "local_parking_sharp") return Icons.local_parking_sharp;
    if (value == "local_parking_rounded") return Icons.local_parking_rounded;
    if (value == "local_parking_outlined") return Icons.local_parking_outlined;
    if (value == "local_pharmacy") return Icons.local_pharmacy;
    if (value == "local_pharmacy_sharp") return Icons.local_pharmacy_sharp;
    if (value == "local_pharmacy_rounded") return Icons.local_pharmacy_rounded;
    if (value == "local_pharmacy_outlined")
      return Icons.local_pharmacy_outlined;
    if (value == "local_phone") return Icons.local_phone;
    if (value == "local_phone_sharp") return Icons.local_phone_sharp;
    if (value == "local_phone_rounded") return Icons.local_phone_rounded;
    if (value == "local_phone_outlined") return Icons.local_phone_outlined;
    if (value == "local_pizza") return Icons.local_pizza;
    if (value == "local_pizza_sharp") return Icons.local_pizza_sharp;
    if (value == "local_pizza_rounded") return Icons.local_pizza_rounded;
    if (value == "local_pizza_outlined") return Icons.local_pizza_outlined;
    if (value == "local_play") return Icons.local_play;
    if (value == "local_play_sharp") return Icons.local_play_sharp;
    if (value == "local_play_rounded") return Icons.local_play_rounded;
    if (value == "local_play_outlined") return Icons.local_play_outlined;
    if (value == "local_police") return Icons.local_police;
    if (value == "local_police_sharp") return Icons.local_police_sharp;
    if (value == "local_police_rounded") return Icons.local_police_rounded;
    if (value == "local_police_outlined") return Icons.local_police_outlined;
    if (value == "local_post_office") return Icons.local_post_office;
    if (value == "local_post_office_sharp")
      return Icons.local_post_office_sharp;
    if (value == "local_post_office_rounded")
      return Icons.local_post_office_rounded;
    if (value == "local_post_office_outlined")
      return Icons.local_post_office_outlined;
    if (value == "local_print_shop") return Icons.local_print_shop;
    if (value == "local_print_shop_sharp") return Icons.local_print_shop_sharp;
    if (value == "local_print_shop_rounded")
      return Icons.local_print_shop_rounded;
    if (value == "local_print_shop_outlined")
      return Icons.local_print_shop_outlined;
    if (value == "local_printshop") return Icons.local_printshop;
    if (value == "local_printshop_sharp") return Icons.local_printshop_sharp;
    if (value == "local_printshop_rounded")
      return Icons.local_printshop_rounded;
    if (value == "local_printshop_outlined")
      return Icons.local_printshop_outlined;
    if (value == "local_restaurant") return Icons.local_restaurant;
    if (value == "local_restaurant_sharp") return Icons.local_restaurant_sharp;
    if (value == "local_restaurant_rounded")
      return Icons.local_restaurant_rounded;
    if (value == "local_restaurant_outlined")
      return Icons.local_restaurant_outlined;
    if (value == "local_see") return Icons.local_see;
    if (value == "local_see_sharp") return Icons.local_see_sharp;
    if (value == "local_see_rounded") return Icons.local_see_rounded;
    if (value == "local_see_outlined") return Icons.local_see_outlined;
    if (value == "local_shipping") return Icons.local_shipping;
    if (value == "local_shipping_sharp") return Icons.local_shipping_sharp;
    if (value == "local_shipping_rounded") return Icons.local_shipping_rounded;
    if (value == "local_shipping_outlined")
      return Icons.local_shipping_outlined;
    if (value == "local_taxi") return Icons.local_taxi;
    if (value == "local_taxi_sharp") return Icons.local_taxi_sharp;
    if (value == "local_taxi_rounded") return Icons.local_taxi_rounded;
    if (value == "local_taxi_outlined") return Icons.local_taxi_outlined;
    if (value == "location_city") return Icons.location_city;
    if (value == "location_city_sharp") return Icons.location_city_sharp;
    if (value == "location_city_rounded") return Icons.location_city_rounded;
    if (value == "location_city_outlined") return Icons.location_city_outlined;
    if (value == "location_disabled") return Icons.location_disabled;
    if (value == "location_disabled_sharp")
      return Icons.location_disabled_sharp;
    if (value == "location_disabled_rounded")
      return Icons.location_disabled_rounded;
    if (value == "location_disabled_outlined")
      return Icons.location_disabled_outlined;
    if (value == "location_history") return Icons.location_history;
    if (value == "location_history_sharp") return Icons.location_history_sharp;
    if (value == "location_history_rounded")
      return Icons.location_history_rounded;
    if (value == "location_history_outlined")
      return Icons.location_history_outlined;
    if (value == "location_off") return Icons.location_off;
    if (value == "location_off_sharp") return Icons.location_off_sharp;
    if (value == "location_off_rounded") return Icons.location_off_rounded;
    if (value == "location_off_outlined") return Icons.location_off_outlined;
    if (value == "location_on") return Icons.location_on;
    if (value == "location_on_sharp") return Icons.location_on_sharp;
    if (value == "location_on_rounded") return Icons.location_on_rounded;
    if (value == "location_on_outlined") return Icons.location_on_outlined;
    if (value == "location_pin") return Icons.location_pin;
    if (value == "location_searching") return Icons.location_searching;
    if (value == "location_searching_sharp")
      return Icons.location_searching_sharp;
    if (value == "location_searching_rounded")
      return Icons.location_searching_rounded;
    if (value == "location_searching_outlined")
      return Icons.location_searching_outlined;
    if (value == "lock") return Icons.lock;
    if (value == "lock_sharp") return Icons.lock_sharp;
    if (value == "lock_rounded") return Icons.lock_rounded;
    if (value == "lock_outlined") return Icons.lock_outlined;
    if (value == "lock_clock") return Icons.lock_clock;
    if (value == "lock_clock_sharp") return Icons.lock_clock_sharp;
    if (value == "lock_clock_rounded") return Icons.lock_clock_rounded;
    if (value == "lock_clock_outlined") return Icons.lock_clock_outlined;
    if (value == "lock_open") return Icons.lock_open;
    if (value == "lock_open_sharp") return Icons.lock_open_sharp;
    if (value == "lock_open_rounded") return Icons.lock_open_rounded;
    if (value == "lock_open_outlined") return Icons.lock_open_outlined;
    if (value == "lock_outline") return Icons.lock_outline;
    if (value == "lock_outline_sharp") return Icons.lock_outline_sharp;
    if (value == "lock_outline_rounded") return Icons.lock_outline_rounded;
    if (value == "lock_person") return Icons.lock_person;
    if (value == "lock_person_sharp") return Icons.lock_person_sharp;
    if (value == "lock_person_rounded") return Icons.lock_person_rounded;
    if (value == "lock_person_outlined") return Icons.lock_person_outlined;
    if (value == "lock_reset") return Icons.lock_reset;
    if (value == "lock_reset_sharp") return Icons.lock_reset_sharp;
    if (value == "lock_reset_rounded") return Icons.lock_reset_rounded;
    if (value == "lock_reset_outlined") return Icons.lock_reset_outlined;
    if (value == "login") return Icons.login;
    if (value == "login_sharp") return Icons.login_sharp;
    if (value == "login_rounded") return Icons.login_rounded;
    if (value == "login_outlined") return Icons.login_outlined;
    if (value == "logo_dev") return Icons.logo_dev;
    if (value == "logo_dev_sharp") return Icons.logo_dev_sharp;
    if (value == "logo_dev_rounded") return Icons.logo_dev_rounded;
    if (value == "logo_dev_outlined") return Icons.logo_dev_outlined;
    if (value == "logout") return Icons.logout;
    if (value == "logout_sharp") return Icons.logout_sharp;
    if (value == "logout_rounded") return Icons.logout_rounded;
    if (value == "logout_outlined") return Icons.logout_outlined;
    if (value == "looks") return Icons.looks;
    if (value == "looks_sharp") return Icons.looks_sharp;
    if (value == "looks_rounded") return Icons.looks_rounded;
    if (value == "looks_outlined") return Icons.looks_outlined;
    if (value == "looks_3") return Icons.looks_3;
    if (value == "looks_3_sharp") return Icons.looks_3_sharp;
    if (value == "looks_3_rounded") return Icons.looks_3_rounded;
    if (value == "looks_3_outlined") return Icons.looks_3_outlined;
    if (value == "looks_4") return Icons.looks_4;
    if (value == "looks_4_sharp") return Icons.looks_4_sharp;
    if (value == "looks_4_rounded") return Icons.looks_4_rounded;
    if (value == "looks_4_outlined") return Icons.looks_4_outlined;
    if (value == "looks_5") return Icons.looks_5;
    if (value == "looks_5_sharp") return Icons.looks_5_sharp;
    if (value == "looks_5_rounded") return Icons.looks_5_rounded;
    if (value == "looks_5_outlined") return Icons.looks_5_outlined;
    if (value == "looks_6") return Icons.looks_6;
    if (value == "looks_6_sharp") return Icons.looks_6_sharp;
    if (value == "looks_6_rounded") return Icons.looks_6_rounded;
    if (value == "looks_6_outlined") return Icons.looks_6_outlined;
    if (value == "looks_one") return Icons.looks_one;
    if (value == "looks_one_sharp") return Icons.looks_one_sharp;
    if (value == "looks_one_rounded") return Icons.looks_one_rounded;
    if (value == "looks_one_outlined") return Icons.looks_one_outlined;
    if (value == "looks_two") return Icons.looks_two;
    if (value == "looks_two_sharp") return Icons.looks_two_sharp;
    if (value == "looks_two_rounded") return Icons.looks_two_rounded;
    if (value == "looks_two_outlined") return Icons.looks_two_outlined;
    if (value == "loop") return Icons.loop;
    if (value == "loop_sharp") return Icons.loop_sharp;
    if (value == "loop_rounded") return Icons.loop_rounded;
    if (value == "loop_outlined") return Icons.loop_outlined;
    if (value == "loupe") return Icons.loupe;
    if (value == "loupe_sharp") return Icons.loupe_sharp;
    if (value == "loupe_rounded") return Icons.loupe_rounded;
    if (value == "loupe_outlined") return Icons.loupe_outlined;
    if (value == "low_priority") return Icons.low_priority;
    if (value == "low_priority_sharp") return Icons.low_priority_sharp;
    if (value == "low_priority_rounded") return Icons.low_priority_rounded;
    if (value == "low_priority_outlined") return Icons.low_priority_outlined;
    if (value == "loyalty") return Icons.loyalty;
    if (value == "loyalty_sharp") return Icons.loyalty_sharp;
    if (value == "loyalty_rounded") return Icons.loyalty_rounded;
    if (value == "loyalty_outlined") return Icons.loyalty_outlined;
    if (value == "lte_mobiledata") return Icons.lte_mobiledata;
    if (value == "lte_mobiledata_sharp") return Icons.lte_mobiledata_sharp;
    if (value == "lte_mobiledata_rounded") return Icons.lte_mobiledata_rounded;
    if (value == "lte_mobiledata_outlined")
      return Icons.lte_mobiledata_outlined;
    if (value == "lte_plus_mobiledata") return Icons.lte_plus_mobiledata;
    if (value == "lte_plus_mobiledata_sharp")
      return Icons.lte_plus_mobiledata_sharp;
    if (value == "lte_plus_mobiledata_rounded")
      return Icons.lte_plus_mobiledata_rounded;
    if (value == "lte_plus_mobiledata_outlined")
      return Icons.lte_plus_mobiledata_outlined;
    if (value == "luggage") return Icons.luggage;
    if (value == "luggage_sharp") return Icons.luggage_sharp;
    if (value == "luggage_rounded") return Icons.luggage_rounded;
    if (value == "luggage_outlined") return Icons.luggage_outlined;
    if (value == "lunch_dining") return Icons.lunch_dining;
    if (value == "lunch_dining_sharp") return Icons.lunch_dining_sharp;
    if (value == "lunch_dining_rounded") return Icons.lunch_dining_rounded;
    if (value == "lunch_dining_outlined") return Icons.lunch_dining_outlined;
    if (value == "lyrics") return Icons.lyrics;
    if (value == "lyrics_sharp") return Icons.lyrics_sharp;
    if (value == "lyrics_rounded") return Icons.lyrics_rounded;
    if (value == "lyrics_outlined") return Icons.lyrics_outlined;
    if (value == "mail") return Icons.mail;
    if (value == "mail_sharp") return Icons.mail_sharp;
    if (value == "mail_rounded") return Icons.mail_rounded;
    if (value == "mail_outlined") return Icons.mail_outlined;
    if (value == "mail_lock") return Icons.mail_lock;
    if (value == "mail_lock_sharp") return Icons.mail_lock_sharp;
    if (value == "mail_lock_rounded") return Icons.mail_lock_rounded;
    if (value == "mail_lock_outlined") return Icons.mail_lock_outlined;
    if (value == "mail_outline") return Icons.mail_outline;
    if (value == "mail_outline_sharp") return Icons.mail_outline_sharp;
    if (value == "mail_outline_rounded") return Icons.mail_outline_rounded;
    if (value == "mail_outline_outlined") return Icons.mail_outline_outlined;
    if (value == "male") return Icons.male;
    if (value == "male_sharp") return Icons.male_sharp;
    if (value == "male_rounded") return Icons.male_rounded;
    if (value == "male_outlined") return Icons.male_outlined;
    if (value == "man") return Icons.man;
    if (value == "man_sharp") return Icons.man_sharp;
    if (value == "man_rounded") return Icons.man_rounded;
    if (value == "man_outlined") return Icons.man_outlined;
    if (value == "manage_accounts") return Icons.manage_accounts;
    if (value == "manage_accounts_sharp") return Icons.manage_accounts_sharp;
    if (value == "manage_accounts_rounded")
      return Icons.manage_accounts_rounded;
    if (value == "manage_accounts_outlined")
      return Icons.manage_accounts_outlined;
    if (value == "manage_history") return Icons.manage_history;
    if (value == "manage_history_sharp") return Icons.manage_history_sharp;
    if (value == "manage_history_rounded") return Icons.manage_history_rounded;
    if (value == "manage_history_outlined")
      return Icons.manage_history_outlined;
    if (value == "manage_search") return Icons.manage_search;
    if (value == "manage_search_sharp") return Icons.manage_search_sharp;
    if (value == "manage_search_rounded") return Icons.manage_search_rounded;
    if (value == "manage_search_outlined") return Icons.manage_search_outlined;
    if (value == "map") return Icons.map;
    if (value == "map_sharp") return Icons.map_sharp;
    if (value == "map_rounded") return Icons.map_rounded;
    if (value == "map_outlined") return Icons.map_outlined;
    if (value == "maps_home_work") return Icons.maps_home_work;
    if (value == "maps_home_work_sharp") return Icons.maps_home_work_sharp;
    if (value == "maps_home_work_rounded") return Icons.maps_home_work_rounded;
    if (value == "maps_home_work_outlined")
      return Icons.maps_home_work_outlined;
    if (value == "maps_ugc") return Icons.maps_ugc;
    if (value == "maps_ugc_sharp") return Icons.maps_ugc_sharp;
    if (value == "maps_ugc_rounded") return Icons.maps_ugc_rounded;
    if (value == "maps_ugc_outlined") return Icons.maps_ugc_outlined;
    if (value == "margin") return Icons.margin;
    if (value == "margin_sharp") return Icons.margin_sharp;
    if (value == "margin_rounded") return Icons.margin_rounded;
    if (value == "margin_outlined") return Icons.margin_outlined;
    if (value == "mark_as_unread") return Icons.mark_as_unread;
    if (value == "mark_as_unread_sharp") return Icons.mark_as_unread_sharp;
    if (value == "mark_as_unread_rounded") return Icons.mark_as_unread_rounded;
    if (value == "mark_as_unread_outlined")
      return Icons.mark_as_unread_outlined;
    if (value == "mark_chat_read") return Icons.mark_chat_read;
    if (value == "mark_chat_read_sharp") return Icons.mark_chat_read_sharp;
    if (value == "mark_chat_read_rounded") return Icons.mark_chat_read_rounded;
    if (value == "mark_chat_read_outlined")
      return Icons.mark_chat_read_outlined;
    if (value == "mark_chat_unread") return Icons.mark_chat_unread;
    if (value == "mark_chat_unread_sharp") return Icons.mark_chat_unread_sharp;
    if (value == "mark_chat_unread_rounded")
      return Icons.mark_chat_unread_rounded;
    if (value == "mark_chat_unread_outlined")
      return Icons.mark_chat_unread_outlined;
    if (value == "mark_email_read") return Icons.mark_email_read;
    if (value == "mark_email_read_sharp") return Icons.mark_email_read_sharp;
    if (value == "mark_email_read_rounded")
      return Icons.mark_email_read_rounded;
    if (value == "mark_email_read_outlined")
      return Icons.mark_email_read_outlined;
    if (value == "mark_email_unread") return Icons.mark_email_unread;
    if (value == "mark_email_unread_sharp")
      return Icons.mark_email_unread_sharp;
    if (value == "mark_email_unread_rounded")
      return Icons.mark_email_unread_rounded;
    if (value == "mark_email_unread_outlined")
      return Icons.mark_email_unread_outlined;
    if (value == "mark_unread_chat_alt") return Icons.mark_unread_chat_alt;
    if (value == "mark_unread_chat_alt_sharp")
      return Icons.mark_unread_chat_alt_sharp;
    if (value == "mark_unread_chat_alt_rounded")
      return Icons.mark_unread_chat_alt_rounded;
    if (value == "mark_unread_chat_alt_outlined")
      return Icons.mark_unread_chat_alt_outlined;
    if (value == "markunread") return Icons.markunread;
    if (value == "markunread_sharp") return Icons.markunread_sharp;
    if (value == "markunread_rounded") return Icons.markunread_rounded;
    if (value == "markunread_outlined") return Icons.markunread_outlined;
    if (value == "markunread_mailbox") return Icons.markunread_mailbox;
    if (value == "markunread_mailbox_sharp")
      return Icons.markunread_mailbox_sharp;
    if (value == "markunread_mailbox_rounded")
      return Icons.markunread_mailbox_rounded;
    if (value == "markunread_mailbox_outlined")
      return Icons.markunread_mailbox_outlined;
    if (value == "masks") return Icons.masks;
    if (value == "masks_sharp") return Icons.masks_sharp;
    if (value == "masks_rounded") return Icons.masks_rounded;
    if (value == "masks_outlined") return Icons.masks_outlined;
    if (value == "maximize") return Icons.maximize;
    if (value == "maximize_sharp") return Icons.maximize_sharp;
    if (value == "maximize_rounded") return Icons.maximize_rounded;
    if (value == "maximize_outlined") return Icons.maximize_outlined;
    if (value == "media_bluetooth_off") return Icons.media_bluetooth_off;
    if (value == "media_bluetooth_off_sharp")
      return Icons.media_bluetooth_off_sharp;
    if (value == "media_bluetooth_off_rounded")
      return Icons.media_bluetooth_off_rounded;
    if (value == "media_bluetooth_off_outlined")
      return Icons.media_bluetooth_off_outlined;
    if (value == "media_bluetooth_on") return Icons.media_bluetooth_on;
    if (value == "media_bluetooth_on_sharp")
      return Icons.media_bluetooth_on_sharp;
    if (value == "media_bluetooth_on_rounded")
      return Icons.media_bluetooth_on_rounded;
    if (value == "media_bluetooth_on_outlined")
      return Icons.media_bluetooth_on_outlined;
    if (value == "mediation") return Icons.mediation;
    if (value == "mediation_sharp") return Icons.mediation_sharp;
    if (value == "mediation_rounded") return Icons.mediation_rounded;
    if (value == "mediation_outlined") return Icons.mediation_outlined;
    if (value == "medical_information") return Icons.medical_information;
    if (value == "medical_information_sharp")
      return Icons.medical_information_sharp;
    if (value == "medical_information_rounded")
      return Icons.medical_information_rounded;
    if (value == "medical_information_outlined")
      return Icons.medical_information_outlined;
    if (value == "medical_services") return Icons.medical_services;
    if (value == "medical_services_sharp") return Icons.medical_services_sharp;
    if (value == "medical_services_rounded")
      return Icons.medical_services_rounded;
    if (value == "medical_services_outlined")
      return Icons.medical_services_outlined;
    if (value == "medication") return Icons.medication;
    if (value == "medication_sharp") return Icons.medication_sharp;
    if (value == "medication_rounded") return Icons.medication_rounded;
    if (value == "medication_outlined") return Icons.medication_outlined;
    if (value == "medication_liquid") return Icons.medication_liquid;
    if (value == "medication_liquid_sharp")
      return Icons.medication_liquid_sharp;
    if (value == "medication_liquid_rounded")
      return Icons.medication_liquid_rounded;
    if (value == "medication_liquid_outlined")
      return Icons.medication_liquid_outlined;
    if (value == "meeting_room") return Icons.meeting_room;
    if (value == "meeting_room_sharp") return Icons.meeting_room_sharp;
    if (value == "meeting_room_rounded") return Icons.meeting_room_rounded;
    if (value == "meeting_room_outlined") return Icons.meeting_room_outlined;
    if (value == "memory") return Icons.memory;
    if (value == "memory_sharp") return Icons.memory_sharp;
    if (value == "memory_rounded") return Icons.memory_rounded;
    if (value == "memory_outlined") return Icons.memory_outlined;
    if (value == "menu") return Icons.menu;
    if (value == "menu_sharp") return Icons.menu_sharp;
    if (value == "menu_rounded") return Icons.menu_rounded;
    if (value == "menu_outlined") return Icons.menu_outlined;
    if (value == "menu_book") return Icons.menu_book;
    if (value == "menu_book_sharp") return Icons.menu_book_sharp;
    if (value == "menu_book_rounded") return Icons.menu_book_rounded;
    if (value == "menu_book_outlined") return Icons.menu_book_outlined;
    if (value == "menu_open") return Icons.menu_open;
    if (value == "menu_open_sharp") return Icons.menu_open_sharp;
    if (value == "menu_open_rounded") return Icons.menu_open_rounded;
    if (value == "menu_open_outlined") return Icons.menu_open_outlined;
    if (value == "merge") return Icons.merge;
    if (value == "merge_sharp") return Icons.merge_sharp;
    if (value == "merge_rounded") return Icons.merge_rounded;
    if (value == "merge_outlined") return Icons.merge_outlined;
    if (value == "merge_type") return Icons.merge_type;
    if (value == "merge_type_sharp") return Icons.merge_type_sharp;
    if (value == "merge_type_rounded") return Icons.merge_type_rounded;
    if (value == "merge_type_outlined") return Icons.merge_type_outlined;
    if (value == "message") return Icons.message;
    if (value == "message_sharp") return Icons.message_sharp;
    if (value == "message_rounded") return Icons.message_rounded;
    if (value == "message_outlined") return Icons.message_outlined;
    if (value == "messenger") return Icons.messenger;
    if (value == "messenger_sharp") return Icons.messenger_sharp;
    if (value == "messenger_rounded") return Icons.messenger_rounded;
    if (value == "messenger_outlined") return Icons.messenger_outlined;
    if (value == "messenger_outline") return Icons.messenger_outline;
    if (value == "messenger_outline_sharp")
      return Icons.messenger_outline_sharp;
    if (value == "messenger_outline_rounded")
      return Icons.messenger_outline_rounded;
    if (value == "messenger_outline_outlined")
      return Icons.messenger_outline_outlined;
    if (value == "mic") return Icons.mic;
    if (value == "mic_sharp") return Icons.mic_sharp;
    if (value == "mic_rounded") return Icons.mic_rounded;
    if (value == "mic_outlined") return Icons.mic_outlined;
    if (value == "mic_external_off") return Icons.mic_external_off;
    if (value == "mic_external_off_sharp") return Icons.mic_external_off_sharp;
    if (value == "mic_external_off_rounded")
      return Icons.mic_external_off_rounded;
    if (value == "mic_external_off_outlined")
      return Icons.mic_external_off_outlined;
    if (value == "mic_external_on") return Icons.mic_external_on;
    if (value == "mic_external_on_sharp") return Icons.mic_external_on_sharp;
    if (value == "mic_external_on_rounded")
      return Icons.mic_external_on_rounded;
    if (value == "mic_external_on_outlined")
      return Icons.mic_external_on_outlined;
    if (value == "mic_none") return Icons.mic_none;
    if (value == "mic_none_sharp") return Icons.mic_none_sharp;
    if (value == "mic_none_rounded") return Icons.mic_none_rounded;
    if (value == "mic_none_outlined") return Icons.mic_none_outlined;
    if (value == "mic_off") return Icons.mic_off;
    if (value == "mic_off_sharp") return Icons.mic_off_sharp;
    if (value == "mic_off_rounded") return Icons.mic_off_rounded;
    if (value == "mic_off_outlined") return Icons.mic_off_outlined;
    if (value == "microwave") return Icons.microwave;
    if (value == "microwave_sharp") return Icons.microwave_sharp;
    if (value == "microwave_rounded") return Icons.microwave_rounded;
    if (value == "microwave_outlined") return Icons.microwave_outlined;
    if (value == "military_tech") return Icons.military_tech;
    if (value == "military_tech_sharp") return Icons.military_tech_sharp;
    if (value == "military_tech_rounded") return Icons.military_tech_rounded;
    if (value == "military_tech_outlined") return Icons.military_tech_outlined;
    if (value == "minimize") return Icons.minimize;
    if (value == "minimize_sharp") return Icons.minimize_sharp;
    if (value == "minimize_rounded") return Icons.minimize_rounded;
    if (value == "minimize_outlined") return Icons.minimize_outlined;
    if (value == "minor_crash") return Icons.minor_crash;
    if (value == "minor_crash_sharp") return Icons.minor_crash_sharp;
    if (value == "minor_crash_rounded") return Icons.minor_crash_rounded;
    if (value == "minor_crash_outlined") return Icons.minor_crash_outlined;
    if (value == "miscellaneous_services") return Icons.miscellaneous_services;
    if (value == "miscellaneous_services_sharp")
      return Icons.miscellaneous_services_sharp;
    if (value == "miscellaneous_services_rounded")
      return Icons.miscellaneous_services_rounded;
    if (value == "miscellaneous_services_outlined")
      return Icons.miscellaneous_services_outlined;
    if (value == "missed_video_call") return Icons.missed_video_call;
    if (value == "missed_video_call_sharp")
      return Icons.missed_video_call_sharp;
    if (value == "missed_video_call_rounded")
      return Icons.missed_video_call_rounded;
    if (value == "missed_video_call_outlined")
      return Icons.missed_video_call_outlined;
    if (value == "mms") return Icons.mms;
    if (value == "mms_sharp") return Icons.mms_sharp;
    if (value == "mms_rounded") return Icons.mms_rounded;
    if (value == "mms_outlined") return Icons.mms_outlined;
    if (value == "mobile_friendly") return Icons.mobile_friendly;
    if (value == "mobile_friendly_sharp") return Icons.mobile_friendly_sharp;
    if (value == "mobile_friendly_rounded")
      return Icons.mobile_friendly_rounded;
    if (value == "mobile_friendly_outlined")
      return Icons.mobile_friendly_outlined;
    if (value == "mobile_off") return Icons.mobile_off;
    if (value == "mobile_off_sharp") return Icons.mobile_off_sharp;
    if (value == "mobile_off_rounded") return Icons.mobile_off_rounded;
    if (value == "mobile_off_outlined") return Icons.mobile_off_outlined;
    if (value == "mobile_screen_share") return Icons.mobile_screen_share;
    if (value == "mobile_screen_share_sharp")
      return Icons.mobile_screen_share_sharp;
    if (value == "mobile_screen_share_rounded")
      return Icons.mobile_screen_share_rounded;
    if (value == "mobile_screen_share_outlined")
      return Icons.mobile_screen_share_outlined;
    if (value == "mobiledata_off") return Icons.mobiledata_off;
    if (value == "mobiledata_off_sharp") return Icons.mobiledata_off_sharp;
    if (value == "mobiledata_off_rounded") return Icons.mobiledata_off_rounded;
    if (value == "mobiledata_off_outlined")
      return Icons.mobiledata_off_outlined;
    if (value == "mode") return Icons.mode;
    if (value == "mode_sharp") return Icons.mode_sharp;
    if (value == "mode_rounded") return Icons.mode_rounded;
    if (value == "mode_outlined") return Icons.mode_outlined;
    if (value == "mode_comment") return Icons.mode_comment;
    if (value == "mode_comment_sharp") return Icons.mode_comment_sharp;
    if (value == "mode_comment_rounded") return Icons.mode_comment_rounded;
    if (value == "mode_comment_outlined") return Icons.mode_comment_outlined;
    if (value == "mode_edit") return Icons.mode_edit;
    if (value == "mode_edit_sharp") return Icons.mode_edit_sharp;
    if (value == "mode_edit_rounded") return Icons.mode_edit_rounded;
    if (value == "mode_edit_outlined") return Icons.mode_edit_outlined;
    if (value == "mode_edit_outline") return Icons.mode_edit_outline;
    if (value == "mode_edit_outline_sharp")
      return Icons.mode_edit_outline_sharp;
    if (value == "mode_edit_outline_rounded")
      return Icons.mode_edit_outline_rounded;
    if (value == "mode_edit_outline_outlined")
      return Icons.mode_edit_outline_outlined;
    if (value == "mode_fan_off") return Icons.mode_fan_off;
    if (value == "mode_fan_off_sharp") return Icons.mode_fan_off_sharp;
    if (value == "mode_fan_off_rounded") return Icons.mode_fan_off_rounded;
    if (value == "mode_fan_off_outlined") return Icons.mode_fan_off_outlined;
    if (value == "mode_night") return Icons.mode_night;
    if (value == "mode_night_sharp") return Icons.mode_night_sharp;
    if (value == "mode_night_rounded") return Icons.mode_night_rounded;
    if (value == "mode_night_outlined") return Icons.mode_night_outlined;
    if (value == "mode_of_travel") return Icons.mode_of_travel;
    if (value == "mode_of_travel_sharp") return Icons.mode_of_travel_sharp;
    if (value == "mode_of_travel_rounded") return Icons.mode_of_travel_rounded;
    if (value == "mode_of_travel_outlined")
      return Icons.mode_of_travel_outlined;
    if (value == "mode_standby") return Icons.mode_standby;
    if (value == "mode_standby_sharp") return Icons.mode_standby_sharp;
    if (value == "mode_standby_rounded") return Icons.mode_standby_rounded;
    if (value == "mode_standby_outlined") return Icons.mode_standby_outlined;
    if (value == "model_training") return Icons.model_training;
    if (value == "model_training_sharp") return Icons.model_training_sharp;
    if (value == "model_training_rounded") return Icons.model_training_rounded;
    if (value == "model_training_outlined")
      return Icons.model_training_outlined;
    if (value == "monetization_on") return Icons.monetization_on;
    if (value == "monetization_on_sharp") return Icons.monetization_on_sharp;
    if (value == "monetization_on_rounded")
      return Icons.monetization_on_rounded;
    if (value == "monetization_on_outlined")
      return Icons.monetization_on_outlined;
    if (value == "money") return Icons.money;
    if (value == "money_sharp") return Icons.money_sharp;
    if (value == "money_rounded") return Icons.money_rounded;
    if (value == "money_outlined") return Icons.money_outlined;
    if (value == "money_off") return Icons.money_off;
    if (value == "money_off_sharp") return Icons.money_off_sharp;
    if (value == "money_off_rounded") return Icons.money_off_rounded;
    if (value == "money_off_outlined") return Icons.money_off_outlined;
    if (value == "money_off_csred") return Icons.money_off_csred;
    if (value == "money_off_csred_sharp") return Icons.money_off_csred_sharp;
    if (value == "money_off_csred_rounded")
      return Icons.money_off_csred_rounded;
    if (value == "money_off_csred_outlined")
      return Icons.money_off_csred_outlined;
    if (value == "monitor") return Icons.monitor;
    if (value == "monitor_sharp") return Icons.monitor_sharp;
    if (value == "monitor_rounded") return Icons.monitor_rounded;
    if (value == "monitor_outlined") return Icons.monitor_outlined;
    if (value == "monitor_heart") return Icons.monitor_heart;
    if (value == "monitor_heart_sharp") return Icons.monitor_heart_sharp;
    if (value == "monitor_heart_rounded") return Icons.monitor_heart_rounded;
    if (value == "monitor_heart_outlined") return Icons.monitor_heart_outlined;
    if (value == "monitor_weight") return Icons.monitor_weight;
    if (value == "monitor_weight_sharp") return Icons.monitor_weight_sharp;
    if (value == "monitor_weight_rounded") return Icons.monitor_weight_rounded;
    if (value == "monitor_weight_outlined")
      return Icons.monitor_weight_outlined;
    if (value == "monochrome_photos") return Icons.monochrome_photos;
    if (value == "monochrome_photos_sharp")
      return Icons.monochrome_photos_sharp;
    if (value == "monochrome_photos_rounded")
      return Icons.monochrome_photos_rounded;
    if (value == "monochrome_photos_outlined")
      return Icons.monochrome_photos_outlined;
    if (value == "mood") return Icons.mood;
    if (value == "mood_sharp") return Icons.mood_sharp;
    if (value == "mood_rounded") return Icons.mood_rounded;
    if (value == "mood_outlined") return Icons.mood_outlined;
    if (value == "mood_bad") return Icons.mood_bad;
    if (value == "mood_bad_sharp") return Icons.mood_bad_sharp;
    if (value == "mood_bad_rounded") return Icons.mood_bad_rounded;
    if (value == "mood_bad_outlined") return Icons.mood_bad_outlined;
    if (value == "moped") return Icons.moped;
    if (value == "moped_sharp") return Icons.moped_sharp;
    if (value == "moped_rounded") return Icons.moped_rounded;
    if (value == "moped_outlined") return Icons.moped_outlined;
    if (value == "more") return Icons.more;
    if (value == "more_sharp") return Icons.more_sharp;
    if (value == "more_rounded") return Icons.more_rounded;
    if (value == "more_outlined") return Icons.more_outlined;
    if (value == "more_horiz") return Icons.more_horiz;
    if (value == "more_horiz_sharp") return Icons.more_horiz_sharp;
    if (value == "more_horiz_rounded") return Icons.more_horiz_rounded;
    if (value == "more_horiz_outlined") return Icons.more_horiz_outlined;
    if (value == "more_time") return Icons.more_time;
    if (value == "more_time_sharp") return Icons.more_time_sharp;
    if (value == "more_time_rounded") return Icons.more_time_rounded;
    if (value == "more_time_outlined") return Icons.more_time_outlined;
    if (value == "more_vert") return Icons.more_vert;
    if (value == "more_vert_sharp") return Icons.more_vert_sharp;
    if (value == "more_vert_rounded") return Icons.more_vert_rounded;
    if (value == "more_vert_outlined") return Icons.more_vert_outlined;
    if (value == "mosque") return Icons.mosque;
    if (value == "mosque_sharp") return Icons.mosque_sharp;
    if (value == "mosque_rounded") return Icons.mosque_rounded;
    if (value == "mosque_outlined") return Icons.mosque_outlined;
    if (value == "motion_photos_auto") return Icons.motion_photos_auto;
    if (value == "motion_photos_auto_sharp")
      return Icons.motion_photos_auto_sharp;
    if (value == "motion_photos_auto_rounded")
      return Icons.motion_photos_auto_rounded;
    if (value == "motion_photos_auto_outlined")
      return Icons.motion_photos_auto_outlined;
    if (value == "motion_photos_off") return Icons.motion_photos_off;
    if (value == "motion_photos_off_sharp")
      return Icons.motion_photos_off_sharp;
    if (value == "motion_photos_off_rounded")
      return Icons.motion_photos_off_rounded;
    if (value == "motion_photos_off_outlined")
      return Icons.motion_photos_off_outlined;
    if (value == "motion_photos_on") return Icons.motion_photos_on;
    if (value == "motion_photos_on_sharp") return Icons.motion_photos_on_sharp;
    if (value == "motion_photos_on_rounded")
      return Icons.motion_photos_on_rounded;
    if (value == "motion_photos_on_outlined")
      return Icons.motion_photos_on_outlined;
    if (value == "motion_photos_pause") return Icons.motion_photos_pause;
    if (value == "motion_photos_pause_sharp")
      return Icons.motion_photos_pause_sharp;
    if (value == "motion_photos_pause_rounded")
      return Icons.motion_photos_pause_rounded;
    if (value == "motion_photos_pause_outlined")
      return Icons.motion_photos_pause_outlined;
    if (value == "motion_photos_paused") return Icons.motion_photos_paused;
    if (value == "motion_photos_paused_sharp")
      return Icons.motion_photos_paused_sharp;
    if (value == "motion_photos_paused_rounded")
      return Icons.motion_photos_paused_rounded;
    if (value == "motion_photos_paused_outlined")
      return Icons.motion_photos_paused_outlined;
    if (value == "motorcycle") return Icons.motorcycle;
    if (value == "motorcycle_sharp") return Icons.motorcycle_sharp;
    if (value == "motorcycle_rounded") return Icons.motorcycle_rounded;
    if (value == "motorcycle_outlined") return Icons.motorcycle_outlined;
    if (value == "mouse") return Icons.mouse;
    if (value == "mouse_sharp") return Icons.mouse_sharp;
    if (value == "mouse_rounded") return Icons.mouse_rounded;
    if (value == "mouse_outlined") return Icons.mouse_outlined;
    if (value == "move_down") return Icons.move_down;
    if (value == "move_down_sharp") return Icons.move_down_sharp;
    if (value == "move_down_rounded") return Icons.move_down_rounded;
    if (value == "move_down_outlined") return Icons.move_down_outlined;
    if (value == "move_to_inbox") return Icons.move_to_inbox;
    if (value == "move_to_inbox_sharp") return Icons.move_to_inbox_sharp;
    if (value == "move_to_inbox_rounded") return Icons.move_to_inbox_rounded;
    if (value == "move_to_inbox_outlined") return Icons.move_to_inbox_outlined;
    if (value == "move_up") return Icons.move_up;
    if (value == "move_up_sharp") return Icons.move_up_sharp;
    if (value == "move_up_rounded") return Icons.move_up_rounded;
    if (value == "move_up_outlined") return Icons.move_up_outlined;
    if (value == "movie") return Icons.movie;
    if (value == "movie_sharp") return Icons.movie_sharp;
    if (value == "movie_rounded") return Icons.movie_rounded;
    if (value == "movie_outlined") return Icons.movie_outlined;
    if (value == "movie_creation") return Icons.movie_creation;
    if (value == "movie_creation_sharp") return Icons.movie_creation_sharp;
    if (value == "movie_creation_rounded") return Icons.movie_creation_rounded;
    if (value == "movie_creation_outlined")
      return Icons.movie_creation_outlined;
    if (value == "movie_filter") return Icons.movie_filter;
    if (value == "movie_filter_sharp") return Icons.movie_filter_sharp;
    if (value == "movie_filter_rounded") return Icons.movie_filter_rounded;
    if (value == "movie_filter_outlined") return Icons.movie_filter_outlined;
    if (value == "moving") return Icons.moving;
    if (value == "moving_sharp") return Icons.moving_sharp;
    if (value == "moving_rounded") return Icons.moving_rounded;
    if (value == "moving_outlined") return Icons.moving_outlined;
    if (value == "mp") return Icons.mp;
    if (value == "mp_sharp") return Icons.mp_sharp;
    if (value == "mp_rounded") return Icons.mp_rounded;
    if (value == "mp_outlined") return Icons.mp_outlined;
    if (value == "multiline_chart") return Icons.multiline_chart;
    if (value == "multiline_chart_sharp") return Icons.multiline_chart_sharp;
    if (value == "multiline_chart_rounded")
      return Icons.multiline_chart_rounded;
    if (value == "multiline_chart_outlined")
      return Icons.multiline_chart_outlined;
    if (value == "multiple_stop") return Icons.multiple_stop;
    if (value == "multiple_stop_sharp") return Icons.multiple_stop_sharp;
    if (value == "multiple_stop_rounded") return Icons.multiple_stop_rounded;
    if (value == "multiple_stop_outlined") return Icons.multiple_stop_outlined;
    if (value == "multitrack_audio") return Icons.multitrack_audio;
    if (value == "multitrack_audio_sharp") return Icons.multitrack_audio_sharp;
    if (value == "multitrack_audio_rounded")
      return Icons.multitrack_audio_rounded;
    if (value == "multitrack_audio_outlined")
      return Icons.multitrack_audio_outlined;
    if (value == "museum") return Icons.museum;
    if (value == "museum_sharp") return Icons.museum_sharp;
    if (value == "museum_rounded") return Icons.museum_rounded;
    if (value == "museum_outlined") return Icons.museum_outlined;
    if (value == "music_note") return Icons.music_note;
    if (value == "music_note_sharp") return Icons.music_note_sharp;
    if (value == "music_note_rounded") return Icons.music_note_rounded;
    if (value == "music_note_outlined") return Icons.music_note_outlined;
    if (value == "music_off") return Icons.music_off;
    if (value == "music_off_sharp") return Icons.music_off_sharp;
    if (value == "music_off_rounded") return Icons.music_off_rounded;
    if (value == "music_off_outlined") return Icons.music_off_outlined;
    if (value == "music_video") return Icons.music_video;
    if (value == "music_video_sharp") return Icons.music_video_sharp;
    if (value == "music_video_rounded") return Icons.music_video_rounded;
    if (value == "music_video_outlined") return Icons.music_video_outlined;
    if (value == "my_library_add") return Icons.my_library_add;
    if (value == "my_library_add_sharp") return Icons.my_library_add_sharp;
    if (value == "my_library_add_rounded") return Icons.my_library_add_rounded;
    if (value == "my_library_add_outlined")
      return Icons.my_library_add_outlined;
    if (value == "my_library_books") return Icons.my_library_books;
    if (value == "my_library_books_sharp") return Icons.my_library_books_sharp;
    if (value == "my_library_books_rounded")
      return Icons.my_library_books_rounded;
    if (value == "my_library_books_outlined")
      return Icons.my_library_books_outlined;
    if (value == "my_library_music") return Icons.my_library_music;
    if (value == "my_library_music_sharp") return Icons.my_library_music_sharp;
    if (value == "my_library_music_rounded")
      return Icons.my_library_music_rounded;
    if (value == "my_library_music_outlined")
      return Icons.my_library_music_outlined;
    if (value == "my_location") return Icons.my_location;
    if (value == "my_location_sharp") return Icons.my_location_sharp;
    if (value == "my_location_rounded") return Icons.my_location_rounded;
    if (value == "my_location_outlined") return Icons.my_location_outlined;
    if (value == "nat") return Icons.nat;
    if (value == "nat_sharp") return Icons.nat_sharp;
    if (value == "nat_rounded") return Icons.nat_rounded;
    if (value == "nat_outlined") return Icons.nat_outlined;
    if (value == "nature") return Icons.nature;
    if (value == "nature_sharp") return Icons.nature_sharp;
    if (value == "nature_rounded") return Icons.nature_rounded;
    if (value == "nature_outlined") return Icons.nature_outlined;
    if (value == "nature_people") return Icons.nature_people;
    if (value == "nature_people_sharp") return Icons.nature_people_sharp;
    if (value == "nature_people_rounded") return Icons.nature_people_rounded;
    if (value == "nature_people_outlined") return Icons.nature_people_outlined;
    if (value == "navigate_before") return Icons.navigate_before;
    if (value == "navigate_before_sharp") return Icons.navigate_before_sharp;
    if (value == "navigate_before_rounded")
      return Icons.navigate_before_rounded;
    if (value == "navigate_before_outlined")
      return Icons.navigate_before_outlined;
    if (value == "navigate_next") return Icons.navigate_next;
    if (value == "navigate_next_sharp") return Icons.navigate_next_sharp;
    if (value == "navigate_next_rounded") return Icons.navigate_next_rounded;
    if (value == "navigate_next_outlined") return Icons.navigate_next_outlined;
    if (value == "navigation") return Icons.navigation;
    if (value == "navigation_sharp") return Icons.navigation_sharp;
    if (value == "navigation_rounded") return Icons.navigation_rounded;
    if (value == "navigation_outlined") return Icons.navigation_outlined;
    if (value == "near_me") return Icons.near_me;
    if (value == "near_me_sharp") return Icons.near_me_sharp;
    if (value == "near_me_rounded") return Icons.near_me_rounded;
    if (value == "near_me_outlined") return Icons.near_me_outlined;
    if (value == "near_me_disabled") return Icons.near_me_disabled;
    if (value == "near_me_disabled_sharp") return Icons.near_me_disabled_sharp;
    if (value == "near_me_disabled_rounded")
      return Icons.near_me_disabled_rounded;
    if (value == "near_me_disabled_outlined")
      return Icons.near_me_disabled_outlined;
    if (value == "nearby_error") return Icons.nearby_error;
    if (value == "nearby_error_sharp") return Icons.nearby_error_sharp;
    if (value == "nearby_error_rounded") return Icons.nearby_error_rounded;
    if (value == "nearby_error_outlined") return Icons.nearby_error_outlined;
    if (value == "nearby_off") return Icons.nearby_off;
    if (value == "nearby_off_sharp") return Icons.nearby_off_sharp;
    if (value == "nearby_off_rounded") return Icons.nearby_off_rounded;
    if (value == "nearby_off_outlined") return Icons.nearby_off_outlined;
    if (value == "nest_cam_wired_stand") return Icons.nest_cam_wired_stand;
    if (value == "nest_cam_wired_stand_sharp")
      return Icons.nest_cam_wired_stand_sharp;
    if (value == "nest_cam_wired_stand_rounded")
      return Icons.nest_cam_wired_stand_rounded;
    if (value == "nest_cam_wired_stand_outlined")
      return Icons.nest_cam_wired_stand_outlined;
    if (value == "network_cell") return Icons.network_cell;
    if (value == "network_cell_sharp") return Icons.network_cell_sharp;
    if (value == "network_cell_rounded") return Icons.network_cell_rounded;
    if (value == "network_cell_outlined") return Icons.network_cell_outlined;
    if (value == "network_check") return Icons.network_check;
    if (value == "network_check_sharp") return Icons.network_check_sharp;
    if (value == "network_check_rounded") return Icons.network_check_rounded;
    if (value == "network_check_outlined") return Icons.network_check_outlined;
    if (value == "network_locked") return Icons.network_locked;
    if (value == "network_locked_sharp") return Icons.network_locked_sharp;
    if (value == "network_locked_rounded") return Icons.network_locked_rounded;
    if (value == "network_locked_outlined")
      return Icons.network_locked_outlined;
    if (value == "network_ping") return Icons.network_ping;
    if (value == "network_ping_sharp") return Icons.network_ping_sharp;
    if (value == "network_ping_rounded") return Icons.network_ping_rounded;
    if (value == "network_ping_outlined") return Icons.network_ping_outlined;
    if (value == "network_wifi") return Icons.network_wifi;
    if (value == "network_wifi_sharp") return Icons.network_wifi_sharp;
    if (value == "network_wifi_rounded") return Icons.network_wifi_rounded;
    if (value == "network_wifi_outlined") return Icons.network_wifi_outlined;
    if (value == "network_wifi_1_bar") return Icons.network_wifi_1_bar;
    if (value == "network_wifi_1_bar_sharp")
      return Icons.network_wifi_1_bar_sharp;
    if (value == "network_wifi_1_bar_rounded")
      return Icons.network_wifi_1_bar_rounded;
    if (value == "network_wifi_1_bar_outlined")
      return Icons.network_wifi_1_bar_outlined;
    if (value == "network_wifi_2_bar") return Icons.network_wifi_2_bar;
    if (value == "network_wifi_2_bar_sharp")
      return Icons.network_wifi_2_bar_sharp;
    if (value == "network_wifi_2_bar_rounded")
      return Icons.network_wifi_2_bar_rounded;
    if (value == "network_wifi_2_bar_outlined")
      return Icons.network_wifi_2_bar_outlined;
    if (value == "network_wifi_3_bar") return Icons.network_wifi_3_bar;
    if (value == "network_wifi_3_bar_sharp")
      return Icons.network_wifi_3_bar_sharp;
    if (value == "network_wifi_3_bar_rounded")
      return Icons.network_wifi_3_bar_rounded;
    if (value == "network_wifi_3_bar_outlined")
      return Icons.network_wifi_3_bar_outlined;
    if (value == "new_label") return Icons.new_label;
    if (value == "new_label_sharp") return Icons.new_label_sharp;
    if (value == "new_label_rounded") return Icons.new_label_rounded;
    if (value == "new_label_outlined") return Icons.new_label_outlined;
    if (value == "new_releases") return Icons.new_releases;
    if (value == "new_releases_sharp") return Icons.new_releases_sharp;
    if (value == "new_releases_rounded") return Icons.new_releases_rounded;
    if (value == "new_releases_outlined") return Icons.new_releases_outlined;
    if (value == "newspaper") return Icons.newspaper;
    if (value == "newspaper_sharp") return Icons.newspaper_sharp;
    if (value == "newspaper_rounded") return Icons.newspaper_rounded;
    if (value == "newspaper_outlined") return Icons.newspaper_outlined;
    if (value == "next_plan") return Icons.next_plan;
    if (value == "next_plan_sharp") return Icons.next_plan_sharp;
    if (value == "next_plan_rounded") return Icons.next_plan_rounded;
    if (value == "next_plan_outlined") return Icons.next_plan_outlined;
    if (value == "next_week") return Icons.next_week;
    if (value == "next_week_sharp") return Icons.next_week_sharp;
    if (value == "next_week_rounded") return Icons.next_week_rounded;
    if (value == "next_week_outlined") return Icons.next_week_outlined;
    if (value == "nfc") return Icons.nfc;
    if (value == "nfc_sharp") return Icons.nfc_sharp;
    if (value == "nfc_rounded") return Icons.nfc_rounded;
    if (value == "nfc_outlined") return Icons.nfc_outlined;
    if (value == "night_shelter") return Icons.night_shelter;
    if (value == "night_shelter_sharp") return Icons.night_shelter_sharp;
    if (value == "night_shelter_rounded") return Icons.night_shelter_rounded;
    if (value == "night_shelter_outlined") return Icons.night_shelter_outlined;
    if (value == "nightlife") return Icons.nightlife;
    if (value == "nightlife_sharp") return Icons.nightlife_sharp;
    if (value == "nightlife_rounded") return Icons.nightlife_rounded;
    if (value == "nightlife_outlined") return Icons.nightlife_outlined;
    if (value == "nightlight") return Icons.nightlight;
    if (value == "nightlight_sharp") return Icons.nightlight_sharp;
    if (value == "nightlight_rounded") return Icons.nightlight_rounded;
    if (value == "nightlight_outlined") return Icons.nightlight_outlined;
    if (value == "nightlight_round") return Icons.nightlight_round;
    if (value == "nightlight_round_sharp") return Icons.nightlight_round_sharp;
    if (value == "nightlight_round_rounded")
      return Icons.nightlight_round_rounded;
    if (value == "nightlight_round_outlined")
      return Icons.nightlight_round_outlined;
    if (value == "nights_stay") return Icons.nights_stay;
    if (value == "nights_stay_sharp") return Icons.nights_stay_sharp;
    if (value == "nights_stay_rounded") return Icons.nights_stay_rounded;
    if (value == "nights_stay_outlined") return Icons.nights_stay_outlined;
    if (value == "no_accounts") return Icons.no_accounts;
    if (value == "no_accounts_sharp") return Icons.no_accounts_sharp;
    if (value == "no_accounts_rounded") return Icons.no_accounts_rounded;
    if (value == "no_accounts_outlined") return Icons.no_accounts_outlined;
    if (value == "no_adult_content") return Icons.no_adult_content;
    if (value == "no_adult_content_sharp") return Icons.no_adult_content_sharp;
    if (value == "no_adult_content_rounded")
      return Icons.no_adult_content_rounded;
    if (value == "no_adult_content_outlined")
      return Icons.no_adult_content_outlined;
    if (value == "no_backpack") return Icons.no_backpack;
    if (value == "no_backpack_sharp") return Icons.no_backpack_sharp;
    if (value == "no_backpack_rounded") return Icons.no_backpack_rounded;
    if (value == "no_backpack_outlined") return Icons.no_backpack_outlined;
    if (value == "no_cell") return Icons.no_cell;
    if (value == "no_cell_sharp") return Icons.no_cell_sharp;
    if (value == "no_cell_rounded") return Icons.no_cell_rounded;
    if (value == "no_cell_outlined") return Icons.no_cell_outlined;
    if (value == "no_crash") return Icons.no_crash;
    if (value == "no_crash_sharp") return Icons.no_crash_sharp;
    if (value == "no_crash_rounded") return Icons.no_crash_rounded;
    if (value == "no_crash_outlined") return Icons.no_crash_outlined;
    if (value == "no_drinks") return Icons.no_drinks;
    if (value == "no_drinks_sharp") return Icons.no_drinks_sharp;
    if (value == "no_drinks_rounded") return Icons.no_drinks_rounded;
    if (value == "no_drinks_outlined") return Icons.no_drinks_outlined;
    if (value == "no_encryption") return Icons.no_encryption;
    if (value == "no_encryption_sharp") return Icons.no_encryption_sharp;
    if (value == "no_encryption_rounded") return Icons.no_encryption_rounded;
    if (value == "no_encryption_outlined") return Icons.no_encryption_outlined;
    if (value == "no_encryption_gmailerrorred")
      return Icons.no_encryption_gmailerrorred;
    if (value == "no_encryption_gmailerrorred_sharp")
      return Icons.no_encryption_gmailerrorred_sharp;
    if (value == "no_encryption_gmailerrorred_rounded")
      return Icons.no_encryption_gmailerrorred_rounded;
    if (value == "no_encryption_gmailerrorred_outlined")
      return Icons.no_encryption_gmailerrorred_outlined;
    if (value == "no_flash") return Icons.no_flash;
    if (value == "no_flash_sharp") return Icons.no_flash_sharp;
    if (value == "no_flash_rounded") return Icons.no_flash_rounded;
    if (value == "no_flash_outlined") return Icons.no_flash_outlined;
    if (value == "no_food") return Icons.no_food;
    if (value == "no_food_sharp") return Icons.no_food_sharp;
    if (value == "no_food_rounded") return Icons.no_food_rounded;
    if (value == "no_food_outlined") return Icons.no_food_outlined;
    if (value == "no_luggage") return Icons.no_luggage;
    if (value == "no_luggage_sharp") return Icons.no_luggage_sharp;
    if (value == "no_luggage_rounded") return Icons.no_luggage_rounded;
    if (value == "no_luggage_outlined") return Icons.no_luggage_outlined;
    if (value == "no_meals") return Icons.no_meals;
    if (value == "no_meals_sharp") return Icons.no_meals_sharp;
    if (value == "no_meals_rounded") return Icons.no_meals_rounded;
    if (value == "no_meals_outlined") return Icons.no_meals_outlined;
    if (value == "no_meals_ouline") return Icons.no_meals_ouline;
    if (value == "no_meeting_room") return Icons.no_meeting_room;
    if (value == "no_meeting_room_sharp") return Icons.no_meeting_room_sharp;
    if (value == "no_meeting_room_rounded")
      return Icons.no_meeting_room_rounded;
    if (value == "no_meeting_room_outlined")
      return Icons.no_meeting_room_outlined;
    if (value == "no_photography") return Icons.no_photography;
    if (value == "no_photography_sharp") return Icons.no_photography_sharp;
    if (value == "no_photography_rounded") return Icons.no_photography_rounded;
    if (value == "no_photography_outlined")
      return Icons.no_photography_outlined;
    if (value == "no_sim") return Icons.no_sim;
    if (value == "no_sim_sharp") return Icons.no_sim_sharp;
    if (value == "no_sim_rounded") return Icons.no_sim_rounded;
    if (value == "no_sim_outlined") return Icons.no_sim_outlined;
    if (value == "no_stroller") return Icons.no_stroller;
    if (value == "no_stroller_sharp") return Icons.no_stroller_sharp;
    if (value == "no_stroller_rounded") return Icons.no_stroller_rounded;
    if (value == "no_stroller_outlined") return Icons.no_stroller_outlined;
    if (value == "no_transfer") return Icons.no_transfer;
    if (value == "no_transfer_sharp") return Icons.no_transfer_sharp;
    if (value == "no_transfer_rounded") return Icons.no_transfer_rounded;
    if (value == "no_transfer_outlined") return Icons.no_transfer_outlined;
    if (value == "noise_aware") return Icons.noise_aware;
    if (value == "noise_aware_sharp") return Icons.noise_aware_sharp;
    if (value == "noise_aware_rounded") return Icons.noise_aware_rounded;
    if (value == "noise_aware_outlined") return Icons.noise_aware_outlined;
    if (value == "noise_control_off") return Icons.noise_control_off;
    if (value == "noise_control_off_sharp")
      return Icons.noise_control_off_sharp;
    if (value == "noise_control_off_rounded")
      return Icons.noise_control_off_rounded;
    if (value == "noise_control_off_outlined")
      return Icons.noise_control_off_outlined;
    if (value == "nordic_walking") return Icons.nordic_walking;
    if (value == "nordic_walking_sharp") return Icons.nordic_walking_sharp;
    if (value == "nordic_walking_rounded") return Icons.nordic_walking_rounded;
    if (value == "nordic_walking_outlined")
      return Icons.nordic_walking_outlined;
    if (value == "north") return Icons.north;
    if (value == "north_sharp") return Icons.north_sharp;
    if (value == "north_rounded") return Icons.north_rounded;
    if (value == "north_outlined") return Icons.north_outlined;
    if (value == "north_east") return Icons.north_east;
    if (value == "north_east_sharp") return Icons.north_east_sharp;
    if (value == "north_east_rounded") return Icons.north_east_rounded;
    if (value == "north_east_outlined") return Icons.north_east_outlined;
    if (value == "north_west") return Icons.north_west;
    if (value == "north_west_sharp") return Icons.north_west_sharp;
    if (value == "north_west_rounded") return Icons.north_west_rounded;
    if (value == "north_west_outlined") return Icons.north_west_outlined;
    if (value == "not_accessible") return Icons.not_accessible;
    if (value == "not_accessible_sharp") return Icons.not_accessible_sharp;
    if (value == "not_accessible_rounded") return Icons.not_accessible_rounded;
    if (value == "not_accessible_outlined")
      return Icons.not_accessible_outlined;
    if (value == "not_interested") return Icons.not_interested;
    if (value == "not_interested_sharp") return Icons.not_interested_sharp;
    if (value == "not_interested_rounded") return Icons.not_interested_rounded;
    if (value == "not_interested_outlined")
      return Icons.not_interested_outlined;
    if (value == "not_listed_location") return Icons.not_listed_location;
    if (value == "not_listed_location_sharp")
      return Icons.not_listed_location_sharp;
    if (value == "not_listed_location_rounded")
      return Icons.not_listed_location_rounded;
    if (value == "not_listed_location_outlined")
      return Icons.not_listed_location_outlined;
    if (value == "not_started") return Icons.not_started;
    if (value == "not_started_sharp") return Icons.not_started_sharp;
    if (value == "not_started_rounded") return Icons.not_started_rounded;
    if (value == "not_started_outlined") return Icons.not_started_outlined;
    if (value == "note") return Icons.note;
    if (value == "note_sharp") return Icons.note_sharp;
    if (value == "note_rounded") return Icons.note_rounded;
    if (value == "note_outlined") return Icons.note_outlined;
    if (value == "note_add") return Icons.note_add;
    if (value == "note_add_sharp") return Icons.note_add_sharp;
    if (value == "note_add_rounded") return Icons.note_add_rounded;
    if (value == "note_add_outlined") return Icons.note_add_outlined;
    if (value == "note_alt") return Icons.note_alt;
    if (value == "note_alt_sharp") return Icons.note_alt_sharp;
    if (value == "note_alt_rounded") return Icons.note_alt_rounded;
    if (value == "note_alt_outlined") return Icons.note_alt_outlined;
    if (value == "notes") return Icons.notes;
    if (value == "notes_sharp") return Icons.notes_sharp;
    if (value == "notes_rounded") return Icons.notes_rounded;
    if (value == "notes_outlined") return Icons.notes_outlined;
    if (value == "notification_add") return Icons.notification_add;
    if (value == "notification_add_sharp") return Icons.notification_add_sharp;
    if (value == "notification_add_rounded")
      return Icons.notification_add_rounded;
    if (value == "notification_add_outlined")
      return Icons.notification_add_outlined;
    if (value == "notification_important") return Icons.notification_important;
    if (value == "notification_important_sharp")
      return Icons.notification_important_sharp;
    if (value == "notification_important_rounded")
      return Icons.notification_important_rounded;
    if (value == "notification_important_outlined")
      return Icons.notification_important_outlined;
    if (value == "notifications") return Icons.notifications;
    if (value == "notifications_sharp") return Icons.notifications_sharp;
    if (value == "notifications_rounded") return Icons.notifications_rounded;
    if (value == "notifications_outlined") return Icons.notifications_outlined;
    if (value == "notifications_active") return Icons.notifications_active;
    if (value == "notifications_active_sharp")
      return Icons.notifications_active_sharp;
    if (value == "notifications_active_rounded")
      return Icons.notifications_active_rounded;
    if (value == "notifications_active_outlined")
      return Icons.notifications_active_outlined;
    if (value == "notifications_none") return Icons.notifications_none;
    if (value == "notifications_none_sharp")
      return Icons.notifications_none_sharp;
    if (value == "notifications_none_rounded")
      return Icons.notifications_none_rounded;
    if (value == "notifications_none_outlined")
      return Icons.notifications_none_outlined;
    if (value == "notifications_off") return Icons.notifications_off;
    if (value == "notifications_off_sharp")
      return Icons.notifications_off_sharp;
    if (value == "notifications_off_rounded")
      return Icons.notifications_off_rounded;
    if (value == "notifications_off_outlined")
      return Icons.notifications_off_outlined;
    if (value == "notifications_on") return Icons.notifications_on;
    if (value == "notifications_on_sharp") return Icons.notifications_on_sharp;
    if (value == "notifications_on_rounded")
      return Icons.notifications_on_rounded;
    if (value == "notifications_on_outlined")
      return Icons.notifications_on_outlined;
    if (value == "notifications_paused") return Icons.notifications_paused;
    if (value == "notifications_paused_sharp")
      return Icons.notifications_paused_sharp;
    if (value == "notifications_paused_rounded")
      return Icons.notifications_paused_rounded;
    if (value == "notifications_paused_outlined")
      return Icons.notifications_paused_outlined;
    if (value == "now_wallpaper") return Icons.now_wallpaper;
    if (value == "now_wallpaper_sharp") return Icons.now_wallpaper_sharp;
    if (value == "now_wallpaper_rounded") return Icons.now_wallpaper_rounded;
    if (value == "now_wallpaper_outlined") return Icons.now_wallpaper_outlined;
    if (value == "now_widgets") return Icons.now_widgets;
    if (value == "now_widgets_sharp") return Icons.now_widgets_sharp;
    if (value == "now_widgets_rounded") return Icons.now_widgets_rounded;
    if (value == "now_widgets_outlined") return Icons.now_widgets_outlined;
    if (value == "numbers") return Icons.numbers;
    if (value == "numbers_sharp") return Icons.numbers_sharp;
    if (value == "numbers_rounded") return Icons.numbers_rounded;
    if (value == "numbers_outlined") return Icons.numbers_outlined;
    if (value == "offline_bolt") return Icons.offline_bolt;
    if (value == "offline_bolt_sharp") return Icons.offline_bolt_sharp;
    if (value == "offline_bolt_rounded") return Icons.offline_bolt_rounded;
    if (value == "offline_bolt_outlined") return Icons.offline_bolt_outlined;
    if (value == "offline_pin") return Icons.offline_pin;
    if (value == "offline_pin_sharp") return Icons.offline_pin_sharp;
    if (value == "offline_pin_rounded") return Icons.offline_pin_rounded;
    if (value == "offline_pin_outlined") return Icons.offline_pin_outlined;
    if (value == "offline_share") return Icons.offline_share;
    if (value == "offline_share_sharp") return Icons.offline_share_sharp;
    if (value == "offline_share_rounded") return Icons.offline_share_rounded;
    if (value == "offline_share_outlined") return Icons.offline_share_outlined;
    if (value == "oil_barrel") return Icons.oil_barrel;
    if (value == "oil_barrel_sharp") return Icons.oil_barrel_sharp;
    if (value == "oil_barrel_rounded") return Icons.oil_barrel_rounded;
    if (value == "oil_barrel_outlined") return Icons.oil_barrel_outlined;
    if (value == "on_device_training") return Icons.on_device_training;
    if (value == "on_device_training_sharp")
      return Icons.on_device_training_sharp;
    if (value == "on_device_training_rounded")
      return Icons.on_device_training_rounded;
    if (value == "on_device_training_outlined")
      return Icons.on_device_training_outlined;
    if (value == "ondemand_video") return Icons.ondemand_video;
    if (value == "ondemand_video_sharp") return Icons.ondemand_video_sharp;
    if (value == "ondemand_video_rounded") return Icons.ondemand_video_rounded;
    if (value == "ondemand_video_outlined")
      return Icons.ondemand_video_outlined;
    if (value == "online_prediction") return Icons.online_prediction;
    if (value == "online_prediction_sharp")
      return Icons.online_prediction_sharp;
    if (value == "online_prediction_rounded")
      return Icons.online_prediction_rounded;
    if (value == "online_prediction_outlined")
      return Icons.online_prediction_outlined;
    if (value == "opacity") return Icons.opacity;
    if (value == "opacity_sharp") return Icons.opacity_sharp;
    if (value == "opacity_rounded") return Icons.opacity_rounded;
    if (value == "opacity_outlined") return Icons.opacity_outlined;
    if (value == "open_in_browser") return Icons.open_in_browser;
    if (value == "open_in_browser_sharp") return Icons.open_in_browser_sharp;
    if (value == "open_in_browser_rounded")
      return Icons.open_in_browser_rounded;
    if (value == "open_in_browser_outlined")
      return Icons.open_in_browser_outlined;
    if (value == "open_in_full") return Icons.open_in_full;
    if (value == "open_in_full_sharp") return Icons.open_in_full_sharp;
    if (value == "open_in_full_rounded") return Icons.open_in_full_rounded;
    if (value == "open_in_full_outlined") return Icons.open_in_full_outlined;
    if (value == "open_in_new") return Icons.open_in_new;
    if (value == "open_in_new_sharp") return Icons.open_in_new_sharp;
    if (value == "open_in_new_rounded") return Icons.open_in_new_rounded;
    if (value == "open_in_new_outlined") return Icons.open_in_new_outlined;
    if (value == "open_in_new_off") return Icons.open_in_new_off;
    if (value == "open_in_new_off_sharp") return Icons.open_in_new_off_sharp;
    if (value == "open_in_new_off_rounded")
      return Icons.open_in_new_off_rounded;
    if (value == "open_in_new_off_outlined")
      return Icons.open_in_new_off_outlined;
    if (value == "open_with") return Icons.open_with;
    if (value == "open_with_sharp") return Icons.open_with_sharp;
    if (value == "open_with_rounded") return Icons.open_with_rounded;
    if (value == "open_with_outlined") return Icons.open_with_outlined;
    if (value == "other_houses") return Icons.other_houses;
    if (value == "other_houses_sharp") return Icons.other_houses_sharp;
    if (value == "other_houses_rounded") return Icons.other_houses_rounded;
    if (value == "other_houses_outlined") return Icons.other_houses_outlined;
    if (value == "outbond") return Icons.outbond;
    if (value == "outbond_sharp") return Icons.outbond_sharp;
    if (value == "outbond_rounded") return Icons.outbond_rounded;
    if (value == "outbond_outlined") return Icons.outbond_outlined;
    if (value == "outbound") return Icons.outbound;
    if (value == "outbound_sharp") return Icons.outbound_sharp;
    if (value == "outbound_rounded") return Icons.outbound_rounded;
    if (value == "outbound_outlined") return Icons.outbound_outlined;
    if (value == "outbox") return Icons.outbox;
    if (value == "outbox_sharp") return Icons.outbox_sharp;
    if (value == "outbox_rounded") return Icons.outbox_rounded;
    if (value == "outbox_outlined") return Icons.outbox_outlined;
    if (value == "outdoor_grill") return Icons.outdoor_grill;
    if (value == "outdoor_grill_sharp") return Icons.outdoor_grill_sharp;
    if (value == "outdoor_grill_rounded") return Icons.outdoor_grill_rounded;
    if (value == "outdoor_grill_outlined") return Icons.outdoor_grill_outlined;
    if (value == "outgoing_mail") return Icons.outgoing_mail;
    if (value == "outlet") return Icons.outlet;
    if (value == "outlet_sharp") return Icons.outlet_sharp;
    if (value == "outlet_rounded") return Icons.outlet_rounded;
    if (value == "outlet_outlined") return Icons.outlet_outlined;
    if (value == "outlined_flag") return Icons.outlined_flag;
    if (value == "outlined_flag_sharp") return Icons.outlined_flag_sharp;
    if (value == "outlined_flag_rounded") return Icons.outlined_flag_rounded;
    if (value == "outlined_flag_outlined") return Icons.outlined_flag_outlined;
    if (value == "output") return Icons.output;
    if (value == "output_sharp") return Icons.output_sharp;
    if (value == "output_rounded") return Icons.output_rounded;
    if (value == "output_outlined") return Icons.output_outlined;
    if (value == "padding") return Icons.padding;
    if (value == "padding_sharp") return Icons.padding_sharp;
    if (value == "padding_rounded") return Icons.padding_rounded;
    if (value == "padding_outlined") return Icons.padding_outlined;
    if (value == "pages") return Icons.pages;
    if (value == "pages_sharp") return Icons.pages_sharp;
    if (value == "pages_rounded") return Icons.pages_rounded;
    if (value == "pages_outlined") return Icons.pages_outlined;
    if (value == "pageview") return Icons.pageview;
    if (value == "pageview_sharp") return Icons.pageview_sharp;
    if (value == "pageview_rounded") return Icons.pageview_rounded;
    if (value == "pageview_outlined") return Icons.pageview_outlined;
    if (value == "paid") return Icons.paid;
    if (value == "paid_sharp") return Icons.paid_sharp;
    if (value == "paid_rounded") return Icons.paid_rounded;
    if (value == "paid_outlined") return Icons.paid_outlined;
    if (value == "palette") return Icons.palette;
    if (value == "palette_sharp") return Icons.palette_sharp;
    if (value == "palette_rounded") return Icons.palette_rounded;
    if (value == "palette_outlined") return Icons.palette_outlined;
    if (value == "pan_tool") return Icons.pan_tool;
    if (value == "pan_tool_sharp") return Icons.pan_tool_sharp;
    if (value == "pan_tool_rounded") return Icons.pan_tool_rounded;
    if (value == "pan_tool_outlined") return Icons.pan_tool_outlined;
    if (value == "pan_tool_alt") return Icons.pan_tool_alt;
    if (value == "pan_tool_alt_sharp") return Icons.pan_tool_alt_sharp;
    if (value == "pan_tool_alt_rounded") return Icons.pan_tool_alt_rounded;
    if (value == "pan_tool_alt_outlined") return Icons.pan_tool_alt_outlined;
    if (value == "panorama") return Icons.panorama;
    if (value == "panorama_sharp") return Icons.panorama_sharp;
    if (value == "panorama_rounded") return Icons.panorama_rounded;
    if (value == "panorama_outlined") return Icons.panorama_outlined;
    if (value == "panorama_fish_eye") return Icons.panorama_fish_eye;
    if (value == "panorama_fish_eye_sharp")
      return Icons.panorama_fish_eye_sharp;
    if (value == "panorama_fish_eye_rounded")
      return Icons.panorama_fish_eye_rounded;
    if (value == "panorama_fish_eye_outlined")
      return Icons.panorama_fish_eye_outlined;
    if (value == "panorama_fisheye") return Icons.panorama_fisheye;
    if (value == "panorama_fisheye_sharp") return Icons.panorama_fisheye_sharp;
    if (value == "panorama_fisheye_rounded")
      return Icons.panorama_fisheye_rounded;
    if (value == "panorama_fisheye_outlined")
      return Icons.panorama_fisheye_outlined;
    if (value == "panorama_horizontal") return Icons.panorama_horizontal;
    if (value == "panorama_horizontal_sharp")
      return Icons.panorama_horizontal_sharp;
    if (value == "panorama_horizontal_rounded")
      return Icons.panorama_horizontal_rounded;
    if (value == "panorama_horizontal_outlined")
      return Icons.panorama_horizontal_outlined;
    if (value == "panorama_horizontal_select")
      return Icons.panorama_horizontal_select;
    if (value == "panorama_horizontal_select_sharp")
      return Icons.panorama_horizontal_select_sharp;
    if (value == "panorama_horizontal_select_rounded")
      return Icons.panorama_horizontal_select_rounded;
    if (value == "panorama_horizontal_select_outlined")
      return Icons.panorama_horizontal_select_outlined;
    if (value == "panorama_photosphere") return Icons.panorama_photosphere;
    if (value == "panorama_photosphere_sharp")
      return Icons.panorama_photosphere_sharp;
    if (value == "panorama_photosphere_rounded")
      return Icons.panorama_photosphere_rounded;
    if (value == "panorama_photosphere_outlined")
      return Icons.panorama_photosphere_outlined;
    if (value == "panorama_photosphere_select")
      return Icons.panorama_photosphere_select;
    if (value == "panorama_photosphere_select_sharp")
      return Icons.panorama_photosphere_select_sharp;
    if (value == "panorama_photosphere_select_rounded")
      return Icons.panorama_photosphere_select_rounded;
    if (value == "panorama_photosphere_select_outlined")
      return Icons.panorama_photosphere_select_outlined;
    if (value == "panorama_vertical") return Icons.panorama_vertical;
    if (value == "panorama_vertical_sharp")
      return Icons.panorama_vertical_sharp;
    if (value == "panorama_vertical_rounded")
      return Icons.panorama_vertical_rounded;
    if (value == "panorama_vertical_outlined")
      return Icons.panorama_vertical_outlined;
    if (value == "panorama_vertical_select")
      return Icons.panorama_vertical_select;
    if (value == "panorama_vertical_select_sharp")
      return Icons.panorama_vertical_select_sharp;
    if (value == "panorama_vertical_select_rounded")
      return Icons.panorama_vertical_select_rounded;
    if (value == "panorama_vertical_select_outlined")
      return Icons.panorama_vertical_select_outlined;
    if (value == "panorama_wide_angle") return Icons.panorama_wide_angle;
    if (value == "panorama_wide_angle_sharp")
      return Icons.panorama_wide_angle_sharp;
    if (value == "panorama_wide_angle_rounded")
      return Icons.panorama_wide_angle_rounded;
    if (value == "panorama_wide_angle_outlined")
      return Icons.panorama_wide_angle_outlined;
    if (value == "panorama_wide_angle_select")
      return Icons.panorama_wide_angle_select;
    if (value == "panorama_wide_angle_select_sharp")
      return Icons.panorama_wide_angle_select_sharp;
    if (value == "panorama_wide_angle_select_rounded")
      return Icons.panorama_wide_angle_select_rounded;
    if (value == "panorama_wide_angle_select_outlined")
      return Icons.panorama_wide_angle_select_outlined;
    if (value == "paragliding") return Icons.paragliding;
    if (value == "paragliding_sharp") return Icons.paragliding_sharp;
    if (value == "paragliding_rounded") return Icons.paragliding_rounded;
    if (value == "paragliding_outlined") return Icons.paragliding_outlined;
    if (value == "park") return Icons.park;
    if (value == "park_sharp") return Icons.park_sharp;
    if (value == "park_rounded") return Icons.park_rounded;
    if (value == "park_outlined") return Icons.park_outlined;
    if (value == "party_mode") return Icons.party_mode;
    if (value == "party_mode_sharp") return Icons.party_mode_sharp;
    if (value == "party_mode_rounded") return Icons.party_mode_rounded;
    if (value == "party_mode_outlined") return Icons.party_mode_outlined;
    if (value == "password") return Icons.password;
    if (value == "password_sharp") return Icons.password_sharp;
    if (value == "password_rounded") return Icons.password_rounded;
    if (value == "password_outlined") return Icons.password_outlined;
    if (value == "paste") return Icons.paste;
    if (value == "paste_sharp") return Icons.paste_sharp;
    if (value == "paste_rounded") return Icons.paste_rounded;
    if (value == "paste_outlined") return Icons.paste_outlined;
    if (value == "pattern") return Icons.pattern;
    if (value == "pattern_sharp") return Icons.pattern_sharp;
    if (value == "pattern_rounded") return Icons.pattern_rounded;
    if (value == "pattern_outlined") return Icons.pattern_outlined;
    if (value == "pause") return Icons.pause;
    if (value == "pause_sharp") return Icons.pause_sharp;
    if (value == "pause_rounded") return Icons.pause_rounded;
    if (value == "pause_outlined") return Icons.pause_outlined;
    if (value == "pause_circle") return Icons.pause_circle;
    if (value == "pause_circle_sharp") return Icons.pause_circle_sharp;
    if (value == "pause_circle_rounded") return Icons.pause_circle_rounded;
    if (value == "pause_circle_outlined") return Icons.pause_circle_outlined;
    if (value == "pause_circle_filled") return Icons.pause_circle_filled;
    if (value == "pause_circle_filled_sharp")
      return Icons.pause_circle_filled_sharp;
    if (value == "pause_circle_filled_rounded")
      return Icons.pause_circle_filled_rounded;
    if (value == "pause_circle_filled_outlined")
      return Icons.pause_circle_filled_outlined;
    if (value == "pause_circle_outline") return Icons.pause_circle_outline;
    if (value == "pause_circle_outline_sharp")
      return Icons.pause_circle_outline_sharp;
    if (value == "pause_circle_outline_rounded")
      return Icons.pause_circle_outline_rounded;
    if (value == "pause_circle_outline_outlined")
      return Icons.pause_circle_outline_outlined;
    if (value == "pause_presentation") return Icons.pause_presentation;
    if (value == "pause_presentation_sharp")
      return Icons.pause_presentation_sharp;
    if (value == "pause_presentation_rounded")
      return Icons.pause_presentation_rounded;
    if (value == "pause_presentation_outlined")
      return Icons.pause_presentation_outlined;
    if (value == "payment") return Icons.payment;
    if (value == "payment_sharp") return Icons.payment_sharp;
    if (value == "payment_rounded") return Icons.payment_rounded;
    if (value == "payment_outlined") return Icons.payment_outlined;
    if (value == "payments") return Icons.payments;
    if (value == "payments_sharp") return Icons.payments_sharp;
    if (value == "payments_rounded") return Icons.payments_rounded;
    if (value == "payments_outlined") return Icons.payments_outlined;
    if (value == "paypal") return Icons.paypal;
    if (value == "paypal_sharp") return Icons.paypal_sharp;
    if (value == "paypal_rounded") return Icons.paypal_rounded;
    if (value == "paypal_outlined") return Icons.paypal_outlined;
    if (value == "pedal_bike") return Icons.pedal_bike;
    if (value == "pedal_bike_sharp") return Icons.pedal_bike_sharp;
    if (value == "pedal_bike_rounded") return Icons.pedal_bike_rounded;
    if (value == "pedal_bike_outlined") return Icons.pedal_bike_outlined;
    if (value == "pending") return Icons.pending;
    if (value == "pending_sharp") return Icons.pending_sharp;
    if (value == "pending_rounded") return Icons.pending_rounded;
    if (value == "pending_outlined") return Icons.pending_outlined;
    if (value == "pending_actions") return Icons.pending_actions;
    if (value == "pending_actions_sharp") return Icons.pending_actions_sharp;
    if (value == "pending_actions_rounded")
      return Icons.pending_actions_rounded;
    if (value == "pending_actions_outlined")
      return Icons.pending_actions_outlined;
    if (value == "pentagon") return Icons.pentagon;
    if (value == "pentagon_sharp") return Icons.pentagon_sharp;
    if (value == "pentagon_rounded") return Icons.pentagon_rounded;
    if (value == "pentagon_outlined") return Icons.pentagon_outlined;
    if (value == "people") return Icons.people;
    if (value == "people_sharp") return Icons.people_sharp;
    if (value == "people_rounded") return Icons.people_rounded;
    if (value == "people_outlined") return Icons.people_outlined;
    if (value == "people_alt") return Icons.people_alt;
    if (value == "people_alt_sharp") return Icons.people_alt_sharp;
    if (value == "people_alt_rounded") return Icons.people_alt_rounded;
    if (value == "people_alt_outlined") return Icons.people_alt_outlined;
    if (value == "people_outline") return Icons.people_outline;
    if (value == "people_outline_sharp") return Icons.people_outline_sharp;
    if (value == "people_outline_rounded") return Icons.people_outline_rounded;
    if (value == "people_outline_outlined")
      return Icons.people_outline_outlined;
    if (value == "percent") return Icons.percent;
    if (value == "percent_sharp") return Icons.percent_sharp;
    if (value == "percent_rounded") return Icons.percent_rounded;
    if (value == "percent_outlined") return Icons.percent_outlined;
    if (value == "perm_camera_mic") return Icons.perm_camera_mic;
    if (value == "perm_camera_mic_sharp") return Icons.perm_camera_mic_sharp;
    if (value == "perm_camera_mic_rounded")
      return Icons.perm_camera_mic_rounded;
    if (value == "perm_camera_mic_outlined")
      return Icons.perm_camera_mic_outlined;
    if (value == "perm_contact_cal") return Icons.perm_contact_cal;
    if (value == "perm_contact_cal_sharp") return Icons.perm_contact_cal_sharp;
    if (value == "perm_contact_cal_rounded")
      return Icons.perm_contact_cal_rounded;
    if (value == "perm_contact_cal_outlined")
      return Icons.perm_contact_cal_outlined;
    if (value == "perm_contact_calendar") return Icons.perm_contact_calendar;
    if (value == "perm_contact_calendar_sharp")
      return Icons.perm_contact_calendar_sharp;
    if (value == "perm_contact_calendar_rounded")
      return Icons.perm_contact_calendar_rounded;
    if (value == "perm_contact_calendar_outlined")
      return Icons.perm_contact_calendar_outlined;
    if (value == "perm_data_setting") return Icons.perm_data_setting;
    if (value == "perm_data_setting_sharp")
      return Icons.perm_data_setting_sharp;
    if (value == "perm_data_setting_rounded")
      return Icons.perm_data_setting_rounded;
    if (value == "perm_data_setting_outlined")
      return Icons.perm_data_setting_outlined;
    if (value == "perm_device_info") return Icons.perm_device_info;
    if (value == "perm_device_info_sharp") return Icons.perm_device_info_sharp;
    if (value == "perm_device_info_rounded")
      return Icons.perm_device_info_rounded;
    if (value == "perm_device_info_outlined")
      return Icons.perm_device_info_outlined;
    if (value == "perm_device_information")
      return Icons.perm_device_information;
    if (value == "perm_device_information_sharp")
      return Icons.perm_device_information_sharp;
    if (value == "perm_device_information_rounded")
      return Icons.perm_device_information_rounded;
    if (value == "perm_device_information_outlined")
      return Icons.perm_device_information_outlined;
    if (value == "perm_identity") return Icons.perm_identity;
    if (value == "perm_identity_sharp") return Icons.perm_identity_sharp;
    if (value == "perm_identity_rounded") return Icons.perm_identity_rounded;
    if (value == "perm_identity_outlined") return Icons.perm_identity_outlined;
    if (value == "perm_media") return Icons.perm_media;
    if (value == "perm_media_sharp") return Icons.perm_media_sharp;
    if (value == "perm_media_rounded") return Icons.perm_media_rounded;
    if (value == "perm_media_outlined") return Icons.perm_media_outlined;
    if (value == "perm_phone_msg") return Icons.perm_phone_msg;
    if (value == "perm_phone_msg_sharp") return Icons.perm_phone_msg_sharp;
    if (value == "perm_phone_msg_rounded") return Icons.perm_phone_msg_rounded;
    if (value == "perm_phone_msg_outlined")
      return Icons.perm_phone_msg_outlined;
    if (value == "perm_scan_wifi") return Icons.perm_scan_wifi;
    if (value == "perm_scan_wifi_sharp") return Icons.perm_scan_wifi_sharp;
    if (value == "perm_scan_wifi_rounded") return Icons.perm_scan_wifi_rounded;
    if (value == "perm_scan_wifi_outlined")
      return Icons.perm_scan_wifi_outlined;
    if (value == "person") return Icons.person;
    if (value == "person_sharp") return Icons.person_sharp;
    if (value == "person_rounded") return Icons.person_rounded;
    if (value == "person_outlined") return Icons.person_outlined;
    if (value == "person_add") return Icons.person_add;
    if (value == "person_add_sharp") return Icons.person_add_sharp;
    if (value == "person_add_rounded") return Icons.person_add_rounded;
    if (value == "person_add_outlined") return Icons.person_add_outlined;
    if (value == "person_add_alt") return Icons.person_add_alt;
    if (value == "person_add_alt_sharp") return Icons.person_add_alt_sharp;
    if (value == "person_add_alt_rounded") return Icons.person_add_alt_rounded;
    if (value == "person_add_alt_outlined")
      return Icons.person_add_alt_outlined;
    if (value == "person_add_alt_1") return Icons.person_add_alt_1;
    if (value == "person_add_alt_1_sharp") return Icons.person_add_alt_1_sharp;
    if (value == "person_add_alt_1_rounded")
      return Icons.person_add_alt_1_rounded;
    if (value == "person_add_alt_1_outlined")
      return Icons.person_add_alt_1_outlined;
    if (value == "person_add_disabled") return Icons.person_add_disabled;
    if (value == "person_add_disabled_sharp")
      return Icons.person_add_disabled_sharp;
    if (value == "person_add_disabled_rounded")
      return Icons.person_add_disabled_rounded;
    if (value == "person_add_disabled_outlined")
      return Icons.person_add_disabled_outlined;
    if (value == "person_off") return Icons.person_off;
    if (value == "person_off_sharp") return Icons.person_off_sharp;
    if (value == "person_off_rounded") return Icons.person_off_rounded;
    if (value == "person_off_outlined") return Icons.person_off_outlined;
    if (value == "person_outline") return Icons.person_outline;
    if (value == "person_outline_sharp") return Icons.person_outline_sharp;
    if (value == "person_outline_rounded") return Icons.person_outline_rounded;
    if (value == "person_outline_outlined")
      return Icons.person_outline_outlined;
    if (value == "person_pin") return Icons.person_pin;
    if (value == "person_pin_sharp") return Icons.person_pin_sharp;
    if (value == "person_pin_rounded") return Icons.person_pin_rounded;
    if (value == "person_pin_outlined") return Icons.person_pin_outlined;
    if (value == "person_pin_circle") return Icons.person_pin_circle;
    if (value == "person_pin_circle_sharp")
      return Icons.person_pin_circle_sharp;
    if (value == "person_pin_circle_rounded")
      return Icons.person_pin_circle_rounded;
    if (value == "person_pin_circle_outlined")
      return Icons.person_pin_circle_outlined;
    if (value == "person_remove") return Icons.person_remove;
    if (value == "person_remove_sharp") return Icons.person_remove_sharp;
    if (value == "person_remove_rounded") return Icons.person_remove_rounded;
    if (value == "person_remove_outlined") return Icons.person_remove_outlined;
    if (value == "person_remove_alt_1") return Icons.person_remove_alt_1;
    if (value == "person_remove_alt_1_sharp")
      return Icons.person_remove_alt_1_sharp;
    if (value == "person_remove_alt_1_rounded")
      return Icons.person_remove_alt_1_rounded;
    if (value == "person_remove_alt_1_outlined")
      return Icons.person_remove_alt_1_outlined;
    if (value == "person_search") return Icons.person_search;
    if (value == "person_search_sharp") return Icons.person_search_sharp;
    if (value == "person_search_rounded") return Icons.person_search_rounded;
    if (value == "person_search_outlined") return Icons.person_search_outlined;
    if (value == "personal_injury") return Icons.personal_injury;
    if (value == "personal_injury_sharp") return Icons.personal_injury_sharp;
    if (value == "personal_injury_rounded")
      return Icons.personal_injury_rounded;
    if (value == "personal_injury_outlined")
      return Icons.personal_injury_outlined;
    if (value == "personal_video") return Icons.personal_video;
    if (value == "personal_video_sharp") return Icons.personal_video_sharp;
    if (value == "personal_video_rounded") return Icons.personal_video_rounded;
    if (value == "personal_video_outlined")
      return Icons.personal_video_outlined;
    if (value == "pest_control") return Icons.pest_control;
    if (value == "pest_control_sharp") return Icons.pest_control_sharp;
    if (value == "pest_control_rounded") return Icons.pest_control_rounded;
    if (value == "pest_control_outlined") return Icons.pest_control_outlined;
    if (value == "pest_control_rodent") return Icons.pest_control_rodent;
    if (value == "pest_control_rodent_sharp")
      return Icons.pest_control_rodent_sharp;
    if (value == "pest_control_rodent_rounded")
      return Icons.pest_control_rodent_rounded;
    if (value == "pest_control_rodent_outlined")
      return Icons.pest_control_rodent_outlined;
    if (value == "pets") return Icons.pets;
    if (value == "pets_sharp") return Icons.pets_sharp;
    if (value == "pets_rounded") return Icons.pets_rounded;
    if (value == "pets_outlined") return Icons.pets_outlined;
    if (value == "phishing") return Icons.phishing;
    if (value == "phishing_sharp") return Icons.phishing_sharp;
    if (value == "phishing_rounded") return Icons.phishing_rounded;
    if (value == "phishing_outlined") return Icons.phishing_outlined;
    if (value == "phone") return Icons.phone;
    if (value == "phone_sharp") return Icons.phone_sharp;
    if (value == "phone_rounded") return Icons.phone_rounded;
    if (value == "phone_outlined") return Icons.phone_outlined;
    if (value == "phone_android") return Icons.phone_android;
    if (value == "phone_android_sharp") return Icons.phone_android_sharp;
    if (value == "phone_android_rounded") return Icons.phone_android_rounded;
    if (value == "phone_android_outlined") return Icons.phone_android_outlined;
    if (value == "phone_bluetooth_speaker")
      return Icons.phone_bluetooth_speaker;
    if (value == "phone_bluetooth_speaker_sharp")
      return Icons.phone_bluetooth_speaker_sharp;
    if (value == "phone_bluetooth_speaker_rounded")
      return Icons.phone_bluetooth_speaker_rounded;
    if (value == "phone_bluetooth_speaker_outlined")
      return Icons.phone_bluetooth_speaker_outlined;
    if (value == "phone_callback") return Icons.phone_callback;
    if (value == "phone_callback_sharp") return Icons.phone_callback_sharp;
    if (value == "phone_callback_rounded") return Icons.phone_callback_rounded;
    if (value == "phone_callback_outlined")
      return Icons.phone_callback_outlined;
    if (value == "phone_disabled") return Icons.phone_disabled;
    if (value == "phone_disabled_sharp") return Icons.phone_disabled_sharp;
    if (value == "phone_disabled_rounded") return Icons.phone_disabled_rounded;
    if (value == "phone_disabled_outlined")
      return Icons.phone_disabled_outlined;
    if (value == "phone_enabled") return Icons.phone_enabled;
    if (value == "phone_enabled_sharp") return Icons.phone_enabled_sharp;
    if (value == "phone_enabled_rounded") return Icons.phone_enabled_rounded;
    if (value == "phone_enabled_outlined") return Icons.phone_enabled_outlined;
    if (value == "phone_forwarded") return Icons.phone_forwarded;
    if (value == "phone_forwarded_sharp") return Icons.phone_forwarded_sharp;
    if (value == "phone_forwarded_rounded")
      return Icons.phone_forwarded_rounded;
    if (value == "phone_forwarded_outlined")
      return Icons.phone_forwarded_outlined;
    if (value == "phone_in_talk") return Icons.phone_in_talk;
    if (value == "phone_in_talk_sharp") return Icons.phone_in_talk_sharp;
    if (value == "phone_in_talk_rounded") return Icons.phone_in_talk_rounded;
    if (value == "phone_in_talk_outlined") return Icons.phone_in_talk_outlined;
    if (value == "phone_iphone") return Icons.phone_iphone;
    if (value == "phone_iphone_sharp") return Icons.phone_iphone_sharp;
    if (value == "phone_iphone_rounded") return Icons.phone_iphone_rounded;
    if (value == "phone_iphone_outlined") return Icons.phone_iphone_outlined;
    if (value == "phone_locked") return Icons.phone_locked;
    if (value == "phone_locked_sharp") return Icons.phone_locked_sharp;
    if (value == "phone_locked_rounded") return Icons.phone_locked_rounded;
    if (value == "phone_locked_outlined") return Icons.phone_locked_outlined;
    if (value == "phone_missed") return Icons.phone_missed;
    if (value == "phone_missed_sharp") return Icons.phone_missed_sharp;
    if (value == "phone_missed_rounded") return Icons.phone_missed_rounded;
    if (value == "phone_missed_outlined") return Icons.phone_missed_outlined;
    if (value == "phone_paused") return Icons.phone_paused;
    if (value == "phone_paused_sharp") return Icons.phone_paused_sharp;
    if (value == "phone_paused_rounded") return Icons.phone_paused_rounded;
    if (value == "phone_paused_outlined") return Icons.phone_paused_outlined;
    if (value == "phonelink") return Icons.phonelink;
    if (value == "phonelink_sharp") return Icons.phonelink_sharp;
    if (value == "phonelink_rounded") return Icons.phonelink_rounded;
    if (value == "phonelink_outlined") return Icons.phonelink_outlined;
    if (value == "phonelink_erase") return Icons.phonelink_erase;
    if (value == "phonelink_erase_sharp") return Icons.phonelink_erase_sharp;
    if (value == "phonelink_erase_rounded")
      return Icons.phonelink_erase_rounded;
    if (value == "phonelink_erase_outlined")
      return Icons.phonelink_erase_outlined;
    if (value == "phonelink_lock") return Icons.phonelink_lock;
    if (value == "phonelink_lock_sharp") return Icons.phonelink_lock_sharp;
    if (value == "phonelink_lock_rounded") return Icons.phonelink_lock_rounded;
    if (value == "phonelink_lock_outlined")
      return Icons.phonelink_lock_outlined;
    if (value == "phonelink_off") return Icons.phonelink_off;
    if (value == "phonelink_off_sharp") return Icons.phonelink_off_sharp;
    if (value == "phonelink_off_rounded") return Icons.phonelink_off_rounded;
    if (value == "phonelink_off_outlined") return Icons.phonelink_off_outlined;
    if (value == "phonelink_ring") return Icons.phonelink_ring;
    if (value == "phonelink_ring_sharp") return Icons.phonelink_ring_sharp;
    if (value == "phonelink_ring_rounded") return Icons.phonelink_ring_rounded;
    if (value == "phonelink_ring_outlined")
      return Icons.phonelink_ring_outlined;
    if (value == "phonelink_setup") return Icons.phonelink_setup;
    if (value == "phonelink_setup_sharp") return Icons.phonelink_setup_sharp;
    if (value == "phonelink_setup_rounded")
      return Icons.phonelink_setup_rounded;
    if (value == "phonelink_setup_outlined")
      return Icons.phonelink_setup_outlined;
    if (value == "photo") return Icons.photo;
    if (value == "photo_sharp") return Icons.photo_sharp;
    if (value == "photo_rounded") return Icons.photo_rounded;
    if (value == "photo_outlined") return Icons.photo_outlined;
    if (value == "photo_album") return Icons.photo_album;
    if (value == "photo_album_sharp") return Icons.photo_album_sharp;
    if (value == "photo_album_rounded") return Icons.photo_album_rounded;
    if (value == "photo_album_outlined") return Icons.photo_album_outlined;
    if (value == "photo_camera") return Icons.photo_camera;
    if (value == "photo_camera_sharp") return Icons.photo_camera_sharp;
    if (value == "photo_camera_rounded") return Icons.photo_camera_rounded;
    if (value == "photo_camera_outlined") return Icons.photo_camera_outlined;
    if (value == "photo_camera_back") return Icons.photo_camera_back;
    if (value == "photo_camera_back_sharp")
      return Icons.photo_camera_back_sharp;
    if (value == "photo_camera_back_rounded")
      return Icons.photo_camera_back_rounded;
    if (value == "photo_camera_back_outlined")
      return Icons.photo_camera_back_outlined;
    if (value == "photo_camera_front") return Icons.photo_camera_front;
    if (value == "photo_camera_front_sharp")
      return Icons.photo_camera_front_sharp;
    if (value == "photo_camera_front_rounded")
      return Icons.photo_camera_front_rounded;
    if (value == "photo_camera_front_outlined")
      return Icons.photo_camera_front_outlined;
    if (value == "photo_filter") return Icons.photo_filter;
    if (value == "photo_filter_sharp") return Icons.photo_filter_sharp;
    if (value == "photo_filter_rounded") return Icons.photo_filter_rounded;
    if (value == "photo_filter_outlined") return Icons.photo_filter_outlined;
    if (value == "photo_library") return Icons.photo_library;
    if (value == "photo_library_sharp") return Icons.photo_library_sharp;
    if (value == "photo_library_rounded") return Icons.photo_library_rounded;
    if (value == "photo_library_outlined") return Icons.photo_library_outlined;
    if (value == "photo_size_select_actual")
      return Icons.photo_size_select_actual;
    if (value == "photo_size_select_actual_sharp")
      return Icons.photo_size_select_actual_sharp;
    if (value == "photo_size_select_actual_rounded")
      return Icons.photo_size_select_actual_rounded;
    if (value == "photo_size_select_actual_outlined")
      return Icons.photo_size_select_actual_outlined;
    if (value == "photo_size_select_large")
      return Icons.photo_size_select_large;
    if (value == "photo_size_select_large_sharp")
      return Icons.photo_size_select_large_sharp;
    if (value == "photo_size_select_large_rounded")
      return Icons.photo_size_select_large_rounded;
    if (value == "photo_size_select_large_outlined")
      return Icons.photo_size_select_large_outlined;
    if (value == "photo_size_select_small")
      return Icons.photo_size_select_small;
    if (value == "photo_size_select_small_sharp")
      return Icons.photo_size_select_small_sharp;
    if (value == "photo_size_select_small_rounded")
      return Icons.photo_size_select_small_rounded;
    if (value == "photo_size_select_small_outlined")
      return Icons.photo_size_select_small_outlined;
    if (value == "php") return Icons.php;
    if (value == "php_sharp") return Icons.php_sharp;
    if (value == "php_rounded") return Icons.php_rounded;
    if (value == "php_outlined") return Icons.php_outlined;
    if (value == "piano") return Icons.piano;
    if (value == "piano_sharp") return Icons.piano_sharp;
    if (value == "piano_rounded") return Icons.piano_rounded;
    if (value == "piano_outlined") return Icons.piano_outlined;
    if (value == "piano_off") return Icons.piano_off;
    if (value == "piano_off_sharp") return Icons.piano_off_sharp;
    if (value == "piano_off_rounded") return Icons.piano_off_rounded;
    if (value == "piano_off_outlined") return Icons.piano_off_outlined;
    if (value == "picture_as_pdf") return Icons.picture_as_pdf;
    if (value == "picture_as_pdf_sharp") return Icons.picture_as_pdf_sharp;
    if (value == "picture_as_pdf_rounded") return Icons.picture_as_pdf_rounded;
    if (value == "picture_as_pdf_outlined")
      return Icons.picture_as_pdf_outlined;
    if (value == "picture_in_picture") return Icons.picture_in_picture;
    if (value == "picture_in_picture_sharp")
      return Icons.picture_in_picture_sharp;
    if (value == "picture_in_picture_rounded")
      return Icons.picture_in_picture_rounded;
    if (value == "picture_in_picture_outlined")
      return Icons.picture_in_picture_outlined;
    if (value == "picture_in_picture_alt") return Icons.picture_in_picture_alt;
    if (value == "picture_in_picture_alt_sharp")
      return Icons.picture_in_picture_alt_sharp;
    if (value == "picture_in_picture_alt_rounded")
      return Icons.picture_in_picture_alt_rounded;
    if (value == "picture_in_picture_alt_outlined")
      return Icons.picture_in_picture_alt_outlined;
    if (value == "pie_chart") return Icons.pie_chart;
    if (value == "pie_chart_sharp") return Icons.pie_chart_sharp;
    if (value == "pie_chart_rounded") return Icons.pie_chart_rounded;
    if (value == "pie_chart_outline") return Icons.pie_chart_outline;
    if (value == "pie_chart_outline_sharp")
      return Icons.pie_chart_outline_sharp;
    if (value == "pie_chart_outline_rounded")
      return Icons.pie_chart_outline_rounded;
    if (value == "pie_chart_outline_outlined")
      return Icons.pie_chart_outline_outlined;
    if (value == "pin") return Icons.pin;
    if (value == "pin_sharp") return Icons.pin_sharp;
    if (value == "pin_rounded") return Icons.pin_rounded;
    if (value == "pin_outlined") return Icons.pin_outlined;
    if (value == "pin_drop") return Icons.pin_drop;
    if (value == "pin_drop_sharp") return Icons.pin_drop_sharp;
    if (value == "pin_drop_rounded") return Icons.pin_drop_rounded;
    if (value == "pin_drop_outlined") return Icons.pin_drop_outlined;
    if (value == "pin_end") return Icons.pin_end;
    if (value == "pin_end_sharp") return Icons.pin_end_sharp;
    if (value == "pin_end_rounded") return Icons.pin_end_rounded;
    if (value == "pin_end_outlined") return Icons.pin_end_outlined;
    if (value == "pin_invoke") return Icons.pin_invoke;
    if (value == "pin_invoke_sharp") return Icons.pin_invoke_sharp;
    if (value == "pin_invoke_rounded") return Icons.pin_invoke_rounded;
    if (value == "pin_invoke_outlined") return Icons.pin_invoke_outlined;
    if (value == "pinch") return Icons.pinch;
    if (value == "pinch_sharp") return Icons.pinch_sharp;
    if (value == "pinch_rounded") return Icons.pinch_rounded;
    if (value == "pinch_outlined") return Icons.pinch_outlined;
    if (value == "pivot_table_chart") return Icons.pivot_table_chart;
    if (value == "pivot_table_chart_sharp")
      return Icons.pivot_table_chart_sharp;
    if (value == "pivot_table_chart_rounded")
      return Icons.pivot_table_chart_rounded;
    if (value == "pivot_table_chart_outlined")
      return Icons.pivot_table_chart_outlined;
    if (value == "pix") return Icons.pix;
    if (value == "pix_sharp") return Icons.pix_sharp;
    if (value == "pix_rounded") return Icons.pix_rounded;
    if (value == "pix_outlined") return Icons.pix_outlined;
    if (value == "place") return Icons.place;
    if (value == "place_sharp") return Icons.place_sharp;
    if (value == "place_rounded") return Icons.place_rounded;
    if (value == "place_outlined") return Icons.place_outlined;
    if (value == "plagiarism") return Icons.plagiarism;
    if (value == "plagiarism_sharp") return Icons.plagiarism_sharp;
    if (value == "plagiarism_rounded") return Icons.plagiarism_rounded;
    if (value == "plagiarism_outlined") return Icons.plagiarism_outlined;
    if (value == "play_arrow") return Icons.play_arrow;
    if (value == "play_arrow_sharp") return Icons.play_arrow_sharp;
    if (value == "play_arrow_rounded") return Icons.play_arrow_rounded;
    if (value == "play_arrow_outlined") return Icons.play_arrow_outlined;
    if (value == "play_circle") return Icons.play_circle;
    if (value == "play_circle_sharp") return Icons.play_circle_sharp;
    if (value == "play_circle_rounded") return Icons.play_circle_rounded;
    if (value == "play_circle_outlined") return Icons.play_circle_outlined;
    if (value == "play_circle_fill") return Icons.play_circle_fill;
    if (value == "play_circle_fill_sharp") return Icons.play_circle_fill_sharp;
    if (value == "play_circle_fill_rounded")
      return Icons.play_circle_fill_rounded;
    if (value == "play_circle_fill_outlined")
      return Icons.play_circle_fill_outlined;
    if (value == "play_circle_filled") return Icons.play_circle_filled;
    if (value == "play_circle_filled_sharp")
      return Icons.play_circle_filled_sharp;
    if (value == "play_circle_filled_rounded")
      return Icons.play_circle_filled_rounded;
    if (value == "play_circle_filled_outlined")
      return Icons.play_circle_filled_outlined;
    if (value == "play_circle_outline") return Icons.play_circle_outline;
    if (value == "play_circle_outline_sharp")
      return Icons.play_circle_outline_sharp;
    if (value == "play_circle_outline_rounded")
      return Icons.play_circle_outline_rounded;
    if (value == "play_circle_outline_outlined")
      return Icons.play_circle_outline_outlined;
    if (value == "play_disabled") return Icons.play_disabled;
    if (value == "play_disabled_sharp") return Icons.play_disabled_sharp;
    if (value == "play_disabled_rounded") return Icons.play_disabled_rounded;
    if (value == "play_disabled_outlined") return Icons.play_disabled_outlined;
    if (value == "play_for_work") return Icons.play_for_work;
    if (value == "play_for_work_sharp") return Icons.play_for_work_sharp;
    if (value == "play_for_work_rounded") return Icons.play_for_work_rounded;
    if (value == "play_for_work_outlined") return Icons.play_for_work_outlined;
    if (value == "play_lesson") return Icons.play_lesson;
    if (value == "play_lesson_sharp") return Icons.play_lesson_sharp;
    if (value == "play_lesson_rounded") return Icons.play_lesson_rounded;
    if (value == "play_lesson_outlined") return Icons.play_lesson_outlined;
    if (value == "playlist_add") return Icons.playlist_add;
    if (value == "playlist_add_sharp") return Icons.playlist_add_sharp;
    if (value == "playlist_add_rounded") return Icons.playlist_add_rounded;
    if (value == "playlist_add_outlined") return Icons.playlist_add_outlined;
    if (value == "playlist_add_check") return Icons.playlist_add_check;
    if (value == "playlist_add_check_sharp")
      return Icons.playlist_add_check_sharp;
    if (value == "playlist_add_check_rounded")
      return Icons.playlist_add_check_rounded;
    if (value == "playlist_add_check_outlined")
      return Icons.playlist_add_check_outlined;
    if (value == "playlist_add_check_circle")
      return Icons.playlist_add_check_circle;
    if (value == "playlist_add_check_circle_sharp")
      return Icons.playlist_add_check_circle_sharp;
    if (value == "playlist_add_check_circle_rounded")
      return Icons.playlist_add_check_circle_rounded;
    if (value == "playlist_add_check_circle_outlined")
      return Icons.playlist_add_check_circle_outlined;
    if (value == "playlist_add_circle") return Icons.playlist_add_circle;
    if (value == "playlist_add_circle_sharp")
      return Icons.playlist_add_circle_sharp;
    if (value == "playlist_add_circle_rounded")
      return Icons.playlist_add_circle_rounded;
    if (value == "playlist_add_circle_outlined")
      return Icons.playlist_add_circle_outlined;
    if (value == "playlist_play") return Icons.playlist_play;
    if (value == "playlist_play_sharp") return Icons.playlist_play_sharp;
    if (value == "playlist_play_rounded") return Icons.playlist_play_rounded;
    if (value == "playlist_play_outlined") return Icons.playlist_play_outlined;
    if (value == "playlist_remove") return Icons.playlist_remove;
    if (value == "playlist_remove_sharp") return Icons.playlist_remove_sharp;
    if (value == "playlist_remove_rounded")
      return Icons.playlist_remove_rounded;
    if (value == "playlist_remove_outlined")
      return Icons.playlist_remove_outlined;
    if (value == "plumbing") return Icons.plumbing;
    if (value == "plumbing_sharp") return Icons.plumbing_sharp;
    if (value == "plumbing_rounded") return Icons.plumbing_rounded;
    if (value == "plumbing_outlined") return Icons.plumbing_outlined;
    if (value == "plus_one") return Icons.plus_one;
    if (value == "plus_one_sharp") return Icons.plus_one_sharp;
    if (value == "plus_one_rounded") return Icons.plus_one_rounded;
    if (value == "plus_one_outlined") return Icons.plus_one_outlined;
    if (value == "podcasts") return Icons.podcasts;
    if (value == "podcasts_sharp") return Icons.podcasts_sharp;
    if (value == "podcasts_rounded") return Icons.podcasts_rounded;
    if (value == "podcasts_outlined") return Icons.podcasts_outlined;
    if (value == "point_of_sale") return Icons.point_of_sale;
    if (value == "point_of_sale_sharp") return Icons.point_of_sale_sharp;
    if (value == "point_of_sale_rounded") return Icons.point_of_sale_rounded;
    if (value == "point_of_sale_outlined") return Icons.point_of_sale_outlined;
    if (value == "policy") return Icons.policy;
    if (value == "policy_sharp") return Icons.policy_sharp;
    if (value == "policy_rounded") return Icons.policy_rounded;
    if (value == "policy_outlined") return Icons.policy_outlined;
    if (value == "poll") return Icons.poll;
    if (value == "poll_sharp") return Icons.poll_sharp;
    if (value == "poll_rounded") return Icons.poll_rounded;
    if (value == "poll_outlined") return Icons.poll_outlined;
    if (value == "polyline") return Icons.polyline;
    if (value == "polyline_sharp") return Icons.polyline_sharp;
    if (value == "polyline_rounded") return Icons.polyline_rounded;
    if (value == "polyline_outlined") return Icons.polyline_outlined;
    if (value == "polymer") return Icons.polymer;
    if (value == "polymer_sharp") return Icons.polymer_sharp;
    if (value == "polymer_rounded") return Icons.polymer_rounded;
    if (value == "polymer_outlined") return Icons.polymer_outlined;
    if (value == "pool") return Icons.pool;
    if (value == "pool_sharp") return Icons.pool_sharp;
    if (value == "pool_rounded") return Icons.pool_rounded;
    if (value == "pool_outlined") return Icons.pool_outlined;
    if (value == "portable_wifi_off") return Icons.portable_wifi_off;
    if (value == "portable_wifi_off_sharp")
      return Icons.portable_wifi_off_sharp;
    if (value == "portable_wifi_off_rounded")
      return Icons.portable_wifi_off_rounded;
    if (value == "portable_wifi_off_outlined")
      return Icons.portable_wifi_off_outlined;
    if (value == "portrait") return Icons.portrait;
    if (value == "portrait_sharp") return Icons.portrait_sharp;
    if (value == "portrait_rounded") return Icons.portrait_rounded;
    if (value == "portrait_outlined") return Icons.portrait_outlined;
    if (value == "post_add") return Icons.post_add;
    if (value == "post_add_sharp") return Icons.post_add_sharp;
    if (value == "post_add_rounded") return Icons.post_add_rounded;
    if (value == "post_add_outlined") return Icons.post_add_outlined;
    if (value == "power") return Icons.power;
    if (value == "power_sharp") return Icons.power_sharp;
    if (value == "power_rounded") return Icons.power_rounded;
    if (value == "power_outlined") return Icons.power_outlined;
    if (value == "power_input") return Icons.power_input;
    if (value == "power_input_sharp") return Icons.power_input_sharp;
    if (value == "power_input_rounded") return Icons.power_input_rounded;
    if (value == "power_input_outlined") return Icons.power_input_outlined;
    if (value == "power_off") return Icons.power_off;
    if (value == "power_off_sharp") return Icons.power_off_sharp;
    if (value == "power_off_rounded") return Icons.power_off_rounded;
    if (value == "power_off_outlined") return Icons.power_off_outlined;
    if (value == "power_settings_new") return Icons.power_settings_new;
    if (value == "power_settings_new_sharp")
      return Icons.power_settings_new_sharp;
    if (value == "power_settings_new_rounded")
      return Icons.power_settings_new_rounded;
    if (value == "power_settings_new_outlined")
      return Icons.power_settings_new_outlined;
    if (value == "precision_manufacturing")
      return Icons.precision_manufacturing;
    if (value == "precision_manufacturing_sharp")
      return Icons.precision_manufacturing_sharp;
    if (value == "precision_manufacturing_rounded")
      return Icons.precision_manufacturing_rounded;
    if (value == "precision_manufacturing_outlined")
      return Icons.precision_manufacturing_outlined;
    if (value == "pregnant_woman") return Icons.pregnant_woman;
    if (value == "pregnant_woman_sharp") return Icons.pregnant_woman_sharp;
    if (value == "pregnant_woman_rounded") return Icons.pregnant_woman_rounded;
    if (value == "pregnant_woman_outlined")
      return Icons.pregnant_woman_outlined;
    if (value == "present_to_all") return Icons.present_to_all;
    if (value == "present_to_all_sharp") return Icons.present_to_all_sharp;
    if (value == "present_to_all_rounded") return Icons.present_to_all_rounded;
    if (value == "present_to_all_outlined")
      return Icons.present_to_all_outlined;
    if (value == "preview") return Icons.preview;
    if (value == "preview_sharp") return Icons.preview_sharp;
    if (value == "preview_rounded") return Icons.preview_rounded;
    if (value == "preview_outlined") return Icons.preview_outlined;
    if (value == "price_change") return Icons.price_change;
    if (value == "price_change_sharp") return Icons.price_change_sharp;
    if (value == "price_change_rounded") return Icons.price_change_rounded;
    if (value == "price_change_outlined") return Icons.price_change_outlined;
    if (value == "price_check") return Icons.price_check;
    if (value == "price_check_sharp") return Icons.price_check_sharp;
    if (value == "price_check_rounded") return Icons.price_check_rounded;
    if (value == "price_check_outlined") return Icons.price_check_outlined;
    if (value == "print") return Icons.print;
    if (value == "print_sharp") return Icons.print_sharp;
    if (value == "print_rounded") return Icons.print_rounded;
    if (value == "print_outlined") return Icons.print_outlined;
    if (value == "print_disabled") return Icons.print_disabled;
    if (value == "print_disabled_sharp") return Icons.print_disabled_sharp;
    if (value == "print_disabled_rounded") return Icons.print_disabled_rounded;
    if (value == "print_disabled_outlined")
      return Icons.print_disabled_outlined;
    if (value == "priority_high") return Icons.priority_high;
    if (value == "priority_high_sharp") return Icons.priority_high_sharp;
    if (value == "priority_high_rounded") return Icons.priority_high_rounded;
    if (value == "priority_high_outlined") return Icons.priority_high_outlined;
    if (value == "privacy_tip") return Icons.privacy_tip;
    if (value == "privacy_tip_sharp") return Icons.privacy_tip_sharp;
    if (value == "privacy_tip_rounded") return Icons.privacy_tip_rounded;
    if (value == "privacy_tip_outlined") return Icons.privacy_tip_outlined;
    if (value == "private_connectivity") return Icons.private_connectivity;
    if (value == "private_connectivity_sharp")
      return Icons.private_connectivity_sharp;
    if (value == "private_connectivity_rounded")
      return Icons.private_connectivity_rounded;
    if (value == "private_connectivity_outlined")
      return Icons.private_connectivity_outlined;
    if (value == "production_quantity_limits")
      return Icons.production_quantity_limits;
    if (value == "production_quantity_limits_sharp")
      return Icons.production_quantity_limits_sharp;
    if (value == "production_quantity_limits_rounded")
      return Icons.production_quantity_limits_rounded;
    if (value == "production_quantity_limits_outlined")
      return Icons.production_quantity_limits_outlined;
    if (value == "propane") return Icons.propane;
    if (value == "propane_sharp") return Icons.propane_sharp;
    if (value == "propane_rounded") return Icons.propane_rounded;
    if (value == "propane_outlined") return Icons.propane_outlined;
    if (value == "propane_tank") return Icons.propane_tank;
    if (value == "propane_tank_sharp") return Icons.propane_tank_sharp;
    if (value == "propane_tank_rounded") return Icons.propane_tank_rounded;
    if (value == "propane_tank_outlined") return Icons.propane_tank_outlined;
    if (value == "psychology") return Icons.psychology;
    if (value == "psychology_sharp") return Icons.psychology_sharp;
    if (value == "psychology_rounded") return Icons.psychology_rounded;
    if (value == "psychology_outlined") return Icons.psychology_outlined;
    if (value == "public") return Icons.public;
    if (value == "public_sharp") return Icons.public_sharp;
    if (value == "public_rounded") return Icons.public_rounded;
    if (value == "public_outlined") return Icons.public_outlined;
    if (value == "public_off") return Icons.public_off;
    if (value == "public_off_sharp") return Icons.public_off_sharp;
    if (value == "public_off_rounded") return Icons.public_off_rounded;
    if (value == "public_off_outlined") return Icons.public_off_outlined;
    if (value == "publish") return Icons.publish;
    if (value == "publish_sharp") return Icons.publish_sharp;
    if (value == "publish_rounded") return Icons.publish_rounded;
    if (value == "publish_outlined") return Icons.publish_outlined;
    if (value == "published_with_changes") return Icons.published_with_changes;
    if (value == "published_with_changes_sharp")
      return Icons.published_with_changes_sharp;
    if (value == "published_with_changes_rounded")
      return Icons.published_with_changes_rounded;
    if (value == "published_with_changes_outlined")
      return Icons.published_with_changes_outlined;
    if (value == "punch_clock") return Icons.punch_clock;
    if (value == "punch_clock_sharp") return Icons.punch_clock_sharp;
    if (value == "punch_clock_rounded") return Icons.punch_clock_rounded;
    if (value == "punch_clock_outlined") return Icons.punch_clock_outlined;
    if (value == "push_pin") return Icons.push_pin;
    if (value == "push_pin_sharp") return Icons.push_pin_sharp;
    if (value == "push_pin_rounded") return Icons.push_pin_rounded;
    if (value == "push_pin_outlined") return Icons.push_pin_outlined;
    if (value == "qr_code") return Icons.qr_code;
    if (value == "qr_code_sharp") return Icons.qr_code_sharp;
    if (value == "qr_code_rounded") return Icons.qr_code_rounded;
    if (value == "qr_code_outlined") return Icons.qr_code_outlined;
    if (value == "qr_code_2") return Icons.qr_code_2;
    if (value == "qr_code_2_sharp") return Icons.qr_code_2_sharp;
    if (value == "qr_code_2_rounded") return Icons.qr_code_2_rounded;
    if (value == "qr_code_2_outlined") return Icons.qr_code_2_outlined;
    if (value == "qr_code_scanner") return Icons.qr_code_scanner;
    if (value == "qr_code_scanner_sharp") return Icons.qr_code_scanner_sharp;
    if (value == "qr_code_scanner_rounded")
      return Icons.qr_code_scanner_rounded;
    if (value == "qr_code_scanner_outlined")
      return Icons.qr_code_scanner_outlined;
    if (value == "query_builder") return Icons.query_builder;
    if (value == "query_builder_sharp") return Icons.query_builder_sharp;
    if (value == "query_builder_rounded") return Icons.query_builder_rounded;
    if (value == "query_builder_outlined") return Icons.query_builder_outlined;
    if (value == "query_stats") return Icons.query_stats;
    if (value == "query_stats_sharp") return Icons.query_stats_sharp;
    if (value == "query_stats_rounded") return Icons.query_stats_rounded;
    if (value == "query_stats_outlined") return Icons.query_stats_outlined;
    if (value == "question_answer") return Icons.question_answer;
    if (value == "question_answer_sharp") return Icons.question_answer_sharp;
    if (value == "question_answer_rounded")
      return Icons.question_answer_rounded;
    if (value == "question_answer_outlined")
      return Icons.question_answer_outlined;
    if (value == "question_mark") return Icons.question_mark;
    if (value == "question_mark_sharp") return Icons.question_mark_sharp;
    if (value == "question_mark_rounded") return Icons.question_mark_rounded;
    if (value == "question_mark_outlined") return Icons.question_mark_outlined;
    if (value == "queue") return Icons.queue;
    if (value == "queue_sharp") return Icons.queue_sharp;
    if (value == "queue_rounded") return Icons.queue_rounded;
    if (value == "queue_outlined") return Icons.queue_outlined;
    if (value == "queue_music") return Icons.queue_music;
    if (value == "queue_music_sharp") return Icons.queue_music_sharp;
    if (value == "queue_music_rounded") return Icons.queue_music_rounded;
    if (value == "queue_music_outlined") return Icons.queue_music_outlined;
    if (value == "queue_play_next") return Icons.queue_play_next;
    if (value == "queue_play_next_sharp") return Icons.queue_play_next_sharp;
    if (value == "queue_play_next_rounded")
      return Icons.queue_play_next_rounded;
    if (value == "queue_play_next_outlined")
      return Icons.queue_play_next_outlined;
    if (value == "quick_contacts_dialer") return Icons.quick_contacts_dialer;
    if (value == "quick_contacts_dialer_sharp")
      return Icons.quick_contacts_dialer_sharp;
    if (value == "quick_contacts_dialer_rounded")
      return Icons.quick_contacts_dialer_rounded;
    if (value == "quick_contacts_dialer_outlined")
      return Icons.quick_contacts_dialer_outlined;
    if (value == "quick_contacts_mail") return Icons.quick_contacts_mail;
    if (value == "quick_contacts_mail_sharp")
      return Icons.quick_contacts_mail_sharp;
    if (value == "quick_contacts_mail_rounded")
      return Icons.quick_contacts_mail_rounded;
    if (value == "quick_contacts_mail_outlined")
      return Icons.quick_contacts_mail_outlined;
    if (value == "quickreply") return Icons.quickreply;
    if (value == "quickreply_sharp") return Icons.quickreply_sharp;
    if (value == "quickreply_rounded") return Icons.quickreply_rounded;
    if (value == "quickreply_outlined") return Icons.quickreply_outlined;
    if (value == "quiz") return Icons.quiz;
    if (value == "quiz_sharp") return Icons.quiz_sharp;
    if (value == "quiz_rounded") return Icons.quiz_rounded;
    if (value == "quiz_outlined") return Icons.quiz_outlined;
    if (value == "quora") return Icons.quora;
    if (value == "quora_sharp") return Icons.quora_sharp;
    if (value == "quora_rounded") return Icons.quora_rounded;
    if (value == "quora_outlined") return Icons.quora_outlined;
    if (value == "r_mobiledata") return Icons.r_mobiledata;
    if (value == "r_mobiledata_sharp") return Icons.r_mobiledata_sharp;
    if (value == "r_mobiledata_rounded") return Icons.r_mobiledata_rounded;
    if (value == "r_mobiledata_outlined") return Icons.r_mobiledata_outlined;
    if (value == "radar") return Icons.radar;
    if (value == "radar_sharp") return Icons.radar_sharp;
    if (value == "radar_rounded") return Icons.radar_rounded;
    if (value == "radar_outlined") return Icons.radar_outlined;
    if (value == "radio") return Icons.radio;
    if (value == "radio_sharp") return Icons.radio_sharp;
    if (value == "radio_rounded") return Icons.radio_rounded;
    if (value == "radio_outlined") return Icons.radio_outlined;
    if (value == "radio_button_checked") return Icons.radio_button_checked;
    if (value == "radio_button_checked_sharp")
      return Icons.radio_button_checked_sharp;
    if (value == "radio_button_checked_rounded")
      return Icons.radio_button_checked_rounded;
    if (value == "radio_button_checked_outlined")
      return Icons.radio_button_checked_outlined;
    if (value == "radio_button_off") return Icons.radio_button_off;
    if (value == "radio_button_off_sharp") return Icons.radio_button_off_sharp;
    if (value == "radio_button_off_rounded")
      return Icons.radio_button_off_rounded;
    if (value == "radio_button_off_outlined")
      return Icons.radio_button_off_outlined;
    if (value == "radio_button_on") return Icons.radio_button_on;
    if (value == "radio_button_on_sharp") return Icons.radio_button_on_sharp;
    if (value == "radio_button_on_rounded")
      return Icons.radio_button_on_rounded;
    if (value == "radio_button_on_outlined")
      return Icons.radio_button_on_outlined;
    if (value == "radio_button_unchecked") return Icons.radio_button_unchecked;
    if (value == "radio_button_unchecked_sharp")
      return Icons.radio_button_unchecked_sharp;
    if (value == "radio_button_unchecked_rounded")
      return Icons.radio_button_unchecked_rounded;
    if (value == "radio_button_unchecked_outlined")
      return Icons.radio_button_unchecked_outlined;
    if (value == "railway_alert") return Icons.railway_alert;
    if (value == "railway_alert_sharp") return Icons.railway_alert_sharp;
    if (value == "railway_alert_rounded") return Icons.railway_alert_rounded;
    if (value == "railway_alert_outlined") return Icons.railway_alert_outlined;
    if (value == "ramen_dining") return Icons.ramen_dining;
    if (value == "ramen_dining_sharp") return Icons.ramen_dining_sharp;
    if (value == "ramen_dining_rounded") return Icons.ramen_dining_rounded;
    if (value == "ramen_dining_outlined") return Icons.ramen_dining_outlined;
    if (value == "ramp_left") return Icons.ramp_left;
    if (value == "ramp_left_sharp") return Icons.ramp_left_sharp;
    if (value == "ramp_left_rounded") return Icons.ramp_left_rounded;
    if (value == "ramp_left_outlined") return Icons.ramp_left_outlined;
    if (value == "ramp_right") return Icons.ramp_right;
    if (value == "ramp_right_sharp") return Icons.ramp_right_sharp;
    if (value == "ramp_right_rounded") return Icons.ramp_right_rounded;
    if (value == "ramp_right_outlined") return Icons.ramp_right_outlined;
    if (value == "rate_review") return Icons.rate_review;
    if (value == "rate_review_sharp") return Icons.rate_review_sharp;
    if (value == "rate_review_rounded") return Icons.rate_review_rounded;
    if (value == "rate_review_outlined") return Icons.rate_review_outlined;
    if (value == "raw_off") return Icons.raw_off;
    if (value == "raw_off_sharp") return Icons.raw_off_sharp;
    if (value == "raw_off_rounded") return Icons.raw_off_rounded;
    if (value == "raw_off_outlined") return Icons.raw_off_outlined;
    if (value == "raw_on") return Icons.raw_on;
    if (value == "raw_on_sharp") return Icons.raw_on_sharp;
    if (value == "raw_on_rounded") return Icons.raw_on_rounded;
    if (value == "raw_on_outlined") return Icons.raw_on_outlined;
    if (value == "read_more") return Icons.read_more;
    if (value == "read_more_sharp") return Icons.read_more_sharp;
    if (value == "read_more_rounded") return Icons.read_more_rounded;
    if (value == "read_more_outlined") return Icons.read_more_outlined;
    if (value == "real_estate_agent") return Icons.real_estate_agent;
    if (value == "real_estate_agent_sharp")
      return Icons.real_estate_agent_sharp;
    if (value == "real_estate_agent_rounded")
      return Icons.real_estate_agent_rounded;
    if (value == "real_estate_agent_outlined")
      return Icons.real_estate_agent_outlined;
    if (value == "receipt") return Icons.receipt;
    if (value == "receipt_sharp") return Icons.receipt_sharp;
    if (value == "receipt_rounded") return Icons.receipt_rounded;
    if (value == "receipt_outlined") return Icons.receipt_outlined;
    if (value == "receipt_long") return Icons.receipt_long;
    if (value == "receipt_long_sharp") return Icons.receipt_long_sharp;
    if (value == "receipt_long_rounded") return Icons.receipt_long_rounded;
    if (value == "receipt_long_outlined") return Icons.receipt_long_outlined;
    if (value == "recent_actors") return Icons.recent_actors;
    if (value == "recent_actors_sharp") return Icons.recent_actors_sharp;
    if (value == "recent_actors_rounded") return Icons.recent_actors_rounded;
    if (value == "recent_actors_outlined") return Icons.recent_actors_outlined;
    if (value == "recommend") return Icons.recommend;
    if (value == "recommend_sharp") return Icons.recommend_sharp;
    if (value == "recommend_rounded") return Icons.recommend_rounded;
    if (value == "recommend_outlined") return Icons.recommend_outlined;
    if (value == "record_voice_over") return Icons.record_voice_over;
    if (value == "record_voice_over_sharp")
      return Icons.record_voice_over_sharp;
    if (value == "record_voice_over_rounded")
      return Icons.record_voice_over_rounded;
    if (value == "record_voice_over_outlined")
      return Icons.record_voice_over_outlined;
    if (value == "rectangle") return Icons.rectangle;
    if (value == "rectangle_sharp") return Icons.rectangle_sharp;
    if (value == "rectangle_rounded") return Icons.rectangle_rounded;
    if (value == "rectangle_outlined") return Icons.rectangle_outlined;
    if (value == "recycling") return Icons.recycling;
    if (value == "recycling_sharp") return Icons.recycling_sharp;
    if (value == "recycling_rounded") return Icons.recycling_rounded;
    if (value == "recycling_outlined") return Icons.recycling_outlined;
    if (value == "reddit") return Icons.reddit;
    if (value == "reddit_sharp") return Icons.reddit_sharp;
    if (value == "reddit_rounded") return Icons.reddit_rounded;
    if (value == "reddit_outlined") return Icons.reddit_outlined;
    if (value == "redeem") return Icons.redeem;
    if (value == "redeem_sharp") return Icons.redeem_sharp;
    if (value == "redeem_rounded") return Icons.redeem_rounded;
    if (value == "redeem_outlined") return Icons.redeem_outlined;
    if (value == "redo") return Icons.redo;
    if (value == "redo_sharp") return Icons.redo_sharp;
    if (value == "redo_rounded") return Icons.redo_rounded;
    if (value == "redo_outlined") return Icons.redo_outlined;
    if (value == "reduce_capacity") return Icons.reduce_capacity;
    if (value == "reduce_capacity_sharp") return Icons.reduce_capacity_sharp;
    if (value == "reduce_capacity_rounded")
      return Icons.reduce_capacity_rounded;
    if (value == "reduce_capacity_outlined")
      return Icons.reduce_capacity_outlined;
    if (value == "refresh") return Icons.refresh;
    if (value == "refresh_sharp") return Icons.refresh_sharp;
    if (value == "refresh_rounded") return Icons.refresh_rounded;
    if (value == "refresh_outlined") return Icons.refresh_outlined;
    if (value == "remember_me") return Icons.remember_me;
    if (value == "remember_me_sharp") return Icons.remember_me_sharp;
    if (value == "remember_me_rounded") return Icons.remember_me_rounded;
    if (value == "remember_me_outlined") return Icons.remember_me_outlined;
    if (value == "remove") return Icons.remove;
    if (value == "remove_sharp") return Icons.remove_sharp;
    if (value == "remove_rounded") return Icons.remove_rounded;
    if (value == "remove_outlined") return Icons.remove_outlined;
    if (value == "remove_circle") return Icons.remove_circle;
    if (value == "remove_circle_sharp") return Icons.remove_circle_sharp;
    if (value == "remove_circle_rounded") return Icons.remove_circle_rounded;
    if (value == "remove_circle_outlined") return Icons.remove_circle_outlined;
    if (value == "remove_circle_outline") return Icons.remove_circle_outline;
    if (value == "remove_circle_outline_sharp")
      return Icons.remove_circle_outline_sharp;
    if (value == "remove_circle_outline_rounded")
      return Icons.remove_circle_outline_rounded;
    if (value == "remove_circle_outline_outlined")
      return Icons.remove_circle_outline_outlined;
    if (value == "remove_done") return Icons.remove_done;
    if (value == "remove_done_sharp") return Icons.remove_done_sharp;
    if (value == "remove_done_rounded") return Icons.remove_done_rounded;
    if (value == "remove_done_outlined") return Icons.remove_done_outlined;
    if (value == "remove_from_queue") return Icons.remove_from_queue;
    if (value == "remove_from_queue_sharp")
      return Icons.remove_from_queue_sharp;
    if (value == "remove_from_queue_rounded")
      return Icons.remove_from_queue_rounded;
    if (value == "remove_from_queue_outlined")
      return Icons.remove_from_queue_outlined;
    if (value == "remove_moderator") return Icons.remove_moderator;
    if (value == "remove_moderator_sharp") return Icons.remove_moderator_sharp;
    if (value == "remove_moderator_rounded")
      return Icons.remove_moderator_rounded;
    if (value == "remove_moderator_outlined")
      return Icons.remove_moderator_outlined;
    if (value == "remove_red_eye") return Icons.remove_red_eye;
    if (value == "remove_red_eye_sharp") return Icons.remove_red_eye_sharp;
    if (value == "remove_red_eye_rounded") return Icons.remove_red_eye_rounded;
    if (value == "remove_red_eye_outlined")
      return Icons.remove_red_eye_outlined;
    if (value == "remove_road") return Icons.remove_road;
    if (value == "remove_road_sharp") return Icons.remove_road_sharp;
    if (value == "remove_road_rounded") return Icons.remove_road_rounded;
    if (value == "remove_road_outlined") return Icons.remove_road_outlined;
    if (value == "remove_shopping_cart") return Icons.remove_shopping_cart;
    if (value == "remove_shopping_cart_sharp")
      return Icons.remove_shopping_cart_sharp;
    if (value == "remove_shopping_cart_rounded")
      return Icons.remove_shopping_cart_rounded;
    if (value == "remove_shopping_cart_outlined")
      return Icons.remove_shopping_cart_outlined;
    if (value == "reorder") return Icons.reorder;
    if (value == "reorder_sharp") return Icons.reorder_sharp;
    if (value == "reorder_rounded") return Icons.reorder_rounded;
    if (value == "reorder_outlined") return Icons.reorder_outlined;
    if (value == "repeat") return Icons.repeat;
    if (value == "repeat_sharp") return Icons.repeat_sharp;
    if (value == "repeat_rounded") return Icons.repeat_rounded;
    if (value == "repeat_outlined") return Icons.repeat_outlined;
    if (value == "repeat_on") return Icons.repeat_on;
    if (value == "repeat_on_sharp") return Icons.repeat_on_sharp;
    if (value == "repeat_on_rounded") return Icons.repeat_on_rounded;
    if (value == "repeat_on_outlined") return Icons.repeat_on_outlined;
    if (value == "repeat_one") return Icons.repeat_one;
    if (value == "repeat_one_sharp") return Icons.repeat_one_sharp;
    if (value == "repeat_one_rounded") return Icons.repeat_one_rounded;
    if (value == "repeat_one_outlined") return Icons.repeat_one_outlined;
    if (value == "repeat_one_on") return Icons.repeat_one_on;
    if (value == "repeat_one_on_sharp") return Icons.repeat_one_on_sharp;
    if (value == "repeat_one_on_rounded") return Icons.repeat_one_on_rounded;
    if (value == "repeat_one_on_outlined") return Icons.repeat_one_on_outlined;
    if (value == "replay") return Icons.replay;
    if (value == "replay_sharp") return Icons.replay_sharp;
    if (value == "replay_rounded") return Icons.replay_rounded;
    if (value == "replay_outlined") return Icons.replay_outlined;
    if (value == "replay_10") return Icons.replay_10;
    if (value == "replay_10_sharp") return Icons.replay_10_sharp;
    if (value == "replay_10_rounded") return Icons.replay_10_rounded;
    if (value == "replay_10_outlined") return Icons.replay_10_outlined;
    if (value == "replay_30") return Icons.replay_30;
    if (value == "replay_30_sharp") return Icons.replay_30_sharp;
    if (value == "replay_30_rounded") return Icons.replay_30_rounded;
    if (value == "replay_30_outlined") return Icons.replay_30_outlined;
    if (value == "replay_5") return Icons.replay_5;
    if (value == "replay_5_sharp") return Icons.replay_5_sharp;
    if (value == "replay_5_rounded") return Icons.replay_5_rounded;
    if (value == "replay_5_outlined") return Icons.replay_5_outlined;
    if (value == "replay_circle_filled") return Icons.replay_circle_filled;
    if (value == "replay_circle_filled_sharp")
      return Icons.replay_circle_filled_sharp;
    if (value == "replay_circle_filled_rounded")
      return Icons.replay_circle_filled_rounded;
    if (value == "replay_circle_filled_outlined")
      return Icons.replay_circle_filled_outlined;
    if (value == "reply") return Icons.reply;
    if (value == "reply_sharp") return Icons.reply_sharp;
    if (value == "reply_rounded") return Icons.reply_rounded;
    if (value == "reply_outlined") return Icons.reply_outlined;
    if (value == "reply_all") return Icons.reply_all;
    if (value == "reply_all_sharp") return Icons.reply_all_sharp;
    if (value == "reply_all_rounded") return Icons.reply_all_rounded;
    if (value == "reply_all_outlined") return Icons.reply_all_outlined;
    if (value == "report") return Icons.report;
    if (value == "report_sharp") return Icons.report_sharp;
    if (value == "report_rounded") return Icons.report_rounded;
    if (value == "report_outlined") return Icons.report_outlined;
    if (value == "report_gmailerrorred") return Icons.report_gmailerrorred;
    if (value == "report_gmailerrorred_sharp")
      return Icons.report_gmailerrorred_sharp;
    if (value == "report_gmailerrorred_rounded")
      return Icons.report_gmailerrorred_rounded;
    if (value == "report_gmailerrorred_outlined")
      return Icons.report_gmailerrorred_outlined;
    if (value == "report_off") return Icons.report_off;
    if (value == "report_off_sharp") return Icons.report_off_sharp;
    if (value == "report_off_rounded") return Icons.report_off_rounded;
    if (value == "report_off_outlined") return Icons.report_off_outlined;
    if (value == "report_problem") return Icons.report_problem;
    if (value == "report_problem_sharp") return Icons.report_problem_sharp;
    if (value == "report_problem_rounded") return Icons.report_problem_rounded;
    if (value == "report_problem_outlined")
      return Icons.report_problem_outlined;
    if (value == "request_page") return Icons.request_page;
    if (value == "request_page_sharp") return Icons.request_page_sharp;
    if (value == "request_page_rounded") return Icons.request_page_rounded;
    if (value == "request_page_outlined") return Icons.request_page_outlined;
    if (value == "request_quote") return Icons.request_quote;
    if (value == "request_quote_sharp") return Icons.request_quote_sharp;
    if (value == "request_quote_rounded") return Icons.request_quote_rounded;
    if (value == "request_quote_outlined") return Icons.request_quote_outlined;
    if (value == "reset_tv") return Icons.reset_tv;
    if (value == "reset_tv_sharp") return Icons.reset_tv_sharp;
    if (value == "reset_tv_rounded") return Icons.reset_tv_rounded;
    if (value == "reset_tv_outlined") return Icons.reset_tv_outlined;
    if (value == "restart_alt") return Icons.restart_alt;
    if (value == "restart_alt_sharp") return Icons.restart_alt_sharp;
    if (value == "restart_alt_rounded") return Icons.restart_alt_rounded;
    if (value == "restart_alt_outlined") return Icons.restart_alt_outlined;
    if (value == "restaurant") return Icons.restaurant;
    if (value == "restaurant_sharp") return Icons.restaurant_sharp;
    if (value == "restaurant_rounded") return Icons.restaurant_rounded;
    if (value == "restaurant_outlined") return Icons.restaurant_outlined;
    if (value == "restaurant_menu") return Icons.restaurant_menu;
    if (value == "restaurant_menu_sharp") return Icons.restaurant_menu_sharp;
    if (value == "restaurant_menu_rounded")
      return Icons.restaurant_menu_rounded;
    if (value == "restaurant_menu_outlined")
      return Icons.restaurant_menu_outlined;
    if (value == "restore") return Icons.restore;
    if (value == "restore_sharp") return Icons.restore_sharp;
    if (value == "restore_rounded") return Icons.restore_rounded;
    if (value == "restore_outlined") return Icons.restore_outlined;
    if (value == "restore_from_trash") return Icons.restore_from_trash;
    if (value == "restore_from_trash_sharp")
      return Icons.restore_from_trash_sharp;
    if (value == "restore_from_trash_rounded")
      return Icons.restore_from_trash_rounded;
    if (value == "restore_from_trash_outlined")
      return Icons.restore_from_trash_outlined;
    if (value == "restore_page") return Icons.restore_page;
    if (value == "restore_page_sharp") return Icons.restore_page_sharp;
    if (value == "restore_page_rounded") return Icons.restore_page_rounded;
    if (value == "restore_page_outlined") return Icons.restore_page_outlined;
    if (value == "reviews") return Icons.reviews;
    if (value == "reviews_sharp") return Icons.reviews_sharp;
    if (value == "reviews_rounded") return Icons.reviews_rounded;
    if (value == "reviews_outlined") return Icons.reviews_outlined;
    if (value == "rice_bowl") return Icons.rice_bowl;
    if (value == "rice_bowl_sharp") return Icons.rice_bowl_sharp;
    if (value == "rice_bowl_rounded") return Icons.rice_bowl_rounded;
    if (value == "rice_bowl_outlined") return Icons.rice_bowl_outlined;
    if (value == "ring_volume") return Icons.ring_volume;
    if (value == "ring_volume_sharp") return Icons.ring_volume_sharp;
    if (value == "ring_volume_rounded") return Icons.ring_volume_rounded;
    if (value == "ring_volume_outlined") return Icons.ring_volume_outlined;
    if (value == "rocket") return Icons.rocket;
    if (value == "rocket_sharp") return Icons.rocket_sharp;
    if (value == "rocket_rounded") return Icons.rocket_rounded;
    if (value == "rocket_outlined") return Icons.rocket_outlined;
    if (value == "rocket_launch") return Icons.rocket_launch;
    if (value == "rocket_launch_sharp") return Icons.rocket_launch_sharp;
    if (value == "rocket_launch_rounded") return Icons.rocket_launch_rounded;
    if (value == "rocket_launch_outlined") return Icons.rocket_launch_outlined;
    if (value == "roller_shades") return Icons.roller_shades;
    if (value == "roller_shades_sharp") return Icons.roller_shades_sharp;
    if (value == "roller_shades_rounded") return Icons.roller_shades_rounded;
    if (value == "roller_shades_outlined") return Icons.roller_shades_outlined;
    if (value == "roller_shades_closed") return Icons.roller_shades_closed;
    if (value == "roller_shades_closed_sharp")
      return Icons.roller_shades_closed_sharp;
    if (value == "roller_shades_closed_rounded")
      return Icons.roller_shades_closed_rounded;
    if (value == "roller_shades_closed_outlined")
      return Icons.roller_shades_closed_outlined;
    if (value == "roller_skating") return Icons.roller_skating;
    if (value == "roller_skating_sharp") return Icons.roller_skating_sharp;
    if (value == "roller_skating_rounded") return Icons.roller_skating_rounded;
    if (value == "roller_skating_outlined")
      return Icons.roller_skating_outlined;
    if (value == "roofing") return Icons.roofing;
    if (value == "roofing_sharp") return Icons.roofing_sharp;
    if (value == "roofing_rounded") return Icons.roofing_rounded;
    if (value == "roofing_outlined") return Icons.roofing_outlined;
    if (value == "room") return Icons.room;
    if (value == "room_sharp") return Icons.room_sharp;
    if (value == "room_rounded") return Icons.room_rounded;
    if (value == "room_outlined") return Icons.room_outlined;
    if (value == "room_preferences") return Icons.room_preferences;
    if (value == "room_preferences_sharp") return Icons.room_preferences_sharp;
    if (value == "room_preferences_rounded")
      return Icons.room_preferences_rounded;
    if (value == "room_preferences_outlined")
      return Icons.room_preferences_outlined;
    if (value == "room_service") return Icons.room_service;
    if (value == "room_service_sharp") return Icons.room_service_sharp;
    if (value == "room_service_rounded") return Icons.room_service_rounded;
    if (value == "room_service_outlined") return Icons.room_service_outlined;
    if (value == "rotate_90_degrees_ccw") return Icons.rotate_90_degrees_ccw;
    if (value == "rotate_90_degrees_ccw_sharp")
      return Icons.rotate_90_degrees_ccw_sharp;
    if (value == "rotate_90_degrees_ccw_rounded")
      return Icons.rotate_90_degrees_ccw_rounded;
    if (value == "rotate_90_degrees_ccw_outlined")
      return Icons.rotate_90_degrees_ccw_outlined;
    if (value == "rotate_90_degrees_cw") return Icons.rotate_90_degrees_cw;
    if (value == "rotate_90_degrees_cw_sharp")
      return Icons.rotate_90_degrees_cw_sharp;
    if (value == "rotate_90_degrees_cw_rounded")
      return Icons.rotate_90_degrees_cw_rounded;
    if (value == "rotate_90_degrees_cw_outlined")
      return Icons.rotate_90_degrees_cw_outlined;
    if (value == "rotate_left") return Icons.rotate_left;
    if (value == "rotate_left_sharp") return Icons.rotate_left_sharp;
    if (value == "rotate_left_rounded") return Icons.rotate_left_rounded;
    if (value == "rotate_left_outlined") return Icons.rotate_left_outlined;
    if (value == "rotate_right") return Icons.rotate_right;
    if (value == "rotate_right_sharp") return Icons.rotate_right_sharp;
    if (value == "rotate_right_rounded") return Icons.rotate_right_rounded;
    if (value == "rotate_right_outlined") return Icons.rotate_right_outlined;
    if (value == "roundabout_left") return Icons.roundabout_left;
    if (value == "roundabout_left_sharp") return Icons.roundabout_left_sharp;
    if (value == "roundabout_left_rounded")
      return Icons.roundabout_left_rounded;
    if (value == "roundabout_left_outlined")
      return Icons.roundabout_left_outlined;
    if (value == "roundabout_right") return Icons.roundabout_right;
    if (value == "roundabout_right_sharp") return Icons.roundabout_right_sharp;
    if (value == "roundabout_right_rounded")
      return Icons.roundabout_right_rounded;
    if (value == "roundabout_right_outlined")
      return Icons.roundabout_right_outlined;
    if (value == "rounded_corner") return Icons.rounded_corner;
    if (value == "rounded_corner_sharp") return Icons.rounded_corner_sharp;
    if (value == "rounded_corner_rounded") return Icons.rounded_corner_rounded;
    if (value == "rounded_corner_outlined")
      return Icons.rounded_corner_outlined;
    if (value == "route") return Icons.route;
    if (value == "route_sharp") return Icons.route_sharp;
    if (value == "route_rounded") return Icons.route_rounded;
    if (value == "route_outlined") return Icons.route_outlined;
    if (value == "router") return Icons.router;
    if (value == "router_sharp") return Icons.router_sharp;
    if (value == "router_rounded") return Icons.router_rounded;
    if (value == "router_outlined") return Icons.router_outlined;
    if (value == "rowing") return Icons.rowing;
    if (value == "rowing_sharp") return Icons.rowing_sharp;
    if (value == "rowing_rounded") return Icons.rowing_rounded;
    if (value == "rowing_outlined") return Icons.rowing_outlined;
    if (value == "rss_feed") return Icons.rss_feed;
    if (value == "rss_feed_sharp") return Icons.rss_feed_sharp;
    if (value == "rss_feed_rounded") return Icons.rss_feed_rounded;
    if (value == "rss_feed_outlined") return Icons.rss_feed_outlined;
    if (value == "rsvp") return Icons.rsvp;
    if (value == "rsvp_sharp") return Icons.rsvp_sharp;
    if (value == "rsvp_rounded") return Icons.rsvp_rounded;
    if (value == "rsvp_outlined") return Icons.rsvp_outlined;
    if (value == "rtt") return Icons.rtt;
    if (value == "rtt_sharp") return Icons.rtt_sharp;
    if (value == "rtt_rounded") return Icons.rtt_rounded;
    if (value == "rtt_outlined") return Icons.rtt_outlined;
    if (value == "rule") return Icons.rule;
    if (value == "rule_sharp") return Icons.rule_sharp;
    if (value == "rule_rounded") return Icons.rule_rounded;
    if (value == "rule_outlined") return Icons.rule_outlined;
    if (value == "rule_folder") return Icons.rule_folder;
    if (value == "rule_folder_sharp") return Icons.rule_folder_sharp;
    if (value == "rule_folder_rounded") return Icons.rule_folder_rounded;
    if (value == "rule_folder_outlined") return Icons.rule_folder_outlined;
    if (value == "run_circle") return Icons.run_circle;
    if (value == "run_circle_sharp") return Icons.run_circle_sharp;
    if (value == "run_circle_rounded") return Icons.run_circle_rounded;
    if (value == "run_circle_outlined") return Icons.run_circle_outlined;
    if (value == "running_with_errors") return Icons.running_with_errors;
    if (value == "running_with_errors_sharp")
      return Icons.running_with_errors_sharp;
    if (value == "running_with_errors_rounded")
      return Icons.running_with_errors_rounded;
    if (value == "running_with_errors_outlined")
      return Icons.running_with_errors_outlined;
    if (value == "rv_hookup") return Icons.rv_hookup;
    if (value == "rv_hookup_sharp") return Icons.rv_hookup_sharp;
    if (value == "rv_hookup_rounded") return Icons.rv_hookup_rounded;
    if (value == "rv_hookup_outlined") return Icons.rv_hookup_outlined;
    if (value == "safety_check") return Icons.safety_check;
    if (value == "safety_check_sharp") return Icons.safety_check_sharp;
    if (value == "safety_check_rounded") return Icons.safety_check_rounded;
    if (value == "safety_check_outlined") return Icons.safety_check_outlined;
    if (value == "safety_divider") return Icons.safety_divider;
    if (value == "safety_divider_sharp") return Icons.safety_divider_sharp;
    if (value == "safety_divider_rounded") return Icons.safety_divider_rounded;
    if (value == "safety_divider_outlined")
      return Icons.safety_divider_outlined;
    if (value == "sailing") return Icons.sailing;
    if (value == "sailing_sharp") return Icons.sailing_sharp;
    if (value == "sailing_rounded") return Icons.sailing_rounded;
    if (value == "sailing_outlined") return Icons.sailing_outlined;
    if (value == "sanitizer") return Icons.sanitizer;
    if (value == "sanitizer_sharp") return Icons.sanitizer_sharp;
    if (value == "sanitizer_rounded") return Icons.sanitizer_rounded;
    if (value == "sanitizer_outlined") return Icons.sanitizer_outlined;
    if (value == "satellite") return Icons.satellite;
    if (value == "satellite_sharp") return Icons.satellite_sharp;
    if (value == "satellite_rounded") return Icons.satellite_rounded;
    if (value == "satellite_outlined") return Icons.satellite_outlined;
    if (value == "satellite_alt") return Icons.satellite_alt;
    if (value == "satellite_alt_sharp") return Icons.satellite_alt_sharp;
    if (value == "satellite_alt_rounded") return Icons.satellite_alt_rounded;
    if (value == "satellite_alt_outlined") return Icons.satellite_alt_outlined;
    if (value == "save") return Icons.save;
    if (value == "save_sharp") return Icons.save_sharp;
    if (value == "save_rounded") return Icons.save_rounded;
    if (value == "save_outlined") return Icons.save_outlined;
    if (value == "save_alt") return Icons.save_alt;
    if (value == "save_alt_sharp") return Icons.save_alt_sharp;
    if (value == "save_alt_rounded") return Icons.save_alt_rounded;
    if (value == "save_alt_outlined") return Icons.save_alt_outlined;
    if (value == "save_as") return Icons.save_as;
    if (value == "save_as_sharp") return Icons.save_as_sharp;
    if (value == "save_as_rounded") return Icons.save_as_rounded;
    if (value == "save_as_outlined") return Icons.save_as_outlined;
    if (value == "saved_search") return Icons.saved_search;
    if (value == "saved_search_sharp") return Icons.saved_search_sharp;
    if (value == "saved_search_rounded") return Icons.saved_search_rounded;
    if (value == "saved_search_outlined") return Icons.saved_search_outlined;
    if (value == "savings") return Icons.savings;
    if (value == "savings_sharp") return Icons.savings_sharp;
    if (value == "savings_rounded") return Icons.savings_rounded;
    if (value == "savings_outlined") return Icons.savings_outlined;
    if (value == "scale") return Icons.scale;
    if (value == "scale_sharp") return Icons.scale_sharp;
    if (value == "scale_rounded") return Icons.scale_rounded;
    if (value == "scale_outlined") return Icons.scale_outlined;
    if (value == "scanner") return Icons.scanner;
    if (value == "scanner_sharp") return Icons.scanner_sharp;
    if (value == "scanner_rounded") return Icons.scanner_rounded;
    if (value == "scanner_outlined") return Icons.scanner_outlined;
    if (value == "scatter_plot") return Icons.scatter_plot;
    if (value == "scatter_plot_sharp") return Icons.scatter_plot_sharp;
    if (value == "scatter_plot_rounded") return Icons.scatter_plot_rounded;
    if (value == "scatter_plot_outlined") return Icons.scatter_plot_outlined;
    if (value == "schedule") return Icons.schedule;
    if (value == "schedule_sharp") return Icons.schedule_sharp;
    if (value == "schedule_rounded") return Icons.schedule_rounded;
    if (value == "schedule_outlined") return Icons.schedule_outlined;
    if (value == "schedule_send") return Icons.schedule_send;
    if (value == "schedule_send_sharp") return Icons.schedule_send_sharp;
    if (value == "schedule_send_rounded") return Icons.schedule_send_rounded;
    if (value == "schedule_send_outlined") return Icons.schedule_send_outlined;
    if (value == "schema") return Icons.schema;
    if (value == "schema_sharp") return Icons.schema_sharp;
    if (value == "schema_rounded") return Icons.schema_rounded;
    if (value == "schema_outlined") return Icons.schema_outlined;
    if (value == "school") return Icons.school;
    if (value == "school_sharp") return Icons.school_sharp;
    if (value == "school_rounded") return Icons.school_rounded;
    if (value == "school_outlined") return Icons.school_outlined;
    if (value == "science") return Icons.science;
    if (value == "science_sharp") return Icons.science_sharp;
    if (value == "science_rounded") return Icons.science_rounded;
    if (value == "science_outlined") return Icons.science_outlined;
    if (value == "score") return Icons.score;
    if (value == "score_sharp") return Icons.score_sharp;
    if (value == "score_rounded") return Icons.score_rounded;
    if (value == "score_outlined") return Icons.score_outlined;
    if (value == "scoreboard") return Icons.scoreboard;
    if (value == "scoreboard_sharp") return Icons.scoreboard_sharp;
    if (value == "scoreboard_rounded") return Icons.scoreboard_rounded;
    if (value == "scoreboard_outlined") return Icons.scoreboard_outlined;
    if (value == "screen_lock_landscape") return Icons.screen_lock_landscape;
    if (value == "screen_lock_landscape_sharp")
      return Icons.screen_lock_landscape_sharp;
    if (value == "screen_lock_landscape_rounded")
      return Icons.screen_lock_landscape_rounded;
    if (value == "screen_lock_landscape_outlined")
      return Icons.screen_lock_landscape_outlined;
    if (value == "screen_lock_portrait") return Icons.screen_lock_portrait;
    if (value == "screen_lock_portrait_sharp")
      return Icons.screen_lock_portrait_sharp;
    if (value == "screen_lock_portrait_rounded")
      return Icons.screen_lock_portrait_rounded;
    if (value == "screen_lock_portrait_outlined")
      return Icons.screen_lock_portrait_outlined;
    if (value == "screen_lock_rotation") return Icons.screen_lock_rotation;
    if (value == "screen_lock_rotation_sharp")
      return Icons.screen_lock_rotation_sharp;
    if (value == "screen_lock_rotation_rounded")
      return Icons.screen_lock_rotation_rounded;
    if (value == "screen_lock_rotation_outlined")
      return Icons.screen_lock_rotation_outlined;
    if (value == "screen_rotation") return Icons.screen_rotation;
    if (value == "screen_rotation_sharp") return Icons.screen_rotation_sharp;
    if (value == "screen_rotation_rounded")
      return Icons.screen_rotation_rounded;
    if (value == "screen_rotation_outlined")
      return Icons.screen_rotation_outlined;
    if (value == "screen_rotation_alt") return Icons.screen_rotation_alt;
    if (value == "screen_rotation_alt_sharp")
      return Icons.screen_rotation_alt_sharp;
    if (value == "screen_rotation_alt_rounded")
      return Icons.screen_rotation_alt_rounded;
    if (value == "screen_rotation_alt_outlined")
      return Icons.screen_rotation_alt_outlined;
    if (value == "screen_search_desktop") return Icons.screen_search_desktop;
    if (value == "screen_search_desktop_sharp")
      return Icons.screen_search_desktop_sharp;
    if (value == "screen_search_desktop_rounded")
      return Icons.screen_search_desktop_rounded;
    if (value == "screen_search_desktop_outlined")
      return Icons.screen_search_desktop_outlined;
    if (value == "screen_share") return Icons.screen_share;
    if (value == "screen_share_sharp") return Icons.screen_share_sharp;
    if (value == "screen_share_rounded") return Icons.screen_share_rounded;
    if (value == "screen_share_outlined") return Icons.screen_share_outlined;
    if (value == "screenshot") return Icons.screenshot;
    if (value == "screenshot_sharp") return Icons.screenshot_sharp;
    if (value == "screenshot_rounded") return Icons.screenshot_rounded;
    if (value == "screenshot_outlined") return Icons.screenshot_outlined;
    if (value == "screenshot_monitor") return Icons.screenshot_monitor;
    if (value == "screenshot_monitor_sharp")
      return Icons.screenshot_monitor_sharp;
    if (value == "screenshot_monitor_rounded")
      return Icons.screenshot_monitor_rounded;
    if (value == "screenshot_monitor_outlined")
      return Icons.screenshot_monitor_outlined;
    if (value == "scuba_diving") return Icons.scuba_diving;
    if (value == "scuba_diving_sharp") return Icons.scuba_diving_sharp;
    if (value == "scuba_diving_rounded") return Icons.scuba_diving_rounded;
    if (value == "scuba_diving_outlined") return Icons.scuba_diving_outlined;
    if (value == "sd") return Icons.sd;
    if (value == "sd_sharp") return Icons.sd_sharp;
    if (value == "sd_rounded") return Icons.sd_rounded;
    if (value == "sd_outlined") return Icons.sd_outlined;
    if (value == "sd_card") return Icons.sd_card;
    if (value == "sd_card_sharp") return Icons.sd_card_sharp;
    if (value == "sd_card_rounded") return Icons.sd_card_rounded;
    if (value == "sd_card_outlined") return Icons.sd_card_outlined;
    if (value == "sd_card_alert") return Icons.sd_card_alert;
    if (value == "sd_card_alert_sharp") return Icons.sd_card_alert_sharp;
    if (value == "sd_card_alert_rounded") return Icons.sd_card_alert_rounded;
    if (value == "sd_card_alert_outlined") return Icons.sd_card_alert_outlined;
    if (value == "sd_storage") return Icons.sd_storage;
    if (value == "sd_storage_sharp") return Icons.sd_storage_sharp;
    if (value == "sd_storage_rounded") return Icons.sd_storage_rounded;
    if (value == "sd_storage_outlined") return Icons.sd_storage_outlined;
    if (value == "search") return Icons.search;
    if (value == "search_sharp") return Icons.search_sharp;
    if (value == "search_rounded") return Icons.search_rounded;
    if (value == "search_outlined") return Icons.search_outlined;
    if (value == "search_off") return Icons.search_off;
    if (value == "search_off_sharp") return Icons.search_off_sharp;
    if (value == "search_off_rounded") return Icons.search_off_rounded;
    if (value == "search_off_outlined") return Icons.search_off_outlined;
    if (value == "security") return Icons.security;
    if (value == "security_sharp") return Icons.security_sharp;
    if (value == "security_rounded") return Icons.security_rounded;
    if (value == "security_outlined") return Icons.security_outlined;
    if (value == "security_update") return Icons.security_update;
    if (value == "security_update_sharp") return Icons.security_update_sharp;
    if (value == "security_update_rounded")
      return Icons.security_update_rounded;
    if (value == "security_update_outlined")
      return Icons.security_update_outlined;
    if (value == "security_update_good") return Icons.security_update_good;
    if (value == "security_update_good_sharp")
      return Icons.security_update_good_sharp;
    if (value == "security_update_good_rounded")
      return Icons.security_update_good_rounded;
    if (value == "security_update_good_outlined")
      return Icons.security_update_good_outlined;
    if (value == "security_update_warning")
      return Icons.security_update_warning;
    if (value == "security_update_warning_sharp")
      return Icons.security_update_warning_sharp;
    if (value == "security_update_warning_rounded")
      return Icons.security_update_warning_rounded;
    if (value == "security_update_warning_outlined")
      return Icons.security_update_warning_outlined;
    if (value == "segment") return Icons.segment;
    if (value == "segment_sharp") return Icons.segment_sharp;
    if (value == "segment_rounded") return Icons.segment_rounded;
    if (value == "segment_outlined") return Icons.segment_outlined;
    if (value == "select_all") return Icons.select_all;
    if (value == "select_all_sharp") return Icons.select_all_sharp;
    if (value == "select_all_rounded") return Icons.select_all_rounded;
    if (value == "select_all_outlined") return Icons.select_all_outlined;
    if (value == "self_improvement") return Icons.self_improvement;
    if (value == "self_improvement_sharp") return Icons.self_improvement_sharp;
    if (value == "self_improvement_rounded")
      return Icons.self_improvement_rounded;
    if (value == "self_improvement_outlined")
      return Icons.self_improvement_outlined;
    if (value == "sell") return Icons.sell;
    if (value == "sell_sharp") return Icons.sell_sharp;
    if (value == "sell_rounded") return Icons.sell_rounded;
    if (value == "sell_outlined") return Icons.sell_outlined;
    if (value == "send") return Icons.send;
    if (value == "send_sharp") return Icons.send_sharp;
    if (value == "send_rounded") return Icons.send_rounded;
    if (value == "send_outlined") return Icons.send_outlined;
    if (value == "send_and_archive") return Icons.send_and_archive;
    if (value == "send_and_archive_sharp") return Icons.send_and_archive_sharp;
    if (value == "send_and_archive_rounded")
      return Icons.send_and_archive_rounded;
    if (value == "send_and_archive_outlined")
      return Icons.send_and_archive_outlined;
    if (value == "send_time_extension") return Icons.send_time_extension;
    if (value == "send_time_extension_sharp")
      return Icons.send_time_extension_sharp;
    if (value == "send_time_extension_rounded")
      return Icons.send_time_extension_rounded;
    if (value == "send_time_extension_outlined")
      return Icons.send_time_extension_outlined;
    if (value == "send_to_mobile") return Icons.send_to_mobile;
    if (value == "send_to_mobile_sharp") return Icons.send_to_mobile_sharp;
    if (value == "send_to_mobile_rounded") return Icons.send_to_mobile_rounded;
    if (value == "send_to_mobile_outlined")
      return Icons.send_to_mobile_outlined;
    if (value == "sensor_door") return Icons.sensor_door;
    if (value == "sensor_door_sharp") return Icons.sensor_door_sharp;
    if (value == "sensor_door_rounded") return Icons.sensor_door_rounded;
    if (value == "sensor_door_outlined") return Icons.sensor_door_outlined;
    if (value == "sensor_occupied") return Icons.sensor_occupied;
    if (value == "sensor_occupied_sharp") return Icons.sensor_occupied_sharp;
    if (value == "sensor_occupied_rounded")
      return Icons.sensor_occupied_rounded;
    if (value == "sensor_occupied_outlined")
      return Icons.sensor_occupied_outlined;
    if (value == "sensor_window") return Icons.sensor_window;
    if (value == "sensor_window_sharp") return Icons.sensor_window_sharp;
    if (value == "sensor_window_rounded") return Icons.sensor_window_rounded;
    if (value == "sensor_window_outlined") return Icons.sensor_window_outlined;
    if (value == "sensors") return Icons.sensors;
    if (value == "sensors_sharp") return Icons.sensors_sharp;
    if (value == "sensors_rounded") return Icons.sensors_rounded;
    if (value == "sensors_outlined") return Icons.sensors_outlined;
    if (value == "sensors_off") return Icons.sensors_off;
    if (value == "sensors_off_sharp") return Icons.sensors_off_sharp;
    if (value == "sensors_off_rounded") return Icons.sensors_off_rounded;
    if (value == "sensors_off_outlined") return Icons.sensors_off_outlined;
    if (value == "sentiment_dissatisfied") return Icons.sentiment_dissatisfied;
    if (value == "sentiment_dissatisfied_sharp")
      return Icons.sentiment_dissatisfied_sharp;
    if (value == "sentiment_dissatisfied_rounded")
      return Icons.sentiment_dissatisfied_rounded;
    if (value == "sentiment_dissatisfied_outlined")
      return Icons.sentiment_dissatisfied_outlined;
    if (value == "sentiment_neutral") return Icons.sentiment_neutral;
    if (value == "sentiment_neutral_sharp")
      return Icons.sentiment_neutral_sharp;
    if (value == "sentiment_neutral_rounded")
      return Icons.sentiment_neutral_rounded;
    if (value == "sentiment_neutral_outlined")
      return Icons.sentiment_neutral_outlined;
    if (value == "sentiment_satisfied") return Icons.sentiment_satisfied;
    if (value == "sentiment_satisfied_sharp")
      return Icons.sentiment_satisfied_sharp;
    if (value == "sentiment_satisfied_rounded")
      return Icons.sentiment_satisfied_rounded;
    if (value == "sentiment_satisfied_outlined")
      return Icons.sentiment_satisfied_outlined;
    if (value == "sentiment_satisfied_alt")
      return Icons.sentiment_satisfied_alt;
    if (value == "sentiment_satisfied_alt_sharp")
      return Icons.sentiment_satisfied_alt_sharp;
    if (value == "sentiment_satisfied_alt_rounded")
      return Icons.sentiment_satisfied_alt_rounded;
    if (value == "sentiment_satisfied_alt_outlined")
      return Icons.sentiment_satisfied_alt_outlined;
    if (value == "sentiment_very_dissatisfied")
      return Icons.sentiment_very_dissatisfied;
    if (value == "sentiment_very_dissatisfied_sharp")
      return Icons.sentiment_very_dissatisfied_sharp;
    if (value == "sentiment_very_dissatisfied_rounded")
      return Icons.sentiment_very_dissatisfied_rounded;
    if (value == "sentiment_very_dissatisfied_outlined")
      return Icons.sentiment_very_dissatisfied_outlined;
    if (value == "sentiment_very_satisfied")
      return Icons.sentiment_very_satisfied;
    if (value == "sentiment_very_satisfied_sharp")
      return Icons.sentiment_very_satisfied_sharp;
    if (value == "sentiment_very_satisfied_rounded")
      return Icons.sentiment_very_satisfied_rounded;
    if (value == "sentiment_very_satisfied_outlined")
      return Icons.sentiment_very_satisfied_outlined;
    if (value == "set_meal") return Icons.set_meal;
    if (value == "set_meal_sharp") return Icons.set_meal_sharp;
    if (value == "set_meal_rounded") return Icons.set_meal_rounded;
    if (value == "set_meal_outlined") return Icons.set_meal_outlined;
    if (value == "settings") return Icons.settings;
    if (value == "settings_sharp") return Icons.settings_sharp;
    if (value == "settings_rounded") return Icons.settings_rounded;
    if (value == "settings_outlined") return Icons.settings_outlined;
    if (value == "settings_accessibility") return Icons.settings_accessibility;
    if (value == "settings_accessibility_sharp")
      return Icons.settings_accessibility_sharp;
    if (value == "settings_accessibility_rounded")
      return Icons.settings_accessibility_rounded;
    if (value == "settings_accessibility_outlined")
      return Icons.settings_accessibility_outlined;
    if (value == "settings_applications") return Icons.settings_applications;
    if (value == "settings_applications_sharp")
      return Icons.settings_applications_sharp;
    if (value == "settings_applications_rounded")
      return Icons.settings_applications_rounded;
    if (value == "settings_applications_outlined")
      return Icons.settings_applications_outlined;
    if (value == "settings_backup_restore")
      return Icons.settings_backup_restore;
    if (value == "settings_backup_restore_sharp")
      return Icons.settings_backup_restore_sharp;
    if (value == "settings_backup_restore_rounded")
      return Icons.settings_backup_restore_rounded;
    if (value == "settings_backup_restore_outlined")
      return Icons.settings_backup_restore_outlined;
    if (value == "settings_bluetooth") return Icons.settings_bluetooth;
    if (value == "settings_bluetooth_sharp")
      return Icons.settings_bluetooth_sharp;
    if (value == "settings_bluetooth_rounded")
      return Icons.settings_bluetooth_rounded;
    if (value == "settings_bluetooth_outlined")
      return Icons.settings_bluetooth_outlined;
    if (value == "settings_brightness") return Icons.settings_brightness;
    if (value == "settings_brightness_sharp")
      return Icons.settings_brightness_sharp;
    if (value == "settings_brightness_rounded")
      return Icons.settings_brightness_rounded;
    if (value == "settings_brightness_outlined")
      return Icons.settings_brightness_outlined;
    if (value == "settings_cell") return Icons.settings_cell;
    if (value == "settings_cell_sharp") return Icons.settings_cell_sharp;
    if (value == "settings_cell_rounded") return Icons.settings_cell_rounded;
    if (value == "settings_cell_outlined") return Icons.settings_cell_outlined;
    if (value == "settings_display") return Icons.settings_display;
    if (value == "settings_display_sharp") return Icons.settings_display_sharp;
    if (value == "settings_display_rounded")
      return Icons.settings_display_rounded;
    if (value == "settings_display_outlined")
      return Icons.settings_display_outlined;
    if (value == "settings_ethernet") return Icons.settings_ethernet;
    if (value == "settings_ethernet_sharp")
      return Icons.settings_ethernet_sharp;
    if (value == "settings_ethernet_rounded")
      return Icons.settings_ethernet_rounded;
    if (value == "settings_ethernet_outlined")
      return Icons.settings_ethernet_outlined;
    if (value == "settings_input_antenna") return Icons.settings_input_antenna;
    if (value == "settings_input_antenna_sharp")
      return Icons.settings_input_antenna_sharp;
    if (value == "settings_input_antenna_rounded")
      return Icons.settings_input_antenna_rounded;
    if (value == "settings_input_antenna_outlined")
      return Icons.settings_input_antenna_outlined;
    if (value == "settings_input_component")
      return Icons.settings_input_component;
    if (value == "settings_input_component_sharp")
      return Icons.settings_input_component_sharp;
    if (value == "settings_input_component_rounded")
      return Icons.settings_input_component_rounded;
    if (value == "settings_input_component_outlined")
      return Icons.settings_input_component_outlined;
    if (value == "settings_input_composite")
      return Icons.settings_input_composite;
    if (value == "settings_input_composite_sharp")
      return Icons.settings_input_composite_sharp;
    if (value == "settings_input_composite_rounded")
      return Icons.settings_input_composite_rounded;
    if (value == "settings_input_composite_outlined")
      return Icons.settings_input_composite_outlined;
    if (value == "settings_input_hdmi") return Icons.settings_input_hdmi;
    if (value == "settings_input_hdmi_sharp")
      return Icons.settings_input_hdmi_sharp;
    if (value == "settings_input_hdmi_rounded")
      return Icons.settings_input_hdmi_rounded;
    if (value == "settings_input_hdmi_outlined")
      return Icons.settings_input_hdmi_outlined;
    if (value == "settings_input_svideo") return Icons.settings_input_svideo;
    if (value == "settings_input_svideo_sharp")
      return Icons.settings_input_svideo_sharp;
    if (value == "settings_input_svideo_rounded")
      return Icons.settings_input_svideo_rounded;
    if (value == "settings_input_svideo_outlined")
      return Icons.settings_input_svideo_outlined;
    if (value == "settings_overscan") return Icons.settings_overscan;
    if (value == "settings_overscan_sharp")
      return Icons.settings_overscan_sharp;
    if (value == "settings_overscan_rounded")
      return Icons.settings_overscan_rounded;
    if (value == "settings_overscan_outlined")
      return Icons.settings_overscan_outlined;
    if (value == "settings_phone") return Icons.settings_phone;
    if (value == "settings_phone_sharp") return Icons.settings_phone_sharp;
    if (value == "settings_phone_rounded") return Icons.settings_phone_rounded;
    if (value == "settings_phone_outlined")
      return Icons.settings_phone_outlined;
    if (value == "settings_power") return Icons.settings_power;
    if (value == "settings_power_sharp") return Icons.settings_power_sharp;
    if (value == "settings_power_rounded") return Icons.settings_power_rounded;
    if (value == "settings_power_outlined")
      return Icons.settings_power_outlined;
    if (value == "settings_remote") return Icons.settings_remote;
    if (value == "settings_remote_sharp") return Icons.settings_remote_sharp;
    if (value == "settings_remote_rounded")
      return Icons.settings_remote_rounded;
    if (value == "settings_remote_outlined")
      return Icons.settings_remote_outlined;
    if (value == "settings_suggest") return Icons.settings_suggest;
    if (value == "settings_suggest_sharp") return Icons.settings_suggest_sharp;
    if (value == "settings_suggest_rounded")
      return Icons.settings_suggest_rounded;
    if (value == "settings_suggest_outlined")
      return Icons.settings_suggest_outlined;
    if (value == "settings_system_daydream")
      return Icons.settings_system_daydream;
    if (value == "settings_system_daydream_sharp")
      return Icons.settings_system_daydream_sharp;
    if (value == "settings_system_daydream_rounded")
      return Icons.settings_system_daydream_rounded;
    if (value == "settings_system_daydream_outlined")
      return Icons.settings_system_daydream_outlined;
    if (value == "settings_voice") return Icons.settings_voice;
    if (value == "settings_voice_sharp") return Icons.settings_voice_sharp;
    if (value == "settings_voice_rounded") return Icons.settings_voice_rounded;
    if (value == "settings_voice_outlined")
      return Icons.settings_voice_outlined;
    if (value == "severe_cold") return Icons.severe_cold;
    if (value == "severe_cold_sharp") return Icons.severe_cold_sharp;
    if (value == "severe_cold_rounded") return Icons.severe_cold_rounded;
    if (value == "severe_cold_outlined") return Icons.severe_cold_outlined;
    if (value == "share") return Icons.share;
    if (value == "share_sharp") return Icons.share_sharp;
    if (value == "share_rounded") return Icons.share_rounded;
    if (value == "share_outlined") return Icons.share_outlined;
    if (value == "share_arrival_time") return Icons.share_arrival_time;
    if (value == "share_arrival_time_sharp")
      return Icons.share_arrival_time_sharp;
    if (value == "share_arrival_time_rounded")
      return Icons.share_arrival_time_rounded;
    if (value == "share_arrival_time_outlined")
      return Icons.share_arrival_time_outlined;
    if (value == "share_location") return Icons.share_location;
    if (value == "share_location_sharp") return Icons.share_location_sharp;
    if (value == "share_location_rounded") return Icons.share_location_rounded;
    if (value == "share_location_outlined")
      return Icons.share_location_outlined;
    if (value == "shield") return Icons.shield;
    if (value == "shield_sharp") return Icons.shield_sharp;
    if (value == "shield_rounded") return Icons.shield_rounded;
    if (value == "shield_outlined") return Icons.shield_outlined;
    if (value == "shield_moon") return Icons.shield_moon;
    if (value == "shield_moon_sharp") return Icons.shield_moon_sharp;
    if (value == "shield_moon_rounded") return Icons.shield_moon_rounded;
    if (value == "shield_moon_outlined") return Icons.shield_moon_outlined;
    if (value == "shop") return Icons.shop;
    if (value == "shop_sharp") return Icons.shop_sharp;
    if (value == "shop_rounded") return Icons.shop_rounded;
    if (value == "shop_outlined") return Icons.shop_outlined;
    if (value == "shop_2") return Icons.shop_2;
    if (value == "shop_2_sharp") return Icons.shop_2_sharp;
    if (value == "shop_2_rounded") return Icons.shop_2_rounded;
    if (value == "shop_2_outlined") return Icons.shop_2_outlined;
    if (value == "shop_two") return Icons.shop_two;
    if (value == "shop_two_sharp") return Icons.shop_two_sharp;
    if (value == "shop_two_rounded") return Icons.shop_two_rounded;
    if (value == "shop_two_outlined") return Icons.shop_two_outlined;
    if (value == "shopify") return Icons.shopify;
    if (value == "shopify_sharp") return Icons.shopify_sharp;
    if (value == "shopify_rounded") return Icons.shopify_rounded;
    if (value == "shopify_outlined") return Icons.shopify_outlined;
    if (value == "shopping_bag") return Icons.shopping_bag;
    if (value == "shopping_bag_sharp") return Icons.shopping_bag_sharp;
    if (value == "shopping_bag_rounded") return Icons.shopping_bag_rounded;
    if (value == "shopping_bag_outlined") return Icons.shopping_bag_outlined;
    if (value == "shopping_basket") return Icons.shopping_basket;
    if (value == "shopping_basket_sharp") return Icons.shopping_basket_sharp;
    if (value == "shopping_basket_rounded")
      return Icons.shopping_basket_rounded;
    if (value == "shopping_basket_outlined")
      return Icons.shopping_basket_outlined;
    if (value == "shopping_cart") return Icons.shopping_cart;
    if (value == "shopping_cart_sharp") return Icons.shopping_cart_sharp;
    if (value == "shopping_cart_rounded") return Icons.shopping_cart_rounded;
    if (value == "shopping_cart_outlined") return Icons.shopping_cart_outlined;
    if (value == "shopping_cart_checkout") return Icons.shopping_cart_checkout;
    if (value == "shopping_cart_checkout_sharp")
      return Icons.shopping_cart_checkout_sharp;
    if (value == "shopping_cart_checkout_rounded")
      return Icons.shopping_cart_checkout_rounded;
    if (value == "shopping_cart_checkout_outlined")
      return Icons.shopping_cart_checkout_outlined;
    if (value == "short_text") return Icons.short_text;
    if (value == "short_text_sharp") return Icons.short_text_sharp;
    if (value == "short_text_rounded") return Icons.short_text_rounded;
    if (value == "short_text_outlined") return Icons.short_text_outlined;
    if (value == "shortcut") return Icons.shortcut;
    if (value == "shortcut_sharp") return Icons.shortcut_sharp;
    if (value == "shortcut_rounded") return Icons.shortcut_rounded;
    if (value == "shortcut_outlined") return Icons.shortcut_outlined;
    if (value == "show_chart") return Icons.show_chart;
    if (value == "show_chart_sharp") return Icons.show_chart_sharp;
    if (value == "show_chart_rounded") return Icons.show_chart_rounded;
    if (value == "show_chart_outlined") return Icons.show_chart_outlined;
    if (value == "shower") return Icons.shower;
    if (value == "shower_sharp") return Icons.shower_sharp;
    if (value == "shower_rounded") return Icons.shower_rounded;
    if (value == "shower_outlined") return Icons.shower_outlined;
    if (value == "shuffle") return Icons.shuffle;
    if (value == "shuffle_sharp") return Icons.shuffle_sharp;
    if (value == "shuffle_rounded") return Icons.shuffle_rounded;
    if (value == "shuffle_outlined") return Icons.shuffle_outlined;
    if (value == "shuffle_on") return Icons.shuffle_on;
    if (value == "shuffle_on_sharp") return Icons.shuffle_on_sharp;
    if (value == "shuffle_on_rounded") return Icons.shuffle_on_rounded;
    if (value == "shuffle_on_outlined") return Icons.shuffle_on_outlined;
    if (value == "shutter_speed") return Icons.shutter_speed;
    if (value == "shutter_speed_sharp") return Icons.shutter_speed_sharp;
    if (value == "shutter_speed_rounded") return Icons.shutter_speed_rounded;
    if (value == "shutter_speed_outlined") return Icons.shutter_speed_outlined;
    if (value == "sick") return Icons.sick;
    if (value == "sick_sharp") return Icons.sick_sharp;
    if (value == "sick_rounded") return Icons.sick_rounded;
    if (value == "sick_outlined") return Icons.sick_outlined;
    if (value == "sign_language") return Icons.sign_language;
    if (value == "sign_language_sharp") return Icons.sign_language_sharp;
    if (value == "sign_language_rounded") return Icons.sign_language_rounded;
    if (value == "sign_language_outlined") return Icons.sign_language_outlined;
    if (value == "signal_cellular_0_bar") return Icons.signal_cellular_0_bar;
    if (value == "signal_cellular_0_bar_sharp")
      return Icons.signal_cellular_0_bar_sharp;
    if (value == "signal_cellular_0_bar_rounded")
      return Icons.signal_cellular_0_bar_rounded;
    if (value == "signal_cellular_0_bar_outlined")
      return Icons.signal_cellular_0_bar_outlined;
    if (value == "signal_cellular_4_bar") return Icons.signal_cellular_4_bar;
    if (value == "signal_cellular_4_bar_sharp")
      return Icons.signal_cellular_4_bar_sharp;
    if (value == "signal_cellular_4_bar_rounded")
      return Icons.signal_cellular_4_bar_rounded;
    if (value == "signal_cellular_4_bar_outlined")
      return Icons.signal_cellular_4_bar_outlined;
    if (value == "signal_cellular_alt") return Icons.signal_cellular_alt;
    if (value == "signal_cellular_alt_sharp")
      return Icons.signal_cellular_alt_sharp;
    if (value == "signal_cellular_alt_rounded")
      return Icons.signal_cellular_alt_rounded;
    if (value == "signal_cellular_alt_outlined")
      return Icons.signal_cellular_alt_outlined;
    if (value == "signal_cellular_alt_1_bar")
      return Icons.signal_cellular_alt_1_bar;
    if (value == "signal_cellular_alt_1_bar_sharp")
      return Icons.signal_cellular_alt_1_bar_sharp;
    if (value == "signal_cellular_alt_1_bar_rounded")
      return Icons.signal_cellular_alt_1_bar_rounded;
    if (value == "signal_cellular_alt_1_bar_outlined")
      return Icons.signal_cellular_alt_1_bar_outlined;
    if (value == "signal_cellular_alt_2_bar")
      return Icons.signal_cellular_alt_2_bar;
    if (value == "signal_cellular_alt_2_bar_sharp")
      return Icons.signal_cellular_alt_2_bar_sharp;
    if (value == "signal_cellular_alt_2_bar_rounded")
      return Icons.signal_cellular_alt_2_bar_rounded;
    if (value == "signal_cellular_alt_2_bar_outlined")
      return Icons.signal_cellular_alt_2_bar_outlined;
    if (value == "signal_cellular_connected_no_internet_0_bar")
      return Icons.signal_cellular_connected_no_internet_0_bar;
    if (value == "signal_cellular_connected_no_internet_0_bar_sharp")
      return Icons.signal_cellular_connected_no_internet_0_bar_sharp;
    if (value == "signal_cellular_connected_no_internet_0_bar_rounded")
      return Icons.signal_cellular_connected_no_internet_0_bar_rounded;
    if (value == "signal_cellular_connected_no_internet_0_bar_outlined")
      return Icons.signal_cellular_connected_no_internet_0_bar_outlined;
    if (value == "signal_cellular_connected_no_internet_4_bar")
      return Icons.signal_cellular_connected_no_internet_4_bar;
    if (value == "signal_cellular_connected_no_internet_4_bar_sharp")
      return Icons.signal_cellular_connected_no_internet_4_bar_sharp;
    if (value == "signal_cellular_connected_no_internet_4_bar_rounded")
      return Icons.signal_cellular_connected_no_internet_4_bar_rounded;
    if (value == "signal_cellular_connected_no_internet_4_bar_outlined")
      return Icons.signal_cellular_connected_no_internet_4_bar_outlined;
    if (value == "signal_cellular_no_sim") return Icons.signal_cellular_no_sim;
    if (value == "signal_cellular_no_sim_sharp")
      return Icons.signal_cellular_no_sim_sharp;
    if (value == "signal_cellular_no_sim_rounded")
      return Icons.signal_cellular_no_sim_rounded;
    if (value == "signal_cellular_no_sim_outlined")
      return Icons.signal_cellular_no_sim_outlined;
    if (value == "signal_cellular_nodata") return Icons.signal_cellular_nodata;
    if (value == "signal_cellular_nodata_sharp")
      return Icons.signal_cellular_nodata_sharp;
    if (value == "signal_cellular_nodata_rounded")
      return Icons.signal_cellular_nodata_rounded;
    if (value == "signal_cellular_nodata_outlined")
      return Icons.signal_cellular_nodata_outlined;
    if (value == "signal_cellular_null") return Icons.signal_cellular_null;
    if (value == "signal_cellular_null_sharp")
      return Icons.signal_cellular_null_sharp;
    if (value == "signal_cellular_null_rounded")
      return Icons.signal_cellular_null_rounded;
    if (value == "signal_cellular_null_outlined")
      return Icons.signal_cellular_null_outlined;
    if (value == "signal_cellular_off") return Icons.signal_cellular_off;
    if (value == "signal_cellular_off_sharp")
      return Icons.signal_cellular_off_sharp;
    if (value == "signal_cellular_off_rounded")
      return Icons.signal_cellular_off_rounded;
    if (value == "signal_cellular_off_outlined")
      return Icons.signal_cellular_off_outlined;
    if (value == "signal_wifi_0_bar") return Icons.signal_wifi_0_bar;
    if (value == "signal_wifi_0_bar_sharp")
      return Icons.signal_wifi_0_bar_sharp;
    if (value == "signal_wifi_0_bar_rounded")
      return Icons.signal_wifi_0_bar_rounded;
    if (value == "signal_wifi_0_bar_outlined")
      return Icons.signal_wifi_0_bar_outlined;
    if (value == "signal_wifi_4_bar") return Icons.signal_wifi_4_bar;
    if (value == "signal_wifi_4_bar_sharp")
      return Icons.signal_wifi_4_bar_sharp;
    if (value == "signal_wifi_4_bar_rounded")
      return Icons.signal_wifi_4_bar_rounded;
    if (value == "signal_wifi_4_bar_outlined")
      return Icons.signal_wifi_4_bar_outlined;
    if (value == "signal_wifi_4_bar_lock") return Icons.signal_wifi_4_bar_lock;
    if (value == "signal_wifi_4_bar_lock_sharp")
      return Icons.signal_wifi_4_bar_lock_sharp;
    if (value == "signal_wifi_4_bar_lock_rounded")
      return Icons.signal_wifi_4_bar_lock_rounded;
    if (value == "signal_wifi_4_bar_lock_outlined")
      return Icons.signal_wifi_4_bar_lock_outlined;
    if (value == "signal_wifi_bad") return Icons.signal_wifi_bad;
    if (value == "signal_wifi_bad_sharp") return Icons.signal_wifi_bad_sharp;
    if (value == "signal_wifi_bad_rounded")
      return Icons.signal_wifi_bad_rounded;
    if (value == "signal_wifi_bad_outlined")
      return Icons.signal_wifi_bad_outlined;
    if (value == "signal_wifi_connected_no_internet_4")
      return Icons.signal_wifi_connected_no_internet_4;
    if (value == "signal_wifi_connected_no_internet_4_sharp")
      return Icons.signal_wifi_connected_no_internet_4_sharp;
    if (value == "signal_wifi_connected_no_internet_4_rounded")
      return Icons.signal_wifi_connected_no_internet_4_rounded;
    if (value == "signal_wifi_connected_no_internet_4_outlined")
      return Icons.signal_wifi_connected_no_internet_4_outlined;
    if (value == "signal_wifi_off") return Icons.signal_wifi_off;
    if (value == "signal_wifi_off_sharp") return Icons.signal_wifi_off_sharp;
    if (value == "signal_wifi_off_rounded")
      return Icons.signal_wifi_off_rounded;
    if (value == "signal_wifi_off_outlined")
      return Icons.signal_wifi_off_outlined;
    if (value == "signal_wifi_statusbar_4_bar")
      return Icons.signal_wifi_statusbar_4_bar;
    if (value == "signal_wifi_statusbar_4_bar_sharp")
      return Icons.signal_wifi_statusbar_4_bar_sharp;
    if (value == "signal_wifi_statusbar_4_bar_rounded")
      return Icons.signal_wifi_statusbar_4_bar_rounded;
    if (value == "signal_wifi_statusbar_4_bar_outlined")
      return Icons.signal_wifi_statusbar_4_bar_outlined;
    if (value == "signal_wifi_statusbar_connected_no_internet_4")
      return Icons.signal_wifi_statusbar_connected_no_internet_4;
    if (value == "signal_wifi_statusbar_connected_no_internet_4_sharp")
      return Icons.signal_wifi_statusbar_connected_no_internet_4_sharp;
    if (value == "signal_wifi_statusbar_connected_no_internet_4_rounded")
      return Icons.signal_wifi_statusbar_connected_no_internet_4_rounded;
    if (value == "signal_wifi_statusbar_connected_no_internet_4_outlined")
      return Icons.signal_wifi_statusbar_connected_no_internet_4_outlined;
    if (value == "signal_wifi_statusbar_null")
      return Icons.signal_wifi_statusbar_null;
    if (value == "signal_wifi_statusbar_null_sharp")
      return Icons.signal_wifi_statusbar_null_sharp;
    if (value == "signal_wifi_statusbar_null_rounded")
      return Icons.signal_wifi_statusbar_null_rounded;
    if (value == "signal_wifi_statusbar_null_outlined")
      return Icons.signal_wifi_statusbar_null_outlined;
    if (value == "signpost") return Icons.signpost;
    if (value == "signpost_sharp") return Icons.signpost_sharp;
    if (value == "signpost_rounded") return Icons.signpost_rounded;
    if (value == "signpost_outlined") return Icons.signpost_outlined;
    if (value == "sim_card") return Icons.sim_card;
    if (value == "sim_card_sharp") return Icons.sim_card_sharp;
    if (value == "sim_card_rounded") return Icons.sim_card_rounded;
    if (value == "sim_card_outlined") return Icons.sim_card_outlined;
    if (value == "sim_card_alert") return Icons.sim_card_alert;
    if (value == "sim_card_alert_sharp") return Icons.sim_card_alert_sharp;
    if (value == "sim_card_alert_rounded") return Icons.sim_card_alert_rounded;
    if (value == "sim_card_alert_outlined")
      return Icons.sim_card_alert_outlined;
    if (value == "sim_card_download") return Icons.sim_card_download;
    if (value == "sim_card_download_sharp")
      return Icons.sim_card_download_sharp;
    if (value == "sim_card_download_rounded")
      return Icons.sim_card_download_rounded;
    if (value == "sim_card_download_outlined")
      return Icons.sim_card_download_outlined;
    if (value == "single_bed") return Icons.single_bed;
    if (value == "single_bed_sharp") return Icons.single_bed_sharp;
    if (value == "single_bed_rounded") return Icons.single_bed_rounded;
    if (value == "single_bed_outlined") return Icons.single_bed_outlined;
    if (value == "sip") return Icons.sip;
    if (value == "sip_sharp") return Icons.sip_sharp;
    if (value == "sip_rounded") return Icons.sip_rounded;
    if (value == "sip_outlined") return Icons.sip_outlined;
    if (value == "skateboarding") return Icons.skateboarding;
    if (value == "skateboarding_sharp") return Icons.skateboarding_sharp;
    if (value == "skateboarding_rounded") return Icons.skateboarding_rounded;
    if (value == "skateboarding_outlined") return Icons.skateboarding_outlined;
    if (value == "skip_next") return Icons.skip_next;
    if (value == "skip_next_sharp") return Icons.skip_next_sharp;
    if (value == "skip_next_rounded") return Icons.skip_next_rounded;
    if (value == "skip_next_outlined") return Icons.skip_next_outlined;
    if (value == "skip_previous") return Icons.skip_previous;
    if (value == "skip_previous_sharp") return Icons.skip_previous_sharp;
    if (value == "skip_previous_rounded") return Icons.skip_previous_rounded;
    if (value == "skip_previous_outlined") return Icons.skip_previous_outlined;
    if (value == "sledding") return Icons.sledding;
    if (value == "sledding_sharp") return Icons.sledding_sharp;
    if (value == "sledding_rounded") return Icons.sledding_rounded;
    if (value == "sledding_outlined") return Icons.sledding_outlined;
    if (value == "slideshow") return Icons.slideshow;
    if (value == "slideshow_sharp") return Icons.slideshow_sharp;
    if (value == "slideshow_rounded") return Icons.slideshow_rounded;
    if (value == "slideshow_outlined") return Icons.slideshow_outlined;
    if (value == "slow_motion_video") return Icons.slow_motion_video;
    if (value == "slow_motion_video_sharp")
      return Icons.slow_motion_video_sharp;
    if (value == "slow_motion_video_rounded")
      return Icons.slow_motion_video_rounded;
    if (value == "slow_motion_video_outlined")
      return Icons.slow_motion_video_outlined;
    if (value == "smart_button") return Icons.smart_button;
    if (value == "smart_button_sharp") return Icons.smart_button_sharp;
    if (value == "smart_button_rounded") return Icons.smart_button_rounded;
    if (value == "smart_button_outlined") return Icons.smart_button_outlined;
    if (value == "smart_display") return Icons.smart_display;
    if (value == "smart_display_sharp") return Icons.smart_display_sharp;
    if (value == "smart_display_rounded") return Icons.smart_display_rounded;
    if (value == "smart_display_outlined") return Icons.smart_display_outlined;
    if (value == "smart_screen") return Icons.smart_screen;
    if (value == "smart_screen_sharp") return Icons.smart_screen_sharp;
    if (value == "smart_screen_rounded") return Icons.smart_screen_rounded;
    if (value == "smart_screen_outlined") return Icons.smart_screen_outlined;
    if (value == "smart_toy") return Icons.smart_toy;
    if (value == "smart_toy_sharp") return Icons.smart_toy_sharp;
    if (value == "smart_toy_rounded") return Icons.smart_toy_rounded;
    if (value == "smart_toy_outlined") return Icons.smart_toy_outlined;
    if (value == "smartphone") return Icons.smartphone;
    if (value == "smartphone_sharp") return Icons.smartphone_sharp;
    if (value == "smartphone_rounded") return Icons.smartphone_rounded;
    if (value == "smartphone_outlined") return Icons.smartphone_outlined;
    if (value == "smoke_free") return Icons.smoke_free;
    if (value == "smoke_free_sharp") return Icons.smoke_free_sharp;
    if (value == "smoke_free_rounded") return Icons.smoke_free_rounded;
    if (value == "smoke_free_outlined") return Icons.smoke_free_outlined;
    if (value == "smoking_rooms") return Icons.smoking_rooms;
    if (value == "smoking_rooms_sharp") return Icons.smoking_rooms_sharp;
    if (value == "smoking_rooms_rounded") return Icons.smoking_rooms_rounded;
    if (value == "smoking_rooms_outlined") return Icons.smoking_rooms_outlined;
    if (value == "sms") return Icons.sms;
    if (value == "sms_sharp") return Icons.sms_sharp;
    if (value == "sms_rounded") return Icons.sms_rounded;
    if (value == "sms_outlined") return Icons.sms_outlined;
    if (value == "sms_failed") return Icons.sms_failed;
    if (value == "sms_failed_sharp") return Icons.sms_failed_sharp;
    if (value == "sms_failed_rounded") return Icons.sms_failed_rounded;
    if (value == "sms_failed_outlined") return Icons.sms_failed_outlined;
    if (value == "snapchat") return Icons.snapchat;
    if (value == "snapchat_sharp") return Icons.snapchat_sharp;
    if (value == "snapchat_rounded") return Icons.snapchat_rounded;
    if (value == "snapchat_outlined") return Icons.snapchat_outlined;
    if (value == "snippet_folder") return Icons.snippet_folder;
    if (value == "snippet_folder_sharp") return Icons.snippet_folder_sharp;
    if (value == "snippet_folder_rounded") return Icons.snippet_folder_rounded;
    if (value == "snippet_folder_outlined")
      return Icons.snippet_folder_outlined;
    if (value == "snooze") return Icons.snooze;
    if (value == "snooze_sharp") return Icons.snooze_sharp;
    if (value == "snooze_rounded") return Icons.snooze_rounded;
    if (value == "snooze_outlined") return Icons.snooze_outlined;
    if (value == "snowboarding") return Icons.snowboarding;
    if (value == "snowboarding_sharp") return Icons.snowboarding_sharp;
    if (value == "snowboarding_rounded") return Icons.snowboarding_rounded;
    if (value == "snowboarding_outlined") return Icons.snowboarding_outlined;
    if (value == "snowing") return Icons.snowing;
    if (value == "snowmobile") return Icons.snowmobile;
    if (value == "snowmobile_sharp") return Icons.snowmobile_sharp;
    if (value == "snowmobile_rounded") return Icons.snowmobile_rounded;
    if (value == "snowmobile_outlined") return Icons.snowmobile_outlined;
    if (value == "snowshoeing") return Icons.snowshoeing;
    if (value == "snowshoeing_sharp") return Icons.snowshoeing_sharp;
    if (value == "snowshoeing_rounded") return Icons.snowshoeing_rounded;
    if (value == "snowshoeing_outlined") return Icons.snowshoeing_outlined;
    if (value == "soap") return Icons.soap;
    if (value == "soap_sharp") return Icons.soap_sharp;
    if (value == "soap_rounded") return Icons.soap_rounded;
    if (value == "soap_outlined") return Icons.soap_outlined;
    if (value == "social_distance") return Icons.social_distance;
    if (value == "social_distance_sharp") return Icons.social_distance_sharp;
    if (value == "social_distance_rounded")
      return Icons.social_distance_rounded;
    if (value == "social_distance_outlined")
      return Icons.social_distance_outlined;
    if (value == "solar_power") return Icons.solar_power;
    if (value == "solar_power_sharp") return Icons.solar_power_sharp;
    if (value == "solar_power_rounded") return Icons.solar_power_rounded;
    if (value == "solar_power_outlined") return Icons.solar_power_outlined;
    if (value == "sort") return Icons.sort;
    if (value == "sort_sharp") return Icons.sort_sharp;
    if (value == "sort_rounded") return Icons.sort_rounded;
    if (value == "sort_outlined") return Icons.sort_outlined;
    if (value == "sort_by_alpha") return Icons.sort_by_alpha;
    if (value == "sort_by_alpha_sharp") return Icons.sort_by_alpha_sharp;
    if (value == "sort_by_alpha_rounded") return Icons.sort_by_alpha_rounded;
    if (value == "sort_by_alpha_outlined") return Icons.sort_by_alpha_outlined;
    if (value == "sos") return Icons.sos;
    if (value == "sos_sharp") return Icons.sos_sharp;
    if (value == "sos_rounded") return Icons.sos_rounded;
    if (value == "sos_outlined") return Icons.sos_outlined;
    if (value == "soup_kitchen") return Icons.soup_kitchen;
    if (value == "soup_kitchen_sharp") return Icons.soup_kitchen_sharp;
    if (value == "soup_kitchen_rounded") return Icons.soup_kitchen_rounded;
    if (value == "soup_kitchen_outlined") return Icons.soup_kitchen_outlined;
    if (value == "source") return Icons.source;
    if (value == "source_sharp") return Icons.source_sharp;
    if (value == "source_rounded") return Icons.source_rounded;
    if (value == "source_outlined") return Icons.source_outlined;
    if (value == "south") return Icons.south;
    if (value == "south_sharp") return Icons.south_sharp;
    if (value == "south_rounded") return Icons.south_rounded;
    if (value == "south_outlined") return Icons.south_outlined;
    if (value == "south_america") return Icons.south_america;
    if (value == "south_america_sharp") return Icons.south_america_sharp;
    if (value == "south_america_rounded") return Icons.south_america_rounded;
    if (value == "south_america_outlined") return Icons.south_america_outlined;
    if (value == "south_east") return Icons.south_east;
    if (value == "south_east_sharp") return Icons.south_east_sharp;
    if (value == "south_east_rounded") return Icons.south_east_rounded;
    if (value == "south_east_outlined") return Icons.south_east_outlined;
    if (value == "south_west") return Icons.south_west;
    if (value == "south_west_sharp") return Icons.south_west_sharp;
    if (value == "south_west_rounded") return Icons.south_west_rounded;
    if (value == "south_west_outlined") return Icons.south_west_outlined;
    if (value == "spa") return Icons.spa;
    if (value == "spa_sharp") return Icons.spa_sharp;
    if (value == "spa_rounded") return Icons.spa_rounded;
    if (value == "spa_outlined") return Icons.spa_outlined;
    if (value == "space_bar") return Icons.space_bar;
    if (value == "space_bar_sharp") return Icons.space_bar_sharp;
    if (value == "space_bar_rounded") return Icons.space_bar_rounded;
    if (value == "space_bar_outlined") return Icons.space_bar_outlined;
    if (value == "space_dashboard") return Icons.space_dashboard;
    if (value == "space_dashboard_sharp") return Icons.space_dashboard_sharp;
    if (value == "space_dashboard_rounded")
      return Icons.space_dashboard_rounded;
    if (value == "space_dashboard_outlined")
      return Icons.space_dashboard_outlined;
    if (value == "spatial_audio") return Icons.spatial_audio;
    if (value == "spatial_audio_sharp") return Icons.spatial_audio_sharp;
    if (value == "spatial_audio_rounded") return Icons.spatial_audio_rounded;
    if (value == "spatial_audio_outlined") return Icons.spatial_audio_outlined;
    if (value == "spatial_audio_off") return Icons.spatial_audio_off;
    if (value == "spatial_audio_off_sharp")
      return Icons.spatial_audio_off_sharp;
    if (value == "spatial_audio_off_rounded")
      return Icons.spatial_audio_off_rounded;
    if (value == "spatial_audio_off_outlined")
      return Icons.spatial_audio_off_outlined;
    if (value == "spatial_tracking") return Icons.spatial_tracking;
    if (value == "spatial_tracking_sharp") return Icons.spatial_tracking_sharp;
    if (value == "spatial_tracking_rounded")
      return Icons.spatial_tracking_rounded;
    if (value == "spatial_tracking_outlined")
      return Icons.spatial_tracking_outlined;
    if (value == "speaker") return Icons.speaker;
    if (value == "speaker_sharp") return Icons.speaker_sharp;
    if (value == "speaker_rounded") return Icons.speaker_rounded;
    if (value == "speaker_outlined") return Icons.speaker_outlined;
    if (value == "speaker_group") return Icons.speaker_group;
    if (value == "speaker_group_sharp") return Icons.speaker_group_sharp;
    if (value == "speaker_group_rounded") return Icons.speaker_group_rounded;
    if (value == "speaker_group_outlined") return Icons.speaker_group_outlined;
    if (value == "speaker_notes") return Icons.speaker_notes;
    if (value == "speaker_notes_sharp") return Icons.speaker_notes_sharp;
    if (value == "speaker_notes_rounded") return Icons.speaker_notes_rounded;
    if (value == "speaker_notes_outlined") return Icons.speaker_notes_outlined;
    if (value == "speaker_notes_off") return Icons.speaker_notes_off;
    if (value == "speaker_notes_off_sharp")
      return Icons.speaker_notes_off_sharp;
    if (value == "speaker_notes_off_rounded")
      return Icons.speaker_notes_off_rounded;
    if (value == "speaker_notes_off_outlined")
      return Icons.speaker_notes_off_outlined;
    if (value == "speaker_phone") return Icons.speaker_phone;
    if (value == "speaker_phone_sharp") return Icons.speaker_phone_sharp;
    if (value == "speaker_phone_rounded") return Icons.speaker_phone_rounded;
    if (value == "speaker_phone_outlined") return Icons.speaker_phone_outlined;
    if (value == "speed") return Icons.speed;
    if (value == "speed_sharp") return Icons.speed_sharp;
    if (value == "speed_rounded") return Icons.speed_rounded;
    if (value == "speed_outlined") return Icons.speed_outlined;
    if (value == "spellcheck") return Icons.spellcheck;
    if (value == "spellcheck_sharp") return Icons.spellcheck_sharp;
    if (value == "spellcheck_rounded") return Icons.spellcheck_rounded;
    if (value == "spellcheck_outlined") return Icons.spellcheck_outlined;
    if (value == "splitscreen") return Icons.splitscreen;
    if (value == "splitscreen_sharp") return Icons.splitscreen_sharp;
    if (value == "splitscreen_rounded") return Icons.splitscreen_rounded;
    if (value == "splitscreen_outlined") return Icons.splitscreen_outlined;
    if (value == "spoke") return Icons.spoke;
    if (value == "spoke_sharp") return Icons.spoke_sharp;
    if (value == "spoke_rounded") return Icons.spoke_rounded;
    if (value == "spoke_outlined") return Icons.spoke_outlined;
    if (value == "sports") return Icons.sports;
    if (value == "sports_sharp") return Icons.sports_sharp;
    if (value == "sports_rounded") return Icons.sports_rounded;
    if (value == "sports_outlined") return Icons.sports_outlined;
    if (value == "sports_bar") return Icons.sports_bar;
    if (value == "sports_bar_sharp") return Icons.sports_bar_sharp;
    if (value == "sports_bar_rounded") return Icons.sports_bar_rounded;
    if (value == "sports_bar_outlined") return Icons.sports_bar_outlined;
    if (value == "sports_baseball") return Icons.sports_baseball;
    if (value == "sports_baseball_sharp") return Icons.sports_baseball_sharp;
    if (value == "sports_baseball_rounded")
      return Icons.sports_baseball_rounded;
    if (value == "sports_baseball_outlined")
      return Icons.sports_baseball_outlined;
    if (value == "sports_basketball") return Icons.sports_basketball;
    if (value == "sports_basketball_sharp")
      return Icons.sports_basketball_sharp;
    if (value == "sports_basketball_rounded")
      return Icons.sports_basketball_rounded;
    if (value == "sports_basketball_outlined")
      return Icons.sports_basketball_outlined;
    if (value == "sports_cricket") return Icons.sports_cricket;
    if (value == "sports_cricket_sharp") return Icons.sports_cricket_sharp;
    if (value == "sports_cricket_rounded") return Icons.sports_cricket_rounded;
    if (value == "sports_cricket_outlined")
      return Icons.sports_cricket_outlined;
    if (value == "sports_esports") return Icons.sports_esports;
    if (value == "sports_esports_sharp") return Icons.sports_esports_sharp;
    if (value == "sports_esports_rounded") return Icons.sports_esports_rounded;
    if (value == "sports_esports_outlined")
      return Icons.sports_esports_outlined;
    if (value == "sports_football") return Icons.sports_football;
    if (value == "sports_football_sharp") return Icons.sports_football_sharp;
    if (value == "sports_football_rounded")
      return Icons.sports_football_rounded;
    if (value == "sports_football_outlined")
      return Icons.sports_football_outlined;
    if (value == "sports_golf") return Icons.sports_golf;
    if (value == "sports_golf_sharp") return Icons.sports_golf_sharp;
    if (value == "sports_golf_rounded") return Icons.sports_golf_rounded;
    if (value == "sports_golf_outlined") return Icons.sports_golf_outlined;
    if (value == "sports_gymnastics") return Icons.sports_gymnastics;
    if (value == "sports_gymnastics_sharp")
      return Icons.sports_gymnastics_sharp;
    if (value == "sports_gymnastics_rounded")
      return Icons.sports_gymnastics_rounded;
    if (value == "sports_gymnastics_outlined")
      return Icons.sports_gymnastics_outlined;
    if (value == "sports_handball") return Icons.sports_handball;
    if (value == "sports_handball_sharp") return Icons.sports_handball_sharp;
    if (value == "sports_handball_rounded")
      return Icons.sports_handball_rounded;
    if (value == "sports_handball_outlined")
      return Icons.sports_handball_outlined;
    if (value == "sports_hockey") return Icons.sports_hockey;
    if (value == "sports_hockey_sharp") return Icons.sports_hockey_sharp;
    if (value == "sports_hockey_rounded") return Icons.sports_hockey_rounded;
    if (value == "sports_hockey_outlined") return Icons.sports_hockey_outlined;
    if (value == "sports_kabaddi") return Icons.sports_kabaddi;
    if (value == "sports_kabaddi_sharp") return Icons.sports_kabaddi_sharp;
    if (value == "sports_kabaddi_rounded") return Icons.sports_kabaddi_rounded;
    if (value == "sports_kabaddi_outlined")
      return Icons.sports_kabaddi_outlined;
    if (value == "sports_martial_arts") return Icons.sports_martial_arts;
    if (value == "sports_martial_arts_sharp")
      return Icons.sports_martial_arts_sharp;
    if (value == "sports_martial_arts_rounded")
      return Icons.sports_martial_arts_rounded;
    if (value == "sports_martial_arts_outlined")
      return Icons.sports_martial_arts_outlined;
    if (value == "sports_mma") return Icons.sports_mma;
    if (value == "sports_mma_sharp") return Icons.sports_mma_sharp;
    if (value == "sports_mma_rounded") return Icons.sports_mma_rounded;
    if (value == "sports_mma_outlined") return Icons.sports_mma_outlined;
    if (value == "sports_motorsports") return Icons.sports_motorsports;
    if (value == "sports_motorsports_sharp")
      return Icons.sports_motorsports_sharp;
    if (value == "sports_motorsports_rounded")
      return Icons.sports_motorsports_rounded;
    if (value == "sports_motorsports_outlined")
      return Icons.sports_motorsports_outlined;
    if (value == "sports_rugby") return Icons.sports_rugby;
    if (value == "sports_rugby_sharp") return Icons.sports_rugby_sharp;
    if (value == "sports_rugby_rounded") return Icons.sports_rugby_rounded;
    if (value == "sports_rugby_outlined") return Icons.sports_rugby_outlined;
    if (value == "sports_score") return Icons.sports_score;
    if (value == "sports_score_sharp") return Icons.sports_score_sharp;
    if (value == "sports_score_rounded") return Icons.sports_score_rounded;
    if (value == "sports_score_outlined") return Icons.sports_score_outlined;
    if (value == "sports_soccer") return Icons.sports_soccer;
    if (value == "sports_soccer_sharp") return Icons.sports_soccer_sharp;
    if (value == "sports_soccer_rounded") return Icons.sports_soccer_rounded;
    if (value == "sports_soccer_outlined") return Icons.sports_soccer_outlined;
    if (value == "sports_tennis") return Icons.sports_tennis;
    if (value == "sports_tennis_sharp") return Icons.sports_tennis_sharp;
    if (value == "sports_tennis_rounded") return Icons.sports_tennis_rounded;
    if (value == "sports_tennis_outlined") return Icons.sports_tennis_outlined;
    if (value == "sports_volleyball") return Icons.sports_volleyball;
    if (value == "sports_volleyball_sharp")
      return Icons.sports_volleyball_sharp;
    if (value == "sports_volleyball_rounded")
      return Icons.sports_volleyball_rounded;
    if (value == "sports_volleyball_outlined")
      return Icons.sports_volleyball_outlined;
    if (value == "square") return Icons.square;
    if (value == "square_sharp") return Icons.square_sharp;
    if (value == "square_rounded") return Icons.square_rounded;
    if (value == "square_outlined") return Icons.square_outlined;
    if (value == "square_foot") return Icons.square_foot;
    if (value == "square_foot_sharp") return Icons.square_foot_sharp;
    if (value == "square_foot_rounded") return Icons.square_foot_rounded;
    if (value == "square_foot_outlined") return Icons.square_foot_outlined;
    if (value == "ssid_chart") return Icons.ssid_chart;
    if (value == "ssid_chart_sharp") return Icons.ssid_chart_sharp;
    if (value == "ssid_chart_rounded") return Icons.ssid_chart_rounded;
    if (value == "ssid_chart_outlined") return Icons.ssid_chart_outlined;
    if (value == "stacked_bar_chart") return Icons.stacked_bar_chart;
    if (value == "stacked_bar_chart_sharp")
      return Icons.stacked_bar_chart_sharp;
    if (value == "stacked_bar_chart_rounded")
      return Icons.stacked_bar_chart_rounded;
    if (value == "stacked_bar_chart_outlined")
      return Icons.stacked_bar_chart_outlined;
    if (value == "stacked_line_chart") return Icons.stacked_line_chart;
    if (value == "stacked_line_chart_sharp")
      return Icons.stacked_line_chart_sharp;
    if (value == "stacked_line_chart_rounded")
      return Icons.stacked_line_chart_rounded;
    if (value == "stacked_line_chart_outlined")
      return Icons.stacked_line_chart_outlined;
    if (value == "stadium") return Icons.stadium;
    if (value == "stadium_sharp") return Icons.stadium_sharp;
    if (value == "stadium_rounded") return Icons.stadium_rounded;
    if (value == "stadium_outlined") return Icons.stadium_outlined;
    if (value == "stairs") return Icons.stairs;
    if (value == "stairs_sharp") return Icons.stairs_sharp;
    if (value == "stairs_rounded") return Icons.stairs_rounded;
    if (value == "stairs_outlined") return Icons.stairs_outlined;
    if (value == "star") return Icons.star;
    if (value == "star_sharp") return Icons.star_sharp;
    if (value == "star_rounded") return Icons.star_rounded;
    if (value == "star_outlined") return Icons.star_outlined;
    if (value == "star_border") return Icons.star_border;
    if (value == "star_border_sharp") return Icons.star_border_sharp;
    if (value == "star_border_rounded") return Icons.star_border_rounded;
    if (value == "star_border_outlined") return Icons.star_border_outlined;
    if (value == "star_border_purple500") return Icons.star_border_purple500;
    if (value == "star_border_purple500_sharp")
      return Icons.star_border_purple500_sharp;
    if (value == "star_border_purple500_rounded")
      return Icons.star_border_purple500_rounded;
    if (value == "star_border_purple500_outlined")
      return Icons.star_border_purple500_outlined;
    if (value == "star_half") return Icons.star_half;
    if (value == "star_half_sharp") return Icons.star_half_sharp;
    if (value == "star_half_rounded") return Icons.star_half_rounded;
    if (value == "star_half_outlined") return Icons.star_half_outlined;
    if (value == "star_outline") return Icons.star_outline;
    if (value == "star_outline_sharp") return Icons.star_outline_sharp;
    if (value == "star_outline_rounded") return Icons.star_outline_rounded;
    if (value == "star_outline_outlined") return Icons.star_outline_outlined;
    if (value == "star_purple500") return Icons.star_purple500;
    if (value == "star_purple500_sharp") return Icons.star_purple500_sharp;
    if (value == "star_purple500_rounded") return Icons.star_purple500_rounded;
    if (value == "star_purple500_outlined")
      return Icons.star_purple500_outlined;
    if (value == "star_rate") return Icons.star_rate;
    if (value == "star_rate_sharp") return Icons.star_rate_sharp;
    if (value == "star_rate_rounded") return Icons.star_rate_rounded;
    if (value == "star_rate_outlined") return Icons.star_rate_outlined;
    if (value == "stars") return Icons.stars;
    if (value == "stars_sharp") return Icons.stars_sharp;
    if (value == "stars_rounded") return Icons.stars_rounded;
    if (value == "stars_outlined") return Icons.stars_outlined;
    if (value == "start") return Icons.start;
    if (value == "start_sharp") return Icons.start_sharp;
    if (value == "start_rounded") return Icons.start_rounded;
    if (value == "start_outlined") return Icons.start_outlined;
    if (value == "stay_current_landscape") return Icons.stay_current_landscape;
    if (value == "stay_current_landscape_sharp")
      return Icons.stay_current_landscape_sharp;
    if (value == "stay_current_landscape_rounded")
      return Icons.stay_current_landscape_rounded;
    if (value == "stay_current_landscape_outlined")
      return Icons.stay_current_landscape_outlined;
    if (value == "stay_current_portrait") return Icons.stay_current_portrait;
    if (value == "stay_current_portrait_sharp")
      return Icons.stay_current_portrait_sharp;
    if (value == "stay_current_portrait_rounded")
      return Icons.stay_current_portrait_rounded;
    if (value == "stay_current_portrait_outlined")
      return Icons.stay_current_portrait_outlined;
    if (value == "stay_primary_landscape") return Icons.stay_primary_landscape;
    if (value == "stay_primary_landscape_sharp")
      return Icons.stay_primary_landscape_sharp;
    if (value == "stay_primary_landscape_rounded")
      return Icons.stay_primary_landscape_rounded;
    if (value == "stay_primary_landscape_outlined")
      return Icons.stay_primary_landscape_outlined;
    if (value == "stay_primary_portrait") return Icons.stay_primary_portrait;
    if (value == "stay_primary_portrait_sharp")
      return Icons.stay_primary_portrait_sharp;
    if (value == "stay_primary_portrait_rounded")
      return Icons.stay_primary_portrait_rounded;
    if (value == "stay_primary_portrait_outlined")
      return Icons.stay_primary_portrait_outlined;
    if (value == "sticky_note_2") return Icons.sticky_note_2;
    if (value == "sticky_note_2_sharp") return Icons.sticky_note_2_sharp;
    if (value == "sticky_note_2_rounded") return Icons.sticky_note_2_rounded;
    if (value == "sticky_note_2_outlined") return Icons.sticky_note_2_outlined;
    if (value == "stop") return Icons.stop;
    if (value == "stop_sharp") return Icons.stop_sharp;
    if (value == "stop_rounded") return Icons.stop_rounded;
    if (value == "stop_outlined") return Icons.stop_outlined;
    if (value == "stop_circle") return Icons.stop_circle;
    if (value == "stop_circle_sharp") return Icons.stop_circle_sharp;
    if (value == "stop_circle_rounded") return Icons.stop_circle_rounded;
    if (value == "stop_circle_outlined") return Icons.stop_circle_outlined;
    if (value == "stop_screen_share") return Icons.stop_screen_share;
    if (value == "stop_screen_share_sharp")
      return Icons.stop_screen_share_sharp;
    if (value == "stop_screen_share_rounded")
      return Icons.stop_screen_share_rounded;
    if (value == "stop_screen_share_outlined")
      return Icons.stop_screen_share_outlined;
    if (value == "storage") return Icons.storage;
    if (value == "storage_sharp") return Icons.storage_sharp;
    if (value == "storage_rounded") return Icons.storage_rounded;
    if (value == "storage_outlined") return Icons.storage_outlined;
    if (value == "store") return Icons.store;
    if (value == "store_sharp") return Icons.store_sharp;
    if (value == "store_rounded") return Icons.store_rounded;
    if (value == "store_outlined") return Icons.store_outlined;
    if (value == "store_mall_directory") return Icons.store_mall_directory;
    if (value == "store_mall_directory_sharp")
      return Icons.store_mall_directory_sharp;
    if (value == "store_mall_directory_rounded")
      return Icons.store_mall_directory_rounded;
    if (value == "store_mall_directory_outlined")
      return Icons.store_mall_directory_outlined;
    if (value == "storefront") return Icons.storefront;
    if (value == "storefront_sharp") return Icons.storefront_sharp;
    if (value == "storefront_rounded") return Icons.storefront_rounded;
    if (value == "storefront_outlined") return Icons.storefront_outlined;
    if (value == "storm") return Icons.storm;
    if (value == "storm_sharp") return Icons.storm_sharp;
    if (value == "storm_rounded") return Icons.storm_rounded;
    if (value == "storm_outlined") return Icons.storm_outlined;
    if (value == "straight") return Icons.straight;
    if (value == "straight_sharp") return Icons.straight_sharp;
    if (value == "straight_rounded") return Icons.straight_rounded;
    if (value == "straight_outlined") return Icons.straight_outlined;
    if (value == "straighten") return Icons.straighten;
    if (value == "straighten_sharp") return Icons.straighten_sharp;
    if (value == "straighten_rounded") return Icons.straighten_rounded;
    if (value == "straighten_outlined") return Icons.straighten_outlined;
    if (value == "stream") return Icons.stream;
    if (value == "stream_sharp") return Icons.stream_sharp;
    if (value == "stream_rounded") return Icons.stream_rounded;
    if (value == "stream_outlined") return Icons.stream_outlined;
    if (value == "streetview") return Icons.streetview;
    if (value == "streetview_sharp") return Icons.streetview_sharp;
    if (value == "streetview_rounded") return Icons.streetview_rounded;
    if (value == "streetview_outlined") return Icons.streetview_outlined;
    if (value == "strikethrough_s") return Icons.strikethrough_s;
    if (value == "strikethrough_s_sharp") return Icons.strikethrough_s_sharp;
    if (value == "strikethrough_s_rounded")
      return Icons.strikethrough_s_rounded;
    if (value == "strikethrough_s_outlined")
      return Icons.strikethrough_s_outlined;
    if (value == "stroller") return Icons.stroller;
    if (value == "stroller_sharp") return Icons.stroller_sharp;
    if (value == "stroller_rounded") return Icons.stroller_rounded;
    if (value == "stroller_outlined") return Icons.stroller_outlined;
    if (value == "style") return Icons.style;
    if (value == "style_sharp") return Icons.style_sharp;
    if (value == "style_rounded") return Icons.style_rounded;
    if (value == "style_outlined") return Icons.style_outlined;
    if (value == "subdirectory_arrow_left")
      return Icons.subdirectory_arrow_left;
    if (value == "subdirectory_arrow_left_sharp")
      return Icons.subdirectory_arrow_left_sharp;
    if (value == "subdirectory_arrow_left_rounded")
      return Icons.subdirectory_arrow_left_rounded;
    if (value == "subdirectory_arrow_left_outlined")
      return Icons.subdirectory_arrow_left_outlined;
    if (value == "subdirectory_arrow_right")
      return Icons.subdirectory_arrow_right;
    if (value == "subdirectory_arrow_right_sharp")
      return Icons.subdirectory_arrow_right_sharp;
    if (value == "subdirectory_arrow_right_rounded")
      return Icons.subdirectory_arrow_right_rounded;
    if (value == "subdirectory_arrow_right_outlined")
      return Icons.subdirectory_arrow_right_outlined;
    if (value == "subject") return Icons.subject;
    if (value == "subject_sharp") return Icons.subject_sharp;
    if (value == "subject_rounded") return Icons.subject_rounded;
    if (value == "subject_outlined") return Icons.subject_outlined;
    if (value == "subscript") return Icons.subscript;
    if (value == "subscript_sharp") return Icons.subscript_sharp;
    if (value == "subscript_rounded") return Icons.subscript_rounded;
    if (value == "subscript_outlined") return Icons.subscript_outlined;
    if (value == "subscriptions") return Icons.subscriptions;
    if (value == "subscriptions_sharp") return Icons.subscriptions_sharp;
    if (value == "subscriptions_rounded") return Icons.subscriptions_rounded;
    if (value == "subscriptions_outlined") return Icons.subscriptions_outlined;
    if (value == "subtitles") return Icons.subtitles;
    if (value == "subtitles_sharp") return Icons.subtitles_sharp;
    if (value == "subtitles_rounded") return Icons.subtitles_rounded;
    if (value == "subtitles_outlined") return Icons.subtitles_outlined;
    if (value == "subtitles_off") return Icons.subtitles_off;
    if (value == "subtitles_off_sharp") return Icons.subtitles_off_sharp;
    if (value == "subtitles_off_rounded") return Icons.subtitles_off_rounded;
    if (value == "subtitles_off_outlined") return Icons.subtitles_off_outlined;
    if (value == "subway") return Icons.subway;
    if (value == "subway_sharp") return Icons.subway_sharp;
    if (value == "subway_rounded") return Icons.subway_rounded;
    if (value == "subway_outlined") return Icons.subway_outlined;
    if (value == "summarize") return Icons.summarize;
    if (value == "summarize_sharp") return Icons.summarize_sharp;
    if (value == "summarize_rounded") return Icons.summarize_rounded;
    if (value == "summarize_outlined") return Icons.summarize_outlined;
    if (value == "sunny") return Icons.sunny;
    if (value == "sunny_snowing") return Icons.sunny_snowing;
    if (value == "superscript") return Icons.superscript;
    if (value == "superscript_sharp") return Icons.superscript_sharp;
    if (value == "superscript_rounded") return Icons.superscript_rounded;
    if (value == "superscript_outlined") return Icons.superscript_outlined;
    if (value == "supervised_user_circle") return Icons.supervised_user_circle;
    if (value == "supervised_user_circle_sharp")
      return Icons.supervised_user_circle_sharp;
    if (value == "supervised_user_circle_rounded")
      return Icons.supervised_user_circle_rounded;
    if (value == "supervised_user_circle_outlined")
      return Icons.supervised_user_circle_outlined;
    if (value == "supervisor_account") return Icons.supervisor_account;
    if (value == "supervisor_account_sharp")
      return Icons.supervisor_account_sharp;
    if (value == "supervisor_account_rounded")
      return Icons.supervisor_account_rounded;
    if (value == "supervisor_account_outlined")
      return Icons.supervisor_account_outlined;
    if (value == "support") return Icons.support;
    if (value == "support_sharp") return Icons.support_sharp;
    if (value == "support_rounded") return Icons.support_rounded;
    if (value == "support_outlined") return Icons.support_outlined;
    if (value == "support_agent") return Icons.support_agent;
    if (value == "support_agent_sharp") return Icons.support_agent_sharp;
    if (value == "support_agent_rounded") return Icons.support_agent_rounded;
    if (value == "support_agent_outlined") return Icons.support_agent_outlined;
    if (value == "surfing") return Icons.surfing;
    if (value == "surfing_sharp") return Icons.surfing_sharp;
    if (value == "surfing_rounded") return Icons.surfing_rounded;
    if (value == "surfing_outlined") return Icons.surfing_outlined;
    if (value == "surround_sound") return Icons.surround_sound;
    if (value == "surround_sound_sharp") return Icons.surround_sound_sharp;
    if (value == "surround_sound_rounded") return Icons.surround_sound_rounded;
    if (value == "surround_sound_outlined")
      return Icons.surround_sound_outlined;
    if (value == "swap_calls") return Icons.swap_calls;
    if (value == "swap_calls_sharp") return Icons.swap_calls_sharp;
    if (value == "swap_calls_rounded") return Icons.swap_calls_rounded;
    if (value == "swap_calls_outlined") return Icons.swap_calls_outlined;
    if (value == "swap_horiz") return Icons.swap_horiz;
    if (value == "swap_horiz_sharp") return Icons.swap_horiz_sharp;
    if (value == "swap_horiz_rounded") return Icons.swap_horiz_rounded;
    if (value == "swap_horiz_outlined") return Icons.swap_horiz_outlined;
    if (value == "swap_horizontal_circle") return Icons.swap_horizontal_circle;
    if (value == "swap_horizontal_circle_sharp")
      return Icons.swap_horizontal_circle_sharp;
    if (value == "swap_horizontal_circle_rounded")
      return Icons.swap_horizontal_circle_rounded;
    if (value == "swap_horizontal_circle_outlined")
      return Icons.swap_horizontal_circle_outlined;
    if (value == "swap_vert") return Icons.swap_vert;
    if (value == "swap_vert_sharp") return Icons.swap_vert_sharp;
    if (value == "swap_vert_rounded") return Icons.swap_vert_rounded;
    if (value == "swap_vert_outlined") return Icons.swap_vert_outlined;
    if (value == "swap_vert_circle") return Icons.swap_vert_circle;
    if (value == "swap_vert_circle_sharp") return Icons.swap_vert_circle_sharp;
    if (value == "swap_vert_circle_rounded")
      return Icons.swap_vert_circle_rounded;
    if (value == "swap_vert_circle_outlined")
      return Icons.swap_vert_circle_outlined;
    if (value == "swap_vertical_circle") return Icons.swap_vertical_circle;
    if (value == "swap_vertical_circle_sharp")
      return Icons.swap_vertical_circle_sharp;
    if (value == "swap_vertical_circle_rounded")
      return Icons.swap_vertical_circle_rounded;
    if (value == "swap_vertical_circle_outlined")
      return Icons.swap_vertical_circle_outlined;
    if (value == "swipe") return Icons.swipe;
    if (value == "swipe_sharp") return Icons.swipe_sharp;
    if (value == "swipe_rounded") return Icons.swipe_rounded;
    if (value == "swipe_outlined") return Icons.swipe_outlined;
    if (value == "swipe_down") return Icons.swipe_down;
    if (value == "swipe_down_sharp") return Icons.swipe_down_sharp;
    if (value == "swipe_down_rounded") return Icons.swipe_down_rounded;
    if (value == "swipe_down_outlined") return Icons.swipe_down_outlined;
    if (value == "swipe_down_alt") return Icons.swipe_down_alt;
    if (value == "swipe_down_alt_sharp") return Icons.swipe_down_alt_sharp;
    if (value == "swipe_down_alt_rounded") return Icons.swipe_down_alt_rounded;
    if (value == "swipe_down_alt_outlined")
      return Icons.swipe_down_alt_outlined;
    if (value == "swipe_left") return Icons.swipe_left;
    if (value == "swipe_left_sharp") return Icons.swipe_left_sharp;
    if (value == "swipe_left_rounded") return Icons.swipe_left_rounded;
    if (value == "swipe_left_outlined") return Icons.swipe_left_outlined;
    if (value == "swipe_left_alt") return Icons.swipe_left_alt;
    if (value == "swipe_left_alt_sharp") return Icons.swipe_left_alt_sharp;
    if (value == "swipe_left_alt_rounded") return Icons.swipe_left_alt_rounded;
    if (value == "swipe_left_alt_outlined")
      return Icons.swipe_left_alt_outlined;
    if (value == "swipe_right") return Icons.swipe_right;
    if (value == "swipe_right_sharp") return Icons.swipe_right_sharp;
    if (value == "swipe_right_rounded") return Icons.swipe_right_rounded;
    if (value == "swipe_right_outlined") return Icons.swipe_right_outlined;
    if (value == "swipe_right_alt") return Icons.swipe_right_alt;
    if (value == "swipe_right_alt_sharp") return Icons.swipe_right_alt_sharp;
    if (value == "swipe_right_alt_rounded")
      return Icons.swipe_right_alt_rounded;
    if (value == "swipe_right_alt_outlined")
      return Icons.swipe_right_alt_outlined;
    if (value == "swipe_up") return Icons.swipe_up;
    if (value == "swipe_up_sharp") return Icons.swipe_up_sharp;
    if (value == "swipe_up_rounded") return Icons.swipe_up_rounded;
    if (value == "swipe_up_outlined") return Icons.swipe_up_outlined;
    if (value == "swipe_up_alt") return Icons.swipe_up_alt;
    if (value == "swipe_up_alt_sharp") return Icons.swipe_up_alt_sharp;
    if (value == "swipe_up_alt_rounded") return Icons.swipe_up_alt_rounded;
    if (value == "swipe_up_alt_outlined") return Icons.swipe_up_alt_outlined;
    if (value == "swipe_vertical") return Icons.swipe_vertical;
    if (value == "swipe_vertical_sharp") return Icons.swipe_vertical_sharp;
    if (value == "swipe_vertical_rounded") return Icons.swipe_vertical_rounded;
    if (value == "swipe_vertical_outlined")
      return Icons.swipe_vertical_outlined;
    if (value == "switch_access_shortcut") return Icons.switch_access_shortcut;
    if (value == "switch_access_shortcut_sharp")
      return Icons.switch_access_shortcut_sharp;
    if (value == "switch_access_shortcut_rounded")
      return Icons.switch_access_shortcut_rounded;
    if (value == "switch_access_shortcut_outlined")
      return Icons.switch_access_shortcut_outlined;
    if (value == "switch_access_shortcut_add")
      return Icons.switch_access_shortcut_add;
    if (value == "switch_access_shortcut_add_sharp")
      return Icons.switch_access_shortcut_add_sharp;
    if (value == "switch_access_shortcut_add_rounded")
      return Icons.switch_access_shortcut_add_rounded;
    if (value == "switch_access_shortcut_add_outlined")
      return Icons.switch_access_shortcut_add_outlined;
    if (value == "switch_account") return Icons.switch_account;
    if (value == "switch_account_sharp") return Icons.switch_account_sharp;
    if (value == "switch_account_rounded") return Icons.switch_account_rounded;
    if (value == "switch_account_outlined")
      return Icons.switch_account_outlined;
    if (value == "switch_camera") return Icons.switch_camera;
    if (value == "switch_camera_sharp") return Icons.switch_camera_sharp;
    if (value == "switch_camera_rounded") return Icons.switch_camera_rounded;
    if (value == "switch_camera_outlined") return Icons.switch_camera_outlined;
    if (value == "switch_left") return Icons.switch_left;
    if (value == "switch_left_sharp") return Icons.switch_left_sharp;
    if (value == "switch_left_rounded") return Icons.switch_left_rounded;
    if (value == "switch_left_outlined") return Icons.switch_left_outlined;
    if (value == "switch_right") return Icons.switch_right;
    if (value == "switch_right_sharp") return Icons.switch_right_sharp;
    if (value == "switch_right_rounded") return Icons.switch_right_rounded;
    if (value == "switch_right_outlined") return Icons.switch_right_outlined;
    if (value == "switch_video") return Icons.switch_video;
    if (value == "switch_video_sharp") return Icons.switch_video_sharp;
    if (value == "switch_video_rounded") return Icons.switch_video_rounded;
    if (value == "switch_video_outlined") return Icons.switch_video_outlined;
    if (value == "synagogue") return Icons.synagogue;
    if (value == "synagogue_sharp") return Icons.synagogue_sharp;
    if (value == "synagogue_rounded") return Icons.synagogue_rounded;
    if (value == "synagogue_outlined") return Icons.synagogue_outlined;
    if (value == "sync") return Icons.sync;
    if (value == "sync_sharp") return Icons.sync_sharp;
    if (value == "sync_rounded") return Icons.sync_rounded;
    if (value == "sync_outlined") return Icons.sync_outlined;
    if (value == "sync_alt") return Icons.sync_alt;
    if (value == "sync_alt_sharp") return Icons.sync_alt_sharp;
    if (value == "sync_alt_rounded") return Icons.sync_alt_rounded;
    if (value == "sync_alt_outlined") return Icons.sync_alt_outlined;
    if (value == "sync_disabled") return Icons.sync_disabled;
    if (value == "sync_disabled_sharp") return Icons.sync_disabled_sharp;
    if (value == "sync_disabled_rounded") return Icons.sync_disabled_rounded;
    if (value == "sync_disabled_outlined") return Icons.sync_disabled_outlined;
    if (value == "sync_lock") return Icons.sync_lock;
    if (value == "sync_lock_sharp") return Icons.sync_lock_sharp;
    if (value == "sync_lock_rounded") return Icons.sync_lock_rounded;
    if (value == "sync_lock_outlined") return Icons.sync_lock_outlined;
    if (value == "sync_problem") return Icons.sync_problem;
    if (value == "sync_problem_sharp") return Icons.sync_problem_sharp;
    if (value == "sync_problem_rounded") return Icons.sync_problem_rounded;
    if (value == "sync_problem_outlined") return Icons.sync_problem_outlined;
    if (value == "system_security_update") return Icons.system_security_update;
    if (value == "system_security_update_sharp")
      return Icons.system_security_update_sharp;
    if (value == "system_security_update_rounded")
      return Icons.system_security_update_rounded;
    if (value == "system_security_update_outlined")
      return Icons.system_security_update_outlined;
    if (value == "system_security_update_good")
      return Icons.system_security_update_good;
    if (value == "system_security_update_good_sharp")
      return Icons.system_security_update_good_sharp;
    if (value == "system_security_update_good_rounded")
      return Icons.system_security_update_good_rounded;
    if (value == "system_security_update_good_outlined")
      return Icons.system_security_update_good_outlined;
    if (value == "system_security_update_warning")
      return Icons.system_security_update_warning;
    if (value == "system_security_update_warning_sharp")
      return Icons.system_security_update_warning_sharp;
    if (value == "system_security_update_warning_rounded")
      return Icons.system_security_update_warning_rounded;
    if (value == "system_security_update_warning_outlined")
      return Icons.system_security_update_warning_outlined;
    if (value == "system_update") return Icons.system_update;
    if (value == "system_update_sharp") return Icons.system_update_sharp;
    if (value == "system_update_rounded") return Icons.system_update_rounded;
    if (value == "system_update_outlined") return Icons.system_update_outlined;
    if (value == "system_update_alt") return Icons.system_update_alt;
    if (value == "system_update_alt_sharp")
      return Icons.system_update_alt_sharp;
    if (value == "system_update_alt_rounded")
      return Icons.system_update_alt_rounded;
    if (value == "system_update_alt_outlined")
      return Icons.system_update_alt_outlined;
    if (value == "system_update_tv") return Icons.system_update_tv;
    if (value == "system_update_tv_sharp") return Icons.system_update_tv_sharp;
    if (value == "system_update_tv_rounded")
      return Icons.system_update_tv_rounded;
    if (value == "system_update_tv_outlined")
      return Icons.system_update_tv_outlined;
    if (value == "tab") return Icons.tab;
    if (value == "tab_sharp") return Icons.tab_sharp;
    if (value == "tab_rounded") return Icons.tab_rounded;
    if (value == "tab_outlined") return Icons.tab_outlined;
    if (value == "tab_unselected") return Icons.tab_unselected;
    if (value == "tab_unselected_sharp") return Icons.tab_unselected_sharp;
    if (value == "tab_unselected_rounded") return Icons.tab_unselected_rounded;
    if (value == "tab_unselected_outlined")
      return Icons.tab_unselected_outlined;
    if (value == "table_bar") return Icons.table_bar;
    if (value == "table_bar_sharp") return Icons.table_bar_sharp;
    if (value == "table_bar_rounded") return Icons.table_bar_rounded;
    if (value == "table_bar_outlined") return Icons.table_bar_outlined;
    if (value == "table_chart") return Icons.table_chart;
    if (value == "table_chart_sharp") return Icons.table_chart_sharp;
    if (value == "table_chart_rounded") return Icons.table_chart_rounded;
    if (value == "table_chart_outlined") return Icons.table_chart_outlined;
    if (value == "table_restaurant") return Icons.table_restaurant;
    if (value == "table_restaurant_sharp") return Icons.table_restaurant_sharp;
    if (value == "table_restaurant_rounded")
      return Icons.table_restaurant_rounded;
    if (value == "table_restaurant_outlined")
      return Icons.table_restaurant_outlined;
    if (value == "table_rows") return Icons.table_rows;
    if (value == "table_rows_sharp") return Icons.table_rows_sharp;
    if (value == "table_rows_rounded") return Icons.table_rows_rounded;
    if (value == "table_rows_outlined") return Icons.table_rows_outlined;
    if (value == "table_view") return Icons.table_view;
    if (value == "table_view_sharp") return Icons.table_view_sharp;
    if (value == "table_view_rounded") return Icons.table_view_rounded;
    if (value == "table_view_outlined") return Icons.table_view_outlined;
    if (value == "tablet") return Icons.tablet;
    if (value == "tablet_sharp") return Icons.tablet_sharp;
    if (value == "tablet_rounded") return Icons.tablet_rounded;
    if (value == "tablet_outlined") return Icons.tablet_outlined;
    if (value == "tablet_android") return Icons.tablet_android;
    if (value == "tablet_android_sharp") return Icons.tablet_android_sharp;
    if (value == "tablet_android_rounded") return Icons.tablet_android_rounded;
    if (value == "tablet_android_outlined")
      return Icons.tablet_android_outlined;
    if (value == "tablet_mac") return Icons.tablet_mac;
    if (value == "tablet_mac_sharp") return Icons.tablet_mac_sharp;
    if (value == "tablet_mac_rounded") return Icons.tablet_mac_rounded;
    if (value == "tablet_mac_outlined") return Icons.tablet_mac_outlined;
    if (value == "tag") return Icons.tag;
    if (value == "tag_sharp") return Icons.tag_sharp;
    if (value == "tag_rounded") return Icons.tag_rounded;
    if (value == "tag_outlined") return Icons.tag_outlined;
    if (value == "tag_faces") return Icons.tag_faces;
    if (value == "tag_faces_sharp") return Icons.tag_faces_sharp;
    if (value == "tag_faces_rounded") return Icons.tag_faces_rounded;
    if (value == "tag_faces_outlined") return Icons.tag_faces_outlined;
    if (value == "takeout_dining") return Icons.takeout_dining;
    if (value == "takeout_dining_sharp") return Icons.takeout_dining_sharp;
    if (value == "takeout_dining_rounded") return Icons.takeout_dining_rounded;
    if (value == "takeout_dining_outlined")
      return Icons.takeout_dining_outlined;
    if (value == "tap_and_play") return Icons.tap_and_play;
    if (value == "tap_and_play_sharp") return Icons.tap_and_play_sharp;
    if (value == "tap_and_play_rounded") return Icons.tap_and_play_rounded;
    if (value == "tap_and_play_outlined") return Icons.tap_and_play_outlined;
    if (value == "tapas") return Icons.tapas;
    if (value == "tapas_sharp") return Icons.tapas_sharp;
    if (value == "tapas_rounded") return Icons.tapas_rounded;
    if (value == "tapas_outlined") return Icons.tapas_outlined;
    if (value == "task") return Icons.task;
    if (value == "task_sharp") return Icons.task_sharp;
    if (value == "task_rounded") return Icons.task_rounded;
    if (value == "task_outlined") return Icons.task_outlined;
    if (value == "task_alt") return Icons.task_alt;
    if (value == "task_alt_sharp") return Icons.task_alt_sharp;
    if (value == "task_alt_rounded") return Icons.task_alt_rounded;
    if (value == "task_alt_outlined") return Icons.task_alt_outlined;
    if (value == "taxi_alert") return Icons.taxi_alert;
    if (value == "taxi_alert_sharp") return Icons.taxi_alert_sharp;
    if (value == "taxi_alert_rounded") return Icons.taxi_alert_rounded;
    if (value == "taxi_alert_outlined") return Icons.taxi_alert_outlined;
    if (value == "telegram") return Icons.telegram;
    if (value == "telegram_sharp") return Icons.telegram_sharp;
    if (value == "telegram_rounded") return Icons.telegram_rounded;
    if (value == "telegram_outlined") return Icons.telegram_outlined;
    if (value == "temple_buddhist") return Icons.temple_buddhist;
    if (value == "temple_buddhist_sharp") return Icons.temple_buddhist_sharp;
    if (value == "temple_buddhist_rounded")
      return Icons.temple_buddhist_rounded;
    if (value == "temple_buddhist_outlined")
      return Icons.temple_buddhist_outlined;
    if (value == "temple_hindu") return Icons.temple_hindu;
    if (value == "temple_hindu_sharp") return Icons.temple_hindu_sharp;
    if (value == "temple_hindu_rounded") return Icons.temple_hindu_rounded;
    if (value == "temple_hindu_outlined") return Icons.temple_hindu_outlined;
    if (value == "terminal") return Icons.terminal;
    if (value == "terminal_sharp") return Icons.terminal_sharp;
    if (value == "terminal_rounded") return Icons.terminal_rounded;
    if (value == "terminal_outlined") return Icons.terminal_outlined;
    if (value == "terrain") return Icons.terrain;
    if (value == "terrain_sharp") return Icons.terrain_sharp;
    if (value == "terrain_rounded") return Icons.terrain_rounded;
    if (value == "terrain_outlined") return Icons.terrain_outlined;
    if (value == "text_decrease") return Icons.text_decrease;
    if (value == "text_decrease_sharp") return Icons.text_decrease_sharp;
    if (value == "text_decrease_rounded") return Icons.text_decrease_rounded;
    if (value == "text_decrease_outlined") return Icons.text_decrease_outlined;
    if (value == "text_fields") return Icons.text_fields;
    if (value == "text_fields_sharp") return Icons.text_fields_sharp;
    if (value == "text_fields_rounded") return Icons.text_fields_rounded;
    if (value == "text_fields_outlined") return Icons.text_fields_outlined;
    if (value == "text_format") return Icons.text_format;
    if (value == "text_format_sharp") return Icons.text_format_sharp;
    if (value == "text_format_rounded") return Icons.text_format_rounded;
    if (value == "text_format_outlined") return Icons.text_format_outlined;
    if (value == "text_increase") return Icons.text_increase;
    if (value == "text_increase_sharp") return Icons.text_increase_sharp;
    if (value == "text_increase_rounded") return Icons.text_increase_rounded;
    if (value == "text_increase_outlined") return Icons.text_increase_outlined;
    if (value == "text_rotate_up") return Icons.text_rotate_up;
    if (value == "text_rotate_up_sharp") return Icons.text_rotate_up_sharp;
    if (value == "text_rotate_up_rounded") return Icons.text_rotate_up_rounded;
    if (value == "text_rotate_up_outlined")
      return Icons.text_rotate_up_outlined;
    if (value == "text_rotate_vertical") return Icons.text_rotate_vertical;
    if (value == "text_rotate_vertical_sharp")
      return Icons.text_rotate_vertical_sharp;
    if (value == "text_rotate_vertical_rounded")
      return Icons.text_rotate_vertical_rounded;
    if (value == "text_rotate_vertical_outlined")
      return Icons.text_rotate_vertical_outlined;
    if (value == "text_rotation_angledown")
      return Icons.text_rotation_angledown;
    if (value == "text_rotation_angledown_sharp")
      return Icons.text_rotation_angledown_sharp;
    if (value == "text_rotation_angledown_rounded")
      return Icons.text_rotation_angledown_rounded;
    if (value == "text_rotation_angledown_outlined")
      return Icons.text_rotation_angledown_outlined;
    if (value == "text_rotation_angleup") return Icons.text_rotation_angleup;
    if (value == "text_rotation_angleup_sharp")
      return Icons.text_rotation_angleup_sharp;
    if (value == "text_rotation_angleup_rounded")
      return Icons.text_rotation_angleup_rounded;
    if (value == "text_rotation_angleup_outlined")
      return Icons.text_rotation_angleup_outlined;
    if (value == "text_rotation_down") return Icons.text_rotation_down;
    if (value == "text_rotation_down_sharp")
      return Icons.text_rotation_down_sharp;
    if (value == "text_rotation_down_rounded")
      return Icons.text_rotation_down_rounded;
    if (value == "text_rotation_down_outlined")
      return Icons.text_rotation_down_outlined;
    if (value == "text_rotation_none") return Icons.text_rotation_none;
    if (value == "text_rotation_none_sharp")
      return Icons.text_rotation_none_sharp;
    if (value == "text_rotation_none_rounded")
      return Icons.text_rotation_none_rounded;
    if (value == "text_rotation_none_outlined")
      return Icons.text_rotation_none_outlined;
    if (value == "text_snippet") return Icons.text_snippet;
    if (value == "text_snippet_sharp") return Icons.text_snippet_sharp;
    if (value == "text_snippet_rounded") return Icons.text_snippet_rounded;
    if (value == "text_snippet_outlined") return Icons.text_snippet_outlined;
    if (value == "textsms") return Icons.textsms;
    if (value == "textsms_sharp") return Icons.textsms_sharp;
    if (value == "textsms_rounded") return Icons.textsms_rounded;
    if (value == "textsms_outlined") return Icons.textsms_outlined;
    if (value == "texture") return Icons.texture;
    if (value == "texture_sharp") return Icons.texture_sharp;
    if (value == "texture_rounded") return Icons.texture_rounded;
    if (value == "texture_outlined") return Icons.texture_outlined;
    if (value == "theater_comedy") return Icons.theater_comedy;
    if (value == "theater_comedy_sharp") return Icons.theater_comedy_sharp;
    if (value == "theater_comedy_rounded") return Icons.theater_comedy_rounded;
    if (value == "theater_comedy_outlined")
      return Icons.theater_comedy_outlined;
    if (value == "theaters") return Icons.theaters;
    if (value == "theaters_sharp") return Icons.theaters_sharp;
    if (value == "theaters_rounded") return Icons.theaters_rounded;
    if (value == "theaters_outlined") return Icons.theaters_outlined;
    if (value == "thermostat") return Icons.thermostat;
    if (value == "thermostat_sharp") return Icons.thermostat_sharp;
    if (value == "thermostat_rounded") return Icons.thermostat_rounded;
    if (value == "thermostat_outlined") return Icons.thermostat_outlined;
    if (value == "thermostat_auto") return Icons.thermostat_auto;
    if (value == "thermostat_auto_sharp") return Icons.thermostat_auto_sharp;
    if (value == "thermostat_auto_rounded")
      return Icons.thermostat_auto_rounded;
    if (value == "thermostat_auto_outlined")
      return Icons.thermostat_auto_outlined;
    if (value == "thumb_down") return Icons.thumb_down;
    if (value == "thumb_down_sharp") return Icons.thumb_down_sharp;
    if (value == "thumb_down_rounded") return Icons.thumb_down_rounded;
    if (value == "thumb_down_outlined") return Icons.thumb_down_outlined;
    if (value == "thumb_down_alt") return Icons.thumb_down_alt;
    if (value == "thumb_down_alt_sharp") return Icons.thumb_down_alt_sharp;
    if (value == "thumb_down_alt_rounded") return Icons.thumb_down_alt_rounded;
    if (value == "thumb_down_alt_outlined")
      return Icons.thumb_down_alt_outlined;
    if (value == "thumb_down_off_alt") return Icons.thumb_down_off_alt;
    if (value == "thumb_down_off_alt_sharp")
      return Icons.thumb_down_off_alt_sharp;
    if (value == "thumb_down_off_alt_rounded")
      return Icons.thumb_down_off_alt_rounded;
    if (value == "thumb_down_off_alt_outlined")
      return Icons.thumb_down_off_alt_outlined;
    if (value == "thumb_up") return Icons.thumb_up;
    if (value == "thumb_up_sharp") return Icons.thumb_up_sharp;
    if (value == "thumb_up_rounded") return Icons.thumb_up_rounded;
    if (value == "thumb_up_outlined") return Icons.thumb_up_outlined;
    if (value == "thumb_up_alt") return Icons.thumb_up_alt;
    if (value == "thumb_up_alt_sharp") return Icons.thumb_up_alt_sharp;
    if (value == "thumb_up_alt_rounded") return Icons.thumb_up_alt_rounded;
    if (value == "thumb_up_alt_outlined") return Icons.thumb_up_alt_outlined;
    if (value == "thumb_up_off_alt") return Icons.thumb_up_off_alt;
    if (value == "thumb_up_off_alt_sharp") return Icons.thumb_up_off_alt_sharp;
    if (value == "thumb_up_off_alt_rounded")
      return Icons.thumb_up_off_alt_rounded;
    if (value == "thumb_up_off_alt_outlined")
      return Icons.thumb_up_off_alt_outlined;
    if (value == "thumbs_up_down") return Icons.thumbs_up_down;
    if (value == "thumbs_up_down_sharp") return Icons.thumbs_up_down_sharp;
    if (value == "thumbs_up_down_rounded") return Icons.thumbs_up_down_rounded;
    if (value == "thumbs_up_down_outlined")
      return Icons.thumbs_up_down_outlined;
    if (value == "thunderstorm") return Icons.thunderstorm;
    if (value == "thunderstorm_sharp") return Icons.thunderstorm_sharp;
    if (value == "thunderstorm_rounded") return Icons.thunderstorm_rounded;
    if (value == "thunderstorm_outlined") return Icons.thunderstorm_outlined;
    if (value == "tiktok") return Icons.tiktok;
    if (value == "tiktok_sharp") return Icons.tiktok_sharp;
    if (value == "tiktok_rounded") return Icons.tiktok_rounded;
    if (value == "tiktok_outlined") return Icons.tiktok_outlined;
    if (value == "time_to_leave") return Icons.time_to_leave;
    if (value == "time_to_leave_sharp") return Icons.time_to_leave_sharp;
    if (value == "time_to_leave_rounded") return Icons.time_to_leave_rounded;
    if (value == "time_to_leave_outlined") return Icons.time_to_leave_outlined;
    if (value == "timelapse") return Icons.timelapse;
    if (value == "timelapse_sharp") return Icons.timelapse_sharp;
    if (value == "timelapse_rounded") return Icons.timelapse_rounded;
    if (value == "timelapse_outlined") return Icons.timelapse_outlined;
    if (value == "timeline") return Icons.timeline;
    if (value == "timeline_sharp") return Icons.timeline_sharp;
    if (value == "timeline_rounded") return Icons.timeline_rounded;
    if (value == "timeline_outlined") return Icons.timeline_outlined;
    if (value == "timer") return Icons.timer;
    if (value == "timer_sharp") return Icons.timer_sharp;
    if (value == "timer_rounded") return Icons.timer_rounded;
    if (value == "timer_outlined") return Icons.timer_outlined;
    if (value == "timer_10") return Icons.timer_10;
    if (value == "timer_10_sharp") return Icons.timer_10_sharp;
    if (value == "timer_10_rounded") return Icons.timer_10_rounded;
    if (value == "timer_10_outlined") return Icons.timer_10_outlined;
    if (value == "timer_10_select") return Icons.timer_10_select;
    if (value == "timer_10_select_sharp") return Icons.timer_10_select_sharp;
    if (value == "timer_10_select_rounded")
      return Icons.timer_10_select_rounded;
    if (value == "timer_10_select_outlined")
      return Icons.timer_10_select_outlined;
    if (value == "timer_3") return Icons.timer_3;
    if (value == "timer_3_sharp") return Icons.timer_3_sharp;
    if (value == "timer_3_rounded") return Icons.timer_3_rounded;
    if (value == "timer_3_outlined") return Icons.timer_3_outlined;
    if (value == "timer_3_select") return Icons.timer_3_select;
    if (value == "timer_3_select_sharp") return Icons.timer_3_select_sharp;
    if (value == "timer_3_select_rounded") return Icons.timer_3_select_rounded;
    if (value == "timer_3_select_outlined")
      return Icons.timer_3_select_outlined;
    if (value == "timer_off") return Icons.timer_off;
    if (value == "timer_off_sharp") return Icons.timer_off_sharp;
    if (value == "timer_off_rounded") return Icons.timer_off_rounded;
    if (value == "timer_off_outlined") return Icons.timer_off_outlined;
    if (value == "tips_and_updates") return Icons.tips_and_updates;
    if (value == "tips_and_updates_sharp") return Icons.tips_and_updates_sharp;
    if (value == "tips_and_updates_rounded")
      return Icons.tips_and_updates_rounded;
    if (value == "tips_and_updates_outlined")
      return Icons.tips_and_updates_outlined;
    if (value == "tire_repair") return Icons.tire_repair;
    if (value == "tire_repair_sharp") return Icons.tire_repair_sharp;
    if (value == "tire_repair_rounded") return Icons.tire_repair_rounded;
    if (value == "tire_repair_outlined") return Icons.tire_repair_outlined;
    if (value == "title") return Icons.title;
    if (value == "title_sharp") return Icons.title_sharp;
    if (value == "title_rounded") return Icons.title_rounded;
    if (value == "title_outlined") return Icons.title_outlined;
    if (value == "toc") return Icons.toc;
    if (value == "toc_sharp") return Icons.toc_sharp;
    if (value == "toc_rounded") return Icons.toc_rounded;
    if (value == "toc_outlined") return Icons.toc_outlined;
    if (value == "today") return Icons.today;
    if (value == "today_sharp") return Icons.today_sharp;
    if (value == "today_rounded") return Icons.today_rounded;
    if (value == "today_outlined") return Icons.today_outlined;
    if (value == "toggle_off") return Icons.toggle_off;
    if (value == "toggle_off_sharp") return Icons.toggle_off_sharp;
    if (value == "toggle_off_rounded") return Icons.toggle_off_rounded;
    if (value == "toggle_off_outlined") return Icons.toggle_off_outlined;
    if (value == "toggle_on") return Icons.toggle_on;
    if (value == "toggle_on_sharp") return Icons.toggle_on_sharp;
    if (value == "toggle_on_rounded") return Icons.toggle_on_rounded;
    if (value == "toggle_on_outlined") return Icons.toggle_on_outlined;
    if (value == "token") return Icons.token;
    if (value == "token_sharp") return Icons.token_sharp;
    if (value == "token_rounded") return Icons.token_rounded;
    if (value == "token_outlined") return Icons.token_outlined;
    if (value == "toll") return Icons.toll;
    if (value == "toll_sharp") return Icons.toll_sharp;
    if (value == "toll_rounded") return Icons.toll_rounded;
    if (value == "toll_outlined") return Icons.toll_outlined;
    if (value == "tonality") return Icons.tonality;
    if (value == "tonality_sharp") return Icons.tonality_sharp;
    if (value == "tonality_rounded") return Icons.tonality_rounded;
    if (value == "tonality_outlined") return Icons.tonality_outlined;
    if (value == "topic") return Icons.topic;
    if (value == "topic_sharp") return Icons.topic_sharp;
    if (value == "topic_rounded") return Icons.topic_rounded;
    if (value == "topic_outlined") return Icons.topic_outlined;
    if (value == "tornado") return Icons.tornado;
    if (value == "tornado_sharp") return Icons.tornado_sharp;
    if (value == "tornado_rounded") return Icons.tornado_rounded;
    if (value == "tornado_outlined") return Icons.tornado_outlined;
    if (value == "touch_app") return Icons.touch_app;
    if (value == "touch_app_sharp") return Icons.touch_app_sharp;
    if (value == "touch_app_rounded") return Icons.touch_app_rounded;
    if (value == "touch_app_outlined") return Icons.touch_app_outlined;
    if (value == "tour") return Icons.tour;
    if (value == "tour_sharp") return Icons.tour_sharp;
    if (value == "tour_rounded") return Icons.tour_rounded;
    if (value == "tour_outlined") return Icons.tour_outlined;
    if (value == "toys") return Icons.toys;
    if (value == "toys_sharp") return Icons.toys_sharp;
    if (value == "toys_rounded") return Icons.toys_rounded;
    if (value == "toys_outlined") return Icons.toys_outlined;
    if (value == "track_changes") return Icons.track_changes;
    if (value == "track_changes_sharp") return Icons.track_changes_sharp;
    if (value == "track_changes_rounded") return Icons.track_changes_rounded;
    if (value == "track_changes_outlined") return Icons.track_changes_outlined;
    if (value == "traffic") return Icons.traffic;
    if (value == "traffic_sharp") return Icons.traffic_sharp;
    if (value == "traffic_rounded") return Icons.traffic_rounded;
    if (value == "traffic_outlined") return Icons.traffic_outlined;
    if (value == "train") return Icons.train;
    if (value == "train_sharp") return Icons.train_sharp;
    if (value == "train_rounded") return Icons.train_rounded;
    if (value == "train_outlined") return Icons.train_outlined;
    if (value == "tram") return Icons.tram;
    if (value == "tram_sharp") return Icons.tram_sharp;
    if (value == "tram_rounded") return Icons.tram_rounded;
    if (value == "tram_outlined") return Icons.tram_outlined;
    if (value == "transcribe") return Icons.transcribe;
    if (value == "transcribe_sharp") return Icons.transcribe_sharp;
    if (value == "transcribe_rounded") return Icons.transcribe_rounded;
    if (value == "transcribe_outlined") return Icons.transcribe_outlined;
    if (value == "transfer_within_a_station")
      return Icons.transfer_within_a_station;
    if (value == "transfer_within_a_station_sharp")
      return Icons.transfer_within_a_station_sharp;
    if (value == "transfer_within_a_station_rounded")
      return Icons.transfer_within_a_station_rounded;
    if (value == "transfer_within_a_station_outlined")
      return Icons.transfer_within_a_station_outlined;
    if (value == "transform") return Icons.transform;
    if (value == "transform_sharp") return Icons.transform_sharp;
    if (value == "transform_rounded") return Icons.transform_rounded;
    if (value == "transform_outlined") return Icons.transform_outlined;
    if (value == "transgender") return Icons.transgender;
    if (value == "transgender_sharp") return Icons.transgender_sharp;
    if (value == "transgender_rounded") return Icons.transgender_rounded;
    if (value == "transgender_outlined") return Icons.transgender_outlined;
    if (value == "transit_enterexit") return Icons.transit_enterexit;
    if (value == "transit_enterexit_sharp")
      return Icons.transit_enterexit_sharp;
    if (value == "transit_enterexit_rounded")
      return Icons.transit_enterexit_rounded;
    if (value == "transit_enterexit_outlined")
      return Icons.transit_enterexit_outlined;
    if (value == "translate") return Icons.translate;
    if (value == "translate_sharp") return Icons.translate_sharp;
    if (value == "translate_rounded") return Icons.translate_rounded;
    if (value == "translate_outlined") return Icons.translate_outlined;
    if (value == "travel_explore") return Icons.travel_explore;
    if (value == "travel_explore_sharp") return Icons.travel_explore_sharp;
    if (value == "travel_explore_rounded") return Icons.travel_explore_rounded;
    if (value == "travel_explore_outlined")
      return Icons.travel_explore_outlined;
    if (value == "trending_down") return Icons.trending_down;
    if (value == "trending_down_sharp") return Icons.trending_down_sharp;
    if (value == "trending_down_rounded") return Icons.trending_down_rounded;
    if (value == "trending_down_outlined") return Icons.trending_down_outlined;
    if (value == "trending_flat") return Icons.trending_flat;
    if (value == "trending_flat_sharp") return Icons.trending_flat_sharp;
    if (value == "trending_flat_rounded") return Icons.trending_flat_rounded;
    if (value == "trending_flat_outlined") return Icons.trending_flat_outlined;
    if (value == "trending_neutral") return Icons.trending_neutral;
    if (value == "trending_neutral_sharp") return Icons.trending_neutral_sharp;
    if (value == "trending_neutral_rounded")
      return Icons.trending_neutral_rounded;
    if (value == "trending_neutral_outlined")
      return Icons.trending_neutral_outlined;
    if (value == "trending_up") return Icons.trending_up;
    if (value == "trending_up_sharp") return Icons.trending_up_sharp;
    if (value == "trending_up_rounded") return Icons.trending_up_rounded;
    if (value == "trending_up_outlined") return Icons.trending_up_outlined;
    if (value == "trip_origin") return Icons.trip_origin;
    if (value == "trip_origin_sharp") return Icons.trip_origin_sharp;
    if (value == "trip_origin_rounded") return Icons.trip_origin_rounded;
    if (value == "trip_origin_outlined") return Icons.trip_origin_outlined;
    if (value == "troubleshoot") return Icons.troubleshoot;
    if (value == "troubleshoot_sharp") return Icons.troubleshoot_sharp;
    if (value == "troubleshoot_rounded") return Icons.troubleshoot_rounded;
    if (value == "troubleshoot_outlined") return Icons.troubleshoot_outlined;
    if (value == "try_sms_star") return Icons.try_sms_star;
    if (value == "try_sms_star_sharp") return Icons.try_sms_star_sharp;
    if (value == "try_sms_star_rounded") return Icons.try_sms_star_rounded;
    if (value == "try_sms_star_outlined") return Icons.try_sms_star_outlined;
    if (value == "tsunami") return Icons.tsunami;
    if (value == "tsunami_sharp") return Icons.tsunami_sharp;
    if (value == "tsunami_rounded") return Icons.tsunami_rounded;
    if (value == "tsunami_outlined") return Icons.tsunami_outlined;
    if (value == "tty") return Icons.tty;
    if (value == "tty_sharp") return Icons.tty_sharp;
    if (value == "tty_rounded") return Icons.tty_rounded;
    if (value == "tty_outlined") return Icons.tty_outlined;
    if (value == "tune") return Icons.tune;
    if (value == "tune_sharp") return Icons.tune_sharp;
    if (value == "tune_rounded") return Icons.tune_rounded;
    if (value == "tune_outlined") return Icons.tune_outlined;
    if (value == "tungsten") return Icons.tungsten;
    if (value == "tungsten_sharp") return Icons.tungsten_sharp;
    if (value == "tungsten_rounded") return Icons.tungsten_rounded;
    if (value == "tungsten_outlined") return Icons.tungsten_outlined;
    if (value == "turn_left") return Icons.turn_left;
    if (value == "turn_left_sharp") return Icons.turn_left_sharp;
    if (value == "turn_left_rounded") return Icons.turn_left_rounded;
    if (value == "turn_left_outlined") return Icons.turn_left_outlined;
    if (value == "turn_right") return Icons.turn_right;
    if (value == "turn_right_sharp") return Icons.turn_right_sharp;
    if (value == "turn_right_rounded") return Icons.turn_right_rounded;
    if (value == "turn_right_outlined") return Icons.turn_right_outlined;
    if (value == "turn_sharp_left") return Icons.turn_sharp_left;
    if (value == "turn_sharp_left_sharp") return Icons.turn_sharp_left_sharp;
    if (value == "turn_sharp_left_rounded")
      return Icons.turn_sharp_left_rounded;
    if (value == "turn_sharp_left_outlined")
      return Icons.turn_sharp_left_outlined;
    if (value == "turn_sharp_right") return Icons.turn_sharp_right;
    if (value == "turn_sharp_right_sharp") return Icons.turn_sharp_right_sharp;
    if (value == "turn_sharp_right_rounded")
      return Icons.turn_sharp_right_rounded;
    if (value == "turn_sharp_right_outlined")
      return Icons.turn_sharp_right_outlined;
    if (value == "turn_slight_left") return Icons.turn_slight_left;
    if (value == "turn_slight_left_sharp") return Icons.turn_slight_left_sharp;
    if (value == "turn_slight_left_rounded")
      return Icons.turn_slight_left_rounded;
    if (value == "turn_slight_left_outlined")
      return Icons.turn_slight_left_outlined;
    if (value == "turn_slight_right") return Icons.turn_slight_right;
    if (value == "turn_slight_right_sharp")
      return Icons.turn_slight_right_sharp;
    if (value == "turn_slight_right_rounded")
      return Icons.turn_slight_right_rounded;
    if (value == "turn_slight_right_outlined")
      return Icons.turn_slight_right_outlined;
    if (value == "turned_in") return Icons.turned_in;
    if (value == "turned_in_sharp") return Icons.turned_in_sharp;
    if (value == "turned_in_rounded") return Icons.turned_in_rounded;
    if (value == "turned_in_outlined") return Icons.turned_in_outlined;
    if (value == "turned_in_not") return Icons.turned_in_not;
    if (value == "turned_in_not_sharp") return Icons.turned_in_not_sharp;
    if (value == "turned_in_not_rounded") return Icons.turned_in_not_rounded;
    if (value == "turned_in_not_outlined") return Icons.turned_in_not_outlined;
    if (value == "tv") return Icons.tv;
    if (value == "tv_sharp") return Icons.tv_sharp;
    if (value == "tv_rounded") return Icons.tv_rounded;
    if (value == "tv_outlined") return Icons.tv_outlined;
    if (value == "tv_off") return Icons.tv_off;
    if (value == "tv_off_sharp") return Icons.tv_off_sharp;
    if (value == "tv_off_rounded") return Icons.tv_off_rounded;
    if (value == "tv_off_outlined") return Icons.tv_off_outlined;
    if (value == "two_wheeler") return Icons.two_wheeler;
    if (value == "two_wheeler_sharp") return Icons.two_wheeler_sharp;
    if (value == "two_wheeler_rounded") return Icons.two_wheeler_rounded;
    if (value == "two_wheeler_outlined") return Icons.two_wheeler_outlined;
    if (value == "type_specimen") return Icons.type_specimen;
    if (value == "type_specimen_sharp") return Icons.type_specimen_sharp;
    if (value == "type_specimen_rounded") return Icons.type_specimen_rounded;
    if (value == "type_specimen_outlined") return Icons.type_specimen_outlined;
    if (value == "u_turn_left") return Icons.u_turn_left;
    if (value == "u_turn_left_sharp") return Icons.u_turn_left_sharp;
    if (value == "u_turn_left_rounded") return Icons.u_turn_left_rounded;
    if (value == "u_turn_left_outlined") return Icons.u_turn_left_outlined;
    if (value == "u_turn_right") return Icons.u_turn_right;
    if (value == "u_turn_right_sharp") return Icons.u_turn_right_sharp;
    if (value == "u_turn_right_rounded") return Icons.u_turn_right_rounded;
    if (value == "u_turn_right_outlined") return Icons.u_turn_right_outlined;
    if (value == "umbrella") return Icons.umbrella;
    if (value == "umbrella_sharp") return Icons.umbrella_sharp;
    if (value == "umbrella_rounded") return Icons.umbrella_rounded;
    if (value == "umbrella_outlined") return Icons.umbrella_outlined;
    if (value == "unarchive") return Icons.unarchive;
    if (value == "unarchive_sharp") return Icons.unarchive_sharp;
    if (value == "unarchive_rounded") return Icons.unarchive_rounded;
    if (value == "unarchive_outlined") return Icons.unarchive_outlined;
    if (value == "undo") return Icons.undo;
    if (value == "undo_sharp") return Icons.undo_sharp;
    if (value == "undo_rounded") return Icons.undo_rounded;
    if (value == "undo_outlined") return Icons.undo_outlined;
    if (value == "unfold_less") return Icons.unfold_less;
    if (value == "unfold_less_sharp") return Icons.unfold_less_sharp;
    if (value == "unfold_less_rounded") return Icons.unfold_less_rounded;
    if (value == "unfold_less_outlined") return Icons.unfold_less_outlined;
    if (value == "unfold_more") return Icons.unfold_more;
    if (value == "unfold_more_sharp") return Icons.unfold_more_sharp;
    if (value == "unfold_more_rounded") return Icons.unfold_more_rounded;
    if (value == "unfold_more_outlined") return Icons.unfold_more_outlined;
    if (value == "unpublished") return Icons.unpublished;
    if (value == "unpublished_sharp") return Icons.unpublished_sharp;
    if (value == "unpublished_rounded") return Icons.unpublished_rounded;
    if (value == "unpublished_outlined") return Icons.unpublished_outlined;
    if (value == "unsubscribe") return Icons.unsubscribe;
    if (value == "unsubscribe_sharp") return Icons.unsubscribe_sharp;
    if (value == "unsubscribe_rounded") return Icons.unsubscribe_rounded;
    if (value == "unsubscribe_outlined") return Icons.unsubscribe_outlined;
    if (value == "upcoming") return Icons.upcoming;
    if (value == "upcoming_sharp") return Icons.upcoming_sharp;
    if (value == "upcoming_rounded") return Icons.upcoming_rounded;
    if (value == "upcoming_outlined") return Icons.upcoming_outlined;
    if (value == "update") return Icons.update;
    if (value == "update_sharp") return Icons.update_sharp;
    if (value == "update_rounded") return Icons.update_rounded;
    if (value == "update_outlined") return Icons.update_outlined;
    if (value == "update_disabled") return Icons.update_disabled;
    if (value == "update_disabled_sharp") return Icons.update_disabled_sharp;
    if (value == "update_disabled_rounded")
      return Icons.update_disabled_rounded;
    if (value == "update_disabled_outlined")
      return Icons.update_disabled_outlined;
    if (value == "upgrade") return Icons.upgrade;
    if (value == "upgrade_sharp") return Icons.upgrade_sharp;
    if (value == "upgrade_rounded") return Icons.upgrade_rounded;
    if (value == "upgrade_outlined") return Icons.upgrade_outlined;
    if (value == "upload") return Icons.upload;
    if (value == "upload_sharp") return Icons.upload_sharp;
    if (value == "upload_rounded") return Icons.upload_rounded;
    if (value == "upload_outlined") return Icons.upload_outlined;
    if (value == "upload_file") return Icons.upload_file;
    if (value == "upload_file_sharp") return Icons.upload_file_sharp;
    if (value == "upload_file_rounded") return Icons.upload_file_rounded;
    if (value == "upload_file_outlined") return Icons.upload_file_outlined;
    if (value == "usb") return Icons.usb;
    if (value == "usb_sharp") return Icons.usb_sharp;
    if (value == "usb_rounded") return Icons.usb_rounded;
    if (value == "usb_outlined") return Icons.usb_outlined;
    if (value == "usb_off") return Icons.usb_off;
    if (value == "usb_off_sharp") return Icons.usb_off_sharp;
    if (value == "usb_off_rounded") return Icons.usb_off_rounded;
    if (value == "usb_off_outlined") return Icons.usb_off_outlined;
    if (value == "vaccines") return Icons.vaccines;
    if (value == "vaccines_sharp") return Icons.vaccines_sharp;
    if (value == "vaccines_rounded") return Icons.vaccines_rounded;
    if (value == "vaccines_outlined") return Icons.vaccines_outlined;
    if (value == "vape_free") return Icons.vape_free;
    if (value == "vape_free_sharp") return Icons.vape_free_sharp;
    if (value == "vape_free_rounded") return Icons.vape_free_rounded;
    if (value == "vape_free_outlined") return Icons.vape_free_outlined;
    if (value == "vaping_rooms") return Icons.vaping_rooms;
    if (value == "vaping_rooms_sharp") return Icons.vaping_rooms_sharp;
    if (value == "vaping_rooms_rounded") return Icons.vaping_rooms_rounded;
    if (value == "vaping_rooms_outlined") return Icons.vaping_rooms_outlined;
    if (value == "verified") return Icons.verified;
    if (value == "verified_sharp") return Icons.verified_sharp;
    if (value == "verified_rounded") return Icons.verified_rounded;
    if (value == "verified_outlined") return Icons.verified_outlined;
    if (value == "verified_user") return Icons.verified_user;
    if (value == "verified_user_sharp") return Icons.verified_user_sharp;
    if (value == "verified_user_rounded") return Icons.verified_user_rounded;
    if (value == "verified_user_outlined") return Icons.verified_user_outlined;
    if (value == "vertical_align_bottom") return Icons.vertical_align_bottom;
    if (value == "vertical_align_bottom_sharp")
      return Icons.vertical_align_bottom_sharp;
    if (value == "vertical_align_bottom_rounded")
      return Icons.vertical_align_bottom_rounded;
    if (value == "vertical_align_bottom_outlined")
      return Icons.vertical_align_bottom_outlined;
    if (value == "vertical_align_center") return Icons.vertical_align_center;
    if (value == "vertical_align_center_sharp")
      return Icons.vertical_align_center_sharp;
    if (value == "vertical_align_center_rounded")
      return Icons.vertical_align_center_rounded;
    if (value == "vertical_align_center_outlined")
      return Icons.vertical_align_center_outlined;
    if (value == "vertical_align_top") return Icons.vertical_align_top;
    if (value == "vertical_align_top_sharp")
      return Icons.vertical_align_top_sharp;
    if (value == "vertical_align_top_rounded")
      return Icons.vertical_align_top_rounded;
    if (value == "vertical_align_top_outlined")
      return Icons.vertical_align_top_outlined;
    if (value == "vertical_distribute") return Icons.vertical_distribute;
    if (value == "vertical_distribute_sharp")
      return Icons.vertical_distribute_sharp;
    if (value == "vertical_distribute_rounded")
      return Icons.vertical_distribute_rounded;
    if (value == "vertical_distribute_outlined")
      return Icons.vertical_distribute_outlined;
    if (value == "vertical_shades") return Icons.vertical_shades;
    if (value == "vertical_shades_sharp") return Icons.vertical_shades_sharp;
    if (value == "vertical_shades_rounded")
      return Icons.vertical_shades_rounded;
    if (value == "vertical_shades_outlined")
      return Icons.vertical_shades_outlined;
    if (value == "vertical_shades_closed") return Icons.vertical_shades_closed;
    if (value == "vertical_shades_closed_sharp")
      return Icons.vertical_shades_closed_sharp;
    if (value == "vertical_shades_closed_rounded")
      return Icons.vertical_shades_closed_rounded;
    if (value == "vertical_shades_closed_outlined")
      return Icons.vertical_shades_closed_outlined;
    if (value == "vertical_split") return Icons.vertical_split;
    if (value == "vertical_split_sharp") return Icons.vertical_split_sharp;
    if (value == "vertical_split_rounded") return Icons.vertical_split_rounded;
    if (value == "vertical_split_outlined")
      return Icons.vertical_split_outlined;
    if (value == "vibration") return Icons.vibration;
    if (value == "vibration_sharp") return Icons.vibration_sharp;
    if (value == "vibration_rounded") return Icons.vibration_rounded;
    if (value == "vibration_outlined") return Icons.vibration_outlined;
    if (value == "video_call") return Icons.video_call;
    if (value == "video_call_sharp") return Icons.video_call_sharp;
    if (value == "video_call_rounded") return Icons.video_call_rounded;
    if (value == "video_call_outlined") return Icons.video_call_outlined;
    if (value == "video_camera_back") return Icons.video_camera_back;
    if (value == "video_camera_back_sharp")
      return Icons.video_camera_back_sharp;
    if (value == "video_camera_back_rounded")
      return Icons.video_camera_back_rounded;
    if (value == "video_camera_back_outlined")
      return Icons.video_camera_back_outlined;
    if (value == "video_camera_front") return Icons.video_camera_front;
    if (value == "video_camera_front_sharp")
      return Icons.video_camera_front_sharp;
    if (value == "video_camera_front_rounded")
      return Icons.video_camera_front_rounded;
    if (value == "video_camera_front_outlined")
      return Icons.video_camera_front_outlined;
    if (value == "video_collection") return Icons.video_collection;
    if (value == "video_collection_sharp") return Icons.video_collection_sharp;
    if (value == "video_collection_rounded")
      return Icons.video_collection_rounded;
    if (value == "video_collection_outlined")
      return Icons.video_collection_outlined;
    if (value == "video_file") return Icons.video_file;
    if (value == "video_file_sharp") return Icons.video_file_sharp;
    if (value == "video_file_rounded") return Icons.video_file_rounded;
    if (value == "video_file_outlined") return Icons.video_file_outlined;
    if (value == "video_label") return Icons.video_label;
    if (value == "video_label_sharp") return Icons.video_label_sharp;
    if (value == "video_label_rounded") return Icons.video_label_rounded;
    if (value == "video_label_outlined") return Icons.video_label_outlined;
    if (value == "video_library") return Icons.video_library;
    if (value == "video_library_sharp") return Icons.video_library_sharp;
    if (value == "video_library_rounded") return Icons.video_library_rounded;
    if (value == "video_library_outlined") return Icons.video_library_outlined;
    if (value == "video_settings") return Icons.video_settings;
    if (value == "video_settings_sharp") return Icons.video_settings_sharp;
    if (value == "video_settings_rounded") return Icons.video_settings_rounded;
    if (value == "video_settings_outlined")
      return Icons.video_settings_outlined;
    if (value == "video_stable") return Icons.video_stable;
    if (value == "video_stable_sharp") return Icons.video_stable_sharp;
    if (value == "video_stable_rounded") return Icons.video_stable_rounded;
    if (value == "video_stable_outlined") return Icons.video_stable_outlined;
    if (value == "videocam") return Icons.videocam;
    if (value == "videocam_sharp") return Icons.videocam_sharp;
    if (value == "videocam_rounded") return Icons.videocam_rounded;
    if (value == "videocam_outlined") return Icons.videocam_outlined;
    if (value == "videocam_off") return Icons.videocam_off;
    if (value == "videocam_off_sharp") return Icons.videocam_off_sharp;
    if (value == "videocam_off_rounded") return Icons.videocam_off_rounded;
    if (value == "videocam_off_outlined") return Icons.videocam_off_outlined;
    if (value == "videogame_asset") return Icons.videogame_asset;
    if (value == "videogame_asset_sharp") return Icons.videogame_asset_sharp;
    if (value == "videogame_asset_rounded")
      return Icons.videogame_asset_rounded;
    if (value == "videogame_asset_outlined")
      return Icons.videogame_asset_outlined;
    if (value == "videogame_asset_off") return Icons.videogame_asset_off;
    if (value == "videogame_asset_off_sharp")
      return Icons.videogame_asset_off_sharp;
    if (value == "videogame_asset_off_rounded")
      return Icons.videogame_asset_off_rounded;
    if (value == "videogame_asset_off_outlined")
      return Icons.videogame_asset_off_outlined;
    if (value == "view_agenda") return Icons.view_agenda;
    if (value == "view_agenda_sharp") return Icons.view_agenda_sharp;
    if (value == "view_agenda_rounded") return Icons.view_agenda_rounded;
    if (value == "view_agenda_outlined") return Icons.view_agenda_outlined;
    if (value == "view_array") return Icons.view_array;
    if (value == "view_array_sharp") return Icons.view_array_sharp;
    if (value == "view_array_rounded") return Icons.view_array_rounded;
    if (value == "view_array_outlined") return Icons.view_array_outlined;
    if (value == "view_carousel") return Icons.view_carousel;
    if (value == "view_carousel_sharp") return Icons.view_carousel_sharp;
    if (value == "view_carousel_rounded") return Icons.view_carousel_rounded;
    if (value == "view_carousel_outlined") return Icons.view_carousel_outlined;
    if (value == "view_column") return Icons.view_column;
    if (value == "view_column_sharp") return Icons.view_column_sharp;
    if (value == "view_column_rounded") return Icons.view_column_rounded;
    if (value == "view_column_outlined") return Icons.view_column_outlined;
    if (value == "view_comfortable") return Icons.view_comfortable;
    if (value == "view_comfortable_sharp") return Icons.view_comfortable_sharp;
    if (value == "view_comfortable_rounded")
      return Icons.view_comfortable_rounded;
    if (value == "view_comfortable_outlined")
      return Icons.view_comfortable_outlined;
    if (value == "view_comfy") return Icons.view_comfy;
    if (value == "view_comfy_sharp") return Icons.view_comfy_sharp;
    if (value == "view_comfy_rounded") return Icons.view_comfy_rounded;
    if (value == "view_comfy_outlined") return Icons.view_comfy_outlined;
    if (value == "view_comfy_alt") return Icons.view_comfy_alt;
    if (value == "view_comfy_alt_sharp") return Icons.view_comfy_alt_sharp;
    if (value == "view_comfy_alt_rounded") return Icons.view_comfy_alt_rounded;
    if (value == "view_comfy_alt_outlined")
      return Icons.view_comfy_alt_outlined;
    if (value == "view_compact") return Icons.view_compact;
    if (value == "view_compact_sharp") return Icons.view_compact_sharp;
    if (value == "view_compact_rounded") return Icons.view_compact_rounded;
    if (value == "view_compact_outlined") return Icons.view_compact_outlined;
    if (value == "view_compact_alt") return Icons.view_compact_alt;
    if (value == "view_compact_alt_sharp") return Icons.view_compact_alt_sharp;
    if (value == "view_compact_alt_rounded")
      return Icons.view_compact_alt_rounded;
    if (value == "view_compact_alt_outlined")
      return Icons.view_compact_alt_outlined;
    if (value == "view_cozy") return Icons.view_cozy;
    if (value == "view_cozy_sharp") return Icons.view_cozy_sharp;
    if (value == "view_cozy_rounded") return Icons.view_cozy_rounded;
    if (value == "view_cozy_outlined") return Icons.view_cozy_outlined;
    if (value == "view_day") return Icons.view_day;
    if (value == "view_day_sharp") return Icons.view_day_sharp;
    if (value == "view_day_rounded") return Icons.view_day_rounded;
    if (value == "view_day_outlined") return Icons.view_day_outlined;
    if (value == "view_headline") return Icons.view_headline;
    if (value == "view_headline_sharp") return Icons.view_headline_sharp;
    if (value == "view_headline_rounded") return Icons.view_headline_rounded;
    if (value == "view_headline_outlined") return Icons.view_headline_outlined;
    if (value == "view_in_ar") return Icons.view_in_ar;
    if (value == "view_in_ar_sharp") return Icons.view_in_ar_sharp;
    if (value == "view_in_ar_rounded") return Icons.view_in_ar_rounded;
    if (value == "view_in_ar_outlined") return Icons.view_in_ar_outlined;
    if (value == "view_kanban") return Icons.view_kanban;
    if (value == "view_kanban_sharp") return Icons.view_kanban_sharp;
    if (value == "view_kanban_rounded") return Icons.view_kanban_rounded;
    if (value == "view_kanban_outlined") return Icons.view_kanban_outlined;
    if (value == "view_list") return Icons.view_list;
    if (value == "view_list_sharp") return Icons.view_list_sharp;
    if (value == "view_list_rounded") return Icons.view_list_rounded;
    if (value == "view_list_outlined") return Icons.view_list_outlined;
    if (value == "view_module") return Icons.view_module;
    if (value == "view_module_sharp") return Icons.view_module_sharp;
    if (value == "view_module_rounded") return Icons.view_module_rounded;
    if (value == "view_module_outlined") return Icons.view_module_outlined;
    if (value == "view_quilt") return Icons.view_quilt;
    if (value == "view_quilt_sharp") return Icons.view_quilt_sharp;
    if (value == "view_quilt_rounded") return Icons.view_quilt_rounded;
    if (value == "view_quilt_outlined") return Icons.view_quilt_outlined;
    if (value == "view_sidebar") return Icons.view_sidebar;
    if (value == "view_sidebar_sharp") return Icons.view_sidebar_sharp;
    if (value == "view_sidebar_rounded") return Icons.view_sidebar_rounded;
    if (value == "view_sidebar_outlined") return Icons.view_sidebar_outlined;
    if (value == "view_stream") return Icons.view_stream;
    if (value == "view_stream_sharp") return Icons.view_stream_sharp;
    if (value == "view_stream_rounded") return Icons.view_stream_rounded;
    if (value == "view_stream_outlined") return Icons.view_stream_outlined;
    if (value == "view_timeline") return Icons.view_timeline;
    if (value == "view_timeline_sharp") return Icons.view_timeline_sharp;
    if (value == "view_timeline_rounded") return Icons.view_timeline_rounded;
    if (value == "view_timeline_outlined") return Icons.view_timeline_outlined;
    if (value == "view_week") return Icons.view_week;
    if (value == "view_week_sharp") return Icons.view_week_sharp;
    if (value == "view_week_rounded") return Icons.view_week_rounded;
    if (value == "view_week_outlined") return Icons.view_week_outlined;
    if (value == "vignette") return Icons.vignette;
    if (value == "vignette_sharp") return Icons.vignette_sharp;
    if (value == "vignette_rounded") return Icons.vignette_rounded;
    if (value == "vignette_outlined") return Icons.vignette_outlined;
    if (value == "villa") return Icons.villa;
    if (value == "villa_sharp") return Icons.villa_sharp;
    if (value == "villa_rounded") return Icons.villa_rounded;
    if (value == "villa_outlined") return Icons.villa_outlined;
    if (value == "visibility") return Icons.visibility;
    if (value == "visibility_sharp") return Icons.visibility_sharp;
    if (value == "visibility_rounded") return Icons.visibility_rounded;
    if (value == "visibility_outlined") return Icons.visibility_outlined;
    if (value == "visibility_off") return Icons.visibility_off;
    if (value == "visibility_off_sharp") return Icons.visibility_off_sharp;
    if (value == "visibility_off_rounded") return Icons.visibility_off_rounded;
    if (value == "visibility_off_outlined")
      return Icons.visibility_off_outlined;
    if (value == "voice_chat") return Icons.voice_chat;
    if (value == "voice_chat_sharp") return Icons.voice_chat_sharp;
    if (value == "voice_chat_rounded") return Icons.voice_chat_rounded;
    if (value == "voice_chat_outlined") return Icons.voice_chat_outlined;
    if (value == "voice_over_off") return Icons.voice_over_off;
    if (value == "voice_over_off_sharp") return Icons.voice_over_off_sharp;
    if (value == "voice_over_off_rounded") return Icons.voice_over_off_rounded;
    if (value == "voice_over_off_outlined")
      return Icons.voice_over_off_outlined;
    if (value == "voicemail") return Icons.voicemail;
    if (value == "voicemail_sharp") return Icons.voicemail_sharp;
    if (value == "voicemail_rounded") return Icons.voicemail_rounded;
    if (value == "voicemail_outlined") return Icons.voicemail_outlined;
    if (value == "volcano") return Icons.volcano;
    if (value == "volcano_sharp") return Icons.volcano_sharp;
    if (value == "volcano_rounded") return Icons.volcano_rounded;
    if (value == "volcano_outlined") return Icons.volcano_outlined;
    if (value == "volume_down") return Icons.volume_down;
    if (value == "volume_down_sharp") return Icons.volume_down_sharp;
    if (value == "volume_down_rounded") return Icons.volume_down_rounded;
    if (value == "volume_down_outlined") return Icons.volume_down_outlined;
    if (value == "volume_down_alt") return Icons.volume_down_alt;
    if (value == "volume_mute") return Icons.volume_mute;
    if (value == "volume_mute_sharp") return Icons.volume_mute_sharp;
    if (value == "volume_mute_rounded") return Icons.volume_mute_rounded;
    if (value == "volume_mute_outlined") return Icons.volume_mute_outlined;
    if (value == "volume_off") return Icons.volume_off;
    if (value == "volume_off_sharp") return Icons.volume_off_sharp;
    if (value == "volume_off_rounded") return Icons.volume_off_rounded;
    if (value == "volume_off_outlined") return Icons.volume_off_outlined;
    if (value == "volume_up") return Icons.volume_up;
    if (value == "volume_up_sharp") return Icons.volume_up_sharp;
    if (value == "volume_up_rounded") return Icons.volume_up_rounded;
    if (value == "volume_up_outlined") return Icons.volume_up_outlined;
    if (value == "volunteer_activism") return Icons.volunteer_activism;
    if (value == "volunteer_activism_sharp")
      return Icons.volunteer_activism_sharp;
    if (value == "volunteer_activism_rounded")
      return Icons.volunteer_activism_rounded;
    if (value == "volunteer_activism_outlined")
      return Icons.volunteer_activism_outlined;
    if (value == "vpn_key") return Icons.vpn_key;
    if (value == "vpn_key_sharp") return Icons.vpn_key_sharp;
    if (value == "vpn_key_rounded") return Icons.vpn_key_rounded;
    if (value == "vpn_key_outlined") return Icons.vpn_key_outlined;
    if (value == "vpn_key_off") return Icons.vpn_key_off;
    if (value == "vpn_key_off_sharp") return Icons.vpn_key_off_sharp;
    if (value == "vpn_key_off_rounded") return Icons.vpn_key_off_rounded;
    if (value == "vpn_key_off_outlined") return Icons.vpn_key_off_outlined;
    if (value == "vpn_lock") return Icons.vpn_lock;
    if (value == "vpn_lock_sharp") return Icons.vpn_lock_sharp;
    if (value == "vpn_lock_rounded") return Icons.vpn_lock_rounded;
    if (value == "vpn_lock_outlined") return Icons.vpn_lock_outlined;
    if (value == "vrpano") return Icons.vrpano;
    if (value == "vrpano_sharp") return Icons.vrpano_sharp;
    if (value == "vrpano_rounded") return Icons.vrpano_rounded;
    if (value == "vrpano_outlined") return Icons.vrpano_outlined;
    if (value == "wallet") return Icons.wallet;
    if (value == "wallet_sharp") return Icons.wallet_sharp;
    if (value == "wallet_rounded") return Icons.wallet_rounded;
    if (value == "wallet_outlined") return Icons.wallet_outlined;
    if (value == "wallet_giftcard") return Icons.wallet_giftcard;
    if (value == "wallet_giftcard_sharp") return Icons.wallet_giftcard_sharp;
    if (value == "wallet_giftcard_rounded")
      return Icons.wallet_giftcard_rounded;
    if (value == "wallet_giftcard_outlined")
      return Icons.wallet_giftcard_outlined;
    if (value == "wallet_membership") return Icons.wallet_membership;
    if (value == "wallet_membership_sharp")
      return Icons.wallet_membership_sharp;
    if (value == "wallet_membership_rounded")
      return Icons.wallet_membership_rounded;
    if (value == "wallet_membership_outlined")
      return Icons.wallet_membership_outlined;
    if (value == "wallet_travel") return Icons.wallet_travel;
    if (value == "wallet_travel_sharp") return Icons.wallet_travel_sharp;
    if (value == "wallet_travel_rounded") return Icons.wallet_travel_rounded;
    if (value == "wallet_travel_outlined") return Icons.wallet_travel_outlined;
    if (value == "wallpaper") return Icons.wallpaper;
    if (value == "wallpaper_sharp") return Icons.wallpaper_sharp;
    if (value == "wallpaper_rounded") return Icons.wallpaper_rounded;
    if (value == "wallpaper_outlined") return Icons.wallpaper_outlined;
    if (value == "warehouse") return Icons.warehouse;
    if (value == "warehouse_sharp") return Icons.warehouse_sharp;
    if (value == "warehouse_rounded") return Icons.warehouse_rounded;
    if (value == "warehouse_outlined") return Icons.warehouse_outlined;
    if (value == "warning") return Icons.warning;
    if (value == "warning_sharp") return Icons.warning_sharp;
    if (value == "warning_rounded") return Icons.warning_rounded;
    if (value == "warning_outlined") return Icons.warning_outlined;
    if (value == "warning_amber") return Icons.warning_amber;
    if (value == "warning_amber_sharp") return Icons.warning_amber_sharp;
    if (value == "warning_amber_rounded") return Icons.warning_amber_rounded;
    if (value == "warning_amber_outlined") return Icons.warning_amber_outlined;
    if (value == "wash") return Icons.wash;
    if (value == "wash_sharp") return Icons.wash_sharp;
    if (value == "wash_rounded") return Icons.wash_rounded;
    if (value == "wash_outlined") return Icons.wash_outlined;
    if (value == "watch") return Icons.watch;
    if (value == "watch_sharp") return Icons.watch_sharp;
    if (value == "watch_rounded") return Icons.watch_rounded;
    if (value == "watch_outlined") return Icons.watch_outlined;
    if (value == "watch_later") return Icons.watch_later;
    if (value == "watch_later_sharp") return Icons.watch_later_sharp;
    if (value == "watch_later_rounded") return Icons.watch_later_rounded;
    if (value == "watch_later_outlined") return Icons.watch_later_outlined;
    if (value == "watch_off") return Icons.watch_off;
    if (value == "watch_off_sharp") return Icons.watch_off_sharp;
    if (value == "watch_off_rounded") return Icons.watch_off_rounded;
    if (value == "watch_off_outlined") return Icons.watch_off_outlined;
    if (value == "water") return Icons.water;
    if (value == "water_sharp") return Icons.water_sharp;
    if (value == "water_rounded") return Icons.water_rounded;
    if (value == "water_outlined") return Icons.water_outlined;
    if (value == "water_damage") return Icons.water_damage;
    if (value == "water_damage_sharp") return Icons.water_damage_sharp;
    if (value == "water_damage_rounded") return Icons.water_damage_rounded;
    if (value == "water_damage_outlined") return Icons.water_damage_outlined;
    if (value == "water_drop") return Icons.water_drop;
    if (value == "water_drop_sharp") return Icons.water_drop_sharp;
    if (value == "water_drop_rounded") return Icons.water_drop_rounded;
    if (value == "water_drop_outlined") return Icons.water_drop_outlined;
    if (value == "waterfall_chart") return Icons.waterfall_chart;
    if (value == "waterfall_chart_sharp") return Icons.waterfall_chart_sharp;
    if (value == "waterfall_chart_rounded")
      return Icons.waterfall_chart_rounded;
    if (value == "waterfall_chart_outlined")
      return Icons.waterfall_chart_outlined;
    if (value == "waves") return Icons.waves;
    if (value == "waves_sharp") return Icons.waves_sharp;
    if (value == "waves_rounded") return Icons.waves_rounded;
    if (value == "waves_outlined") return Icons.waves_outlined;
    if (value == "waving_hand") return Icons.waving_hand;
    if (value == "waving_hand_sharp") return Icons.waving_hand_sharp;
    if (value == "waving_hand_rounded") return Icons.waving_hand_rounded;
    if (value == "waving_hand_outlined") return Icons.waving_hand_outlined;
    if (value == "wb_auto") return Icons.wb_auto;
    if (value == "wb_auto_sharp") return Icons.wb_auto_sharp;
    if (value == "wb_auto_rounded") return Icons.wb_auto_rounded;
    if (value == "wb_auto_outlined") return Icons.wb_auto_outlined;
    if (value == "wb_cloudy") return Icons.wb_cloudy;
    if (value == "wb_cloudy_sharp") return Icons.wb_cloudy_sharp;
    if (value == "wb_cloudy_rounded") return Icons.wb_cloudy_rounded;
    if (value == "wb_cloudy_outlined") return Icons.wb_cloudy_outlined;
    if (value == "wb_incandescent") return Icons.wb_incandescent;
    if (value == "wb_incandescent_sharp") return Icons.wb_incandescent_sharp;
    if (value == "wb_incandescent_rounded")
      return Icons.wb_incandescent_rounded;
    if (value == "wb_incandescent_outlined")
      return Icons.wb_incandescent_outlined;
    if (value == "wb_iridescent") return Icons.wb_iridescent;
    if (value == "wb_iridescent_sharp") return Icons.wb_iridescent_sharp;
    if (value == "wb_iridescent_rounded") return Icons.wb_iridescent_rounded;
    if (value == "wb_iridescent_outlined") return Icons.wb_iridescent_outlined;
    if (value == "wb_shade") return Icons.wb_shade;
    if (value == "wb_shade_sharp") return Icons.wb_shade_sharp;
    if (value == "wb_shade_rounded") return Icons.wb_shade_rounded;
    if (value == "wb_shade_outlined") return Icons.wb_shade_outlined;
    if (value == "wb_sunny") return Icons.wb_sunny;
    if (value == "wb_sunny_sharp") return Icons.wb_sunny_sharp;
    if (value == "wb_sunny_rounded") return Icons.wb_sunny_rounded;
    if (value == "wb_sunny_outlined") return Icons.wb_sunny_outlined;
    if (value == "wb_twighlight") return Icons.wb_twighlight;
    if (value == "wb_twilight") return Icons.wb_twilight;
    if (value == "wb_twilight_sharp") return Icons.wb_twilight_sharp;
    if (value == "wb_twilight_rounded") return Icons.wb_twilight_rounded;
    if (value == "wb_twilight_outlined") return Icons.wb_twilight_outlined;
    if (value == "wc") return Icons.wc;
    if (value == "wc_sharp") return Icons.wc_sharp;
    if (value == "wc_rounded") return Icons.wc_rounded;
    if (value == "wc_outlined") return Icons.wc_outlined;
    if (value == "web") return Icons.web;
    if (value == "web_sharp") return Icons.web_sharp;
    if (value == "web_rounded") return Icons.web_rounded;
    if (value == "web_outlined") return Icons.web_outlined;
    if (value == "web_asset") return Icons.web_asset;
    if (value == "web_asset_sharp") return Icons.web_asset_sharp;
    if (value == "web_asset_rounded") return Icons.web_asset_rounded;
    if (value == "web_asset_outlined") return Icons.web_asset_outlined;
    if (value == "web_asset_off") return Icons.web_asset_off;
    if (value == "web_asset_off_sharp") return Icons.web_asset_off_sharp;
    if (value == "web_asset_off_rounded") return Icons.web_asset_off_rounded;
    if (value == "web_asset_off_outlined") return Icons.web_asset_off_outlined;
    if (value == "web_stories") return Icons.web_stories;
    if (value == "webhook") return Icons.webhook;
    if (value == "webhook_sharp") return Icons.webhook_sharp;
    if (value == "webhook_rounded") return Icons.webhook_rounded;
    if (value == "webhook_outlined") return Icons.webhook_outlined;
    if (value == "wechat") return Icons.wechat;
    if (value == "wechat_sharp") return Icons.wechat_sharp;
    if (value == "wechat_rounded") return Icons.wechat_rounded;
    if (value == "wechat_outlined") return Icons.wechat_outlined;
    if (value == "weekend") return Icons.weekend;
    if (value == "weekend_sharp") return Icons.weekend_sharp;
    if (value == "weekend_rounded") return Icons.weekend_rounded;
    if (value == "weekend_outlined") return Icons.weekend_outlined;
    if (value == "west") return Icons.west;
    if (value == "west_sharp") return Icons.west_sharp;
    if (value == "west_rounded") return Icons.west_rounded;
    if (value == "west_outlined") return Icons.west_outlined;
    if (value == "whatsapp") return Icons.whatsapp;
    if (value == "whatsapp_sharp") return Icons.whatsapp_sharp;
    if (value == "whatsapp_rounded") return Icons.whatsapp_rounded;
    if (value == "whatsapp_outlined") return Icons.whatsapp_outlined;
    if (value == "whatshot") return Icons.whatshot;
    if (value == "whatshot_sharp") return Icons.whatshot_sharp;
    if (value == "whatshot_rounded") return Icons.whatshot_rounded;
    if (value == "whatshot_outlined") return Icons.whatshot_outlined;
    if (value == "wheelchair_pickup") return Icons.wheelchair_pickup;
    if (value == "wheelchair_pickup_sharp")
      return Icons.wheelchair_pickup_sharp;
    if (value == "wheelchair_pickup_rounded")
      return Icons.wheelchair_pickup_rounded;
    if (value == "wheelchair_pickup_outlined")
      return Icons.wheelchair_pickup_outlined;
    if (value == "where_to_vote") return Icons.where_to_vote;
    if (value == "where_to_vote_sharp") return Icons.where_to_vote_sharp;
    if (value == "where_to_vote_rounded") return Icons.where_to_vote_rounded;
    if (value == "where_to_vote_outlined") return Icons.where_to_vote_outlined;
    if (value == "widgets") return Icons.widgets;
    if (value == "widgets_sharp") return Icons.widgets_sharp;
    if (value == "widgets_rounded") return Icons.widgets_rounded;
    if (value == "widgets_outlined") return Icons.widgets_outlined;
    if (value == "width_full") return Icons.width_full;
    if (value == "width_full_sharp") return Icons.width_full_sharp;
    if (value == "width_full_rounded") return Icons.width_full_rounded;
    if (value == "width_full_outlined") return Icons.width_full_outlined;
    if (value == "width_normal") return Icons.width_normal;
    if (value == "width_normal_sharp") return Icons.width_normal_sharp;
    if (value == "width_normal_rounded") return Icons.width_normal_rounded;
    if (value == "width_normal_outlined") return Icons.width_normal_outlined;
    if (value == "width_wide") return Icons.width_wide;
    if (value == "width_wide_sharp") return Icons.width_wide_sharp;
    if (value == "width_wide_rounded") return Icons.width_wide_rounded;
    if (value == "width_wide_outlined") return Icons.width_wide_outlined;
    if (value == "wifi") return Icons.wifi;
    if (value == "wifi_sharp") return Icons.wifi_sharp;
    if (value == "wifi_rounded") return Icons.wifi_rounded;
    if (value == "wifi_outlined") return Icons.wifi_outlined;
    if (value == "wifi_1_bar") return Icons.wifi_1_bar;
    if (value == "wifi_1_bar_sharp") return Icons.wifi_1_bar_sharp;
    if (value == "wifi_1_bar_rounded") return Icons.wifi_1_bar_rounded;
    if (value == "wifi_1_bar_outlined") return Icons.wifi_1_bar_outlined;
    if (value == "wifi_2_bar") return Icons.wifi_2_bar;
    if (value == "wifi_2_bar_sharp") return Icons.wifi_2_bar_sharp;
    if (value == "wifi_2_bar_rounded") return Icons.wifi_2_bar_rounded;
    if (value == "wifi_2_bar_outlined") return Icons.wifi_2_bar_outlined;
    if (value == "wifi_calling") return Icons.wifi_calling;
    if (value == "wifi_calling_sharp") return Icons.wifi_calling_sharp;
    if (value == "wifi_calling_rounded") return Icons.wifi_calling_rounded;
    if (value == "wifi_calling_outlined") return Icons.wifi_calling_outlined;
    if (value == "wifi_calling_3") return Icons.wifi_calling_3;
    if (value == "wifi_calling_3_sharp") return Icons.wifi_calling_3_sharp;
    if (value == "wifi_calling_3_rounded") return Icons.wifi_calling_3_rounded;
    if (value == "wifi_calling_3_outlined")
      return Icons.wifi_calling_3_outlined;
    if (value == "wifi_channel") return Icons.wifi_channel;
    if (value == "wifi_channel_sharp") return Icons.wifi_channel_sharp;
    if (value == "wifi_channel_rounded") return Icons.wifi_channel_rounded;
    if (value == "wifi_channel_outlined") return Icons.wifi_channel_outlined;
    if (value == "wifi_find") return Icons.wifi_find;
    if (value == "wifi_find_sharp") return Icons.wifi_find_sharp;
    if (value == "wifi_find_rounded") return Icons.wifi_find_rounded;
    if (value == "wifi_find_outlined") return Icons.wifi_find_outlined;
    if (value == "wifi_lock") return Icons.wifi_lock;
    if (value == "wifi_lock_sharp") return Icons.wifi_lock_sharp;
    if (value == "wifi_lock_rounded") return Icons.wifi_lock_rounded;
    if (value == "wifi_lock_outlined") return Icons.wifi_lock_outlined;
    if (value == "wifi_off") return Icons.wifi_off;
    if (value == "wifi_off_sharp") return Icons.wifi_off_sharp;
    if (value == "wifi_off_rounded") return Icons.wifi_off_rounded;
    if (value == "wifi_off_outlined") return Icons.wifi_off_outlined;
    if (value == "wifi_password") return Icons.wifi_password;
    if (value == "wifi_password_sharp") return Icons.wifi_password_sharp;
    if (value == "wifi_password_rounded") return Icons.wifi_password_rounded;
    if (value == "wifi_password_outlined") return Icons.wifi_password_outlined;
    if (value == "wifi_protected_setup") return Icons.wifi_protected_setup;
    if (value == "wifi_protected_setup_sharp")
      return Icons.wifi_protected_setup_sharp;
    if (value == "wifi_protected_setup_rounded")
      return Icons.wifi_protected_setup_rounded;
    if (value == "wifi_protected_setup_outlined")
      return Icons.wifi_protected_setup_outlined;
    if (value == "wifi_tethering") return Icons.wifi_tethering;
    if (value == "wifi_tethering_sharp") return Icons.wifi_tethering_sharp;
    if (value == "wifi_tethering_rounded") return Icons.wifi_tethering_rounded;
    if (value == "wifi_tethering_outlined")
      return Icons.wifi_tethering_outlined;
    if (value == "wifi_tethering_error") return Icons.wifi_tethering_error;
    if (value == "wifi_tethering_error_sharp")
      return Icons.wifi_tethering_error_sharp;
    if (value == "wifi_tethering_error_rounded")
      return Icons.wifi_tethering_error_rounded;
    if (value == "wifi_tethering_error_outlined")
      return Icons.wifi_tethering_error_outlined;
    if (value == "wifi_tethering_error_rounded_sharp")
      return Icons.wifi_tethering_error_rounded_sharp;
    if (value == "wifi_tethering_error_rounded_rounded")
      return Icons.wifi_tethering_error_rounded_rounded;
    if (value == "wifi_tethering_error_rounded_outlined")
      return Icons.wifi_tethering_error_rounded_outlined;
    if (value == "wifi_tethering_off") return Icons.wifi_tethering_off;
    if (value == "wifi_tethering_off_sharp")
      return Icons.wifi_tethering_off_sharp;
    if (value == "wifi_tethering_off_rounded")
      return Icons.wifi_tethering_off_rounded;
    if (value == "wifi_tethering_off_outlined")
      return Icons.wifi_tethering_off_outlined;
    if (value == "wind_power") return Icons.wind_power;
    if (value == "wind_power_sharp") return Icons.wind_power_sharp;
    if (value == "wind_power_rounded") return Icons.wind_power_rounded;
    if (value == "wind_power_outlined") return Icons.wind_power_outlined;
    if (value == "window") return Icons.window;
    if (value == "window_sharp") return Icons.window_sharp;
    if (value == "window_rounded") return Icons.window_rounded;
    if (value == "window_outlined") return Icons.window_outlined;
    if (value == "wine_bar") return Icons.wine_bar;
    if (value == "wine_bar_sharp") return Icons.wine_bar_sharp;
    if (value == "wine_bar_rounded") return Icons.wine_bar_rounded;
    if (value == "wine_bar_outlined") return Icons.wine_bar_outlined;
    if (value == "woman") return Icons.woman;
    if (value == "woman_sharp") return Icons.woman_sharp;
    if (value == "woman_rounded") return Icons.woman_rounded;
    if (value == "woman_outlined") return Icons.woman_outlined;
    if (value == "woo_commerce") return Icons.woo_commerce;
    if (value == "woo_commerce_sharp") return Icons.woo_commerce_sharp;
    if (value == "woo_commerce_rounded") return Icons.woo_commerce_rounded;
    if (value == "woo_commerce_outlined") return Icons.woo_commerce_outlined;
    if (value == "wordpress") return Icons.wordpress;
    if (value == "wordpress_sharp") return Icons.wordpress_sharp;
    if (value == "wordpress_rounded") return Icons.wordpress_rounded;
    if (value == "wordpress_outlined") return Icons.wordpress_outlined;
    if (value == "work") return Icons.work;
    if (value == "work_sharp") return Icons.work_sharp;
    if (value == "work_rounded") return Icons.work_rounded;
    if (value == "work_outlined") return Icons.work_outlined;
    if (value == "work_history") return Icons.work_history;
    if (value == "work_history_sharp") return Icons.work_history_sharp;
    if (value == "work_history_rounded") return Icons.work_history_rounded;
    if (value == "work_history_outlined") return Icons.work_history_outlined;
    if (value == "work_off") return Icons.work_off;
    if (value == "work_off_sharp") return Icons.work_off_sharp;
    if (value == "work_off_rounded") return Icons.work_off_rounded;
    if (value == "work_off_outlined") return Icons.work_off_outlined;
    if (value == "work_outline") return Icons.work_outline;
    if (value == "work_outline_sharp") return Icons.work_outline_sharp;
    if (value == "work_outline_rounded") return Icons.work_outline_rounded;
    if (value == "work_outline_outlined") return Icons.work_outline_outlined;
    if (value == "workspace_premium") return Icons.workspace_premium;
    if (value == "workspace_premium_sharp")
      return Icons.workspace_premium_sharp;
    if (value == "workspace_premium_rounded")
      return Icons.workspace_premium_rounded;
    if (value == "workspace_premium_outlined")
      return Icons.workspace_premium_outlined;
    if (value == "workspaces") return Icons.workspaces;
    if (value == "workspaces_sharp") return Icons.workspaces_sharp;
    if (value == "workspaces_rounded") return Icons.workspaces_rounded;
    if (value == "workspaces_outlined") return Icons.workspaces_outlined;
    if (value == "workspaces_filled") return Icons.workspaces_filled;
    if (value == "workspaces_outline") return Icons.workspaces_outline;
    if (value == "wrap_text") return Icons.wrap_text;
    if (value == "wrap_text_sharp") return Icons.wrap_text_sharp;
    if (value == "wrap_text_rounded") return Icons.wrap_text_rounded;
    if (value == "wrap_text_outlined") return Icons.wrap_text_outlined;
    if (value == "wrong_location") return Icons.wrong_location;
    if (value == "wrong_location_sharp") return Icons.wrong_location_sharp;
    if (value == "wrong_location_rounded") return Icons.wrong_location_rounded;
    if (value == "wrong_location_outlined")
      return Icons.wrong_location_outlined;
    if (value == "wysiwyg") return Icons.wysiwyg;
    if (value == "wysiwyg_sharp") return Icons.wysiwyg_sharp;
    if (value == "wysiwyg_rounded") return Icons.wysiwyg_rounded;
    if (value == "wysiwyg_outlined") return Icons.wysiwyg_outlined;
    if (value == "yard") return Icons.yard;
    if (value == "yard_sharp") return Icons.yard_sharp;
    if (value == "yard_rounded") return Icons.yard_rounded;
    if (value == "yard_outlined") return Icons.yard_outlined;
    if (value == "youtube_searched_for") return Icons.youtube_searched_for;
    if (value == "youtube_searched_for_sharp")
      return Icons.youtube_searched_for_sharp;
    if (value == "youtube_searched_for_rounded")
      return Icons.youtube_searched_for_rounded;
    if (value == "youtube_searched_for_outlined")
      return Icons.youtube_searched_for_outlined;
    if (value == "zoom_in") return Icons.zoom_in;
    if (value == "zoom_in_sharp") return Icons.zoom_in_sharp;
    if (value == "zoom_in_rounded") return Icons.zoom_in_rounded;
    if (value == "zoom_in_outlined") return Icons.zoom_in_outlined;
    if (value == "zoom_in_map") return Icons.zoom_in_map;
    if (value == "zoom_in_map_sharp") return Icons.zoom_in_map_sharp;
    if (value == "zoom_in_map_rounded") return Icons.zoom_in_map_rounded;
    if (value == "zoom_in_map_outlined") return Icons.zoom_in_map_outlined;
    if (value == "zoom_out") return Icons.zoom_out;
    if (value == "zoom_out_sharp") return Icons.zoom_out_sharp;
    if (value == "zoom_out_rounded") return Icons.zoom_out_rounded;
    if (value == "zoom_out_outlined") return Icons.zoom_out_outlined;
    if (value == "zoom_out_map") return Icons.zoom_out_map;
    if (value == "zoom_out_map_sharp") return Icons.zoom_out_map_sharp;
    if (value == "zoom_out_map_rounded") return Icons.zoom_out_map_rounded;
    if (value == "zoom_out_map_outlined") return Icons.zoom_out_map_outlined;

    return null;
  }
}
