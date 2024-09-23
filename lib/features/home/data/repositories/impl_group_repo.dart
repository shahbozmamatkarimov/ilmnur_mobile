import 'dart:convert';

import 'package:ilmnur_mobile/core/error/exception_handler.dart';
import 'package:ilmnur_mobile/features/home/data/models/group/group.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';
import 'package:ilmnur_mobile/features/home/domain/repositories/group_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/group/group_service.dart';

class ImplGroupRepo extends GroupRepo {
  final GroupService groupService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplGroupRepo({required this.groupService});

  Future<void> _initializePreferences() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  // Retrieve group from SharedPreferences
  Future<List<Group>?> _getGroupFromPreferences() async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String>? groupJsonStrings = preferences?.getStringList('Group');

    if (groupJsonStrings == null) {
      return null;
    }

    return groupJsonStrings.map((groupJson) {
      return Group.fromJson(jsonDecode(groupJson) as Map<String, dynamic>);
    }).toList();
  }

  // Save group to SharedPreferences
  Future<void> _saveGroupToPreferences(List<Group> group) async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String> groupJsonStrings = group.map((group) {
      return jsonEncode(group.toJson());
    }).toList();

    preferences?.setStringList('Group', groupJsonStrings);
  }

  @override
  Future<DataState<List<Group>>> getGroup() async {
    try {
      final List<Group>? group = await _getGroupFromPreferences();
      if (group != null && group.isNotEmpty) {
        // return DataSuccess<List<Group>>(data: group);
      }
      final response = await groupService.getGroups();
      await _saveGroupToPreferences(response.data);
      return DataSuccess<List<Group>>(data: response.data);
    } catch (e) {
      print(e);
      return DataException.getError<List<Group>>(e);
    }
  }
}
