#
#  Copyright 2018-2019, The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)
LOCAL_DEVICE := $(lastword $(subst _, ,$(TARGET_PRODUCT)))

ifneq ($(filter blueline bonito coral crosshatch flame sunfish taimen, $(LOCAL_DEVICE)),)

include $(CLEAR_VARS)
LOCAL_PRODUCT_MODULE := true

ifneq ($(filter blueline bonito crosshatch taimen,$(LOCAL_DEVICE)),)
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res_p23
else ifneq ($(filter flame coral,$(LOCAL_DEVICE)),)
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res_p4
else ifneq ($(filter sunfish,$(LOCAL_DEVICE)),)
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res_p4a
endif

LOCAL_PACKAGE_NAME := PixelSetupWizardOverlay
LOCAL_SDK_VERSION := current
include $(BUILD_RRO_PACKAGE)

endif # LOCAL_DEVICE
