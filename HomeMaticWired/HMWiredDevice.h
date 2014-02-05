/* Copyright 2013-2014 Sathya Laufer
 *
 * Homegear is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Homegear is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Homegear.  If not, see <http://www.gnu.org/licenses/>.
 *
 * In addition, as a special exception, the copyright holders give
 * permission to link the code of portions of this program with the
 * OpenSSL library under certain conditions as described in each
 * individual source file, and distribute linked combinations
 * including the two.
 * You must obey the GNU General Public License in all respects
 * for all of the code used other than OpenSSL.  If you modify
 * file(s) with this exception, you may extend this exception to your
 * version of the file(s), but you are not obligated to do so.  If you
 * do not wish to do so, delete this exception statement from your
 * version.  If you delete this exception statement from all source
 * files in the program, then also delete it here.
 */

#ifndef HMWIREDDEVICE_H
#define HMWIREDDEVICE_H

#include "../LogicalDevice.h"
#include "HMWiredPacket.h"
#include "HMWiredPeer.h"

#include <string>
#include <unordered_map>
#include <map>
#include <mutex>
#include <vector>
#include <queue>
#include <thread>
#include <chrono>
#include "pthread.h"

namespace HMWired
{
class HMWiredDevice : public LogicalDevice
{
    public:
        HMWiredDevice();
        HMWiredDevice(uint32_t deviceID, std::string serialNumber, int32_t address);
        virtual ~HMWiredDevice();
        virtual DeviceFamily deviceFamily() { return DeviceFamily::HomeMaticWired; }

        virtual void loadVariables();
        virtual void saveVariables();
        virtual void saveVariable(uint32_t index, int64_t intValue);
        virtual void saveVariable(uint32_t index, std::string& stringValue);
        virtual void saveVariable(uint32_t index, std::vector<uint8_t>& binaryValue);
        virtual void saveMessageCounters();
        virtual void load();
        virtual void save(bool saveDevice);
        virtual void serializeMessageCounters(std::vector<uint8_t>& encodedData);
        virtual void unserializeMessageCounters(std::shared_ptr<std::vector<char>> serializedData);

        virtual void sendPacket(std::shared_ptr<HMWiredPacket> packet, bool stealthy = false);
    protected:
        //In table variables
        int32_t _firmwareVersion = 0;
        int32_t _centralAddress = 0;
        std::unordered_map<int32_t, uint8_t> _messageCounter;
        //End

        bool _initialized = false;
        std::map<uint32_t, uint32_t> _variableDatabaseIDs;

        std::shared_ptr<HMWiredPeer> _currentPeer;
        std::unordered_map<int32_t, std::shared_ptr<HMWiredPeer>> _peers;
        std::unordered_map<std::string, std::shared_ptr<HMWiredPeer>> _peersBySerial;
        std::timed_mutex _peersMutex;
        std::mutex _databaseMutex;

        virtual void init();
    private:
};
}
#endif // HMWIREDDEVICE_H
