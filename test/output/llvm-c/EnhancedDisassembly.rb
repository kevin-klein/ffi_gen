# Generated by ffi-gen. Please do not change this file by hand.

require 'ffi'

module LLVM
  extend FFI::Library
  ffi_lib 'LLVM-3.0'
  
  def self.attach_function(name, *_)
    begin; super; rescue FFI::NotFoundError => e
      (class << self; self; end).class_eval { define_method(name) { |*_| raise e } }
    end
  end
  
  # !
  #  @typedef EDByteReaderCallback
  #  Interface to memory from which instructions may be read.
  #  @param byte A pointer whose target should be filled in with the data returned.
  #  @param address The address of the byte to be read.
  #  @param arg An anonymous argument for client use.
  #  @result 0 on success; -1 otherwise.
  # 
  # <em>This entry is only for documentation and no real method.</em>
  # 
  # @method _callback_ed_byte_reader_callback_(address, arg)
  # @param [Integer] address 
  # @param [FFI::Pointer(*Void)] arg 
  # @return [FFI::Pointer(*Uint8T)] 
  # @scope class
  callback :ed_byte_reader_callback, [:ulong, :pointer], :pointer
  
  # !
  #  @typedef EDRegisterReaderCallback
  #  Interface to registers from which registers may be read.
  #  @param value A pointer whose target should be filled in with the value of the
  #    register.
  #  @param regID The LLVM register identifier for the register to read.
  #  @param arg An anonymous argument for client use.
  #  @result 0 if the register could be read; -1 otherwise.
  # 
  # <em>This entry is only for documentation and no real method.</em>
  # 
  # @method _callback_ed_register_reader_callback_(reg_id, arg)
  # @param [Integer] reg_id 
  # @param [FFI::Pointer(*Void)] arg 
  # @return [FFI::Pointer(*Uint64T)] 
  # @scope class
  callback :ed_register_reader_callback, [:uint, :pointer], :pointer
  
  # !
  #  @function EDGetDisassembler
  #  Gets the disassembler for a given target.
  #  @param disassembler A pointer whose target will be filled in with the
  #    disassembler.
  #  @param triple Identifies the target.  Example: "x86_64-apple-darwin10"
  #  @param syntax The assembly syntax to use when decoding instructions.
  #  @result 0 on success; -1 otherwise.
  # 
  # @method ed_get_disassembler(disassembler, triple, syntax)
  # @param [FFI::Pointer(*EDDisassemblerRef)] disassembler 
  # @param [String] triple 
  # @param [Integer] syntax 
  # @return [Integer] 
  # @scope class
  attach_function :ed_get_disassembler, :EDGetDisassembler, [:pointer, :string, :uint], :int
  
  # !
  #  @function EDGetRegisterName
  #  Gets the human-readable name for a given register.
  #  @param regName A pointer whose target will be pointed at the name of the
  #    register.  The name does not need to be deallocated and will be
  #  @param disassembler The disassembler to query for the name.
  #  @param regID The register identifier, as returned by EDRegisterTokenValue.
  #  @result 0 on success; -1 otherwise.
  # 
  # @method ed_get_register_name(reg_name, disassembler, reg_id)
  # @param [FFI::Pointer(**CharS)] reg_name 
  # @param [FFI::Pointer(EDDisassemblerRef)] disassembler 
  # @param [Integer] reg_id 
  # @return [Integer] 
  # @scope class
  attach_function :ed_get_register_name, :EDGetRegisterName, [:pointer, :pointer, :uint], :int
  
  # !
  #  @function EDRegisterIsStackPointer
  #  Determines if a register is one of the platform's stack-pointer registers.
  #  @param disassembler The disassembler to query.
  #  @param regID The register identifier, as returned by EDRegisterTokenValue.
  #  @result 1 if true; 0 otherwise.
  # 
  # @method ed_register_is_stack_pointer(disassembler, reg_id)
  # @param [FFI::Pointer(EDDisassemblerRef)] disassembler 
  # @param [Integer] reg_id 
  # @return [Integer] 
  # @scope class
  attach_function :ed_register_is_stack_pointer, :EDRegisterIsStackPointer, [:pointer, :uint], :int
  
  # !
  #  @function EDRegisterIsProgramCounter
  #  Determines if a register is one of the platform's stack-pointer registers.
  #  @param disassembler The disassembler to query.
  #  @param regID The register identifier, as returned by EDRegisterTokenValue.
  #  @result 1 if true; 0 otherwise.
  # 
  # @method ed_register_is_program_counter(disassembler, reg_id)
  # @param [FFI::Pointer(EDDisassemblerRef)] disassembler 
  # @param [Integer] reg_id 
  # @return [Integer] 
  # @scope class
  attach_function :ed_register_is_program_counter, :EDRegisterIsProgramCounter, [:pointer, :uint], :int
  
  # !
  #  @function EDCreateInst
  #  Gets a set of contiguous instructions from a disassembler.
  #  @param insts A pointer to an array that will be filled in with the
  #    instructions.  Must have at least count entries.  Entries not filled in will
  #    be set to NULL.
  #  @param count The maximum number of instructions to fill in.
  #  @param disassembler The disassembler to use when decoding the instructions.
  #  @param byteReader The function to use when reading the instruction's machine
  #    code.
  #  @param address The address of the first byte of the instruction.
  #  @param arg An anonymous argument to be passed to byteReader.
  #  @result The number of instructions read on success; 0 otherwise.
  # 
  # @method ed_create_insts(insts, count, disassembler, byte_reader, address, arg)
  # @param [FFI::Pointer(*EDInstRef)] insts 
  # @param [Integer] count 
  # @param [FFI::Pointer(EDDisassemblerRef)] disassembler 
  # @param [Proc(_callback_ed_byte_reader_callback_)] byte_reader 
  # @param [Integer] address 
  # @param [FFI::Pointer(*Void)] arg 
  # @return [Integer] 
  # @scope class
  attach_function :ed_create_insts, :EDCreateInsts, [:pointer, :uint, :pointer, :ed_byte_reader_callback, :ulong, :pointer], :uint
  
  # !
  #  @function EDReleaseInst
  #  Frees the memory for an instruction.  The instruction can no longer be accessed
  #  after this call.
  #  @param inst The instruction to be freed.
  # 
  # @method ed_release_inst(inst)
  # @param [FFI::Pointer(EDInstRef)] inst 
  # @return [nil] 
  # @scope class
  attach_function :ed_release_inst, :EDReleaseInst, [:pointer], :void
  
  # !
  #  @function EDInstByteSize
  #  @param inst The instruction to be queried.
  #  @result The number of bytes in the instruction's machine-code representation.
  # 
  # @method ed_inst_byte_size(inst)
  # @param [FFI::Pointer(EDInstRef)] inst 
  # @return [Integer] 
  # @scope class
  attach_function :ed_inst_byte_size, :EDInstByteSize, [:pointer], :int
  
  # !
  #  @function EDGetInstString
  #  Gets the disassembled text equivalent of the instruction.
  #  @param buf A pointer whose target will be filled in with a pointer to the
  #    string.  (The string becomes invalid when the instruction is released.)
  #  @param inst The instruction to be queried.
  #  @result 0 on success; -1 otherwise.
  # 
  # @method ed_get_inst_string(buf, inst)
  # @param [FFI::Pointer(**CharS)] buf 
  # @param [FFI::Pointer(EDInstRef)] inst 
  # @return [Integer] 
  # @scope class
  attach_function :ed_get_inst_string, :EDGetInstString, [:pointer, :pointer], :int
  
  # !
  #  @function EDInstID
  #  @param instID A pointer whose target will be filled in with the LLVM identifier
  #    for the instruction.
  #  @param inst The instruction to be queried.
  #  @result 0 on success; -1 otherwise.
  # 
  # @method ed_inst_id(inst_id, inst)
  # @param [FFI::Pointer(*UInt)] inst_id 
  # @param [FFI::Pointer(EDInstRef)] inst 
  # @return [Integer] 
  # @scope class
  attach_function :ed_inst_id, :EDInstID, [:pointer, :pointer], :int
  
  # !
  #  @function EDInstIsBranch
  #  @param inst The instruction to be queried.
  #  @result 1 if the instruction is a branch instruction; 0 if it is some other
  #    type of instruction; -1 if there was an error.
  # 
  # @method ed_inst_is_branch(inst)
  # @param [FFI::Pointer(EDInstRef)] inst 
  # @return [Integer] 
  # @scope class
  attach_function :ed_inst_is_branch, :EDInstIsBranch, [:pointer], :int
  
  # !
  #  @function EDInstIsMove
  #  @param inst The instruction to be queried.
  #  @result 1 if the instruction is a move instruction; 0 if it is some other
  #    type of instruction; -1 if there was an error.
  # 
  # @method ed_inst_is_move(inst)
  # @param [FFI::Pointer(EDInstRef)] inst 
  # @return [Integer] 
  # @scope class
  attach_function :ed_inst_is_move, :EDInstIsMove, [:pointer], :int
  
  # !
  #  @function EDBranchTargetID
  #  @param inst The instruction to be queried.
  #  @result The ID of the branch target operand, suitable for use with
  #    EDCopyOperand.  -1 if no such operand exists.
  # 
  # @method ed_branch_target_id(inst)
  # @param [FFI::Pointer(EDInstRef)] inst 
  # @return [Integer] 
  # @scope class
  attach_function :ed_branch_target_id, :EDBranchTargetID, [:pointer], :int
  
  # !
  #  @function EDMoveSourceID
  #  @param inst The instruction to be queried.
  #  @result The ID of the move source operand, suitable for use with
  #    EDCopyOperand.  -1 if no such operand exists.
  # 
  # @method ed_move_source_id(inst)
  # @param [FFI::Pointer(EDInstRef)] inst 
  # @return [Integer] 
  # @scope class
  attach_function :ed_move_source_id, :EDMoveSourceID, [:pointer], :int
  
  # !
  #  @function EDMoveTargetID
  #  @param inst The instruction to be queried.
  #  @result The ID of the move source operand, suitable for use with
  #    EDCopyOperand.  -1 if no such operand exists.
  # 
  # @method ed_move_target_id(inst)
  # @param [FFI::Pointer(EDInstRef)] inst 
  # @return [Integer] 
  # @scope class
  attach_function :ed_move_target_id, :EDMoveTargetID, [:pointer], :int
  
  # !
  #  @function EDNumTokens
  #  @param inst The instruction to be queried.
  #  @result The number of tokens in the instruction, or -1 on error.
  # 
  # @method ed_num_tokens(inst)
  # @param [FFI::Pointer(EDInstRef)] inst 
  # @return [Integer] 
  # @scope class
  attach_function :ed_num_tokens, :EDNumTokens, [:pointer], :int
  
  # !
  #  @function EDGetToken
  #  Retrieves a token from an instruction.  The token is valid until the
  #  instruction is released.
  #  @param token A pointer to be filled in with the token.
  #  @param inst The instruction to be queried.
  #  @param index The index of the token in the instruction.
  #  @result 0 on success; -1 otherwise.
  # 
  # @method ed_get_token(token, inst, index)
  # @param [FFI::Pointer(*EDTokenRef)] token 
  # @param [FFI::Pointer(EDInstRef)] inst 
  # @param [Integer] index 
  # @return [Integer] 
  # @scope class
  attach_function :ed_get_token, :EDGetToken, [:pointer, :pointer, :int], :int
  
  # !
  #  @function EDGetTokenString
  #  Gets the disassembled text for a token.
  #  @param buf A pointer whose target will be filled in with a pointer to the
  #    string.  (The string becomes invalid when the token is released.)
  #  @param token The token to be queried.
  #  @result 0 on success; -1 otherwise.
  # 
  # @method ed_get_token_string(buf, token)
  # @param [FFI::Pointer(**CharS)] buf 
  # @param [FFI::Pointer(EDTokenRef)] token 
  # @return [Integer] 
  # @scope class
  attach_function :ed_get_token_string, :EDGetTokenString, [:pointer, :pointer], :int
  
  # !
  #  @function EDOperandIndexForToken
  #  Returns the index of the operand to which a token belongs.
  #  @param token The token to be queried.
  #  @result The operand index on success; -1 otherwise
  # 
  # @method ed_operand_index_for_token(token)
  # @param [FFI::Pointer(EDTokenRef)] token 
  # @return [Integer] 
  # @scope class
  attach_function :ed_operand_index_for_token, :EDOperandIndexForToken, [:pointer], :int
  
  # !
  #  @function EDTokenIsWhitespace
  #  @param token The token to be queried.
  #  @result 1 if the token is whitespace; 0 if not; -1 on error.
  # 
  # @method ed_token_is_whitespace(token)
  # @param [FFI::Pointer(EDTokenRef)] token 
  # @return [Integer] 
  # @scope class
  attach_function :ed_token_is_whitespace, :EDTokenIsWhitespace, [:pointer], :int
  
  # !
  #  @function EDTokenIsPunctuation
  #  @param token The token to be queried.
  #  @result 1 if the token is punctuation; 0 if not; -1 on error.
  # 
  # @method ed_token_is_punctuation(token)
  # @param [FFI::Pointer(EDTokenRef)] token 
  # @return [Integer] 
  # @scope class
  attach_function :ed_token_is_punctuation, :EDTokenIsPunctuation, [:pointer], :int
  
  # !
  #  @function EDTokenIsOpcode
  #  @param token The token to be queried.
  #  @result 1 if the token is opcode; 0 if not; -1 on error.
  # 
  # @method ed_token_is_opcode(token)
  # @param [FFI::Pointer(EDTokenRef)] token 
  # @return [Integer] 
  # @scope class
  attach_function :ed_token_is_opcode, :EDTokenIsOpcode, [:pointer], :int
  
  # !
  #  @function EDTokenIsLiteral
  #  @param token The token to be queried.
  #  @result 1 if the token is a numeric literal; 0 if not; -1 on error.
  # 
  # @method ed_token_is_literal(token)
  # @param [FFI::Pointer(EDTokenRef)] token 
  # @return [Integer] 
  # @scope class
  attach_function :ed_token_is_literal, :EDTokenIsLiteral, [:pointer], :int
  
  # !
  #  @function EDTokenIsRegister
  #  @param token The token to be queried.
  #  @result 1 if the token identifies a register; 0 if not; -1 on error.
  # 
  # @method ed_token_is_register(token)
  # @param [FFI::Pointer(EDTokenRef)] token 
  # @return [Integer] 
  # @scope class
  attach_function :ed_token_is_register, :EDTokenIsRegister, [:pointer], :int
  
  # !
  #  @function EDTokenIsNegativeLiteral
  #  @param token The token to be queried.
  #  @result 1 if the token is a negative signed literal; 0 if not; -1 on error.
  # 
  # @method ed_token_is_negative_literal(token)
  # @param [FFI::Pointer(EDTokenRef)] token 
  # @return [Integer] 
  # @scope class
  attach_function :ed_token_is_negative_literal, :EDTokenIsNegativeLiteral, [:pointer], :int
  
  # !
  #  @function EDLiteralTokenAbsoluteValue
  #  @param value A pointer whose target will be filled in with the absolute value
  #    of the literal.
  #  @param token The token to be queried.
  #  @result 0 on success; -1 otherwise.
  # 
  # @method ed_literal_token_absolute_value(value, token)
  # @param [FFI::Pointer(*Uint64T)] value 
  # @param [FFI::Pointer(EDTokenRef)] token 
  # @return [Integer] 
  # @scope class
  attach_function :ed_literal_token_absolute_value, :EDLiteralTokenAbsoluteValue, [:pointer, :pointer], :int
  
  # !
  #  @function EDRegisterTokenValue
  #  @param registerID A pointer whose target will be filled in with the LLVM
  #    register identifier for the token.
  #  @param token The token to be queried.
  #  @result 0 on success; -1 otherwise.
  # 
  # @method ed_register_token_value(register_id, token)
  # @param [FFI::Pointer(*UInt)] register_id 
  # @param [FFI::Pointer(EDTokenRef)] token 
  # @return [Integer] 
  # @scope class
  attach_function :ed_register_token_value, :EDRegisterTokenValue, [:pointer, :pointer], :int
  
  # !
  #  @function EDNumOperands
  #  @param inst The instruction to be queried.
  #  @result The number of operands in the instruction, or -1 on error.
  # 
  # @method ed_num_operands(inst)
  # @param [FFI::Pointer(EDInstRef)] inst 
  # @return [Integer] 
  # @scope class
  attach_function :ed_num_operands, :EDNumOperands, [:pointer], :int
  
  # !
  #  @function EDGetOperand
  #  Retrieves an operand from an instruction.  The operand is valid until the
  #  instruction is released.
  #  @param operand A pointer to be filled in with the operand.
  #  @param inst The instruction to be queried.
  #  @param index The index of the operand in the instruction.
  #  @result 0 on success; -1 otherwise.
  # 
  # @method ed_get_operand(operand, inst, index)
  # @param [FFI::Pointer(*EDOperandRef)] operand 
  # @param [FFI::Pointer(EDInstRef)] inst 
  # @param [Integer] index 
  # @return [Integer] 
  # @scope class
  attach_function :ed_get_operand, :EDGetOperand, [:pointer, :pointer, :int], :int
  
  # !
  #  @function EDOperandIsRegister
  #  @param operand The operand to be queried.
  #  @result 1 if the operand names a register; 0 if not; -1 on error.
  # 
  # @method ed_operand_is_register(operand)
  # @param [FFI::Pointer(EDOperandRef)] operand 
  # @return [Integer] 
  # @scope class
  attach_function :ed_operand_is_register, :EDOperandIsRegister, [:pointer], :int
  
  # !
  #  @function EDOperandIsImmediate
  #  @param operand The operand to be queried.
  #  @result 1 if the operand specifies an immediate value; 0 if not; -1 on error.
  # 
  # @method ed_operand_is_immediate(operand)
  # @param [FFI::Pointer(EDOperandRef)] operand 
  # @return [Integer] 
  # @scope class
  attach_function :ed_operand_is_immediate, :EDOperandIsImmediate, [:pointer], :int
  
  # !
  #  @function EDOperandIsMemory
  #  @param operand The operand to be queried.
  #  @result 1 if the operand specifies a location in memory; 0 if not; -1 on error.
  # 
  # @method ed_operand_is_memory(operand)
  # @param [FFI::Pointer(EDOperandRef)] operand 
  # @return [Integer] 
  # @scope class
  attach_function :ed_operand_is_memory, :EDOperandIsMemory, [:pointer], :int
  
  # !
  #  @function EDRegisterOperandValue
  #  @param value A pointer whose target will be filled in with the LLVM register ID
  #    of the register named by the operand.
  #  @param operand The operand to be queried.
  #  @result 0 on success; -1 otherwise.
  # 
  # @method ed_register_operand_value(value, operand)
  # @param [FFI::Pointer(*UInt)] value 
  # @param [FFI::Pointer(EDOperandRef)] operand 
  # @return [Integer] 
  # @scope class
  attach_function :ed_register_operand_value, :EDRegisterOperandValue, [:pointer, :pointer], :int
  
  # !
  #  @function EDImmediateOperandValue
  #  @param value A pointer whose target will be filled in with the value of the
  #    immediate.
  #  @param operand The operand to be queried.
  #  @result 0 on success; -1 otherwise.
  # 
  # @method ed_immediate_operand_value(value, operand)
  # @param [FFI::Pointer(*Uint64T)] value 
  # @param [FFI::Pointer(EDOperandRef)] operand 
  # @return [Integer] 
  # @scope class
  attach_function :ed_immediate_operand_value, :EDImmediateOperandValue, [:pointer, :pointer], :int
  
  # !
  #  @function EDEvaluateOperand
  #  Evaluates an operand using a client-supplied register state accessor.  Register
  #  operands are evaluated by reading the value of the register; immediate operands
  #  are evaluated by reporting the immediate value; memory operands are evaluated
  #  by computing the target address (with only those relocations applied that were
  #  already applied to the original bytes).
  #  @param result A pointer whose target is to be filled with the result of
  #    evaluating the operand.
  #  @param operand The operand to be evaluated.
  #  @param regReader The function to use when reading registers from the register
  #    state.
  #  @param arg An anonymous argument for client use.
  #  @result 0 if the operand could be evaluated; -1 otherwise.
  # 
  # @method ed_evaluate_operand(result, operand, reg_reader, arg)
  # @param [FFI::Pointer(*Uint64T)] result 
  # @param [FFI::Pointer(EDOperandRef)] operand 
  # @param [Proc(_callback_ed_register_reader_callback_)] reg_reader 
  # @param [FFI::Pointer(*Void)] arg 
  # @return [Integer] 
  # @scope class
  attach_function :ed_evaluate_operand, :EDEvaluateOperand, [:pointer, :pointer, :ed_register_reader_callback, :pointer], :int
  
end
