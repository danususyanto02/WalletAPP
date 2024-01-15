import 'package:bwa/blocs/user/user_bloc.dart';
import 'package:bwa/core.dart';
import 'package:bwa/models/transfer_form_model.dart';
import 'package:bwa/models/user_model.dart';
import 'package:bwa/ui/pages/transfer_amount_page.dart';
import 'package:bwa/ui/widgets/forms.dart';
import 'package:bwa/ui/widgets/transfer_reason_user_item.dart';
import 'package:bwa/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final usernameController = TextEditingController(text: '');
  UserModel? selectedUser;
  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    userBloc = context.read<UserBloc>()..add(UserGetRecent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transfer',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 36,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomFormField(
            title: 'Username',
            isShowTitle: false,
            controller: usernameController,
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                userBloc.add(UserGetByUsername(usernameController.text));
              } else {
                userBloc.add(UserGetRecent());
              }
            },
          ),
          // ,
          usernameController.text.isEmpty
              ? buildRecentUsers()
              : buildResultUsers(),
          const SizedBox(
            height: 100,
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(24),
        child: CustomFilledButton(
          title: 'Continue',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TransferAmountPage(
                        data: TransferFormModel(
                            sendTo: selectedUser!.username!))));
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildResultUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          Center(
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  return Wrap(
                    runSpacing: 16,
                    spacing: 30,
                    children: state.users.map((user) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedUser = user;
                            });
                          },
                          child: TransferResultUserItem(
                            user: user,
                            isSelected: user.id == selectedUser?.id,
                          ));
                    }).toList(),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget buildRecentUsers() {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        const SizedBox(
          height: 14,
        ),
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return Column(
                children: state.users.map((user) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransferAmountPage(
                                    data: TransferFormModel(
                                        sendTo: user.username!))));
                      },
                      child: TransferReasonUserItem(user: user));
                }).toList(),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ],
    ),
  );
}
