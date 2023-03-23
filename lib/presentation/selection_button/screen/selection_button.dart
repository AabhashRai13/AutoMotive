import 'package:auto_motive/presentation/login/screen_switch_bloc/switch_screen_bloc.dart';
import 'package:auto_motive/presentation/selection_button/selectionButtonCubit/selection_button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SelectionButton extends StatelessWidget {
  SelectionButton({super.key, required this.option});
  final List<String> option;
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0);
  List<int> newList = [];
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      trackVisibility: true,
      child: BlocBuilder<SelectionButtonCubit, SelectionButtonState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Row(
              children: [
                for (int index = 0; index < 2; index++)
                  _optionButton(index, state, context)
              ],
            ),
          );
        },
      ),
    );
  }

  // String? _selectedOptionCode = "Yes";

  Widget _optionButton(
      int index, SelectionButtonState state, BuildContext context) {
    return GestureDetector(
        onTap: () async {
          await context.read<SelectionButtonCubit>().setIndex(index, newList);

          if (index == 1) {
            // ignore: use_build_context_synchronously
            context.read<ScreenSwitchBloc>().add(const SignInWithEmailMethod());
          } else {
            // ignore: use_build_context_synchronously
            context.read<ScreenSwitchBloc>().add(const SignInWithPhoneMethod());
          }
        },
        child: _selectionButtonWidget(option[index], index, state, context));
  }

  Widget _selectionButtonWidget(String name, int index,
      SelectionButtonState state, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 8.0),
      decoration: BoxDecoration(
        color:
            state.indexList.contains(index) ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          )),
    );
  }
}
