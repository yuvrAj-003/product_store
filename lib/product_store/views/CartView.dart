import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/models/appStateModel.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  String _name = '';
  String _email = '';
  String _mobile = '';
  String _address = '';
  TimeOfDay? _selectedTime;
  DateTime? _selectedDate;

  /// Fix all the input fields

  // Name input
  Widget _buildNameInput() {
    return _buildInputBox(
      label: 'Name',
      icon: Ionicons.person_outline,
      onSaved: (value) => _name = value ?? '',
      onChanged: (value) => setState(() => _name = value),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
    );
  }

  /// Email Input
  Widget _buildEmailInput() {
    return _buildInputBox(
      label: 'Email',
      icon: Ionicons.mail_outline,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => _email = value ?? '',
      onChanged: (value) => setState(() => _email = value),
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
  Widget _buildMobileInput() {
    return _buildInputBox(
      label: 'Mobile',
      icon: Ionicons.call_outline,
      keyboardType: TextInputType.phone,
      onSaved: (value) => _mobile = value ?? '',
      onChanged: (value) => setState(() => _mobile = value),
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
  Widget _buildAddressInput() {
    return _buildInputBox(
      label: 'Address',
      icon: Ionicons.location_outline,
      keyboardType: TextInputType.streetAddress,
      maxLines: 2,
      onSaved: (value) => _address = value ?? '',
      onChanged: (value) {
        setState(() {
          _address = value;
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

  Widget _buildDateInput() {
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
  Widget _buildTimeInput() {
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
              ? _selectedTime!.format(context)
              : 'Select a time',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  // function for select date
  Future<void> _selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
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
      context: context,
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
    required String label,
    required IconData icon,
    required FormFieldSetter<String> onSaved,
    required ValueChanged<String> onChanged,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    FormFieldValidator<String>? validator,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Consumer<AppStateModel>(
        builder: (context, value, child) {
          return ListView(
            children: [
              Theme(
                // removing outline
                data: Theme.of(context).copyWith(
                  expansionTileTheme: const ExpansionTileThemeData(
                    shape: RoundedRectangleBorder(),
                  ),
                ),
                child: ExpansionTile(
                  title: const Text('Address Details'),
                  children: [
                    Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildNameInput(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildEmailInput(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildMobileInput(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildDateInput(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildTimeInput(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildAddressInput(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
