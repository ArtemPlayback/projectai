import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

List<dynamic> cleanJson(String jsonString) {
  jsonString = jsonString.replaceAll('\\n', '');

  // Удалить слеши
  jsonString = jsonString.replaceAll('\\', '');

  // Заменить одинарные кавычки на двойные кавычки для ключей и значений JSON
  jsonString = jsonString.replaceAll(RegExp(r"'(.*?)':"), '"\$1":');
  jsonString = jsonString.replaceAll(RegExp(r"':"), '":');

  // Преобразовать в JSON-массив
  return jsonDecode(jsonString);
}

String? stringToAPI(String? text) {
  if (text == null) {
    return null;
  }
  // Используйте jsonEncode для экранирования строки
  String encodedText = jsonEncode(text);

  // Уберите начальные и конечные кавычки
  return encodedText.substring(1, encodedText.length - 1);
}

List<dynamic>? questions(
  List<dynamic>? chat,
  String? author,
  String? message,
) {
  // Get the current time in the format "22:17"
  String formattedTime = DateFormat('HH:mm').format(DateTime.now());

  // If the chat list is null or empty, initialize it with the bot's default message.
  if (chat == null || chat.isEmpty) {
    return [
      {
        'author': 'GPT',
        'message': 'Please, wait. I am generating questions....',
        'timestamp': formattedTime,
      }
    ];
  }

  // If message is provided, add it to the chat list.
  if (message != null) {
    chat.add({
      if (author != null) 'author': author,
      'message': message,
      'timestamp': formattedTime,
    });
  }

  return chat;
}

DocumentReference? idToReferenceNetworking(String? firestoreID) {
  // make reference from firestore id
  if (firestoreID == null) {
    return null;
  }
  return FirebaseFirestore.instance.collection('networking').doc(firestoreID);
}

List<String> imagesList(
  List<String> newimages,
  List<String>? listImages,
) {
  // add newImages to listImages and return new list of images
  if (listImages == null) {
    return newimages;
  } else {
    return [...listImages, ...newimages];
  }
}

List<CompetitorsStruct>? competitors(
  List<CompetitorsStruct>? appState,
  List<String>? options,
  int? competitorIndex,
  int? optionIndex,
  String? competitorTextfield,
  bool? boolean,
  String? optionTextfield,
) {
  if (appState == null || options == null) {
    return appState;
  }

  // Если обновляем имя компетитора
  if (competitorIndex != null && optionIndex == null) {
    if (competitorIndex < appState.length) {
      var updatedCompetitor = appState[competitorIndex];
      updatedCompetitor.competitorName = optionTextfield;
      appState[competitorIndex] = updatedCompetitor;
    }
  } else if (optionIndex != null) {
    // Если обновляем опцию
    for (var i = 0; i < appState.length; i++) {
      var competitor = appState[i];
      if (optionIndex < competitor.options.length) {
        competitor.options[optionIndex].option = optionTextfield;
      } else {
        competitor.options.add(
            CompetitorOptionsStruct(option: optionTextfield, presence: false));
      }
      appState[i] = competitor;
    }
  }

  return appState;
}

List<PostStruct>? sortPosts(List<PostStruct>? posts) {
  // sort posts by timestamp, handling possible null values
  if (posts == null || posts.isEmpty) {
    return null;
  }

  posts.sort((a, b) {
    // Treat nulls as less than any non-null DateTime.
    if (a.timestamp == null && b.timestamp == null) {
      return 0;
    }
    if (a.timestamp == null) {
      return 1;
    }
    if (b.timestamp == null) {
      return -1;
    }
    // If both timestamps are not null, compare them normally.
    return b.timestamp!.compareTo(a.timestamp!);
  });

  return posts;
}

String? flowiseJson(String? json) {
  if (json == null) return null;

  int startIndex = json.indexOf('[');
  int endIndex = json.lastIndexOf(']');

  if (startIndex == -1 || endIndex == -1 || startIndex > endIndex) {
    return '[]'; // Возвращает пустой JSON-список, если не найдены правильные скобки
  }

  String cleanJson = json.substring(startIndex, endIndex + 1);
  return cleanJson;
}

