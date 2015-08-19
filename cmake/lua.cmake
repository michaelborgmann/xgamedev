set (LUA_SOURCE ${ROOTDIR}/src/lua/src)
set (HEADERS ${HEADERS} ${LUA_SOURCE})
set (LIBS ${LIBS} lua)

set (LUA_CORE
    ${LUA_SOURCE}/lapi.c
    ${LUA_SOURCE}/lcode.c
    ${LUA_SOURCE}/lctype.c
    ${LUA_SOURCE}/ldebug.c
    ${LUA_SOURCE}/ldo.c
    ${LUA_SOURCE}/ldump.c
    ${LUA_SOURCE}/lfunc.c
    ${LUA_SOURCE}/lgc.c
    ${LUA_SOURCE}/llex.c
    ${LUA_SOURCE}/lmem.c
    ${LUA_SOURCE}/lobject.c
    ${LUA_SOURCE}/lopcodes.c
    ${LUA_SOURCE}/lparser.c
    ${LUA_SOURCE}/lstate.c
    ${LUA_SOURCE}/lstring.c
    ${LUA_SOURCE}/ltable.c
    ${LUA_SOURCE}/ltm.c
    ${LUA_SOURCE}/lundump.c
    ${LUA_SOURCE}/lvm.c
    ${LUA_SOURCE}/lzio.c
)

set (LUA_LIB
    ${LUA_SOURCE}/lauxlib.c
    ${LUA_SOURCE}/lbaselib.c
    ${LUA_SOURCE}/lbitlib.c
    ${LUA_SOURCE}/lcorolib.c
    ${LUA_SOURCE}/ldblib.c
    ${LUA_SOURCE}/liolib.c
    ${LUA_SOURCE}/lmathlib.c
    ${LUA_SOURCE}/loslib.c
    ${LUA_SOURCE}/lstrlib.c
    ${LUA_SOURCE}/ltablib.c
    ${LUA_SOURCE}/lutf8lib
    ${LUA_SOURCE}/loadlib.c
    ${LUA_SOURCE}/linit.c
)

add_library (lua ${LUA_CORE} ${LUA_LIB})
target_link_libraries (lua)
