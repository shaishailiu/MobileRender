# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_LIB_SRCS 变量
#aux_source_directory(. DIR_LIB_SRCS)
file(GLOB DIR_LIB_SRCS "*/*.*")

function(assign_source_group)
    if(MSVC)
    foreach(_source IN ITEMS ${ARGN})
        if (IS_ABSOLUTE "${_source}")
            file(RELATIVE_PATH _source_rel "${CMAKE_CURRENT_SOURCE_DIR}" "${_source}")
        else()
            set(_source_rel "${_source}")
        endif()
        get_filename_component(_source_path "${_source_rel}" PATH)
        string(REPLACE "/" "\\" _source_path_msvc "${_source_path}")
        source_group("${_source_path_msvc}" FILES "${_source}")
    endforeach()
    endif(MSVC)
endfunction(assign_source_group)

function(group_vs)
    foreach(_source IN ITEMS ${ARGN})
        assign_source_group(${_source})
    endforeach()
endfunction(group_vs)

group_vs(${DIR_LIB_SRCS})

# 指定生成 MathFunctions 链接库
add_library (runtime ${DIR_LIB_SRCS})