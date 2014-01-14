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

#ifndef HMDEVICETYPES_H_
#define HMDEVICETYPES_H_

#include "DeviceFamily.h"

#include <iostream>
#include <string>
#include <map>

//DeviceID has to be unique in contrast to device type, which is only unique within the device family
enum class DeviceID : uint32_t
{
	UNKNOWN = 		0xFFFFFFFF,

	//HomeMatic BidCoS
	HMSD = 			0xFFFFFFFE,
	HMCENTRAL = 	0xFFFFFFFD,
	HMRCV50 = 		0x0000,
	HMLCSW1PLOM54 =	0x0001,
	HMLCSW1SM =		0x0002,
	HMLCSW4SM =		0x0003,
	HMLCSW1FM = 	0x0004,
	HMRC4 = 		0x0008,
	HMLCSW2FM =		0x0009,
	HMLCSW2SM =		0x000A,
	HMLCSW1PL =		0x0011,
	HMLCSW1SMATMEGA168 = 0x0014,
	HMLCSW4SMATMEGA168 = 0x0015,
	HMRCP1 =		0x001A,
	HMRCSEC3 = 		0x001B,
	HMRCSEC3B = 	0x001C,
	HMRCKEY3 =		0x001D,
	HMRCKEY3B =		0x001E,
	HMRC12 =		0x0029,
	HMRC12B =		0x002A,
	HMLCSW4PCB =	0x002D,
	HMSECSC =		0x002F,
	HMSECRHS =		0x0030,
	HMPB4WM =		0x0035,
	HMPB2WM =		0x0036,
	HMRC19 = 		0x0037,
	HMRC19B =		0x0038,
	HMCCTC = 		0x0039,
	HMCCVD = 		0x003A,
	HMRC4B =		0x003B,
	HMWDS30TO =		0x003E,
	HMWDS100C6O =	0x0040,
	HMSECSD = 		0x0042,
	HMSENEP =		0x0044,
	HMSWI3FM =		0x0046,
	HMSECMDIR =		0x004A,
	HMRC12SW =		0x004C,
	HMRC19SW =		0x004D,
	HMSENMDIRSM =	0x004F,
	HMLCSW1PBFM =	0x0051,
	HMLCSW2PBFM =	0x0052,
	RCH =			0x0054,
	HMLCDIM1TPL =	0x0057,
	HMLCDIM1TCV =	0x0058,
	HMLCDIM1TFM =	0x0059,
	HMLCDIM2TSM =	0x005A,
	HMSENMDIRO =	0x005D,
	HMSCI3FM =		0x005F,
	HMPB4DISWM = 	0x0060,
	HMLCSW4DR =		0x0061,
	HMLCSW2DR =		0x0062,
	ATENT =			0x0064,
	HMLCSW4WM =		0x0066,
	HMLCDIM1PWMCV =	0x0067,
	HMLCDIM1TPBUFM = 0x0068,
	HMLCSW1PBUFM =	0x0069,
	HMLCSW1BAPCB =	0x006C,
	HMLCDIM1LCV644 = 0x006E,
	HMLCDIM1LPL644 = 0x006F,
	HMLCDIM2LSM644 = 0x0070,
	HMLCDIM1TPL644 = 0x0071,
	HMLCDIM1TCV644 = 0x0072,
	HMLCDIM1TFM644 = 0x0073,
	HMLCDIM2TSM644 = 0x0074,
	HMOUCFMPL =		0x0075,
	ZELSTGRMHS4 =	0x0080,
	HMSWI3FMROTO =	0x0083,
	HMLCDIMSCHUECO = 0x0089,
	HMLCDIMSCHUECO2 = 0x008A,
	HMLCSWSCHUECO = 0x008B,
	HMLCSWSCHUECO2 = 0x008C,
	HMSECMDIRSCHUECO = 0x0090,
	HMSWI3FMSCHUECO = 0x0092,
	HMRC42 =		0x00A0,
	HMLCSW1PL2 =	0x00A1,
	HMLCDIM1TPL2 =	0x00A4,
	HMRCSEC42 =		0x00A5,
	HMRCKEY42 =		0x00A6,
	HMPB6WM55 =		0x00A9,
	HMLCSW4BAPCB =	0x00AB,
	HMESPMSW1PL =	0x00AC,
	HMSECSC2 =		0x00B1,

	//HomeMatic Wired
	HMWIREDSD = 			0xFEFFFFFE,
	HMWIREDCENTRAL = 		0xFEFFFFFD,
};

class LogicalDeviceType
{
public:
	LogicalDeviceType() {}
	LogicalDeviceType(DeviceID id, DeviceFamily family, uint32_t type, std::string name);
	virtual ~LogicalDeviceType() {}

	DeviceID id() { return _id; }
	DeviceFamily family() { return _family; }
	uint32_t type() { return _type; }
	std::string name() { return _name; }

	bool operator==(LogicalDeviceType& other);
	bool operator!=(LogicalDeviceType& other);

	bool isSwitch();
	bool isDimmer();
private:
	DeviceID _id = DeviceID::UNKNOWN;
	std::string _name;
	DeviceFamily _family = DeviceFamily::none;
	uint32_t _type = 0xFFFFFFFF;
};

class DeviceTypes
{
public:
	DeviceTypes();
	virtual ~DeviceTypes() {}

	LogicalDeviceType get(DeviceID id);
	LogicalDeviceType get(DeviceFamily family, uint32_t type);
private:
	std::map<DeviceID, LogicalDeviceType> _types;
	std::map<DeviceFamily, std::map<uint32_t, LogicalDeviceType>> _types2;
};
#endif