String generateRandomString(int? length) {
  final int len = length ?? 12; // Default length to 12 if null
  const String chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final StringBuffer buffer = StringBuffer();
  final math.Random rnd = math.Random();

  for (int i = 0; i < len; i++) {
    buffer.write(chars[rnd.nextInt(chars.length)]);
  }
  return buffer.toString();
}

String? jsonListToText(List<dynamic>? jsonList) {
  if (jsonList == null) return '[]';
  return jsonList.map((json) => jsonEncode(json)).toList().toString();
}

String newCustomFunction(String text) {
  String newText = text.replaceAll('\$', '');
  // Добавляем знак доллара в конец обработанного текста
  newText = '\$' + newText;
  return newText;
}

bool compareTimestamps(
  DateTime? timestamp1st,
  DateTime timestamp2nd,
) {
  // If the first timestamp is null, we cannot compare the days.
  if (timestamp1st == null) return false;

  // Compare the year, month, and day components of the timestamps.
  return timestamp1st.year != timestamp2nd.year ||
      timestamp1st.month != timestamp2nd.month ||
      timestamp1st.day != timestamp2nd.day;
}

List<String>? reverseImagesList(List<String>? imagesList) {
  if (imagesList == null || imagesList.isEmpty) return null;
  return List.from(imagesList.reversed);
}

List<EventsRecord> reverseEventsList(List<EventsRecord> eventsList) {
  if (eventsList.isEmpty) return [];
  return List.from(eventsList.reversed);
}

List<ChatsRecord> chatmessages1(
  List<ChatsRecord>? chatmessages,
  String? textfieldValue,
) {
  if (chatmessages == null ||
      textfieldValue == null ||
      textfieldValue.isEmpty) {
    return [];
  }

  return chatmessages.where((chat) {
    return chat.chatMessages
        .any((message) => message.text.contains(textfieldValue));
  }).toList();
}

List<String> chatMessages2(
  List<ChatsRecord>? chatmessages,
  String? textfieldValue,
) {
  if (chatmessages == null ||
      textfieldValue == null ||
      textfieldValue.isEmpty) {
    return [];
  }

  List<String> foundMessages = [];
  for (var chat in chatmessages) {
    for (var message in chat.chatMessages) {
      if (message.text.contains(textfieldValue)) {
        foundMessages.add(message.text);
      }
    }
  }
  return foundMessages;
}

LatLng stringToLatLng(String? location) {
  // convert string to latlng
  if (location == null || location.isEmpty) {
    return const LatLng(0.0, 0.0);
  }
  final latLngList = location.split(',');
  final latitude = double.tryParse(latLngList[0]) ?? 0.0;
  final longitude = double.tryParse(latLngList[1]) ?? 0.0;
  return LatLng(latitude, longitude);
}

List<Color> listStringToListColors(List<String> colors) {
  // Convert list string in hex format to list of colors
  return colors
      .map((color) => Color(int.parse(color, radix: 16) | 0xFF000000))
      .toList();
}

List<String>? listColorsToListString(List<Color>? colors) {
  // convert list of colors to list of strings
  if (colors == null) {
    return null;
  }
  return colors.map((color) => color.toString()).toList();
}

List<dynamic> removeKeysFromJsonList(List<dynamic> jsonList) {
  // Remove keys: "options", "isMultiselect" "type" from all items of jsonList
  return jsonList.map((item) {
    Map<String, dynamic> newItem = Map.from(item);
    newItem.remove('options');
    newItem.remove('isMultiselect');
    newItem.remove('type');
    return newItem;
  }).toList();
}

int findInviteIndexInListOfInvites(
  DocumentReference? user,
  List<InvitesStruct>? invites,
) {
  if (user == null || invites == null) {
    return -1; // Возвращаем -1, если входные параметры недействительны
  }

  for (int i = 0; i < invites.length; i++) {
    if (invites[i].who == user) {
      return i;
    }
  }

  return -1; // Возвращаем -1, если элемент не найден
}
