# Generated by ffi_gen. Please do not change this file by hand.

require 'ffi'

module LLVM
  extend FFI::Library
  ffi_lib 'LLVM-3.0'
  
  def self.attach_function(name, *args)
    begin; super; rescue FFI::NotFoundError => e
      (class << self; self; end).class_eval { define_method(name) { |*args| raise e } }
    end
  end
  
  DISASSEMBLER_VARIANT_KIND_NONE = 0
  
  DISASSEMBLER_VARIANT_KIND_ARM_HI16 = 1
  
  DISASSEMBLER_VARIANT_KIND_ARM_LO16 = 2
  
  DISASSEMBLER_REFERENCE_TYPE_IN_OUT_NONE = 0
  
  DISASSEMBLER_REFERENCE_TYPE_IN_BRANCH = 1
  
  DISASSEMBLER_REFERENCE_TYPE_IN_P_CREL_LOAD = 2
  
  DISASSEMBLER_REFERENCE_TYPE_OUT_SYMBOL_STUB = 1
  
  DISASSEMBLER_REFERENCE_TYPE_OUT_LIT_POOL_SYM_ADDR = 2
  
  DISASSEMBLER_REFERENCE_TYPE_OUT_LIT_POOL_CSTR_ADDR = 3
  
  # The type for the operand information call back function.  This is called to
  # get the symbolic information for an operand of an instruction.  Typically
  # this is from the relocation information, symbol table, etc.  That block of
  # information is saved when the disassembler context is created and passed to
  # the call back in the DisInfo parameter.  The instruction containing operand
  # is at the PC parameter.  For some instruction sets, there can be more than
  # one operand with symbolic information.  To determine the symbolic operand
  # information for each operand, the bytes for the specific operand in the
  # instruction are specified by the Offset parameter and its byte widith is the
  # size parameter.  For instructions sets with fixed widths and one symbolic
  # operand per instruction, the Offset parameter will be zero and Size parameter
  # will be the instruction width.  The information is returned in TagBuf and is 
  # Triple specific with its specific information defined by the value of
  # TagType for that Triple.  If symbolic information is returned the function
  # returns 1, otherwise it returns 0.
  # 
  # <em>This entry is only for documentation and no real method.</em>
  # 
  # @method _callback_op_info_callback_(pc, offset, size, tag_type, tag_buf)
  # @param [Integer] pc 
  # @param [Integer] offset 
  # @param [Integer] size 
  # @param [Integer] tag_type 
  # @param [FFI::Pointer(*Void)] tag_buf 
  # @return [FFI::Pointer(*Void)] 
  # @scope class
  callback :op_info_callback, [:ulong, :ulong, :ulong, :int, :pointer], :pointer
  
  # The initial support in LLVM MC for the most general form of a relocatable
  # expression is "AddSymbol - SubtractSymbol + Offset".  For some Darwin targets
  # this full form is encoded in the relocation information so that AddSymbol and
  # SubtractSymbol can be link edited independent of each other.  Many other
  # platforms only allow a relocatable expression of the form AddSymbol + Offset
  # to be encoded.
  # 
  # The LLVMOpInfoCallback() for the TagType value of 1 uses the struct
  # LLVMOpInfo1.  The value of the relocatable expression for the operand,
  # including any PC adjustment, is passed in to the call back in the Value
  # field.  The symbolic information about the operand is returned using all
  # the fields of the structure with the Offset of the relocatable expression
  # returned in the Value field.  It is possible that some symbols in the
  # relocatable expression were assembly temporary symbols, for example
  # "Ldata - LpicBase + constant", and only the Values of the symbols without
  # symbol names are present in the relocation information.  The VariantKind
  # type is one of the Target specific #defines below and is used to print
  # operands like "_foo@GOT", ":lower16:_foo", etc.
  # 
  # = Fields:
  # :present ::
  #   (Integer) 1 if this symbol is present
  # :name ::
  #   (String) symbol name if not NULL
  # :value ::
  #   (Integer) symbol value if name is NULL
  class OpInfoSymbol1 < FFI::Struct
    layout :present, :ulong,
           :name, :string,
           :value, :ulong
  end
  
  # symbol value if name is NULL
  # 
  # = Fields:
  # :add_symbol ::
  #   (OpInfoSymbol1) 
  # :subtract_symbol ::
  #   (OpInfoSymbol1) 
  # :value ::
  #   (Integer) 
  # :variant_kind ::
  #   (Integer) 
  class OpInfo1 < FFI::Struct
    layout :add_symbol, OpInfoSymbol1.by_value,
           :subtract_symbol, OpInfoSymbol1.by_value,
           :value, :ulong,
           :variant_kind, :ulong
  end
  
  # The type for the symbol lookup function.  This may be called by the
  # disassembler for things like adding a comment for a PC plus a constant
  # offset load instruction to use a symbol name instead of a load address value.
  # It is passed the block information is saved when the disassembler context is
  # created and the ReferenceValue to look up as a symbol.  If no symbol is found
  # for the ReferenceValue NULL is returned.  The ReferenceType of the
  # instruction is passed indirectly as is the PC of the instruction in
  # ReferencePC.  If the output reference can be determined its type is returned
  # indirectly in ReferenceType along with ReferenceName if any, or that is set
  # to NULL.
  # 
  # <em>This entry is only for documentation and no real method.</em>
  # 
  # @method _callback_symbol_lookup_callback_(reference_value, reference_type, reference_pc, reference_name)
  # @param [Integer] reference_value 
  # @param [FFI::Pointer(*Uint64T)] reference_type 
  # @param [Integer] reference_pc 
  # @param [FFI::Pointer(**CharS)] reference_name 
  # @return [FFI::Pointer(*Void)] 
  # @scope class
  callback :symbol_lookup_callback, [:ulong, :pointer, :ulong, :pointer], :pointer
  
  # Create a disassembler for the TripleName.  Symbolic disassembly is supported
  # by passing a block of information in the DisInfo parameter and specifying the
  # TagType and callback functions as described above.  These can all be passed
  # as NULL.  If successful, this returns a disassembler context.  If not, it
  # returns NULL.
  # 
  # @method create_disasm(triple_name, dis_info, tag_type, get_op_info, symbol_look_up)
  # @param [String] triple_name 
  # @param [FFI::Pointer(*Void)] dis_info 
  # @param [Integer] tag_type 
  # @param [Proc(_callback_op_info_callback_)] get_op_info 
  # @param [Proc(_callback_symbol_lookup_callback_)] symbol_look_up 
  # @return [FFI::Pointer(DisasmContextRef)] 
  # @scope class
  attach_function :create_disasm, :LLVMCreateDisasm, [:string, :pointer, :int, :op_info_callback, :symbol_lookup_callback], :pointer
  
  # Dispose of a disassembler context.
  # 
  # @method disasm_dispose(dc)
  # @param [FFI::Pointer(DisasmContextRef)] dc 
  # @return [nil] 
  # @scope class
  attach_function :disasm_dispose, :LLVMDisasmDispose, [:pointer], :void
  
  # Disassemble a single instruction using the disassembler context specified in
  # the parameter DC.  The bytes of the instruction are specified in the
  # parameter Bytes, and contains at least BytesSize number of bytes.  The
  # instruction is at the address specified by the PC parameter.  If a valid
  # instruction can be disassembled, its string is returned indirectly in
  # OutString whose size is specified in the parameter OutStringSize.  This
  # function returns the number of bytes in the instruction or zero if there was
  # no valid instruction.
  # 
  # @method disasm_instruction(dc, bytes, bytes_size, pc, out_string, out_string_size)
  # @param [FFI::Pointer(DisasmContextRef)] dc 
  # @param [FFI::Pointer(*Uint8T)] bytes 
  # @param [Integer] bytes_size 
  # @param [Integer] pc 
  # @param [String] out_string 
  # @param [Integer] out_string_size 
  # @return [Integer] 
  # @scope class
  attach_function :disasm_instruction, :LLVMDisasmInstruction, [:pointer, :pointer, :ulong, :ulong, :string, :ulong], :ulong
  
end
