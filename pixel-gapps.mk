# Copyright (C) 2017 The Pure Nexus Project
# Copyright (C) 2018-2020 The Dirty Unicorns Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PRODUCT_SOONG_NAMESPACES += \
    vendor/pixelgapps

du_device := $(patsubst %f,%,$(subst du_,,$(TARGET_PRODUCT)))

# App (system)
PRODUCT_PACKAGES += \
    GoogleExtShared \
    GooglePrintRecommendationService

# App (product)
PRODUCT_PACKAGES += \
    GoogleContacts \
    GoogleContactsSyncAdapter \
    GoogleTTS \
    LocationHistoryPrebuilt \
    MarkupGoogle \
    PrebuiltDeskClockGoogle \
    talkback \
    TrichromeLibrary-Stub \
    WebViewGoogle-Stub

# Google Camera
ifneq ($(filter blueline bonito coral crosshatch sunfish taimen,$(du_device)),)
PRODUCT_PACKAGES += \
    GoogleCamera
endif

# Google Messages
ifneq ($(filter blueline bonito coral crosshatch lake lavender oneplus3 potter river sunfish taimen,$(du_device)),)
PRODUCT_PACKAGES += \
    PrebuiltBugle
endif

# Google VR
ifneq ($(filter blueline bonito coral crosshatch oneplus3 potter sunfish taimen,$(du_device)),)
PRODUCT_PACKAGES += \
    arcore \
    Ornament
endif

# Google VR Part II
ifneq ($(filter blueline crosshatch oneplus3 potter taimen,$(du_device)),)
PRODUCT_PACKAGES += \
    GoogleVrCore
endif

# WallpapersBReel2019
ifneq ($(filter blueline bonito coral crosshatch sunfish taimen,$(du_device)),)
PRODUCT_PACKAGES += \
    WallpapersBReel2019 \
    WallpapersBReel2020a
endif

# Priv-app (product)
PRODUCT_PACKAGES += \
    AndroidMigratePrebuilt \
    AndroidPlatformServices \
    ConfigUpdater \
    ConnMetrics \
    OTAConfigPrebuilt \
    PartnerSetupPrebuilt \
    Phonesky \
    PrebuiltGmsCore \
    PrebuiltGmsCoreRvc_AdsDynamite \
    PrebuiltGmsCoreRvc_CronetDynamite \
    PrebuiltGmsCoreRvc_DynamiteLoader \
    PrebuiltGmsCoreRvc_DynamiteModulesA \
    PrebuiltGmsCoreRvc_DynamiteModulesC \
    PrebuiltGmsCoreRvc_GoogleCertificates \
    PrebuiltGmsCoreRvc_MapsDynamite \
    PrebuiltGmsCoreRvc_MeasurementDynamite \
    SetupWizardPrebuilt \
    TurboPrebuilt \
    Velvet \
    WellbeingPrebuilt

# Google Dialer
ifneq ($(filter blueline bonito coral crosshatch lake lavender marlin oneplus3 potter river sunfish taimen,$(du_device)),)
PRODUCT_PACKAGES += \
    GoogleDialer
endif

ifneq ($(filter coral sunfish,$(du_device)),)
# Pixel 4 - Next Generation Assistant
PRODUCT_PACKAGES += \
    NgaResources
endif

ifneq ($(filter coral,$(du_device)),)
# Pixel 4 - Motion Sense training
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.enable_assist_gesture_training=true
endif

# Framework (product)
PRODUCT_PACKAGES += \
    com.google.android.dialer.support

# Priv-app (system_ext)
PRODUCT_PACKAGES += \
    GoogleFeedback \
    GoogleOneTimeInitializer \
    GoogleServicesFramework \
    NexusLauncherRelease

# Pixel Setup Wizard
ifneq ($(filter blueline bonito coral crosshatch sunfish taimen,$(du_device)),)
PRODUCT_PACKAGES += \
    PixelSetupWizard
endif

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/pixelgapps/proprietary/product/overlay/

# RRO Overlays
ifneq ($(filter blueline bonito coral crosshatch sunfish taimen,$(du_device)),)
PRODUCT_PACKAGES += \
    PixelSetupWizardOverlay
endif

# Google Assistant prop
PRODUCT_PRODUCT_PROPERTIES += \
    ro.opa.eligible_device=true

