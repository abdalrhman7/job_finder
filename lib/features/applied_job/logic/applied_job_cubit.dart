import 'package:bloc/bloc.dart';
import 'package:JobFinder/core/helper/constants.dart';
import 'package:JobFinder/core/helper/shared_pref_helper.dart';
import 'package:JobFinder/features/applied_job/data/model/apply_model.dart';
import 'package:JobFinder/features/applied_job/data/repo/applied_job_repo.dart';
import 'package:meta/meta.dart';

part 'applied_job_state.dart';

class AppliedJobCubit extends Cubit<AppliedJobState> {
  AppliedJobCubit(this.appliedJobRepo) : super(AppliedJobInitial());

  final AppliedJobRepo appliedJobRepo;

  Future<void> getAppliedJob() async {
    emit(GetAppliedJobLoading());
    final response = await appliedJobRepo.getAppliedJob(AppConstants.userId);
    response.when(success: (applyModel) {
      print('********${applyModel.data}');
      emit(GetAppliedJobSuccess(applyData: applyModel.data ?? []));
    }, failure: (errorMessage) {
      emit(GetAppliedJobFailure());
    });
  }
}
