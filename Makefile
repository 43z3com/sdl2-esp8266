TOOLCHAIN = /Users/b08777/Library/Arduino15/packages/esp8266/tools/xtensa-lx106-elf-gcc/1.20.0-26-gb404fb9-2


AR	= $(TOOLCHAIN)/bin/xtensa-lx106-elf-ar
RANLIB	= $(TOOLCHAIN)/bin//xtensa-lx106-elf-ranlib
CC = $(TOOLCHAIN)/bin/xtensa-lx106-elf-gcc
CXX = $(TOOLCHAIN)/bin/6-elf-g++
STRIP = $(TOOLCHAIN)/bin/xtensa-lx106-elf-strip

INCLUDE = -I./include -I/Users/b08777/Library/Arduino15/packages/esp8266/hardware/esp8266/2.3.0/cores/esp8266 -I/Users/b08777/Library/Arduino15/packages/esp8266/hardware/esp8266/2.3.0/variants/d1_mini -I/Users/b08777/Library/Arduino15/packages/esp8266/hardware/esp8266/2.3.0/tools/sdk/include -I/Users/b08777/Library/Arduino15/packages/esp8266/hardware/esp8266/2.3.0/tools/sdk/lwip/include

CFLAGS = -D__ets__ -DICACHE_FLASH -U__STRICT_ANSI__ -c -w -Os -g -mlongcalls -mtext-section-literals -fno-exceptions -fno-rtti -falign-functions=4 -std=c++11 -ffunction-sections -fdata-sections -w -x c++ -E -CC -DF_CPU=80000000L -DLWIP_OPEN_SRC -DARDUINO=10802 -DARDUINO_ESP8266_WEMOS_D1MINI -DARDUINO_ARCH_ESP8266 -DARDUINO_BOARD="ESP8266_WEMOS_D1MINI" -DESP8266 $(INCLUDE)

TARGET  = libSDL.a


	#CFLAGS  = -g -O2 $(INCLUDE)
#AR	= ar
#RANLIB	= ranlib

TARGET  = libSDL.a
SOURCES = \
	src/*.c \
	src/audio/*.c \
	src/audio/dummy/*.c \
	src/cpuinfo/*.c \
	src/events/*.c \
	src/file/*.c \
	src/haptic/*.c \
	src/haptic/dummy/*.c \
	src/joystick/*.c \
	src/joystick/dummy/*.c \
	src/loadso/dummy/*.c \
	src/power/*.c \
	src/filesystem/dummy/*.c \
	src/render/*.c \
	src/render/software/*.c \
	src/stdlib/*.c \
	src/thread/*.c \
	src/thread/generic/*.c \
	src/timer/*.c \
	src/timer/dummy/*.c \
	src/video/*.c \
	src/video/dummy/*.c \

OBJECTS = $(shell echo $(SOURCES) | sed -e 's,\.c,\.o,g')

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(AR) crv $@ $^
	$(RANLIB) $@

clean:
	rm -f $(TARGET) $(OBJECTS)