# Setup Wizard props
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.theme=glif_v3_light \
    setupwizard.feature.skip_button_use_mobile_data.carrier1839=true \
    setupwizard.feature.show_pai_screen_in_main_flow.carrier1839=false \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    ro.setupwizard.esim_cid_ignore=00000001 \
    setupwizard.feature.show_support_link_in_deferred_setup=false \
    ro.com.google.ime.theme_id=5 \
    ro.setupwizard.rotation_locked=true

PRODUCT_COPY_FILES += \
    vendor/pixelgapps/proprietary/product/app/TrichromeLibrary/TrichromeLibrary.apk.gz:$(TARGET_COPY_OUT_PRODUCT)/app/TrichromeLibrary/TrichromeLibrary.apk.gz \
    vendor/pixelgapps/proprietary/product/app/WebViewGoogle/WebViewGoogle.apk.gz:$(TARGET_COPY_OUT_PRODUCT)/app/WebViewGoogle/WebViewGoogle.apk.gz \
    vendor/pixelgapps/proprietary/product/etc/default-permissions/default-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default-permissions.xml \
    vendor/pixelgapps/proprietary/product/etc/permissions/com.google.android.dialer.support.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.dialer.support.xml \
    vendor/pixelgapps/proprietary/product/etc/preferred-apps/google.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/preferred-apps/google.xml \
    vendor/pixelgapps/proprietary/product/etc/sysconfig/google.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google.xml \
    vendor/pixelgapps/proprietary/product/etc/sysconfig/google_build.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google_build.xml \
    vendor/pixelgapps/proprietary/product/etc/sysconfig/google-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google-hiddenapi-package-whitelist.xml \
    vendor/pixelgapps/proprietary/product/etc/sysconfig/google-rollback-package-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google-rollback-package-whitelist.xml \
    vendor/pixelgapps/proprietary/product/etc/sysconfig/google-staged-installer-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google-staged-installer-whitelist.xml \
    vendor/pixelgapps/proprietary/product/etc/sysconfig/google_vr_build.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google_vr_build.xml \
    vendor/pixelgapps/proprietary/product/etc/sysconfig/nexus.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/nexus.xml \
    vendor/pixelgapps/proprietary/product/etc/sysconfig/whitelist_com.android.omadm.service.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/whitelist_com.android.omadm.service.xml \
    vendor/pixelgapps/proprietary/product/lib64/libgdx.so:$(TARGET_COPY_OUT_PRODUCT)/lib64/libgdx.so \
    vendor/pixelgapps/proprietary/product/lib64/libsketchology_native.so:$(TARGET_COPY_OUT_PRODUCT)/lib64/libsketchology_native.so \
    vendor/pixelgapps/proprietary/system_ext/etc/permissions/privapp-permissions-google-se.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-google-se.xml

# P3/3XL wallpaper library
ifneq ($(filter blueline crosshatch,$(du_device)),)
PRODUCT_COPY_FILES += \
    vendor/pixelgapps/proprietary/product/lib64/libwallpapers-breel-2018-jni.so:$(TARGET_COPY_OUT_PRODUCT)/lib64/libwallpapers-breel-2018-jni.so
endif

