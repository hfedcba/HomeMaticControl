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
  OBJDIR     = obj/Release/homematicwired
  TARGETDIR  = lib/Modules/Release
  TARGET     = $(TARGETDIR)/libhomematicwired.so
  DEFINES   += -DFORTIFY_SOURCE=2 -DGCRYPT_NO_DEPRECATED -DHAVE_SSIZE_T=1 -DSCRIPTENGINE -DEVENTHANDLER -DOPENSSL -DSPIINTERFACES -DNDEBUG
  INCLUDES  += 
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -fPIC -Wall -std=c++11
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -Llib/Release -s -shared -Wl,-rpath=/lib/homegear -Wl,-rpath=/usr/lib/homegear -l pthread -l base
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(LIBS) $(LDFLAGS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug)
  OBJDIR     = obj/Debug/homematicwired
  TARGETDIR  = lib/Modules/Debug
  TARGET     = $(TARGETDIR)/libhomematicwired.so
  DEFINES   += -DFORTIFY_SOURCE=2 -DGCRYPT_NO_DEPRECATED -DHAVE_SSIZE_T=1 -DSCRIPTENGINE -DEVENTHANDLER -DOPENSSL -DSPIINTERFACES -DDEBUG
  INCLUDES  += 
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -fPIC -Wall -std=c++11
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -Llib/Debug -shared -Wl,-rpath=/lib/homegear -Wl,-rpath=/usr/lib/homegear -l pthread -l base
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(LIBS) $(LDFLAGS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),profiling)
  OBJDIR     = obj/Profiling/homematicwired
  TARGETDIR  = lib/Modules/Profiling
  TARGET     = $(TARGETDIR)/libhomematicwired.so
  DEFINES   += -DFORTIFY_SOURCE=2 -DGCRYPT_NO_DEPRECATED -DHAVE_SSIZE_T=1 -DSCRIPTENGINE -DEVENTHANDLER -DOPENSSL -DSPIINTERFACES -DNDEBUG
  INCLUDES  += 
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -g -fPIC -Wall -std=c++11 -pg
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -Llib/Profiling -shared -Wl,-rpath=/lib/homegear -Wl,-rpath=/usr/lib/homegear -l pthread -l base -pg
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(LIBS) $(LDFLAGS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/Factory.o \
	$(OBJDIR)/HMWiredPacketManager.o \
	$(OBJDIR)/HMWiredDevice.o \
	$(OBJDIR)/GD.o \
	$(OBJDIR)/HMWiredPacket.o \
	$(OBJDIR)/HMWired.o \
	$(OBJDIR)/HMWiredPeer.o \
	$(OBJDIR)/HMWiredCentral.o \
	$(OBJDIR)/HMWired-SD.o \
	$(OBJDIR)/IHMWiredInterface.o \
	$(OBJDIR)/HMW-LGW.o \
	$(OBJDIR)/RS485.o \

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
	@echo Linking homematicwired
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
	@echo Cleaning homematicwired
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
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
endif

$(OBJDIR)/Factory.o: Modules/HomeMaticWired/Factory.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/HMWiredPacketManager.o: Modules/HomeMaticWired/HMWiredPacketManager.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/HMWiredDevice.o: Modules/HomeMaticWired/HMWiredDevice.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/GD.o: Modules/HomeMaticWired/GD.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/HMWiredPacket.o: Modules/HomeMaticWired/HMWiredPacket.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/HMWired.o: Modules/HomeMaticWired/HMWired.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/HMWiredPeer.o: Modules/HomeMaticWired/HMWiredPeer.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/HMWiredCentral.o: Modules/HomeMaticWired/Devices/HMWiredCentral.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/HMWired-SD.o: Modules/HomeMaticWired/Devices/HMWired-SD.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/IHMWiredInterface.o: Modules/HomeMaticWired/PhysicalInterfaces/IHMWiredInterface.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/HMW-LGW.o: Modules/HomeMaticWired/PhysicalInterfaces/HMW-LGW.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/RS485.o: Modules/HomeMaticWired/PhysicalInterfaces/RS485.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"

-include $(OBJECTS:%.o=%.d)
