part of '../../home_page.dart';

Widget _buildCheckboxOption(BuildContext context, String option) {
  final homeCubit = BlocProvider.of<HomeCubit>(context);
  return CheckboxListTile(
    title: Text(option),
    value: homeCubit.state.contains(option),
    onChanged: (_) => homeCubit.toggleOption(option),
  );
}