ifneq ($(filter blueline bonito coral crosshatch lake lavender oneplus3 potter river sunfish taimen,$(du_device)),)
PRODUCT_COPY_FILES += \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/am_phonemes.syms:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/am_phonemes.syms \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/APP_NAME.fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/APP_NAME.fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/APP_NAME.syms:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/APP_NAME.syms \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/c_fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/c_fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/CLG.prewalk.fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/CLG.prewalk.fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/commands.abnf:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/commands.abnf \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/compile_grammar.config:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/compile_grammar.config \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/config.pumpkin:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/config.pumpkin \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/CONTACT.transform.mfar:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/CONTACT.transform.mfar \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/CONTACT_NAME.fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/CONTACT_NAME.fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/CONTACT_NAME.syms:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/CONTACT_NAME.syms \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/contacts.abnf:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/contacts.abnf \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/dict:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/dict \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/dictation.config:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/dictation.config \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/dnn:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/dnn \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/embedded_class_denorm.mfar:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/embedded_class_denorm.mfar \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/embedded_normalizer.mfar:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/embedded_normalizer.mfar \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/endpointer_dictation.config:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/endpointer_dictation.config \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/endpointer_model:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/endpointer_model \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/endpointer_model.mmap:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/endpointer_model.mmap \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/endpointer_voicesearch.config:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/endpointer_voicesearch.config \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/en-US_app-actions_prompted-app-name_TWIDDLER_FST.fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/en-US_app-actions_prompted-app-name_TWIDDLER_FST.fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/en-US_calendar-actions_AddCalendarEvent-Prompted-FieldToChange_TWIDDLER_FST.fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/en-US_calendar-actions_AddCalendarEvent-Prompted-FieldToChange_TWIDDLER_FST.fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/en-US_confirmation_confirmation-cancellation_TWIDDLER_FST.fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/en-US_confirmation_confirmation-cancellation_TWIDDLER_FST.fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/en-US_gmm-actions_gmm-nav-actions_TWIDDLER_FST.fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/en-US_gmm-actions_gmm-nav-actions_TWIDDLER_FST.fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/en-US_media-actions_music-service-controllable_TWIDDLER_FST.fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/en-US_media-actions_music-service-controllable_TWIDDLER_FST.fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/en-US_monastery_contact-disambig-static_TWIDDLER_FST.fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/en-US_monastery_contact-disambig-static_TWIDDLER_FST.fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/en-US_monastery_GenericAction-Prompted-ContactName_TWIDDLER_FST.fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/en-US_monastery_GenericAction-Prompted-ContactName_TWIDDLER_FST.fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/en-US_read-items_SearchMessageAction-Prompted-Read_TWIDDLER_FST.fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/en-US_read-items_SearchMessageAction-Prompted-Read_TWIDDLER_FST.fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/en-US_read-items_SearchMessageAction-Prompted-Skip_TWIDDLER_FST.fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/en-US_read-items_SearchMessageAction-Prompted-Skip_TWIDDLER_FST.fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/en-US_time-actions_time-context_TWIDDLER_FST.fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/en-US_time-actions_time-context_TWIDDLER_FST.fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/ep_portable_mean_stddev:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/ep_portable_mean_stddev \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/ep_portable_model.uint8.mmap:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/ep_portable_model.uint8.mmap \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/g2p.data:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/g2p.data \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/g2p_fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/g2p_fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/g2p_graphemes.syms:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/g2p_graphemes.syms \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/g2p_phonemes.syms:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/g2p_phonemes.syms \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/grammar.config:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/grammar.config \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/hmmlist:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/hmmlist \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/hmm_symbols:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/hmm_symbols \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/input_mean_std_dev:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/input_mean_std_dev \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/lexicon.U.fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/lexicon.U.fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/lstm_model.uint8.data:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/lstm_model.uint8.data \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/magic_mic.config:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/magic_mic.config \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/metadata:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/metadata \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/monastery_config.pumpkin:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/monastery_config.pumpkin \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/norm_fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/norm_fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/offensive_word_normalizer.mfar:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/offensive_word_normalizer.mfar \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/offline_action_data.pb:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/offline_action_data.pb \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/phonelist:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/phonelist \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/portable_lstm:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/portable_lstm \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/portable_meanstddev:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/portable_meanstddev \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/prons_exception_dictionary_file.txt:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/prons_exception_dictionary_file.txt \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/pumpkin.mmap:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/pumpkin.mmap \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/rescoring.fst.compact:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/rescoring.fst.compact \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/semantics.pumpkin:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/semantics.pumpkin \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/SONG_NAME.fst:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/SONG_NAME.fst \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/SONG_NAME.syms:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/SONG_NAME.syms \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/TERSE_LSTM_LM.lstm_lm.main_model.uint8.data:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/TERSE_LSTM_LM.lstm_lm.main_model.uint8.data \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/TERSE_LSTM_LM.lstm_lm.self_normalized_model.uint8.data:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/TERSE_LSTM_LM.lstm_lm.self_normalized_model.uint8.data \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/TERSE_LSTM_LM.lstm_lm.syms:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/TERSE_LSTM_LM.lstm_lm.syms \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/verbalizer_terse.mfar:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/verbalizer_terse.mfar \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/voice_actions.config:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/voice_actions.config \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/voice_actions_compiler.config:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/voice_actions_compiler.config \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/word_confidence_classifier:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/word_confidence_classifier \
    vendor/pixelgapps/proprietary/product/usr/srec/en-US/wordlist.syms:$(TARGET_COPY_OUT_PRODUCT)/usr/srec/en-US/wordlist.syms
endif
