/* SPDX-License-Identifier: MIT OR Apache-2.0
 *
 * Copyright (c) 2018-2020 Andre Richter <andre.o.richter@gmail.com>
 */

SECTIONS
{
    /* Set the link address to 256 MiB */
    . = 0x10000000;

    __binary_start = .;
    .text :
    {
        *(.text._start) *(.text*)
    }

    .rodata :
    {
        *(.rodata*)
    }

    .data :
    {
        *(.data*)
    }

    /* Section is zeroed in u64 chunks, align start and end to 8 bytes */
    .bss ALIGN(8):
    {
        __bss_start = .;
        *(.bss*);
        . = ALIGN(8);
        __bss_end = .;
    }

    .got :
    {
        *(.got*)
    }

    /* Fill up to 8 byte, b/c relocating the binary is done in u64 chunks */
    . = ALIGN(8);
    __binary_end = .;

    /DISCARD/ : { *(.comment*) }
}
