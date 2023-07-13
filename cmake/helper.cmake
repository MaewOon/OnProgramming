include(CMakeParseArguments)
#cpack configuration
# cmake-lint: disable=C0103
function(setup_cpack)
  set(oneValueArgs MAINTAINER DESCRIPTION DEPENDENCIES)
  cmake_parse_arguments(SETUP_CPACK "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
  set(CPACK_DEB_COMPONENT_INSTALL ON)
  set(CPACK_PACKAGING_INSTALL_PREFIX "")

  string(REPLACE "_" "-" DASH_PROJECT_NAME ${PROJECT_NAME})
  set(DASH_PROJECT_NAME ${DASH_PROJECT_NAME})

  set(CPACK_PACKAGE_VERSION ${PROJECT_VERSION})
  set(CPACK_PACKAGE_NAME "${DASH_PROJECT_NAME}")

  set(CPACK_COMPONENTS_ALL ${COMPONENT_NAME})
  set(CPACK_DEBIAN_${COMPONENT_NAME}_PACKAGE_NAME ${DASH_PROJECT_NAME})

  set(CPACK_DEBIAN_PACKAGE_MAINTAINER ${SETUP_CPACK_MAINTAINER})
  set(CPACK_PACKAGE_DESCRIPTION_SUMMARY ${SETUP_CPACK_DESCRIPTION})
  set(CPACK_DEBIAN_PACKAGE_DEPENDS ${SETUP_CPACK_DEPENDENCIES})
  set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
  set(CPACK_RESOURCE_FILE_README ${CMAKE_CURRENT_SOURCE_DIR}/README.md)
  set(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_CURRENT_SOURCE_DIR}/LICENSE.md)

  #   set(CPACK_OUTPUT_CONFIG_FILE
  #   "${CMAKE_BINARY_DIR}/configs/${PROJECT_NAME}_Config.cmake"
  #   )
  set(CPACK_GENERATOR "DEB")
  include(CPack)
endfunction()
