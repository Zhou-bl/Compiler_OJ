@n_global0 = dso_local global i32 zeroinitializer, align 4
@r_global0 = dso_local global i32 zeroinitializer, align 4
@c_global0 = dso_local global i32 zeroinitializer, align 4
@i_global0 = dso_local global i32 zeroinitializer, align 4
@j_global0 = dso_local global i32 zeroinitializer, align 4
define i32 @main() {
main_bb0:
	%_return.alloc1 = alloca i32, align 4
	store i32 0, i32* @i_global0, align 4
	br label %for_condition_bb_bb0
main_bb1:					 ;preds = %main_bb2
	%_return.load1 = load i32, i32* %_return.alloc1, align 4
	ret i32 %_return.load1
for_condition_bb_bb0:					 ;preds = %main_bb0, %for_iter_bb_bb0
	%i.load0 = load i32, i32* @i_global0, align 4
	%slt0 = icmp slt i32 %i.load0, 5
	%zext_1 = zext i1 %slt0 to i8
	%trunc_1 = trunc i8 %zext_1 to i1
	br i1 %trunc_1, label %for_body_bb_bb0, label %main_bb2
for_iter_bb_bb0:					 ;preds = %main_bb3
	%i.load2 = load i32, i32* @i_global0, align 4
	%add1 = add i32 %i.load2, 1
	store i32 %add1, i32* @i_global0, align 4
	br label %for_condition_bb_bb0
for_body_bb_bb0:					 ;preds = %for_condition_bb_bb0
	store i32 0, i32* @j_global0, align 4
	br label %for_condition_bb_bb1
main_bb2:					 ;preds = %for_condition_bb_bb0
	%c.load3 = load i32, i32* @c_global0, align 4
	%sub1 = sub i32 2, %c.load3
	%_call_f_abs00 = call i32 @_f_abs0(i32 %sub1)
	%r.load0 = load i32, i32* @r_global0, align 4
	%sub2 = sub i32 2, %r.load0
	%_call_f_abs01 = call i32 @_f_abs0(i32 %sub2)
	%add2 = add i32 %_call_f_abs01, %_call_f_abs00
	call void @_f_printInt0(i32 %add2)
	store i32 0, i32* %_return.alloc1, align 4
	br label %main_bb1
for_condition_bb_bb1:					 ;preds = %for_body_bb_bb0, %for_iter_bb_bb1
	%j.load0 = load i32, i32* @j_global0, align 4
	%slt1 = icmp slt i32 %j.load0, 5
	%zext_2 = zext i1 %slt1 to i8
	%trunc_2 = trunc i8 %zext_2 to i1
	br i1 %trunc_2, label %for_body_bb_bb1, label %main_bb3
for_iter_bb_bb1:					 ;preds = %main_bb4
	%j.load2 = load i32, i32* @j_global0, align 4
	%add0 = add i32 %j.load2, 1
	store i32 %add0, i32* @j_global0, align 4
	br label %for_condition_bb_bb1
for_body_bb_bb1:					 ;preds = %for_condition_bb_bb1
	%_call_f_getInt00 = call i32 @_f_getInt0()
	store i32 %_call_f_getInt00, i32* @n_global0, align 4
	%n.load0 = load i32, i32* @n_global0, align 4
	%eq0 = icmp eq i32 %n.load0, 1
	%zext_3 = zext i1 %eq0 to i8
	%trunc_3 = trunc i8 %zext_3 to i1
	br i1 %trunc_3, label %if_then_bb1, label %main_bb4
main_bb3:					 ;preds = %for_condition_bb_bb1
	br label %for_iter_bb_bb0
if_then_bb1:					 ;preds = %for_body_bb_bb1
	%i.load1 = load i32, i32* @i_global0, align 4
	store i32 %i.load1, i32* @r_global0, align 4
	%j.load1 = load i32, i32* @j_global0, align 4
	store i32 %j.load1, i32* @c_global0, align 4
	br label %main_bb4
main_bb4:					 ;preds = %for_body_bb_bb1, %if_then_bb1
	br label %for_iter_bb_bb1
}
declare i32 @_f_getInt0()
define i32 @_f_abs0(i32 %_arg0) {
_f_abs0_bb0:
	%_return.alloc0 = alloca i32, align 4
	%c.alloc0 = alloca i32, align 4
	store i32 %_arg0, i32* %c.alloc0, align 4
	%c.load0 = load i32, i32* %c.alloc0, align 4
	%sgt0 = icmp sgt i32 %c.load0, 0
	%zext_0 = zext i1 %sgt0 to i8
	%trunc_0 = trunc i8 %zext_0 to i1
	br i1 %trunc_0, label %if_then_bb0, label %_f_abs0_bb2
_f_abs0_bb1:					 ;preds = %if_then_bb0, %_f_abs0_bb2
	%_return.load0 = load i32, i32* %_return.alloc0, align 4
	ret i32 %_return.load0
if_then_bb0:					 ;preds = %_f_abs0_bb0
	%c.load1 = load i32, i32* %c.alloc0, align 4
	store i32 %c.load1, i32* %_return.alloc0, align 4
	br label %_f_abs0_bb1
_f_abs0_bb2:					 ;preds = %_f_abs0_bb0, %if_then_bb0
	%c.load2 = load i32, i32* %c.alloc0, align 4
	%sub0 = sub i32 0, %c.load2
	store i32 %sub0, i32* %_return.alloc0, align 4
	br label %_f_abs0_bb1
}
declare void @_f_printInt0(i32)

