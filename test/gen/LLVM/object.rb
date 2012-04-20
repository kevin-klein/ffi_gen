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
  
  # (Not documented)
  class OpaqueObjectFile < FFI::Struct
    layout :dummy, :char
  end
  
  # (Not documented)
  class OpaqueSectionIterator < FFI::Struct
    layout :dummy, :char
  end
  
  # (Not documented)
  # 
  # @method create_object_file(mem_buf)
  # @param [FFI::Pointer(MemoryBufferRef)] mem_buf 
  # @return [OpaqueObjectFile] 
  # @scope class
  attach_function :create_object_file, :LLVMCreateObjectFile, [:pointer], OpaqueObjectFile
  
  # (Not documented)
  # 
  # @method dispose_object_file(object_file)
  # @param [OpaqueObjectFile] object_file 
  # @return [nil] 
  # @scope class
  attach_function :dispose_object_file, :LLVMDisposeObjectFile, [OpaqueObjectFile], :void
  
  # (Not documented)
  # 
  # @method get_sections(object_file)
  # @param [OpaqueObjectFile] object_file 
  # @return [OpaqueSectionIterator] 
  # @scope class
  attach_function :get_sections, :LLVMGetSections, [OpaqueObjectFile], OpaqueSectionIterator
  
  # (Not documented)
  # 
  # @method dispose_section_iterator(si)
  # @param [OpaqueSectionIterator] si 
  # @return [nil] 
  # @scope class
  attach_function :dispose_section_iterator, :LLVMDisposeSectionIterator, [OpaqueSectionIterator], :void
  
  # (Not documented)
  # 
  # @method is_section_iterator_at_end(object_file, si)
  # @param [OpaqueObjectFile] object_file 
  # @param [OpaqueSectionIterator] si 
  # @return [Integer] 
  # @scope class
  attach_function :is_section_iterator_at_end, :LLVMIsSectionIteratorAtEnd, [OpaqueObjectFile, OpaqueSectionIterator], :int
  
  # (Not documented)
  # 
  # @method move_to_next_section(si)
  # @param [OpaqueSectionIterator] si 
  # @return [nil] 
  # @scope class
  attach_function :move_to_next_section, :LLVMMoveToNextSection, [OpaqueSectionIterator], :void
  
  # (Not documented)
  # 
  # @method get_section_name(si)
  # @param [OpaqueSectionIterator] si 
  # @return [String] 
  # @scope class
  attach_function :get_section_name, :LLVMGetSectionName, [OpaqueSectionIterator], :string
  
  # (Not documented)
  # 
  # @method get_section_size(si)
  # @param [OpaqueSectionIterator] si 
  # @return [Integer] 
  # @scope class
  attach_function :get_section_size, :LLVMGetSectionSize, [OpaqueSectionIterator], :ulong
  
  # (Not documented)
  # 
  # @method get_section_contents(si)
  # @param [OpaqueSectionIterator] si 
  # @return [String] 
  # @scope class
  attach_function :get_section_contents, :LLVMGetSectionContents, [OpaqueSectionIterator], :string
  
end
