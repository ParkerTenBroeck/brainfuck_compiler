

ENTRY(_start)

PHDRS
{
  headers      PT_PHDR PHDRS;
  header_load  PT_LOAD PHDRS;
  interp       PT_INTERP;
  code         PT_LOAD;
  data         PT_LOAD;
  dynamic      PT_DYNAMIC;
}



SECTIONS
{
    .text.start : 
    {
        *(.text.start)
    } 
    .text.other : 
    {
        *(.text)  
    } 
    .text.dyn_fn : 
    {
        *(.text.dyn_fn)
    } 
    .data : {
        *(.data)
        *(.rodata)

        __bss_start = .;
        *(.bss)
        *(COMMON)
        __bss_end = .;
    }

    /DISCARD/ : {
        *(.eh_frame)
    }
    /*.interp*/ /DISCARD/ : { *(.interp) } :interp :headers :header_load
}