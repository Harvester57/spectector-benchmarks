; ModuleID = '../sources/clang/08.c'
source_filename = "../sources/clang/08.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@array1_size = dso_local local_unnamed_addr global i32 16, align 4
@array1 = dso_local local_unnamed_addr global [16 x i8] c"\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10", align 16
@temp = dso_local local_unnamed_addr global i8 0, align 1
@array2 = common dso_local local_unnamed_addr global [131072 x i8] zeroinitializer, align 16

; Function Attrs: norecurse nounwind sspstrong uwtable
define dso_local void @victim_function_v08(i64) local_unnamed_addr #0 {
  %2 = load i32, i32* @array1_size, align 4, !tbaa !4
  %3 = zext i32 %2 to i64
  %4 = icmp ugt i64 %3, %0
  %5 = add i64 %0, 1
  %6 = select i1 %4, i64 %5, i64 0
  %7 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %6
  %8 = load i8, i8* %7, align 1, !tbaa !8
  %9 = zext i8 %8 to i64
  %10 = shl nuw nsw i64 %9, 9
  %11 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %10
  %12 = load i8, i8* %11, align 16, !tbaa !8
  %13 = load i8, i8* @temp, align 1, !tbaa !8
  %14 = and i8 %13, %12
  store i8 %14, i8* @temp, align 1, !tbaa !8
  ret void
}

attributes #0 = { norecurse nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 7.0.1 (tags/RELEASE_701/final)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
