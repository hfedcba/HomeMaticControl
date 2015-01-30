# GNU Make solution makefile autogenerated by Premake
# Type "make help" for usage help

ifndef config
  config=debug
endif
export config

PROJECTS := base homematicbidcos homematicwired max insteon philipshue miscellaneous user rpc cli events database scriptengine gd homegear

.PHONY: all clean help $(PROJECTS)

all: $(PROJECTS)

base: 
	@echo "==== Building base ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f base.make

homematicbidcos: 
	@echo "==== Building homematicbidcos ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f homematicbidcos.make

homematicwired: 
	@echo "==== Building homematicwired ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f homematicwired.make

max: 
	@echo "==== Building max ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f max.make

insteon: 
	@echo "==== Building insteon ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f insteon.make

philipshue: 
	@echo "==== Building philipshue ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f philipshue.make

miscellaneous: 
	@echo "==== Building miscellaneous ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f miscellaneous.make

user: 
	@echo "==== Building user ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f user.make

rpc: 
	@echo "==== Building rpc ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f rpc.make

cli: 
	@echo "==== Building cli ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f cli.make

events: 
	@echo "==== Building events ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f events.make

database: 
	@echo "==== Building database ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f database.make

scriptengine: 
	@echo "==== Building scriptengine ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f scriptengine.make

gd: 
	@echo "==== Building gd ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f gd.make

homegear: 
	@echo "==== Building homegear ($(config)) ===="
	@${MAKE} --no-print-directory -C . -f homegear.make

clean:
	@${MAKE} --no-print-directory -C . -f base.make clean
	@${MAKE} --no-print-directory -C . -f homematicbidcos.make clean
	@${MAKE} --no-print-directory -C . -f homematicwired.make clean
	@${MAKE} --no-print-directory -C . -f max.make clean
	@${MAKE} --no-print-directory -C . -f insteon.make clean
	@${MAKE} --no-print-directory -C . -f philipshue.make clean
	@${MAKE} --no-print-directory -C . -f miscellaneous.make clean
	@${MAKE} --no-print-directory -C . -f user.make clean
	@${MAKE} --no-print-directory -C . -f rpc.make clean
	@${MAKE} --no-print-directory -C . -f cli.make clean
	@${MAKE} --no-print-directory -C . -f events.make clean
	@${MAKE} --no-print-directory -C . -f database.make clean
	@${MAKE} --no-print-directory -C . -f scriptengine.make clean
	@${MAKE} --no-print-directory -C . -f gd.make clean
	@${MAKE} --no-print-directory -C . -f homegear.make clean

help:
	@echo "Usage: make [config=name] [target]"
	@echo ""
	@echo "CONFIGURATIONS:"
	@echo "   debug"
	@echo "   release"
	@echo "   profiling"
	@echo ""
	@echo "TARGETS:"
	@echo "   all (default)"
	@echo "   clean"
	@echo "   base"
	@echo "   homematicbidcos"
	@echo "   homematicwired"
	@echo "   max"
	@echo "   insteon"
	@echo "   philipshue"
	@echo "   miscellaneous"
	@echo "   user"
	@echo "   rpc"
	@echo "   cli"
	@echo "   events"
	@echo "   database"
	@echo "   scriptengine"
	@echo "   gd"
	@echo "   homegear"
	@echo ""
	@echo "For more information, see http://industriousone.com/premake/quick-start"
