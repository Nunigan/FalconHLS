# Build script for the Falcon implementation.
#
# ==========================(LICENSE BEGIN)============================
#
# Copyright (c) 2017-2019  Falcon Project
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
# ===========================(LICENSE END)=============================
#
# @author   Thomas Pornin <thomas.pornin@nccgroup.com>

.POSIX:

# =====================================================================
#
# Configurable options:
#   CC       C compiler; GCC or Clang are fine; MSVC (2015+) works too.
#   CFLAGS   Compilation flags:
#             * Optimization level -O2 or higher is recommended
#            See config.h for some possible configuration macros.
#   LD       Linker; normally the same command as the compiler.
#   LDFLAGS  Linker options, not counting the extra libs.
#   LIBS     Extra libraries for linking:
#             * If using the native FPU, test_falcon and application
#               code that calls this library may need: -lm
#               (normally not needed on x86, both 32-bit and 64-bit)

CC = gcc
CFLAGS = -lm -std=c99
LD = gcc
LDFLAGS =
LIBS = -lm

# =====================================================================

OBJ = codec.o common.o fft.o fpr.o keygen.o rng.o shake.o sign.o vrfy.o

all: falcon

run: falcon
	./falcon

clean:
	-rm -f $(OBJ) falcon tb.o

falcon: tb.o $(OBJ)
	$(LD) $(LDFLAGS) -o falcon tb.o $(OBJ) $(LIBS)

codec.o: codec.c header.h
	$(CC) $(CFLAGS) -c -o codec.o codec.c

common.o: common.c header.h
	$(CC) $(CFLAGS) -c -o common.o common.c

tb.o: tb.c header.h tb_data.h
	$(CC) $(CFLAGS) -c -o tb.o tb.c

fft.o: fft.c header.h
	$(CC) $(CFLAGS) -c -o fft.o fft.c

fpr.o: fpr.c header.h
	$(CC) $(CFLAGS) -c -o fpr.o fpr.c

keygen.o: keygen.c header.h
	$(CC) $(CFLAGS) -c -o keygen.o keygen.c

rng.o: rng.c header.h
	$(CC) $(CFLAGS) -c -o rng.o rng.c

shake.o: shake.c header.h
	$(CC) $(CFLAGS) -c -o shake.o shake.c

sign.o: sign.c header.h
	$(CC) $(CFLAGS) -c -o sign.o sign.c

vrfy.o: vrfy.c header.h
	$(CC) $(CFLAGS) -c -o vrfy.o vrfy.c

