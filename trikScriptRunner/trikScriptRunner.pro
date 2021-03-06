# Copyright 2013 Yurii Litvinov
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include(../global.pri)

HEADERS += \
	$$PWD/include/trikScriptRunner/trikScriptRunner.h \
	$$PWD/src/scriptableParts.h \
	$$PWD/src/scriptEngineWorker.h \
	$$PWD/src/scriptRunnerProxy.h \

SOURCES += \
	$$PWD/src/scriptRunnerProxy.cpp \
	$$PWD/src/scriptableParts.cpp \
	$$PWD/src/scriptEngineWorker.cpp \
	$$PWD/src/trikScriptRunner.cpp \

OTHER_FILES += \
	$$PWD/system.js \

TEMPLATE = lib
QT += script

DEFINES += TRIKSCRIPTRUNNER_LIBRARY

copyToDestdir(system.js)

uses(trikKernel trikControl)

INCLUDEPATH += \
	$$PWD/../trikKernel/include/ \
	$$PWD/../trikControl/include/ \
