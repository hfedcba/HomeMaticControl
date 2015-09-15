/* Copyright 2013-2015 Sathya Laufer
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

#include "BinaryPayload.h"
#include "../BaseLib.h"

namespace BaseLib
{
namespace DeviceDescription
{

BinaryPayload::BinaryPayload(BaseLib::Obj* baseLib)
{
	_bl = baseLib;
}

BinaryPayload::BinaryPayload(BaseLib::Obj* baseLib, xml_node<>* node) : BinaryPayload(baseLib)
{
	for(xml_attribute<>* attr = node->first_attribute(); attr; attr = attr->next_attribute())
	{
		_bl->out.printWarning("Warning: Unknown attribute for \"binaryPayload\": " + std::string(attr->name()));
	}
	for(xml_node<>* subNode = node->first_node(); subNode; subNode = subNode->next_sibling())
	{
		std::string nodeName(subNode->name());
		std::string value(subNode->value());
		if(nodeName == "index") index = Math::getDouble(value);
		else if(nodeName == "size") size = Math::getDouble(value);
		else if(nodeName == "index2") index2 = Math::getDouble(value);
		else if(nodeName == "size2") size2 = Math::getDouble(value);
		else if(nodeName == "index2Offset") index2Offset = Math::getNumber(value);
		else if(nodeName == "constValueInteger") constValueInteger = Math::getNumber(value);
		else if(nodeName == "constValueDecimal") constValueDecimal = Math::getDouble(value);
		else if(nodeName == "constValueString") constValueString = value;
		else if(nodeName == "isSigned") { if(value == "true") { isSigned = true; } }
		else if(nodeName == "omitIf")
		{
			omitIfSet = true;
			omitIf = Math::getNumber(value);
		}
		else if(nodeName == "parameterId") parameterId = value;
		else _bl->out.printWarning("Warning: Unknown node in \"jsonPayload\": " + nodeName);
	}
}

}
}