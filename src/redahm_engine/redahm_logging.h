#pragma once

#include <rex/logging.h>
#include "generated/redahm_init.h"



namespace redahm::log {
    inline const rex::LogCategoryId Input = rex::RegisterLogCategory("redahm_hooks");
}



#define RDAHM_TRACE(...) REXLOG_CAT_TRACE(::redahm::log::Input, __VA_ARGS__)
#define RDAHM_DEBUG(...) REXLOG_CAT_DEBUG(::redahm::log::Input, __VA_ARGS__)
#define RDAHM_INFO(...)  REXLOG_CAT_INFO(::redahm::log::Input, __VA_ARGS__)
#define RDAHM_WARN(...)  REXLOG_CAT_WARN(::redahm::log::Input, __VA_ARGS__)
#define RDAHM_ERROR(...) REXLOG_CAT_ERROR(::redahm::log::Input, __VA_ARGS__)