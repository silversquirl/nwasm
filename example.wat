(module
	(type $answer_ty (func (result i32)))
	(func $answer (type $answer_ty) (result i32)
		i32.const 42
		return)
	(export "answer" (func $answer)))
