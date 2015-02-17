# GNU Make project makefile autogenerated by Premake
ifndef config
  config=release
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifndef RESCOMP
  ifdef WINDRES
    RESCOMP = $(WINDRES)
  else
    RESCOMP = windres
  endif
endif

ifeq ($(config),release)
  OBJDIR     = obj/Release/paho.mqtt.c
  TARGETDIR  = lib/Release
  TARGET     = $(TARGETDIR)/libpaho.mqtt.c.a
  DEFINES   += -DFORTIFY_SOURCE=2 -DGCRYPT_NO_DEPRECATED -DHAVE_SSIZE_T=1 -DSCRIPTENGINE -DEVENTHANDLER -DNDEBUG
  INCLUDES  += 
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -Wall
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L/usr/lib/php5 -s -Wl,-rpath=/lib/homegear -Wl,-rpath=/usr/lib/homegear
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += 
  LDDEPS    += 
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug)
  OBJDIR     = obj/Debug/paho.mqtt.c
  TARGETDIR  = lib/Debug
  TARGET     = $(TARGETDIR)/libpaho.mqtt.c.a
  DEFINES   += -DFORTIFY_SOURCE=2 -DGCRYPT_NO_DEPRECATED -DHAVE_SSIZE_T=1 -DSCRIPTENGINE -DEVENTHANDLER -DDEBUG
  INCLUDES  += 
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -Wall
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L/usr/lib/php5 -Wl,-rpath=/lib/homegear -Wl,-rpath=/usr/lib/homegear
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += 
  LDDEPS    += 
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),profiling)
  OBJDIR     = obj/Profiling/paho.mqtt.c
  TARGETDIR  = lib/Profiling
  TARGET     = $(TARGETDIR)/libpaho.mqtt.c.a
  DEFINES   += -DFORTIFY_SOURCE=2 -DGCRYPT_NO_DEPRECATED -DHAVE_SSIZE_T=1 -DSCRIPTENGINE -DEVENTHANDLER -DNDEBUG
  INCLUDES  += 
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -g -Wall -pg
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L/usr/lib/php5 -Wl,-rpath=/lib/homegear -Wl,-rpath=/usr/lib/homegear -pg
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += 
  LDDEPS    += 
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/MQTTClient.o \
	$(OBJDIR)/utf-8.o \
	$(OBJDIR)/MQTTProtocolClient.o \
	$(OBJDIR)/Tree.o \
	$(OBJDIR)/Clients.o \
	$(OBJDIR)/Thread.o \
	$(OBJDIR)/MQTTPacket.o \
	$(OBJDIR)/MQTTProtocolOut.o \
	$(OBJDIR)/MQTTPersistenceDefault.o \
	$(OBJDIR)/Messages.o \
	$(OBJDIR)/SSLSocket.o \
	$(OBJDIR)/MQTTPacketOut.o \
	$(OBJDIR)/Log.o \
	$(OBJDIR)/MQTTPersistence.o \
	$(OBJDIR)/Socket.o \
	$(OBJDIR)/SocketBuffer.o \
	$(OBJDIR)/MQTTAsync.o \
	$(OBJDIR)/MQTTVersion.o \
	$(OBJDIR)/LinkedList.o \
	$(OBJDIR)/StackTrace.o \
	$(OBJDIR)/Heap.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking paho.mqtt.c
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning paho.mqtt.c
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
ifeq (posix,$(SHELLTYPE))
	-$(SILENT) cp $< $(OBJDIR)
else
	$(SILENT) xcopy /D /Y /Q "$(subst /,\,$<)" "$(subst /,\,$(OBJDIR))" 1>nul
endif
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
endif

$(OBJDIR)/MQTTClient.o: Libraries/MQTT/paho.mqtt.c/src/MQTTClient.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/utf-8.o: Libraries/MQTT/paho.mqtt.c/src/utf-8.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/MQTTProtocolClient.o: Libraries/MQTT/paho.mqtt.c/src/MQTTProtocolClient.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/Tree.o: Libraries/MQTT/paho.mqtt.c/src/Tree.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/Clients.o: Libraries/MQTT/paho.mqtt.c/src/Clients.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/Thread.o: Libraries/MQTT/paho.mqtt.c/src/Thread.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/MQTTPacket.o: Libraries/MQTT/paho.mqtt.c/src/MQTTPacket.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/MQTTProtocolOut.o: Libraries/MQTT/paho.mqtt.c/src/MQTTProtocolOut.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/MQTTPersistenceDefault.o: Libraries/MQTT/paho.mqtt.c/src/MQTTPersistenceDefault.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/Messages.o: Libraries/MQTT/paho.mqtt.c/src/Messages.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/SSLSocket.o: Libraries/MQTT/paho.mqtt.c/src/SSLSocket.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/MQTTPacketOut.o: Libraries/MQTT/paho.mqtt.c/src/MQTTPacketOut.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/Log.o: Libraries/MQTT/paho.mqtt.c/src/Log.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/MQTTPersistence.o: Libraries/MQTT/paho.mqtt.c/src/MQTTPersistence.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/Socket.o: Libraries/MQTT/paho.mqtt.c/src/Socket.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/SocketBuffer.o: Libraries/MQTT/paho.mqtt.c/src/SocketBuffer.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/MQTTAsync.o: Libraries/MQTT/paho.mqtt.c/src/MQTTAsync.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/MQTTVersion.o: Libraries/MQTT/paho.mqtt.c/src/MQTTVersion.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/LinkedList.o: Libraries/MQTT/paho.mqtt.c/src/LinkedList.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/StackTrace.o: Libraries/MQTT/paho.mqtt.c/src/StackTrace.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/Heap.o: Libraries/MQTT/paho.mqtt.c/src/Heap.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"

-include $(OBJECTS:%.o=%.d)