/* Copyright 2013 Matvey Bryksin, Yurii Litvinov
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. */

#include "keys.h"

#include "src/keysWorker.h"

using namespace trikControl;

Keys::Keys(const QString &keysPath)
	: mKeysWorker(new KeysWorker(keysPath))
{
	connect(mKeysWorker.data(), SIGNAL(buttonPressed(int,int)), this, SIGNAL(buttonPressed(int,int)));
	mKeysWorker->moveToThread(&mWorkerThread);
	mWorkerThread.start();
}

Keys::~Keys()
{
	mWorkerThread.quit();
	mWorkerThread.wait();
}

void Keys::reset()
{
	mKeysWorker->reset();
}

bool Keys::wasPressed(int code)
{
	return mKeysWorker->wasPressed(code);
}
