import 'dart:core';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class InputBoxes {
  InputBoxes({
    required this.context,
    required this.setState,
  });

  String name = '';
  String email = '';
  String mobile = '';
  String address = '';
  TimeOfDay? _selectedTime;
  DateTime? _selectedDate;

  late final BuildContext context;
  late final void Function(VoidCallback) setState;

  /// Fix all the input fields

  // Name input
  Widget buildNameInput() {
    return _buildInputBox(
      label: 'Name',
      icon: Ionicons.person_outline,
      onSaved: (value) => name = value as String,
      onChanged: (value) => setState(() => name = value as String),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
    );
  }

  /// Email Input
  Widget buildEmailInput() {
    return _buildInputBox(
      label: 'Email',
      icon: Ionicons.mail_outline,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => email = value as String,
      onChanged: (value) => setState(() => email = value as String),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  /// Mobile Input
  Widget buildMobileInput() {
    return _buildInputBox(
      label: 'Mobile',
      icon: Ionicons.call_outline,
      keyboardType: TextInputType.phone,
      onSaved: (value) => mobile = value as String,
      onChanged: (value) => setState(() => mobile = value as String),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your mobile number';
        }
        if (!RegExp(r'^\d{10}$').hasMatch(value)) {
          return 'Please enter a valid 10-digit mobile number';
        }
        return null;
      },
    );
  }

  /// Address Input
  Widget buildAddressInput() {
    return _buildInputBox(
      label: 'Address',
      icon: Ionicons.location_outline,
      keyboardType: TextInputType.streetAddress,
      maxLines: 2,
      onSaved: (value) => address = value as String,
      onChanged: (value) {
        setState(() {
          address = value as String;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your address';
        }
        return null;
      },
    );
  }

  Widget buildDateInput() {
    return InkWell(
      onTap: _selectDate,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Date',
          prefixIcon:
              const Icon(Ionicons.calendar_outline, color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          _selectedDate != null
              ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
              : 'Select a date',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  /// Time Input
  Widget buildTimeInput() {
    return InkWell(
      onTap: _selectTime,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Time',
          prefixIcon: const Icon(Ionicons.time_outline, color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          _selectedTime != null
              ? _selectedTime!.format(context as BuildContext)
              : 'Select a time',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  // function for select date
  Future<void> _selectDate() async {
    final selectedDate = await showDatePicker(
      context: context as BuildContext,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  // function for select time
  Future<void> _selectTime() async {
    final selectedTime = await showTimePicker(
      context: context as BuildContext,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        _selectedTime = selectedTime;
      });
    }
  }

  /// Generic Input Box Builder
  Widget _buildInputBox({
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    FormFieldValidator<String>? validator,
    required FormFieldSetter<String> onSaved,
    required ValueChanged<String> onChanged,
    required String label,
    required IoniconsData icon,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
